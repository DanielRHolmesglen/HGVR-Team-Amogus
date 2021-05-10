using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Balloon : MonoBehaviour
{
    [SerializeField]
    BalloonPopper popper;
    void Start()
    {
        this.name = "Balloon";
    }

    public void OnPop()
    {
        Destroy(gameObject);
    }
}
