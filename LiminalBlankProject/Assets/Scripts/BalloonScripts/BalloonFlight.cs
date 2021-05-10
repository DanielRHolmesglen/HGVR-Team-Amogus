using System.Collections;
using System.Collections.Generic;
using UnityEngine;
/// <summary>
/// This script controls the flight of the balloons in the game, it can also work for the island movement.
/// </summary>
public class BalloonFlight : MonoBehaviour
{
    public float speed = 1;

    void Update()
    {
        transform.Translate(Vector3.up * Time.deltaTime * speed);

    }
}

