using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class SoundPool : MonoBehaviour
{
    [SerializeField]
    AudioSource source;
    [SerializeField]
    AudioClip[] sounds;
    [SerializeField]
    Vector2 pitchRange = Vector2.one;
    float pitch = 1.0f;
    IEnumerator DestroyAfter(float time)
    {
        yield return new WaitForSecondsRealtime(time);
        DestroyImmediate(gameObject, false);
    }

    void Awake()
    {
        pitch = Random.Range(pitchRange.x, pitchRange.y);
    }
    void Start()
    {
        AudioClip clip = sounds[Random.Range(0, sounds.Length)];
        source.clip = clip;
        source.Play();
        if (!Application.isPlaying)
            StartCoroutine(DestroyAfter(clip.length));
        else
            Destroy(gameObject, clip.length);
    }

    void Update()
    {
        source.pitch = pitch * GameSystem.singleton.timeScale;
    }
}
