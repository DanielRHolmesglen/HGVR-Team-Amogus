using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DualAmbience : MonoBehaviour
{
    [SerializeField]
    AudioSource sourceA;
    [SerializeField]
    AudioSource sourceB;

    [SerializeField]
    float volumeMultiplier = 0.05f;
    [SerializeField]
    float panSpeed = 0.1f;

    float volume = 0.0f;
    static readonly float MAX_PERLIN2D = Mathf.Sqrt(2f / 4f);

    void Awake()
    {
        this.enabled = false;
    }

    void UpdateVolume()
    {
        if (volume > 0f)
        {
            float t = (float)((TimeKeeper.time * 0.0001) % (double)Mathf.PI);
            float x = Mathf.Sin(t) * 100f;
            float y = Mathf.Cos(t) * 100f;
            float swing = Mathf.Clamp(Mathf.PerlinNoise(x, y), 0f, 1f);
            float pitchA = 0.75f + Mathf.PerlinNoise(Mathf.Sin(t) * 1000.0f, 0.5f) * 0.5f;
            float pitchB = 0.75f + Mathf.PerlinNoise(Mathf.Sin(t) * -1000.0f, 5.5f) * 0.5f;
            sourceA.volume = swing * volume * volumeMultiplier;
            sourceB.volume = (1.0f - swing) * volume * volumeMultiplier;
            sourceA.pitch = pitchA;
            sourceB.pitch = pitchB;
        }
    }
    void Update() {
        UpdateVolume();
    }

    public void SetVolume(float newVolume)
    {
        volume = newVolume;

        bool lastEnabled = this.enabled;
        this.enabled = newVolume > 0.0f;

        if (lastEnabled != this.enabled)
            UpdateVolume();
    }
}
