using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IcyBalloon : ExplosiveBalloon
{
    public override void Hit(Balloon balloon)
    {
        balloon.IceUp();
    }
}
