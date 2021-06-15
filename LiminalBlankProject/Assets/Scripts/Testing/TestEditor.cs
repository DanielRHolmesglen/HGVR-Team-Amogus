using System.Collections;
using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(Test))]
public class TestEditor : Editor
{
    public override void OnInspectorGUI()
    {
        if (GUILayout.Button("Test"))
        {
            (target as Test).transform.SetParent(SceneView.GetAllSceneCameras()[0].transform);
            Debug.Log(SceneView.GetAllSceneCameras()[0].transform.name);
        }

        base.OnInspectorGUI();
    }
}