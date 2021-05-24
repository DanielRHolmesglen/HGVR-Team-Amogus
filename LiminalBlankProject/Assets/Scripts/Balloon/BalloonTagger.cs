using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BalloonTagger : MonoBehaviour
{   
    [SerializeField]
    string objectTag = "Enemy";

    void Awake() 
    {
        tag = objectTag; 
    }
}
