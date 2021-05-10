using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Liminal.SDK.Core;
using Liminal.SDK.VR;
using Liminal.SDK.VR.Input;

public class DartHolder : MonoBehaviour
{
    [SerializeField]
    string throwButton = VRButton.One;

    [SerializeField]
    Dart dart;
    [SerializeField]
    GameObject controller;

    Vector3 dartPosition;
    Vector3 debugDartPosition;

    Vector3 lastPosition;
    Vector3[] positionAvg = new Vector3[3];

    float debugOffset;
    public void FixedUpdate()
    {
        IVRInputDevice device = VRDevice.Device.PrimaryInputDevice;
        Transform deviceTransform = device?.Pointer.Transform;
        if (deviceTransform == null) return;
        Vector3 devicePosition = deviceTransform.position;

        devicePosition += deviceTransform.forward * debugOffset;

        Vector3 position = MovingMap.transform.InverseTransformPoint(devicePosition);
        for (int i = 1; i != positionAvg.Length; ++i)
        {
            positionAvg[i - 1] = positionAvg[i];
        }
        Vector3 offset = position - lastPosition;
        positionAvg[positionAvg.Length - 1] = offset;
        lastPosition = position;
    }

    public void Update()
    {
        debugOffset = Mathf.Clamp(debugOffset + Time.deltaTime * (Input.GetKey(KeyCode.E) ? 8f : -8f), 0f, 2f);
        debugDartPosition = Vector3.forward * debugOffset;

        if (dart.mode == Dart.Mode.Held)
            dart.transform.localPosition = dartPosition + debugDartPosition;

        IVRInputDevice device = VRDevice.Device.PrimaryInputDevice;
        if (device == null) return;
        bool down = device.GetButtonDown(VRButton.One);
        if (down)
        {
            if (dart.mode == Dart.Mode.Held)
            {
                Vector3 force = Vector3.zero;
                foreach (Vector3 v in positionAvg) force += v;
                if (force.magnitude > 0.1f)
                {
                    force = force.normalized * force.magnitude;
                    dart.Throw(force * 5.0f);
                }
            } else if (dart.mode == Dart.Mode.Projectile)
            {
                dart.Recall();
            }
        }
    }

    public Vector3 GetDartPosition()
    {
        return transform.TransformPoint(dartPosition + debugDartPosition);
    }

    void Start()
    {
        controller?.SetActive(true);
    }

    void Awake()
    {
        dartPosition = new Vector3(0f, 0f, 0.175f);
    }
}
