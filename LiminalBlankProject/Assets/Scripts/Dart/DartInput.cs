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

    public bool useSecondaryDevice = false;

    IVRInputDevice GetDevice()
    {
        return useSecondaryDevice ? VRDevice.Device.SecondaryInputDevice : VRDevice.Device.PrimaryInputDevice;
    }

    public virtual bool GetButtonDown()
    {
        return GetDevice()?.GetButtonDown(button) ?? false;
    }

    public virtual bool GetButtonUp()
    {
        return GetDevice()?.GetButtonUp(button) ?? false;
    }
}
