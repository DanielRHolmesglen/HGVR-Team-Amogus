using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fireworks : MonoBehaviour
{
    [SerializeField]
    ParticleSystem[] fireworkParticles;

    public static Fireworks singleton;
    void Awake()
    {
        if (singleton != null) Destroy(this);
        else
        {
            singleton = this;
        }
    }
    
    public void Emit()
    {
        fireworkParticles[Random.Range(0, fireworkParticles.Length)].Emit(1);
    }
}
