using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dart : MonoBehaviour
{
    [SerializeField]
    new AudioSource audio;
    [SerializeField]
    AudioSource reversedAudio;
    [SerializeField]
    AudioSource holderAudio;
    [SerializeField]
    AudioClip recallSound;
    [SerializeField]
    AudioClip recallCancelSound;
    [SerializeField]
    AudioClip[] grabSounds;
    [SerializeField]
    AudioClip[] throwSounds;
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
    private static readonly float recallSpeed = 1.9f;
    public struct TimePoint
    {
        public Quaternion rotation;
        public Vector3 position;
        public Vector3 scale;
        public Vector3 velocity;
        public TimePoint(Quaternion rotation, Vector3 position, Vector3 scale, Vector3 velocity) : this()
        {
            this.rotation = rotation;
            this.position = position;
            this.scale = scale;
            this.velocity = velocity;
        }
    }

    float heldScaleFactor = 1.0f;

    TimePoint initialTransform;
    List<TimePoint> timeline;
    float timePosition;
    int timelineLimit;

    Collider lastHit;
    
    void Awake()
    {
        timeline = new List<TimePoint>();
        initialTransform = new TimePoint(transform.localRotation, transform.localPosition, transform.localScale, Vector3.zero);
        timelineLimit = (int)(30f / Time.fixedDeltaTime);
    }

    void Start()
    {
        dartTrail.startWidth = 0.0025f;
        dartTrail.endWidth = 0.005f;
    }

    TimePoint MakeTimePoint()
    {
        return new TimePoint(transform.rotation, MovingMap.transform.InverseTransformPoint(transform.position), transform.localScale, velocity);
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
        audio.PlayOneShot(throwSounds[Random.Range(0, throwSounds.Length)], Mathf.Min(1f, velocity.magnitude * 0.25f));
        AddTimePoint();
    }

    public void CancelRecall(Vector3 newForce)
    {
        int max = timeline.Count;
        if (max < 2 || inactive) return;
        transform.SetParent(MovingMap.transform);
        mode = Mode.Projectile;
        Vector3 oldVelocity = GetTimePoint(timePosition).velocity;
        velocity = newForce == Vector3.zero ? oldVelocity : Vector3.Lerp(newForce.normalized, oldVelocity.normalized, 0.333333f) * oldVelocity.magnitude;
        timeline.RemoveRange(0, timeline.Count - 1);
        float reversedTime = audio.isPlaying ? Mathf.Clamp(audio.clip.length - audio.time, 0f, 1f) : 0f;
        audio.Stop();
        reversedAudio.pitch = recallSpeed;
        reversedAudio.time = reversedTime;
        reversedAudio.Play();
    }

    public void Recall()
    {
        lastHit = null;
        timePosition = 1.0f;
        mode = Mode.Recall;
        float reversedTime = reversedAudio.isPlaying ? Mathf.Clamp(reversedAudio.clip.length - reversedAudio.time, 0f, 1f) : 0f;
        reversedAudio.Stop();
        audio.pitch = recallSpeed;
        audio.time = reversedTime;
        audio.Play();
    }

    public void Hold()
    {
        dartTrail.endWidth = 0.005f;
        transform.SetParent(holder.transform);
        transform.localPosition = initialTransform.position;
        mode = Mode.Held;
        audio.Stop();
        audio.pitch = 1f;
        audio.PlayOneShot(grabSounds[Random.Range(0, grabSounds.Length)]);
        timeline.Clear();
        UpdateTrail();
    }
    bool HitIfBalloon(RaycastHit hit)
    {
        Transform trans = hit.transform;
        if (trans.name == "Balloon")
        {
            if (lastHit != hit.collider)
            {
                lastHit = hit.collider;
                trans.GetComponent<Balloon>()?.Damage(transform.position);
            }
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
        if (timeline.Count == 0) return new TimePoint();
        float fIndex = timePosition * (timeline.Count - 1);
        int min = (int)fIndex;
        TimePoint a = timeline[min];
        TimePoint b = timeline[Mathf.Min(timeline.Count - 1, min + 1)];
        float fractal = fIndex - Mathf.Floor(fIndex);
        Quaternion rotation = Quaternion.LerpUnclamped(a.rotation, b.rotation, fractal);
        Vector3 position = Vector3.LerpUnclamped(a.position, b.position, fractal);

        Vector3 newPosition = Vector3.Lerp(dartPosition, MovingMap.transform.TransformPoint(position), Mathf.Sqrt(timePosition));

        float magnitude = Mathf.Lerp(a.velocity.magnitude, b.velocity.magnitude, fractal);
        return new TimePoint(rotation, newPosition, Vector3.LerpUnclamped(a.scale, b.scale, fractal), Vector3.LerpUnclamped(a.velocity, b.velocity, fractal).normalized * magnitude);
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

    public void LateUpdate()
    {
        if (mode != Mode.Held)
        {
            //    transform.localScale = Vector3.one * Mathf.Lerp(1f, GetScaleFactor() / heldScaleFactor, 0.2f);
            dartTrail.endWidth = 0.005f * Vector3.Distance(transform.position, holder.GetDartPosition());
        }

        if (mode == Mode.Recall)
        {
            timeInAir = Mathf.Max(0f, timeInAir - Time.deltaTime);
            timePosition = Mathf.Max(0f, timePosition - (Time.deltaTime * recallSpeed));
            if (timePosition > 0f && timeline.Count > 0)
            {
                TimePoint point = GetTimePoint(timePosition);

                Vector3 forward = transform.position - point.position;
                if (forward.sqrMagnitude > 0)
                    transform.rotation = Quaternion.Lerp(Quaternion.LookRotation(forward, transform.up), point.rotation, 1f - Mathf.Pow(1f - timePosition, 2));

                Ray ray = new Ray(transform.position, -forward);
                Debug.DrawRay(ray.origin, ray.direction);
                if (Physics.Raycast(ray, out RaycastHit hitInfo, Vector3.Distance(transform.position, point.position) * 2f))
                {
                    HitIfBalloon(hitInfo);
                }

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
            if (timeInAir > 30f) inactive = true;
            if (!inactive)
            {
                velocity += Vector3.down * 4f * Time.deltaTime;
                velocity *= 1f - drag * Mathf.Min(1f, Time.deltaTime);
                Ray ray = new Ray(transform.position, velocity.normalized);
                RaycastHit hitInfo;
                bool hit = Physics.Raycast(ray, out hitInfo, velocity.magnitude * Time.deltaTime * 2f);
                Vector3 newPosition = hit ? hitInfo.point + velocity.normalized * 0.001f : transform.position + velocity * Time.deltaTime;
                transform.position = newPosition;
                if (hit && !HitIfBalloon(hitInfo))
                {
                    audio.PlayOneShot(hitSounds[Random.Range(0, hitSounds.Length)], Mathf.Min(1f, velocity.magnitude * 0.25f));
                    inactive = true;
                }
                else
                {
                    if (velocity.sqrMagnitude != 0f)
                    {
                        float t = Mathf.Min(1f, velocity.magnitude) * Time.deltaTime * 50f;
                        transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.LookRotation(velocity, transform.up), t);
                        transform.Rotate(0f, 0f, Time.deltaTime * 360f, Space.Self);
                    }
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
            //heldScaleFactor = GetScaleFactor();
        }
    }
}
