using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class BalloonPopper : MonoBehaviour
{
    [SerializeField]
    new Collider collider;
    [SerializeField]
    MeshRenderer normalMesh;
    [SerializeField]
    SkinnedMeshRenderer fragmentedMesh;
    [SerializeField]
    Transform fragmentedTransform;

    [SerializeField]
    AudioClip[] popSoundPool;
    [SerializeField]
    AudioSource audioSource;

    [SerializeField]
    bool randomizeRotation = true;
    [SerializeField]
    float lifetimeAfterPop = 0.5f;
    [SerializeField]
    UnityEvent popEnded;

    float popping = 0.0f;
    public void Pop()
    {
        popping = 0f;
        this.enabled = true;
        fragmentedMesh.enabled = true;
        normalMesh.enabled = false;
        collider.enabled = false;
        if (randomizeRotation)
            fragmentedTransform.rotation = Quaternion.AngleAxis(Random.value * 360f, Vector3.up);

        if (popSoundPool.Length != 0)
        {
            audioSource.pitch = Random.Range(1.1f, 1.3f);
            audioSource.PlayOneShot(popSoundPool[Random.Range(0, popSoundPool.Length)]);
        }
    }

    void Awake()
    {
        this.enabled = false;
        fragmentedMesh.enabled = false;
        collider.enabled = true;
    }

    void Update()
    {
        if (popping == 1.0f + lifetimeAfterPop)
        {
            popping = 0f;
            fragmentedTransform.localScale = Vector3.zero;
            fragmentedMesh.SetBlendShapeWeight(0, 0f);
            fragmentedMesh.enabled = false;
            this.enabled = false;
            normalMesh.enabled = true;
            collider.enabled = true;
            popEnded?.Invoke();
            return;
        }
        popping = Mathf.Min(1.0f + lifetimeAfterPop, popping + Time.deltaTime * 3.5f);

        float x = Mathf.Min(1.0f, popping);
        float v = 2.70158f * x * x * x - 1.70158f * x * x;
        fragmentedTransform.localScale = Vector3.one * (1f - v);
        fragmentedMesh.SetBlendShapeWeight(0, Mathf.Sin(x * .5f * Mathf.PI) * 100f);
    }
}
