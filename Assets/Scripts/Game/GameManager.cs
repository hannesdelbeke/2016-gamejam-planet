using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

[System.Serializable]
public struct Level
{
    public Planet planet;
}

public class GameManager : MonoBehaviour
{
    [SerializeField]
    string[] levelsByName;

    int currentLevel = -1;
            
	void Start ()
    {
        DontDestroyOnLoad(gameObject);
	}
	
	void Update ()
    {
        if(!Planet.Instance || Planet.Instance.FullyComplete())
        {
            currentLevel++;
            if(levelsByName.Length > currentLevel)
            {
                StartLevel(currentLevel + 1, levelsByName[currentLevel]);
            }
            else
            {
                GameComplete();
            }            
        }	    
	}

    void StartLevel(int LevelNumber, string name)
    {
        SceneManager.LoadScene(name);

        UIManager.Instance.SetLevel(LevelNumber);
    }

    void GameComplete()
    {
        // todo
        UIManager.Instance.ShowVictory();
    }
}
