using UnityEngine;
using System.Collections;

[System.Serializable]
public enum PlanetObjectiveTypes { UseUseable, CollectItem };

[System.Serializable]
public struct PlanetObjective
{
    public PlanetObjectiveTypes ObjectiveType;

    public Usable UsableToUse;

    public bool ObjectiveComplete()
    {
        if (ObjectiveType == PlanetObjectiveTypes.UseUseable && UsableToUse.BeenUsed)
            return true;
        return false;
    }
}

public class Planet : MonoBehaviour
{
    public static Planet Instance;

    public PlanetObjective[] Objectives;

    bool PortalReached = false;

	void Start ()
    {
        Instance = this;
	}
    public bool FullyComplete()
    {
        return PortalReached;
    }

    public bool ObjectivesComplete()
    {
        // todo: do this with events
        
        for(int i = 0; i < Objectives.Length; i++)
        {
            if(!Objectives[i].ObjectiveComplete())
            {
                return false;
            }
        }
        return true;
    }

    public void ExitPortalReached()
    {
        if(ObjectivesComplete())
        {
            PortalReached = true;
        }
    }
}
