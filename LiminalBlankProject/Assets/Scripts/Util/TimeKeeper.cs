using UnityEngine;

//This is necessary because this version of Unity does not have Time.timeAsDouble.
public class TimeKeeper : MonoBehaviour
{
    public static double time = 0.0;
    void Update() { time += Time.deltaTime; }
}
