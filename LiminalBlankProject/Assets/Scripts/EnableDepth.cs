using UnityEngine;

public class EnableDepth : MonoBehaviour
{
    void Awake()
    {
        Camera cam = GetComponent<Camera>();
        if (cam && cam.depthTextureMode == DepthTextureMode.None)
            cam.depthTextureMode = DepthTextureMode.Depth;
    }
}
