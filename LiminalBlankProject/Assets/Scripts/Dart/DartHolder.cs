using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DartHolder : MonoBehaviour
{
    [SerializeField]
    DartInput input;
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
    Vector3[] velocityAvg = new Vector3[6];

    float debugOffset;
    void StoreVelocity()
    {

        Quaternion rotation = transform.rotation;
        Vector3 rotVelocity = transform.TransformPoint(rotation * Quaternion.Inverse(lastRotation) * GetDartOffset());
        Vector3 position = MovingMap.transform.InverseTransformPoint(GetDartPosition());
        for (int i = 1; i != velocityAvg.Length; ++i)
        {
            velocityAvg[i - 1] = velocityAvg[i];
        }
        Vector3 offset = (position - lastPosition) + (rotVelocity - lastRotVelocity);
        velocityAvg[velocityAvg.Length - 1] = offset / Time.deltaTime;
        lastPosition = position;
        lastRotVelocity = rotVelocity;
        lastRotation = rotation;
    }

    public void Update()
    {
        StoreVelocity();
        bool held = dart.mode == Dart.Mode.Held;
        debugOffset = Mathf.Clamp(debugOffset + Time.deltaTime * (held && Input.GetKey(input.useSecondaryDevice ? KeyCode.R : KeyCode.E) ? 3f : -3f), 0f, 1f);
        debugDartPosition = Vector3.forward * Mathf.Sqrt(debugOffset);

        if (held)
            dart.transform.localPosition = dartPosition + debugDartPosition;

        
        bool down = input.GetButtonDown();
        bool up = input.GetButtonUp();
        if (!downFirstTime && down)
            downFirstTime = input.GetButtonDown();
        if (input is DartInputDesktop)
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
                    dart.Throw(force);
                }
                else if (dart.mode == Dart.Mode.Recall)
                {
                    dart.CancelRecall(forceValid ? force : Vector3.zero);
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
        if (controller)
            controller.SetActive(false);
    }

    void Awake()
    {
        dartPosition = new Vector3(0f, 0.02f, 0.175f);
    }
}
