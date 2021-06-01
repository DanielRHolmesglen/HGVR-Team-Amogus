using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BalloonSpawn : MonoBehaviour
{
    void OnDrawGizmos()
    {
        Gizmos.DrawWireSphere(transform.position, transform.lossyScale.y * 0.05f);
        for (int i = 0; i != 25; ++i)
        {
            Gizmos.color -= new Color(0f, 0f, 0f, 0.04f);
            Vector3 pos = transform.position + Vector3.down * ((float)i * 0.12f);
            Gizmos.DrawLine(pos, pos + Vector3.down * 0.12f);
        }
    }
}
