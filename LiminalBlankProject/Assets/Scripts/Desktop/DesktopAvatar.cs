using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DesktopAvatar : MonoBehaviour
{
    //This is for desktop playtesting.
    [SerializeField]
    Transform head;
    [SerializeField]
    Transform eye;
    [SerializeField]
    Camera cam;
    [SerializeField]
    CharacterController controller;

    float pitch;

    void Update()
    {
        Cursor.lockState = CursorLockMode.Locked;
        pitch = Mathf.Clamp(pitch - Input.GetAxis("Mouse Y"), -89.99f, 89.99f);
        transform.Rotate(Vector3.up, Input.GetAxis("Mouse X"));

        head.transform.localRotation = Quaternion.Euler(pitch, 0f, 0f);

        cam.fieldOfView = Mathf.Lerp(cam.fieldOfView, Input.GetKey(KeyCode.V) ? 50f : 80f, Time.deltaTime * 6f);

        Vector3 moveDirection = Vector3.zero;
        if (Input.GetKey(KeyCode.W)) moveDirection += Vector3.forward;
        if (Input.GetKey(KeyCode.A)) moveDirection += Vector3.left;
        if (Input.GetKey(KeyCode.S)) moveDirection += Vector3.back;
        if (Input.GetKey(KeyCode.D)) moveDirection += Vector3.right;
        moveDirection = head.transform.TransformVector(moveDirection);
        controller.Move(new Vector3(moveDirection.x, 0f, moveDirection.z).normalized * Time.deltaTime * 4f);
    }

    void LateUpdate()
    {
        eye.localPosition = Vector3.zero;
        eye.localRotation = Quaternion.identity;
    }
}
