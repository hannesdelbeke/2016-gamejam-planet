using UnityEngine;
using System.Collections;

public class Planet : MonoBehaviour
{
    public static Planet Instance;

	void Start ()
    {
        Instance = this;
	}
}
