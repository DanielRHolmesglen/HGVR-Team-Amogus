using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ElectricBalloon : MonoBehaviour
{
    public void OnPop()
    {
        GameSystem.singleton.ElectrocuteDart(8.0f);
    }
}
