﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Liminal.SDK.Core;
using Liminal.SDK.VR;
using Liminal.SDK.VR.Input;

public class DartHolder : MonoBehaviour
{
    [SerializeField]
    string throwButton = VRButton.One;
    bool activatedFirstTime = false;

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

        devicePosition += deviceTransform.forward * Mathf.Sqrt(debugOffset) * 2f;

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
        bool held = dart.mode == Dart.Mode.Held;
        debugOffset = Mathf.Clamp(debugOffset + Time.deltaTime * (held && Input.GetKey(KeyCode.E) ? 3f : -3f), 0f, 1f);
        debugDartPosition = Vector3.forward * Mathf.Sqrt(debugOffset) * 2.5f;

        if (held)
            dart.transform.localPosition = dartPosition + debugDartPosition;

        IVRInputDevice device = VRDevice.Device.PrimaryInputDevice;
        if (device == null) return;
        bool activated = Application.isEditor ? device.GetButtonDown(throwButton) : device.GetButtonUp(throwButton);
        if (!activatedFirstTime)
            activatedFirstTime = device.GetButtonDown(throwButton);

        if (activated && activatedFirstTime)
        {
            if (dart.mode == Dart.Mode.Held)
            {
                Vector3 force = Vector3.zero;
                foreach (Vector3 v in positionAvg) force += v;
                force /= positionAvg.Length;
                if (force.magnitude > 0.01f && transform.InverseTransformVector(force.normalized).z > 0.25f)
                {
                    dart.Throw(force / Time.fixedDeltaTime);
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
