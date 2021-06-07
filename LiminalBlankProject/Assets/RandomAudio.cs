using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomAudio : MonoBehaviour
{
    [SerializeField]
    AudioSource[] sources;

    public float timeBetweenSounds = 10.0f;

    float timer = 0.0f;

    void Update()
    {
        timer -= Time.deltaTime;
        if (timer <= 0.0f)
        {
            timer = timeBetweenSounds;
            sources[Random.Range(0, sources.Length)].Play();
        }
    }
}
