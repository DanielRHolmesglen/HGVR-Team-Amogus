using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Balloon : MonoBehaviour
{
    [SerializeField]
    BalloonPopper popper;

    float lifetime = 0.0f;
    void Start()
    {
        this.name = "Balloon";
    }

    public void OnPop()
    {
        Destroy(gameObject);
    }

    void Update()
    {
        lifetime += Time.deltaTime;
        if (lifetime > 120f) Destroy(gameObject);
    }
}
