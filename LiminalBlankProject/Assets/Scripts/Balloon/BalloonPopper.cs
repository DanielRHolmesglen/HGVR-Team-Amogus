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
    //[SerializeField]
    //LODGroup normalLOD;
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
    UnityEvent popped;
    [SerializeField]
    UnityEvent popEnded;

    public bool hasPopped = false;

    float popping = 0.0f;
    public void Pop()
    {
        popping = 0f;
        hasPopped = true;
        this.enabled = true;
        fragmentedMesh.enabled = true;
        collider.enabled = false;
        if (randomizeRotation)
            fragmentedTransform.rotation = Quaternion.AngleAxis(Random.value * 360f, Vector3.up);

        if (popSoundPool.Length != 0)
        {
            audioSource.pitch = Random.Range(1.1f, 1.3f);
            audioSource.PlayOneShot(popSoundPool[Random.Range(0, popSoundPool.Length)]);
        }
        popped?.Invoke();
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
            popEnded?.Invoke();
            /*//
            popping = 0f;
            fragmentedTransform.localScale = Vector3.zero;
            fragmentedMesh.SetBlendShapeWeight(0, 0f);
            fragmentedMesh.enabled = false;
            this.enabled = false;
            normalMesh.enabled = true;
            normalLOD.enabled = true;
            collider.enabled = true;
            //*/
            return;
        }
        popping = Mathf.Min(1.0f + lifetimeAfterPop, popping + Time.deltaTime * 3.5f);

        float x = Mathf.Min(1.0f, popping);
        float v = 2.70158f * x * x * x - 1.70158f * x * x;
        fragmentedTransform.localScale = Vector3.one * (1f - v);
        fragmentedMesh.SetBlendShapeWeight(0, Mathf.Sin(x * .5f * Mathf.PI) * 200f);
        normalMesh.enabled = false;
        //normalLOD.enabled = false;
    }
}
