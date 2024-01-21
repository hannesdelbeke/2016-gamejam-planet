using UnityEngine;
using System.Collections;

enum CollectableLightSensitivity { None, OnlyLight, OnlyDark };

public class Collectable : LightSensitiveObject
{
    [SerializeField]
    public string DisplayName = "";

    [SerializeField]
    CollectableLightSensitivity LightSensitivityHeld = CollectableLightSensitivity.None;

    [SerializeField]
    GameObject RenderObject = null;

    [SerializeField]
    ParticleSystem CollectEffect;
    [SerializeField]
    ParticleSystem SpawnEffect;
    [SerializeField]
    ParticleSystem LostEffect;

    bool IsCollected = false;
    PlayerController Collector = null;

	protected override void Update ()
    {
	    if(IsCollected && Collector)
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
            base.Update();
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
        if(CollectEffect)
        {
            ParticleSystem ps = Instantiate<ParticleSystem>(CollectEffect);
            ps.gameObject.transform.position = transform.position;
            ps.gameObject.transform.rotation = transform.rotation;
            ps.Play();
            Destroy(ps.gameObject, 1);
        }
        return true;
    }

    void Reset()
    {
        if (Collector)
        {
            if (LostEffect)
            {
                ParticleSystem ps = Instantiate<ParticleSystem>(LostEffect);
                ps.gameObject.transform.position = Collector.transform.position;
                ps.gameObject.transform.rotation = Collector.transform.rotation;
                ps.Play();
                Destroy(ps.gameObject, 1);
            }
            Collector.RemoveItem(this);
            Collector = null;
        }
        IsCollected = false;
        if (RenderObject)
        {
            RenderObject.SetActive(true);
        }

        if (SpawnEffect)
        {
            ParticleSystem ps = Instantiate<ParticleSystem>(SpawnEffect);
            ps.gameObject.transform.position = transform.position;
            ps.gameObject.transform.rotation = transform.rotation;
            ps.Play();
            Destroy(ps.gameObject, 1);
        }

    }
}
