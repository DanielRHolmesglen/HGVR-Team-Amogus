using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shark : MonoBehaviour     //unused
{
    [SerializeField]
    ConstantRotation rotator;
    [SerializeField]
    Transform fin;

    public void Angry()
    {
        rotator.enabled = false;
        transform.position = fin.position;
        fin.localPosition = Vector3.zero;
        enabled = true;
    }

    void Update()
    {
        float t = Time.deltaTime * 5f;
        fin.localRotation = Quaternion.Lerp(fin.localRotation, Quaternion.identity, t);
        Quaternion rot = Quaternion.LookRotation(transform.position - MovingMap.transform.position, Vector3.up);
        transform.rotation = Quaternion.Lerp(transform.rotation, rot, Time.deltaTime * t);
        transform.position += transform.forward * Time.deltaTime;
    }
}
