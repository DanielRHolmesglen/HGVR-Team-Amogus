using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AmbienceSystem : MonoBehaviour
{
    [SerializeField]
    DualAmbience dualAmbience;

    public float volume = 1.0f;
    float fadeIn;

    static AmbienceSystem singleton;
    
    void Awake() {
        singleton = this;
    }
    void Update()
    {
        fadeIn = Mathf.Min(1.0f, fadeIn + Time.deltaTime * 0.25f);
        dualAmbience.SetVolume(fadeIn * volume);
    }
}
