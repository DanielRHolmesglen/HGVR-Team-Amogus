﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Liminal.SDK.Core;
using Liminal.SDK.VR;
using Liminal.SDK.VR.Input;

public class DartHolder : MonoBehaviour
{
    [SerializeField]
    Dart dart;

    Vector3 lastPosition;
    Vector3[] positionAvg = new Vector3[8];

    float debugOffset;
    public void FixedUpdate()
    {
        IVRInputDevice device = VRDevice.Device.PrimaryInputDevice;
        Transform deviceTransform = device?.Pointer.Transform;
        if (deviceTransform == null) return;
        Vector3 devicePosition = deviceTransform.position;

        if (dart.mode == Dart.Mode.Held)
            dart.transform.localPosition = (transform.forward * 0.175f) + Vector3.forward * debugOffset;
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
        debugOffset = Mathf.Clamp(debugOffset + Time.deltaTime * (Input.GetKey(KeyCode.E) ? 2f : -2f), 0f, 1f);
        IVRInputDevice device = VRDevice.Device.PrimaryInputDevice;
        if (device == null) return;
        bool down = device.GetButtonDown(VRButton.One);
        if (down)
        {
            if (dart.mode == Dart.Mode.Held)
            {
                Vector3 force = Vector3.zero;
                foreach (Vector3 v in positionAvg) force += v;
                if (force.sqrMagnitude > 0.1f)
                {
                    force = force.normalized * Mathf.Max(1f, force.magnitude / 8f);
                    dart.Throw(force * 2.0f);
                }
            } else if (dart.mode == Dart.Mode.Projectile)
            {
                dart.Recall();
            }
        }
    }

    [SerializeField]
    GameObject controller;
    public void Start()
    {
        controller?.SetActive(true);
    }
}