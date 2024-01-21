using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    LayerMask PlanetLayer;

    [SerializeField]
    GameObject Mesh;

    ArrayList Inventory = new ArrayList();

#if false

    Vector3 PositionVector = new Vector3(0, 0, 1);
    Vector3 UpVector = new Vector3(0, 1, 0);
    Vector3 RightVector = new Vector3(1, 0, 0);

    Vector3 PreviousMoveDegree = Vector3.zero;
    int BounceOff = 0;

    float MoveSpeed = 0;

    void Start()
    {
        RotateSurfacePosition(new Vector3(0, 30, 0));
        RefreshInventoryUI();
    }

	void Update ()
    {
        if(BounceOff > 0)
        {
            BounceOff--;
            RotateSurfacePosition(Time.deltaTime * -PreviousMoveDegree * (BounceOff / 30.0f));
        }
        else
        {
            UpdateMovement();
        }
    }

    void UpdateMovement()
    {
        Vector3 moveDegree = Vector3.zero;
        moveDegree.y += Input.GetAxis("Vertical");
        moveDegree.x += Input.GetAxis("Horizontal");

        if (moveDegree.Equals(Vector3.zero))
            MoveSpeed = Mathf.Lerp(MoveSpeed, 0, 0.1f);
        else
            MoveSpeed = Mathf.Lerp(MoveSpeed, 70.0f, 0.1f);

        float moveSpeed = Time.deltaTime * MoveSpeed;
        float turnSpeed = Time.deltaTime * 90.0f;

        moveDegree.Normalize();
        moveDegree *= moveSpeed;

        if (Input.GetKey(KeyCode.Q))
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
            if(BounceOff <= 0)
                PreviousMoveDegree = moveDegree * (1.0f / Time.deltaTime);

            if (moveDegree.y != 0)
            {
                Quaternion RotAroundRight = Quaternion.AngleAxis(moveDegree.y, RightVector);
                PositionVector = RotAroundRight * PositionVector;
                UpVector = RotAroundRight * UpVector;
            }
            if (moveDegree.x != 0)
            {
                Quaternion RotAroundUp = Quaternion.AngleAxis(-moveDegree.x, UpVector);
                PositionVector = RotAroundUp * PositionVector;
                RightVector = RotAroundUp * RightVector;
            }
            if (moveDegree.z != 0)
            {
                Quaternion RotAroundFwd = Quaternion.AngleAxis(moveDegree.z, PositionVector);
                UpVector = RotAroundFwd * UpVector;
                RightVector = RotAroundFwd * RightVector;
            }

            Vector3 prevPos = transform.position;

            SnapToPlanetSurface();
            
            if (Mesh)
            {
                float a = Vector3.Angle((prevPos - transform.position), RightVector);
                float b = Vector3.Angle((prevPos - transform.position), -RightVector);
                Mesh.transform.localRotation = Quaternion.Lerp(Mesh.transform.localRotation, Quaternion.Euler(0, (a < b ? -1 : 1) * Vector3.Angle(UpVector, (transform.position - prevPos)) + 90, 0), 0.1f);
            }
        }
    }

    void SnapToPlanetSurface()
    {
        Vector3 RayEnd = Planet.Instance.gameObject.transform.position;
        Vector3 RayStart = RayEnd - PositionVector * 10000.0f;
        
        RaycastHit Hit;
        if(Physics.Linecast(RayStart, RayEnd, out Hit, PlanetLayer))
        {
            transform.position = Hit.point;
            transform.rotation = Quaternion.LookRotation(UpVector, -PositionVector);
        }
    }

    //-- Collision --//
    void OnTriggerEnter(Collider col)
    {
        Collectable collectable = col.gameObject.GetComponentInParent<Collectable>();
        Usable usable = col.gameObject.GetComponentInParent<Usable>();
        if(collectable)
        {
            if(collectable.Collected(this))
            {
                Inventory.Add(collectable);
                RefreshInventoryUI();
            }
        }
        else if(usable)
        {
            usable.Use(this);
        }
        else if(BounceOff <= 0)
        {
            BounceOff = 40;
            MoveSpeed = 0;
        }
    }
#endif

    Quaternion currentMeshRotation;
    Quaternion desiredMeshRotation;

    void Start()
    {
        RefreshInventoryUI();
    }

    void Update()
    {
        if (!Planet.Instance)
            return;

        Vector3 planPos = Planet.Instance.gameObject.transform.position;

        Rigidbody rigidBody = GetComponent<Rigidbody>();

        if (!rigidBody)
            return;

        rigidBody.Sleep();

        // grav
        rigidBody.AddForce((planPos - transform.position).normalized * 70.0f);

        // move
        Vector3 moveDegree = Vector3.zero;
        moveDegree.x += Input.GetAxis("Horizontal");
        moveDegree.y += Input.GetAxis("Vertical");
        moveDegree.Normalize();

        float moveAngle = Vector3.Angle(Vector3.up, moveDegree);
        bool isup = Vector3.Cross(Vector3.forward, moveDegree).y > 0;

        Transform camTrans = GameObject.FindObjectOfType<PlayerCamera>().transform;
        moveDegree = camTrans.TransformVector(moveDegree);
        
        rigidBody.AddForce(moveDegree * 200.0f);
        //Debug.DrawLine(transform.position, transform.position + moveDegree, Color.red, 3);

        if (Mesh && !moveDegree.Equals(Vector3.zero))
        {
            desiredMeshRotation = Quaternion.AngleAxis(moveAngle * (isup ? 1 : -1) + 90, -camTrans.forward) * Quaternion.AngleAxis(-90, camTrans.right) * camTrans.rotation;
        }
    }

    void LateUpdate()
    {
        if(Mesh)
        {
            Mesh.transform.rotation = currentMeshRotation = Quaternion.RotateTowards(currentMeshRotation, desiredMeshRotation, Time.deltaTime * 360.0f);
        }
    }

    public bool HasItem(Collectable item)
    {
        return Inventory.Contains(item);
    }

    public void RemoveItem(Collectable item)
    {
        Inventory.Remove(item);
        RefreshInventoryUI();
    }

    public void RefreshInventoryUI()
    {
        if (!UIManager.Instance)
            return;

        int c = 0;
        string[] items = new string[Inventory.Count];

        for(int i = 0; i < Inventory.Count; i++)
            items[c++] = ((Collectable)Inventory[i]).DisplayName;

        UIManager.Instance.SetInventory(items);
    }

    void OnTriggerEnter(Collider col)
    {
        Collectable collectable = col.gameObject.GetComponentInParent<Collectable>();
        Usable usable = col.gameObject.GetComponentInParent<Usable>();
        if (collectable)
        {
            if (collectable.Collected(this))
            {
                Inventory.Add(collectable);
                RefreshInventoryUI();
            }
        }
        else if (usable)
        {
            usable.Use(this);
        }
    }
}
