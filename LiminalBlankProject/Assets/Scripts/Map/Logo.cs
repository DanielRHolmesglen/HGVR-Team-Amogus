using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Logo : MonoBehaviour
{
    [SerializeField]
    Transform mesh;

    float time = 0;
    void Awake()
    {
        mesh.gameObject.SetActive(false);
        this.enabled = false;
    }

    void OnEnable()
    {
        mesh.gameObject.SetActive(true);
    }

    void Update()
    {
        time += Time.deltaTime * 0.5f;
        float t = Mathf.Min(1f, time);
        float t_back = Easing.Back.Out(t);
        transform.localRotation = Quaternion.Euler((1f - t_back) * 90f, Mathf.Sin(time * Mathf.PI) * 2.0f, Mathf.Cos(time * Mathf.PI) * 2.0f);
        float t_shrink = 1f - Mathf.Clamp(time - 2f, 0f, 1f);
        mesh.localScale = Vector3.one * Easing.Elastic.Out(t_shrink);
        if (time > 3f) Destroy(gameObject);
    }
}
