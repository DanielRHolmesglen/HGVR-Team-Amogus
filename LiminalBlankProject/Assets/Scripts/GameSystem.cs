﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameSystem : MonoBehaviour
{
    [SerializeField]
    AmbienceSystem ambience;
    [SerializeField]
    AudioSource music;

    IEnumerator MusicIntro()
    {
        yield return new WaitForSeconds(5f);
        while (ambience.volume > 0.0f)
        {
            ambience.volume = Mathf.Max(0f, ambience.volume - (Time.deltaTime * 0.1f));
            yield return new WaitForEndOfFrame();
        }
        music.Play();
        while (music.volume != 0.25f)
        {
            music.volume = Mathf.Min(0.25f, music.volume + Time.deltaTime * 0.025f);
            yield return new WaitForEndOfFrame();
        }
    }
    void Start()
    {
        StartCoroutine("MusicIntro");
    }
}
