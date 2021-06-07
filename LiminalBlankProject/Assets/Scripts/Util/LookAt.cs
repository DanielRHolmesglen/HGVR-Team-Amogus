using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LookAt : MonoBehaviour
{
    public Transform target;
    void LateUpdate()
    {
        if (!target) return;
        transform.rotation = Quaternion.LookRotation(transform.position - target.position, Vector3.up);
    }
}
