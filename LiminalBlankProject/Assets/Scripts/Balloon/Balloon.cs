using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Balloon : MonoBehaviour
{
    [SerializeField]
    BalloonPopper popper;
    [SerializeField]
    ParticleSystem popParticles;

    float lifetime = 0.0f;
    void Start()
    {
        this.name = "Balloon";
    }

    public void OnPop()
    {
        popParticles.transform.SetParent(null);
        popParticles.gameObject.SetActive(true);
        Destroy(popParticles.gameObject, 6.0f);
    }

    public void OnPopEnded()
    {
        Destroy(gameObject);
    }

    void Update()
    {
        lifetime += Time.deltaTime;
        if (lifetime > 40f) Destroy(gameObject);
    }
}
