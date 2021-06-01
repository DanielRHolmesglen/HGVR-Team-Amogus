using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DesktopManager : MonoBehaviour
{
    [SerializeField]
    GameObject vrAvatar;
    [SerializeField]
    DesktopAvatar desktopAvatar;

    void Awake()
    {
        vrAvatar.SetActive(false);
        desktopAvatar.gameObject.SetActive(true);
    }
}
