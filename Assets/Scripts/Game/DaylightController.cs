using UnityEngine;
using System.Collections;

public class DaylightController : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        transform.position = Quaternion.Euler(Time.deltaTime * -10.0f, 0, 0) * transform.position;
        transform.rotation = Quaternion.FromToRotation(Vector3.down, -transform.position);
	}
}
