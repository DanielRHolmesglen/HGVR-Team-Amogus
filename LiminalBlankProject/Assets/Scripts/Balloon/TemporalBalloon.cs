using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TemporalBalloon : MonoBehaviour
{
    public void OnPop()
    {
        GameSystem.singleton.DoSlowTime(0.2f, 7f);
    }
}
