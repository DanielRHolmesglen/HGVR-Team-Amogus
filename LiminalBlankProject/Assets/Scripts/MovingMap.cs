using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovingMap : MonoBehaviour
{
    public static MovingMap singleton;
    public static new Transform transform;
    void Awake() {
        if (singleton != null) Destroy(this);
        else
        {
            singleton = this;
            transform = gameObject.transform;
        }
    }
}
