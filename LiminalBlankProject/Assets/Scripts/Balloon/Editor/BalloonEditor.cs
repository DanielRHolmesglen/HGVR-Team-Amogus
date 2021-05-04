using System.Collections;
using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(BalloonPopper))]
public class BalloonPopperEditor : Editor
{
    public override void OnInspectorGUI()
    {
        if (Application.isPlaying && GUILayout.Button("Pop"))
            ((BalloonPopper)target).Pop();

        base.OnInspectorGUI();
    }
}