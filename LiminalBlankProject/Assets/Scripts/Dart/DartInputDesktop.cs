using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DartInputDesktop : DartInput
{
    public override bool GetButtonDown()
    {
        return Input.GetMouseButtonDown(useSecondaryDevice ? 1 : 0);
    }

    public override bool GetButtonUp()
    {
        return Input.GetMouseButtonUp(useSecondaryDevice ? 1 : 0);
    }
}
