using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveWithPlayer : MonoBehaviour
{
    [SerializeField]
    Transform playerHead;

    Quaternion rot = Quaternion.identity;

    Transform GetPlayerTransform()
    {
        return Camera.main ? Camera.main.transform : playerHead;
    }

    void LateUpdate()
    {
        Transform player = GetPlayerTransform();
        transform.rotation = Quaternion.Lerp(transform.rotation, Quaternion.Euler(0f, player.rotation.eulerAngles.y, 0f), Time.deltaTime * 4f);
        transform.position = player.position;
    }
}
