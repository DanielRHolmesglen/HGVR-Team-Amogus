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
    bool downFirstTime = false;

    [SerializeField]
    Dart dart;
    [SerializeField]
    GameObject controller;

    Vector3 dartPosition;
    Vector3 debugDartPosition;

    Vector3 lastPosition;
    Vector3 lastRotVelocity;
    Quaternion lastRotation;
    Vector3[] velocityAvg = new Vector3[5];

    float debugOffset;
    public void FixedUpdate()
    {

        Quaternion rotation = transform.rotation;
        Vector3 rotVelocity = transform.TransformPoint(rotation * Quaternion.Inverse(lastRotation) * GetDartOffset());
        Vector3 position = MovingMap.transform.InverseTransformPoint(GetDartPosition());
        for (int i = 1; i != velocityAvg.Length; ++i)
        {
            velocityAvg[i - 1] = velocityAvg[i];
        }
        Vector3 offset = (position - lastPosition) + (rotVelocity - lastRotVelocity);
        velocityAvg[velocityAvg.Length - 1] = offset;
        lastPosition = position;
        lastRotVelocity = rotVelocity;
        lastRotation = rotation;
    }

    public void Update()
    {
        bool held = dart.mode == Dart.Mode.Held;
        debugOffset = Mathf.Clamp(debugOffset + Time.deltaTime * (held && Input.GetKey(KeyCode.E) ? 3f : -3f), 0f, 1f);
        debugDartPosition = Vector3.forward * Mathf.Sqrt(debugOffset);

        if (held)
            dart.transform.localPosition = dartPosition + debugDartPosition;

        IVRInputDevice device = VRDevice.Device.PrimaryInputDevice;
        if (device == null) return;
        bool down = device.GetButtonDown(throwButton);
        bool up = device.GetButtonUp(throwButton);
        if (!downFirstTime && down)
            downFirstTime = device.GetButtonDown(throwButton);
        if (Application.isEditor)
        {
            bool v = up;
            up = down; down = v;
        }

        if (downFirstTime)
        {
            if (up)
            {
                Vector3 force = Vector3.zero;
                foreach (Vector3 v in velocityAvg) force += v;
                force /= velocityAvg.Length;
                force *= 1.75f;
                bool forceValid = force.magnitude > 0.01f;
                if (dart.mode == Dart.Mode.Held && forceValid)
                {
                    dart.Throw(force / Time.fixedDeltaTime);
                }
                else if (dart.mode == Dart.Mode.Recall)
                {
                    dart.CancelRecall(forceValid ? force / Time.fixedDeltaTime : Vector3.zero);
                }
            }
            else if (down)
            {
                if (dart.mode == Dart.Mode.Projectile)
                {
                    dart.Recall();
                }
            }
        }
    }

    public Vector3 GetDartOffset()
    {
        return dartPosition + debugDartPosition;
    }

    public Vector3 GetDartPosition()
    {
        return transform.TransformPoint(GetDartOffset());
    }

    void Start()
    {
        controller?.SetActive(false);
    }

    void Awake()
    {
        dartPosition = new Vector3(0f, 0.02f, 0.175f);
    }
}
