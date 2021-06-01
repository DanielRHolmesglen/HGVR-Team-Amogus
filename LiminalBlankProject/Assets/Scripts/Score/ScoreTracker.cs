using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScoreTracker : MonoBehaviour
{
    public static ScoreTracker singleton;

    public int score = 0;
    public static int highScore = 0;

    public bool PushHighScore()
    {
        bool higher = score > highScore;
        highScore = score;
        return higher;
    }

    void Awake()
    {
        singleton = this;
    }


}
