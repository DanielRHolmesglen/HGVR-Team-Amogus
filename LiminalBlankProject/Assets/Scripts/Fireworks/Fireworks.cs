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
        singleton = this;
    }
    
    public void Emit()
    {
        fireworkParticles[Random.Range(0, fireworkParticles.Length)].Emit(1);
    }

    public IEnumerator Celebration()
    {
        for (int i = 0; i != 100; ++i) {
            Emit();
            yield return new WaitForSeconds(0.25f);
        }
    }
    public void Celebrate()
    {
        StartCoroutine(Celebration());
    }
}
