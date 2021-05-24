using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BalloonSpawn : MonoBehaviour
{
    void OnDrawGizmos()
    {
        Gizmos.DrawWireCube(transform.position, transform.lossyScale * 0.5f);
    }
}
