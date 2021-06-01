using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FireworkSound : MonoBehaviour
{
    [SerializeField]
    ParticleSystem particles;
    [SerializeField]
    GameObject prefab;

    int lastCount = 0;
    Vector3 lastPosition = Vector3.zero;
    void Update()
    {
        ParticleSystem.Particle[] particle = new ParticleSystem.Particle[1];
        int count = particles.GetParticles(particle, 1, 0);
        if (count < lastCount && lastPosition != Vector3.zero)
        {
            GameObject.Instantiate(prefab, lastPosition, Quaternion.identity);
        }
        if (count > 0)
        {
            lastPosition = transform.TransformPoint(particle[0].position);
            Debug.DrawLine(MovingMap.transform.position, lastPosition);
        }
        lastCount = count;
    }
}
