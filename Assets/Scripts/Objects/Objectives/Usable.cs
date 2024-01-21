using UnityEngine;
using System.Collections;

public class Usable : MonoBehaviour
{
    [SerializeField]
    bool IsExitPortal = false;

    [SerializeField]
    Collectable RequiredInventoryObject;

    bool beenUsed = false;
    public bool BeenUsed { get { return beenUsed; } }

	public void Use(PlayerController user)
    {
        if(IsExitPortal)
        {
            if(Planet.Instance)
            {
                Planet.Instance.ExitPortalReached();
            }
        }

        if (beenUsed)
            return;

        if(RequiredInventoryObject)
        {
            if (!user.HasItem(RequiredInventoryObject))
            {
                return;
            }
        }

        PerformUseAction();

        if (IsExitPortal)
        {
            if (Planet.Instance)
            {
                Planet.Instance.ExitPortalReached();
            }
        }
    }

    void PerformUseAction()
    {
        beenUsed = true;
    }
}
