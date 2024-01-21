using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    MeshCollider PlanetSurface;

    [SerializeField]
    LayerMask PlanetLayer;

    Vector3 PositionVector = new Vector3(0, 0, 1);
    Vector3 UpVector = new Vector3(0, 1, 0);
    Vector3 RightVector = new Vector3(1, 0, 0);
    
    void Start()
    {
        RotateSurfacePosition(new Vector3(0, 30, 0));
    }

	void Update ()
    {
        float moveSpeed = Time.deltaTime * 15.0f;
        float turnSpeed = Time.deltaTime * 30.0f;
        Vector3 moveDegree = Vector3.zero;

        if(Input.GetKey(KeyCode.W))
        {
            moveDegree.y += moveSpeed;
        }
        if(Input.GetKey(KeyCode.S))
        {
            moveDegree.y -= moveSpeed;
        }

        if(Input.GetKey(KeyCode.A))
        {
            moveDegree.x += moveSpeed;
        }
        if(Input.GetKey(KeyCode.D))
        {
            moveDegree.x -= moveSpeed;
        }

        if(Input.GetKey(KeyCode.Q))
        {
            moveDegree.z += turnSpeed;
        }
        if(Input.GetKey(KeyCode.E))
        {
            moveDegree.z -= turnSpeed;
        }

        RotateSurfacePosition(moveDegree);
    }

    void RotateSurfacePosition(Vector3 moveDegree)
    {
        if (!moveDegree.Equals(Vector3.zero))
        {
            if (moveDegree.y != 0)
            {
                Quaternion RotAroundRight = Quaternion.AngleAxis(moveDegree.y, RightVector);
                PositionVector = RotAroundRight * PositionVector;
                UpVector = RotAroundRight * UpVector;
            }
            if (moveDegree.x != 0)
            {
                Quaternion RotAroundUp = Quaternion.AngleAxis(moveDegree.x, UpVector);
                PositionVector = RotAroundUp * PositionVector;
                RightVector = RotAroundUp * RightVector;
            }
            if (moveDegree.z != 0)
            {
                Quaternion RotAroundFwd = Quaternion.AngleAxis(moveDegree.z, PositionVector);
                UpVector = RotAroundFwd * UpVector;
                RightVector = RotAroundFwd * RightVector;
            }
            SnapToPlanetSurface();
        }
    }

    void SnapToPlanetSurface()
    {
        Vector3 RayEnd = PlanetSurface.gameObject.transform.position;
        Vector3 RayStart = RayEnd - PositionVector * 10000.0f;
        
        RaycastHit Hit;
        if(Physics.Linecast(RayStart, RayEnd, out Hit, PlanetLayer))
        {
            transform.position = Hit.point;
            transform.rotation = Quaternion.LookRotation(UpVector, -PositionVector);
        }
    }
}
