using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Balloon : MonoBehaviour
{
    public BalloonPopper popper;
    [SerializeField]
    ParticleSystem popParticles;
    [SerializeField]
    ConstantForce force;

    public float lifetime = 40.0f;
    void Start()
    {
        this.name = "Balloon";
        Vector3 offset = transform.position - MovingMap.singleton.gameObject.transform.position;
        force.force += new Vector3(offset.x, 0f, offset.z).normalized * 0.1f;
    }

    public void OnPop()
    {
        if (popParticles != null)
        {
            popParticles.transform.SetParent(null);
            popParticles.gameObject.SetActive(true);
            Destroy(popParticles.gameObject, 6.0f);
        }
    }

    public void OnPopEnded()
    {
        Destroy(gameObject);
    }

    void Update()
    {
        lifetime -= Time.deltaTime;
        if (lifetime < 0f) Destroy(gameObject);
    }
}
