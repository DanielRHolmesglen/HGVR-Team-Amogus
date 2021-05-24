using UnityEngine;
using System.Collections;
// Thanks to runevision for this shader.
[ExecuteInEditMode]
public class SphericalFog : MonoBehaviour
{
	protected MeshRenderer sphericalFogObject;
	public Material sphericalFogMaterial;
	public float scaleFactor = 1;

	void Start()
	{
		sphericalFogObject = gameObject.GetComponent<MeshRenderer>();
		if (sphericalFogObject == null)
			Debug.LogError("Volume Fog Object must have a MeshRenderer Component!");

		Camera cam = Camera.main;
        if (cam && cam.depthTextureMode == DepthTextureMode.None)
            cam.depthTextureMode = DepthTextureMode.Depth;

		sphericalFogObject.material = sphericalFogMaterial;
	}

	void Update()
	{
		float radius = (transform.lossyScale.x + transform.lossyScale.y + transform.lossyScale.z) / 6;
		Material mat = Application.isPlaying ? sphericalFogObject.material : sphericalFogObject.sharedMaterial;
		if (mat)
			mat.SetVector ("FogParam", new Vector4(transform.position.x, transform.position.y, transform.position.z, radius * scaleFactor));
	}
}
