using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ExplosiveBalloon : MonoBehaviour
{
    public virtual void Hit(Balloon balloon)
    {
        balloon.Damage();
    }

    void Explode(Vector3 origin, float radius)
    {
        foreach (Collider col in Physics.OverlapSphere(origin, radius))
        {
            if (col.name == "Balloon")
            {
                Balloon balloon = col.GetComponent<Balloon>();
                if (balloon && !balloon.popper.hasPopped)
                    Hit(balloon);
            }
        }
    }

    public void OnPop()
    {
        Explode(transform.position, 4.0f * transform.localScale.y);
    }
}
