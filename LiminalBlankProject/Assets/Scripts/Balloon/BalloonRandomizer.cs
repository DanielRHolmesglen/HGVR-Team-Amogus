using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BalloonRandomizer : MonoBehaviour
{
    [SerializeField]
    Vector2 scaleRange = Vector2.one;
    [SerializeField]
    Vector2 speedRange = Vector2.one;
    [SerializeField]
    Balloon balloon;
    [SerializeField]
    ConstantForce force;
    [SerializeField]
    MeshRenderer mesh;
    [SerializeField]
    SkinnedMeshRenderer poppedMesh;
    private static Material[] hues = new Material[8];
    void Awake()
    {
        int hue = Random.Range(0, 8);
        Material material = hues[hue];
        if (material == null) {
            material = mesh.material;
            float h = (float)hue / 8f;
            material.SetColor("_Color", Color.HSVToRGB(h, 1f, 1f));
            hues[hue] = material;
        }
        mesh.sharedMaterial = material;
        poppedMesh.sharedMaterial = material;

        transform.localScale *= Random.Range(scaleRange.x, scaleRange.y);
        float speed = Random.Range(speedRange.x, speedRange.y);
        force.force *= speed;
        balloon.lifetime /= speed;
    }
}
