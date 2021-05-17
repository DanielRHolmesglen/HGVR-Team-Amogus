using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

[ExecuteInEditMode]
public class EditorFogCone : MonoBehaviour
{
    void Update()
    {
        Camera cam = SceneView.currentDrawingSceneView?.camera;
        if (cam)
        {
            transform.position = cam.transform.position;
            transform.rotation = cam.transform.rotation;
        }
    }
}
