﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dart : MonoBehaviour
{
    [SerializeField]
    new AudioSource audio;
    [SerializeField]
    AudioSource recallSound;
    [SerializeField]
    AudioClip[] hitSounds;

    public enum Mode { 
        Held,
        Projectile,
        Recall
    }
    public Mode mode = Mode.Held;
    [SerializeField]
    DartHolder holder;
    [SerializeField]
    LineRenderer dartTrail;

    float timeInAir = 0.0f;
    float drag = 0.01f;
    Vector3 velocity;
    bool inactive;

    private static readonly Vector3 endOffset = new Vector3(0f, 0f, -0.3651232f);

    public struct TimePoint
    {
        public Quaternion rotation;
        public Vector3 position;
        public Vector3 scale;
        public TimePoint(Quaternion rotation, Vector3 position, Vector3 scale) : this()
        {
            this.rotation = rotation;
            this.position = position;
            this.scale = scale;
        }
    }

    float heldScaleFactor = 1.0f;

    TimePoint initialTransform;
    List<TimePoint> timeline;
    float timePosition;
    int timelineLimit;
    
    void Awake()
    {
        timeline = new List<TimePoint>();
        initialTransform = new TimePoint(transform.localRotation, transform.localPosition, transform.localScale);
        timelineLimit = (int)(10f / Time.fixedDeltaTime);
    }

    void Start()
    {
        dartTrail.startWidth = 0.0025f;
        dartTrail.endWidth = 0.005f;
    }

    TimePoint MakeTimePoint()
    {
        return new TimePoint(transform.rotation, MovingMap.transform.InverseTransformPoint(transform.position), transform.localScale);
    }

    void AddTimePoint()
    {
        timeline.Add(MakeTimePoint());
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
        recallSound.pitch = 0f;
        recallSound.Play();
    }

    public void Hold()
    {
        transform.SetParent(holder.transform);
        transform.localPosition = initialTransform.position;
        mode = Mode.Held;
        recallSound.Stop();
        timeline.Clear();
        UpdateTrail();
    }
    static bool PopIfBalloon(Transform trans)
    {
        if (trans.name == "Balloon")
        {
            trans.GetComponent<BalloonPopper>()?.Pop();
            return true;
        }
        return false;
    }

    float GetScaleFactor()
    {
        Camera main = Camera.main;
        return 2f * Vector3.Distance(main.transform.position, transform.position) * Mathf.Tan(main.fieldOfView * 0.5f * Mathf.Deg2Rad);
    }
    
    public TimePoint GetTimePoint(float timePosition, Vector3 dartPosition)
    {
        if (timeline.Count == 0) throw new System.Exception("Dart timeline is empty");
        float fIndex = timePosition * (timeline.Count - 1);
        int min = (int)fIndex;
        TimePoint a = timeline[min];
        TimePoint b = timeline[Mathf.Min(timeline.Count - 1, min + 1)];
        float fractal = fIndex - Mathf.Floor(fIndex);
        Quaternion rotation = Quaternion.LerpUnclamped(a.rotation, b.rotation, fractal);
        Vector3 position = Vector3.LerpUnclamped(a.position, b.position, fractal);

        Vector3 newPosition = Vector3.Lerp(dartPosition, MovingMap.transform.TransformPoint(position), Mathf.Sqrt(timePosition));

        return new TimePoint(rotation, newPosition, Vector3.LerpUnclamped(a.scale, b.scale, fractal));
    }

    public TimePoint GetTimePoint(float timePosition)
    {
        return GetTimePoint(timePosition, holder.GetDartPosition());
    }

    public void UpdateTrail(float minTimePosition = 1.0f)
    {
        if (timeline.Count == 0 || minTimePosition == 0.0f)
        {
            dartTrail.positionCount = 0;
            return;
        }
        int segmentCount = Mathf.Clamp(Mathf.Min(timeline.Count, (int)(minTimePosition * timeline.Count)), 64, 256);
        Vector3[] segments = new Vector3[segmentCount];

        Vector3 dartPosition = holder.GetDartPosition();
        Vector3 last = dartPosition;
        for (int i = 0; i != segmentCount; ++i) {
            float index = 1f - Mathf.Sqrt(1f - ((float)i / (float)(segmentCount - 1)));
            TimePoint point = GetTimePoint(index * minTimePosition, dartPosition);
            Vector3 position = point.position + (point.rotation * endOffset * point.scale.z * index);
            segments[i] = position;
            Debug.DrawLine(last, position, (i % 2 == 0 ? Color.red : Color.blue));
            last = position;
        }

        dartTrail.positionCount = segmentCount;
        dartTrail.SetPositions(segments);
        /*//
        minTimePosition = Mathf.Min(timeline.Count, minTimePosition * timeline.Count);
        int len = Mathf.CeilToInt(minTimePosition);
        Vector3[] positions = new Vector3[len];
        for (int i = 0; i != len; ++i)
            positions[i] = timeline[i].position;

        if (len >= 2)
        {
            float fractal = Mathf.FloorToInt(len) - minTimePosition;
            positions[len - 1] = Vector3.Lerp(positions[len - 1], positions[len - 2], 1f - fractal);
        }

        dartTrail.positionCount = len;
        dartTrail.SetPositions(positions);
        //*/
    }

    public void Update()
    {
        if (mode != Mode.Held)
        {
            transform.localScale = Vector3.one * Mathf.Lerp(1f, GetScaleFactor() / heldScaleFactor, 0.2f);
        }

        if (mode == Mode.Recall)
        {
            float speed = ((float)timelineLimit / (float)timeline.Count) * 0.25f;
            recallSound.pitch = speed;
            timePosition = Mathf.Max(0f, timePosition - (Time.deltaTime * speed));
            if (timePosition > 0f && timeline.Count > 0)
            {
                TimePoint point = GetTimePoint(timePosition);

                Vector3 forward = transform.position - point.position;
                if (forward.sqrMagnitude > 0)
                    transform.rotation = Quaternion.Lerp(Quaternion.LookRotation(forward, transform.up), point.rotation, timePosition);

                Ray ray = new Ray(transform.position, transform.forward);
                if (Physics.Raycast(ray, out RaycastHit hitInfo, Vector3.Distance(transform.position, point.position) * 2f))
                    PopIfBalloon(hitInfo.transform);

                transform.position = point.position;
                UpdateTrail(timePosition);
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
                Ray ray = new Ray(transform.position, velocity.normalized);
                RaycastHit hitInfo;
                bool hit = Physics.Raycast(ray, out hitInfo, velocity.magnitude * Time.deltaTime * 2f);
                Vector3 newPosition = hit ? hitInfo.point : transform.position + velocity * Time.deltaTime;
                transform.position = newPosition;
                if (hit && !PopIfBalloon(hitInfo.transform))
                {
                    audio.PlayOneShot(hitSounds[Random.Range(0, hitSounds.Length)], Mathf.Min(1f, velocity.magnitude * 0.25f));
                    inactive = true;
                }
                else if (velocity.sqrMagnitude != 0f)
                {
                    float t = Mathf.Min(1f, velocity.magnitude) * Time.deltaTime * 50f;
                    transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.LookRotation(velocity, transform.up), t);
                    transform.Rotate(0f, 0f, Time.deltaTime * 360f, Space.Self);
                }
                if (timeline.Count > 0)
                {
                    timeline[timeline.Count - 1] = MakeTimePoint();
                }
            }
            UpdateTrail();
        }
        else if (mode == Mode.Held)
        {
            transform.localRotation = Quaternion.Lerp(transform.localRotation, Quaternion.identity, Time.deltaTime * 6f);
            transform.localScale = Vector3.Lerp(transform.localScale, Vector3.one, Time.deltaTime * 6f);
            heldScaleFactor = GetScaleFactor();
        }
    }
}
