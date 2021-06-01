using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class MovingMap : MonoBehaviour
{
    public static MovingMap singleton;
    public static new Transform transform;

    [SerializeField]
    private Vector3 finalDestination = Vector3.zero;
    [SerializeField]
    private float timeToDestination = 160.0f;

    [SerializeField]
    private UnityEvent finishedMoving;

    private Vector3 startPosition = Vector3.zero;
    private float progress = 0.0f;
    void Awake() {
        if (singleton != null) Destroy(this);
        else
        {
            singleton = this;
            transform = gameObject.transform;
            startPosition = transform.position;
        }
    }

    public void Update()
    {
        bool moving = progress < 1f;
        progress = Mathf.Min(1f, progress + Time.deltaTime / timeToDestination);
        transform.position = Vector3.Lerp(startPosition, finalDestination, Mathf.Sqrt(progress));
        if (progress == 1f && moving)
            finishedMoving?.Invoke();
    }
}
