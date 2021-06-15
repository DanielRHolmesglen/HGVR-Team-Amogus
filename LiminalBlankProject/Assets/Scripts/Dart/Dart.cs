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

    public static float timeScale = 1.0f;

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

    public Vector3 PointTowardsBalloon(Vector3 origin, Vector3 velocity, float influence = 1.0f)
    {
        Ray ray = new Ray(origin + velocity.normalized * 3.0f, velocity.normalized);
        Vector3 closestPoint = Vector3.zero;
        float closestDis = Mathf.Infinity;
        Debug.DrawRay(ray.origin, velocity.normalized * velocity.magnitude * 0.5f);
        foreach(RaycastHit hit in Physics.SphereCastAll(ray, 6.0f, velocity.magnitude))
        {
            if (hit.transform.gameObject.name == "Balloon")
            {
                float dis = Vector3.Cross(ray.direction, (hit.transform.position - origin).normalized).sqrMagnitude;
                if (dis < closestDis)
                {
                    closestDis = dis;
                    closestPoint = hit.transform.position + Vector3.up * 0.5f;
                }
            }
        }
        Debug.DrawLine(transform.position, closestPoint, Color.white, 2.0f);
        return closestDis == Mathf.Infinity ? velocity : Vector3.Lerp(velocity, (closestPoint - origin).normalized * velocity.magnitude, influence);
    }

    public void Throw(Vector3 force)
    {
        force = PointTowardsBalloon(transform.position, force, 0.75f);
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
        bool keepOld = newForce == Vector3.zero;
        velocity = PointTowardsBalloon(transform.position, keepOld ? oldVelocity : newForce, 0.9f);
        if (!keepOld)
            timeline.RemoveRange(0, timeline.Count - 1);
        else {
            int i = (int)(timePosition * (timeline.Count - 1));
            timeline.RemoveRange(i, timeline.Count - i);
        }

        float reversedTime = audio.isPlaying ? Mathf.Clamp(audio.clip.length - audio.time, 0f, 1f) : 0f;
        audio.Stop();
        reversedAudio.pitch = recallSpeed;
        reversedAudio.time = reversedTime;
        reversedAudio.Play();
    }

    public void Recall()
    {
        lastHit = null;
        inactive = false;
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

        //float magnitude = Mathf.Lerp(a.velocity.magnitude, b.velocity.magnitude, fractal);
        return new TimePoint(rotation, newPosition, Vector3.LerpUnclamped(a.scale, b.scale, fractal), Vector3.LerpUnclamped(a.velocity, b.velocity, fractal));//.normalized * magnitude);
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
    }

    public void LateUpdate()
    {
        float dt = Time.deltaTime * timeScale;
        if (mode != Mode.Held)
        {
            dartTrail.endWidth = 0.005f * Vector3.Distance(transform.position, holder.GetDartPosition());
        }

        if (mode == Mode.Recall)
        {
            timeInAir = Mathf.Max(0f, timeInAir - dt);
            timePosition = Mathf.Max(0f, timePosition - (dt * recallSpeed));
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
            timeInAir += dt;
            if (timeInAir > 30f) inactive = true;
            if (!inactive)
            {
                velocity += Vector3.down * 4f * dt;
                velocity *= 1f - drag * Mathf.Min(1f, dt);
                Ray ray = new Ray(transform.position, velocity.normalized);
                RaycastHit hitInfo;
                bool hit = Physics.Raycast(ray, out hitInfo, velocity.magnitude * dt * 2f);
                Vector3 newPosition = hit ? hitInfo.point + velocity.normalized * 0.001f : transform.position + velocity * dt;
                transform.position = newPosition;
                if (hit && !HitIfBalloon(hitInfo))
                {
                    audio.PlayOneShot(hitSounds[Random.Range(0, hitSounds.Length)], Mathf.Min(1f, velocity.magnitude * 0.25f));
                    hitInfo.transform.GetComponent<DartTarget>()?.Trigger();
                    inactive = true;
                }
                else
                {
                    if (velocity.sqrMagnitude != 0f)
                    {
                        float t = Mathf.Min(1f, velocity.magnitude) * dt * 50f;
                        transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.LookRotation(velocity, transform.up), t);
                        transform.Rotate(0f, 0f, dt * 360f, Space.Self);
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
            transform.localRotation = Quaternion.Lerp(transform.localRotation, Quaternion.identity, dt * 6f);
            transform.localScale = Vector3.Lerp(transform.localScale, Vector3.one, dt * 6f);
        }
    }
}
