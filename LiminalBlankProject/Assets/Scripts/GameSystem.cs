using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameSystem : MonoBehaviour
{
    public static GameSystem singleton;

    [SerializeField]
    AmbienceSystem ambience;
    [SerializeField]
    AudioSource music;

    [SerializeField]
    Logo logo;
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
        StartCoroutine("MusicIntro");
    }

    void Update()
    {
        if (Application.isEditor)
        {
            Time.timeScale = Mathf.Lerp(Time.timeScale, Input.GetKey(KeyCode.L) ? 10f : 1f, Time.deltaTime * 2f);
            music.pitch = Time.timeScale;
            if (Input.GetKeyDown(KeyCode.K))
                music.volume = 0f;
        }
    }
    IEnumerator Ending()
    {
        while (ambience.volume < 0.25f)
        {
            ambience.volume = Mathf.Min(1f, ambience.volume + (Time.deltaTime * 0.2f));
            yield return new WaitForEndOfFrame();
        }
    }
    public void MapLanded()
    {
        StartCoroutine("Ending");
    }
}
