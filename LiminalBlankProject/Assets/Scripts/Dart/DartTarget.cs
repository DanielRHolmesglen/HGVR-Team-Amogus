using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class DartTarget : MonoBehaviour
{
    public UnityEvent OnTrigger;

    public void Trigger()
    {
        OnTrigger?.Invoke();
    }
}
