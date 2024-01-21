using UnityEngine;
using System.Collections;

enum LightSensitivity { None, OnlyLight, OnlyDark };

public class LightSensitiveObject : MonoBehaviour
{

    [SerializeField]
    LightSensitivity LightSensitivityWorld = LightSensitivity.None;

    [SerializeField]
    GameObject[] ObjectsToDisable;

    protected bool IsHidden = false;
    	
	protected virtual void Update ()
    {
        bool isInLight = DaylightController.Instance.IsLit(gameObject);

        if (LightSensitivityWorld == LightSensitivity.None)
        {
            // do nothing
        }
        else
        {
            bool shouldBeHidden =
                (isInLight && LightSensitivityWorld == LightSensitivity.OnlyDark) ||
                (!isInLight && LightSensitivityWorld == LightSensitivity.OnlyLight);

            SetHidden(shouldBeHidden);
        }
    }
    
    void SetHidden(bool Hidden)
    {
        if (IsHidden == Hidden)
            return;

        IsHidden = Hidden;
        // todo effect
        for(int i = 0; i < ObjectsToDisable.Length; i++)
        {
            ObjectsToDisable[i].SetActive(!Hidden);
        }
    }
}
