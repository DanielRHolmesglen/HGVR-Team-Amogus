using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ConstantRotation : MonoBehaviour
{
    [SerializeField]
    Vector3 rotation;

    void Update() {
        transform.localRotation *= Quaternion.Euler(rotation * Time.deltaTime);
    }
}
