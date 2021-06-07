using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Liminal.Experience;
public class GameSystem : MonoBehaviour
{
    public static GameSystem singleton;

    [SerializeField]
    AmbienceSystem ambience;
    [SerializeField]
    AudioSource music;

    [SerializeField]
    Logo logo;

    float debugTimescale = 1.0f;
    float targetTimeScale = 1.0f;
    float timeScale = 1.0f;

    float timeSlowDuration = 0.0f;
    [SerializeField]
    AudioClip clockStopSound;
    [SerializeField]
    AudioClip clockStartSound;
    [SerializeField]
    AudioSource source;
    IEnumerator MusicIntro()
    {
        yield return new WaitForSeconds(5f);
        while (ambience.volume > 0.0f)
        {
            ambience.volume = Mathf.Max(0f, ambience.volume - (Time.deltaTime * 0.1f));
            yield return new WaitForEndOfFrame();
        }
        logo.enabled = true;
        music.Play();
        while (music.volume != 0.25f)
        {
            music.volume = Mathf.Min(0.25f, music.volume + Time.deltaTime * 0.025f);
            yield return new WaitForEndOfFrame();
        }
    }

    void Awake()
    {
        singleton = this;
    }

    void Start()
    {
        Dart.timeScale = 1.0f;
        StartCoroutine("MusicIntro");
    }

    void Update()
    {
        if (Application.isEditor)
        {
            debugTimescale = Mathf.Lerp(debugTimescale, Input.GetKey(KeyCode.L) ? 10f : (Input.GetKey(KeyCode.J) ? 0.02f : 1f), Time.deltaTime * 2f);
            music.pitch = 0.6f + Time.timeScale * 0.4f;
            if (Input.GetKeyDown(KeyCode.K))
                music.volume = 0f;
        }

        if (timeSlowDuration > 0.0f)
        {
            timeSlowDuration -= Time.unscaledDeltaTime;
            if (timeSlowDuration <= 0.0f)
            {
                source.PlayOneShot(clockStartSound);
                targetTimeScale = 1.0f;
            }
        }

        timeScale = Mathf.Lerp(timeScale, targetTimeScale, Time.deltaTime * 4f);

        //debug timeScale must not be factored in for dart time scale correction
        float realTimeScale = timeScale * debugTimescale;
        Time.timeScale = realTimeScale;
        if (timeScale > 0.0f) Dart.timeScale = 1f / timeScale;
    }

    public void DoSlowTime(float timeScale = 0.5f, float duration = 5.0f)
    {
        targetTimeScale = timeScale;
        if (timeSlowDuration > 2.0f)
            duration /= timeSlowDuration * 0.5f;
        else if (timeSlowDuration <= 0.0f)
            source.PlayOneShot(clockStopSound);
        timeSlowDuration += duration;
    }

    IEnumerator Ending()
    {
        timeSlowDuration = 0.0f;
        targetTimeScale = 1.0f;
        while (ambience.volume < 0.25f)
        {
            ambience.volume = Mathf.Min(1f, ambience.volume + (Time.deltaTime * 0.2f));
            yield return new WaitForEndOfFrame();
        }
        yield return new WaitForSecondsRealtime(22.0f);
        Time.timeScale = 1.0f;
        MyExperienceApp.End();
    }
    public void MapLanded()
    {
        StartCoroutine("Ending");
    }
}
