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
    IEnumerator DestroyAfter(float time)
    {
        yield return new WaitForSecondsRealtime(time);
        DestroyImmediate(gameObject, false);
    }
    void Start()
    {
        AudioClip clip = sounds[Random.Range(0, sounds.Length)];
        source.pitch = Random.Range(pitchRange.x, pitchRange.y);
        source.PlayOneShot(clip);
        if (!Application.isPlaying)
            StartCoroutine(DestroyAfter(clip.length));
        else
            Destroy(gameObject, clip.length);
    }
}
