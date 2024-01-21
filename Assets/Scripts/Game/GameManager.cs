using UnityEngine;
using System.Collections;

[System.Serializable]
public struct Level
{
    public Planet planet;
}

public class GameManager : MonoBehaviour
{

    public Level[] levels;
    public PlayerController PlayerPrefab;

    int currentLevel = 0;

    Planet CurrentLevelPlanet;
    PlayerController CurrentPlayer;
            
	void Start ()
    {
        
	}
	
	void Update ()
    {
        if(!CurrentLevelPlanet /*|| CurrentLevelPlanet.Complete()*/)
        {
            ClearCurrentLevel();
            currentLevel++;
            if(levels.Length > currentLevel)
            {
                StartLevel(currentLevel, levels[currentLevel - 1]);
            }
            else
            {
                GameComplete();
            }            
        }
	    
	}

    void ClearCurrentLevel()
    {
        if(CurrentLevelPlanet)
        {
            Destroy(CurrentLevelPlanet);
            CurrentLevelPlanet = null;
        }
        if(CurrentPlayer)
        {
            Destroy(CurrentPlayer);
            CurrentPlayer = null;
        }
    }

    void StartLevel(int LevelNumber, Level level)
    {
        ClearCurrentLevel();

        CurrentLevelPlanet = Instantiate<Planet>(level.planet);
        CurrentPlayer = Instantiate<PlayerController>(PlayerPrefab);

        UIManager.Instance.SetLevel(LevelNumber);
    }

    void GameComplete()
    {
        // todo
    }
}
