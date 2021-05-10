using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FlightDescent : MonoBehaviour
{
    //The movement speed of the 
    public float movementSpeed = 10;
    //
    //public GameObject Stage;
    //
    private Rigidbody rb;
    //The position that the object stops at    
    public Vector3 endPosition = new Vector3(0, 0, 0);

    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        if (transform.position != endPosition)
        {
            transform.position = Vector3.MoveTowards(transform.position, endPosition, movementSpeed * Time.deltaTime);
        }
    }
}
