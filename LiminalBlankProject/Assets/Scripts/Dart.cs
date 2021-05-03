﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dart : MonoBehaviour
{
    public enum Mode { 
        Held,
        Projectile,
        Recall
    }
    public Mode mode = Mode.Held;
    [SerializeField]
    DartHolder holder;

    float timeInAir = 0.0f;
    float drag = 0.01f;
    Vector3 velocity;
    bool inactive;

    struct TimePoint
    {
        public Quaternion rotation;
        public Vector3 position;
        public TimePoint(Quaternion rotation, Vector3 position) : this()
        {
            this.rotation = rotation;
            this.position = position;
        }
    }

    TimePoint initialTransform;
    List<TimePoint> timeline;
    float timePosition;
    int timelineLimit;
    
    void Awake()
    {
        timeline = new List<TimePoint>();
        initialTransform = new TimePoint(transform.localRotation, transform.localPosition);
        timelineLimit = (int)(10f / Time.fixedDeltaTime);
    }

    void AddTimePoint()
    {
        timeline.Add(new TimePoint(transform.rotation, MovingMap.transform.InverseTransformPoint(transform.position)));
    }

    void FixedUpdate()
    { 
        if (mode == Mode.Projectile && timeline.Count < timelineLimit && !inactive) {
            AddTimePoint();
        }
    }

    public void Throw(Vector3 force)
    {
        transform.SetParent(MovingMap.transform);
        mode = Mode.Projectile;
        inactive = false;
        timeInAir = 0.0f;
        velocity = force;
        AddTimePoint();
    }

    public void Recall()
    { 
        timePosition = 1.0f;
        mode = Mode.Recall;
    }

    public void Hold()
    {
        transform.SetParent(holder.transform);
        transform.localPosition = initialTransform.position;
        transform.localRotation = initialTransform.rotation;
        mode = Mode.Held;
        timeline.Clear();
    }

    public void Update()
    {
        if (mode == Mode.Recall)
        {
            float speed = (float)timelineLimit / (float)timeline.Count;
            timePosition = Mathf.Max(0f, timePosition - (Time.deltaTime * 0.666f * speed));
            if (timePosition > 0f && timeline.Count > 0)
            {
                float smoothTime = Mathf.Sqrt(timePosition);
                float timeI = Mathf.Min(1f, smoothTime) * timeline.Count;
                float min = Mathf.Floor(timeI);
                TimePoint a = timeline[(int)min];
                TimePoint b = timeline[Mathf.Min(timeline.Count - 1, Mathf.CeilToInt(timeI))];
                float fractal = timeI - min;
                Quaternion rotation = Quaternion.LerpUnclamped(a.rotation, b.rotation, fractal);
                Vector3 position = Vector3.LerpUnclamped(a.position, b.position, fractal);

                float lerpToHand = 1f - Mathf.Pow(1f - smoothTime, 3f);
                Vector3 dartPosition = holder.GetDartPosition();
                transform.position = Vector3.Lerp(dartPosition, MovingMap.transform.TransformPoint(position), lerpToHand);
                transform.rotation = Quaternion.Lerp(Quaternion.LookRotation(transform.position - dartPosition, holder.transform.up), rotation, lerpToHand);
            }
            else
            {
                Hold();
            }
        }
        else if (mode == Mode.Projectile)
        {
            timeInAir += Time.deltaTime;
            if (timeInAir > 10f) inactive = true;
            if (!inactive)
            {
                velocity += Vector3.down * 4f * Time.deltaTime;
                velocity *= 1f - drag * Mathf.Min(1f, Time.deltaTime);
            }
            RaycastHit hitInfo;
            bool hit = Physics.Raycast(new Ray(transform.position, velocity.normalized), out hitInfo, velocity.magnitude * Time.deltaTime * 5f);
            if (hit)
            {
                inactive = true;
            }
            Vector3 newPosition = hit ? hitInfo.point : transform.position + velocity * Time.deltaTime;
            transform.position = newPosition;
            if (velocity.sqrMagnitude != 0f)
                transform.rotation = Quaternion.LookRotation(velocity, transform.up);
        }
    }
}
