using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Liminal.SDK.Core;
using Liminal.SDK.VR;
using Liminal.SDK.VR.Input;

public class DartInput : MonoBehaviour
{
    [SerializeField]
    string button = VRButton.One;
    [SerializeField]
    bool useSecondaryDevice = false;

    IVRInputDevice GetDevice()
    {
        return useSecondaryDevice ? VRDevice.Device.SecondaryInputDevice : VRDevice.Device.PrimaryInputDevice;
    }

    public bool GetButtonDown()
    {
        return GetDevice()?.GetButtonDown(button) ?? false;
    }

    public bool GetButtonUp()
    {
        return GetDevice()?.GetButtonUp(button) ?? false;
    }
}
