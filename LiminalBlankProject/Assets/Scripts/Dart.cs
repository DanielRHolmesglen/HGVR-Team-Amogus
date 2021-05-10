using System.Collections;
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

    float heldScaleFactor = 1.0f;

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
                float smoothTime = Mathf.Sin(timePosition * .5f * Mathf.PI);
                float timeI = Mathf.Min(1f, smoothTime) * timeline.Count;
                float min = Mathf.Floor(timeI);
                TimePoint a = timeline[(int)min];
                TimePoint b = timeline[Mathf.Min(timeline.Count - 1, Mathf.CeilToInt(timeI))];
                float fractal = timeI - min;
                Quaternion rotation = Quaternion.LerpUnclamped(a.rotation, b.rotation, fractal);
                Vector3 position = Vector3.LerpUnclamped(a.position, b.position, fractal);

                Vector3 dartPosition = holder.GetDartPosition();
                Vector3 newPosition = Vector3.Lerp(dartPosition, MovingMap.transform.TransformPoint(position), Mathf.Sqrt(smoothTime));

                Vector3 forward = transform.position - newPosition;
                if (forward.sqrMagnitude > 0)
                    transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.LookRotation(forward, transform.up), Time.deltaTime * 20f);

                Ray ray = new Ray(transform.position, transform.forward);
                if (Physics.Raycast(ray, out RaycastHit hitInfo, Vector3.Distance(transform.position, newPosition) * 2f))
                    PopIfBalloon(hitInfo.transform);

                transform.position = newPosition;
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
                    float t = Mathf.Min(1f, velocity.magnitude) * Time.deltaTime * 30f;
                    transform.rotation = Quaternion.Lerp(transform.localRotation, Quaternion.LookRotation(velocity, transform.up), t);
                    transform.Rotate(0f, 0f, Time.deltaTime * 360f, Space.Self);
                }
            }
        } else if (mode == Mode.Held)
        {
            transform.localRotation = Quaternion.Lerp(transform.localRotation, Quaternion.identity, Time.deltaTime * 6f);
            transform.localScale = Vector3.Lerp(transform.localScale, Vector3.one, Time.deltaTime * 6f);
            heldScaleFactor = GetScaleFactor();
        }
    }
}
