using UnityEngine;
using System.Collections;

enum CollectableLightSensitivity { None, OnlyLight, OnlyDark };

public class Collectable : MonoBehaviour
{
    [SerializeField]
    public string DisplayName = "";

    [SerializeField]
    CollectableLightSensitivity LightSensitivityWorld = CollectableLightSensitivity.None;
    [SerializeField]
    CollectableLightSensitivity LightSensitivityHeld = CollectableLightSensitivity.None;

    [SerializeField]
    GameObject RenderObject = null;

    bool IsCollected = false;
    PlayerController Collector = null;
    bool IsHidden = false;

	void Update ()
    {
	    if(IsCollected)
        {
            bool isInLight = DaylightController.Instance.IsLit(Collector.gameObject);

            if (LightSensitivityHeld == CollectableLightSensitivity.None)
            {
                // do nothing
            }
            else
            {
                bool shouldReset =
                    (isInLight && LightSensitivityHeld == CollectableLightSensitivity.OnlyDark) ||
                    (!isInLight && LightSensitivityHeld == CollectableLightSensitivity.OnlyLight);

                if(shouldReset)
                    Reset();
            }
        }
        else
        {
            UpdateWorldLightSensitivity();
        }
	}

    void UpdateWorldLightSensitivity()
    {
        bool isInLight = DaylightController.Instance.IsLit(gameObject);

        if (LightSensitivityWorld == CollectableLightSensitivity.None)
        {
            // do nothing
        }
        else
        {
            bool shouldBeHidden =
                (isInLight && LightSensitivityWorld == CollectableLightSensitivity.OnlyDark) ||
                (!isInLight && LightSensitivityWorld == CollectableLightSensitivity.OnlyLight);

            SetHidden(shouldBeHidden);
        }
    }

    public bool isCollectable()
    {
        return !IsCollected && !IsHidden;
    }

    public bool Collected(PlayerController Collector)
    {
        if(!isCollectable())
            return false;

        this.Collector = Collector;
        IsCollected = true;
        if(RenderObject)
        {
            RenderObject.SetActive(false);
        }
        return true;
    }

    void Reset()
    {
        if (Collector)
        {
            Collector.RemoveItem(this);
            Collector = null;
        }
        IsCollected = false;
        if (RenderObject)
        {
            RenderObject.SetActive(true);
        }
        UpdateWorldLightSensitivity();
    }
    
    // Hidden when not in correct light in world
    void SetHidden(bool Hidden)
    {
        if (IsHidden == Hidden)
            return;

        IsHidden = Hidden;
        // todo effect
        if (RenderObject)
        {
            RenderObject.SetActive(!Hidden);
        }
    }
}
