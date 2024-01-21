using UnityEngine;
using System.Collections;

public class DaylightController : MonoBehaviour
{
    [SerializeField]
    float DayLength = 10;

    public static DaylightController Instance;
    
	// Use this for initialization
	void Start ()
    {
        Instance = this;
	}
	
	// Update is called once per frame
	void Update ()
    {
        transform.position = Quaternion.Euler(Time.deltaTime * (360.0f / DayLength), 0, 0) * transform.position;
        transform.rotation = Quaternion.FromToRotation(Vector3.forward, -transform.position);
	}

    public bool IsLit(GameObject go)
    {
        Vector3 PlanetPos = Planet.Instance.gameObject.transform.position;
        Vector3 GoPos = go.transform.position;
        Vector3 LightPos = gameObject.transform.position;

        return Vector3.Angle(GoPos - PlanetPos, LightPos - PlanetPos) < 90;
    }
}
