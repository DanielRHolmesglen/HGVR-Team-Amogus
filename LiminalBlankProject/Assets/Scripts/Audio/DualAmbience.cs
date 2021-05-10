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
    void Awake()
    {
        this.enabled = false;
    }

    void UpdateVolume()
    {
        float pan = Mathf.Sin((float)((TimeKeeper.time * (double)panSpeed) % Mathf.PI));
        sourceA.volume = pan * volume * volumeMultiplier;
        sourceB.volume = (1.0f - pan) * volume * volumeMultiplier;
    }
    void Update() { UpdateVolume(); }

    public void SetVolume(float newVolume)
    {
        volume = newVolume;

        bool lastEnabled = this.enabled;
        this.enabled = newVolume > 0.0f;

        if (lastEnabled != this.enabled)
            UpdateVolume();
    }
}
