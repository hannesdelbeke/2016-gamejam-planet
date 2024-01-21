using UnityEngine;
using System.Collections;

public class PlayerCamera : MonoBehaviour
{
    PlayerController pCont;

	// Use this for initialization
	void Start ()
    {
        //DontDestroyOnLoad(gameObject);
	}
	
	// Update is called once per frame
	void Update ()
    {
        if (!Planet.Instance)
            return;

        if(!pCont)
        {
            pCont = GameObject.FindObjectOfType<PlayerController>();
            if (!pCont)
                return;
        }

        Vector3 PlanetPos = Planet.Instance.transform.position;
        transform.position = PlanetPos + (pCont.transform.position - PlanetPos).normalized * 7.0f;
        transform.rotation = Quaternion.LookRotation(PlanetPos - transform.position, transform.up);
	}
}
