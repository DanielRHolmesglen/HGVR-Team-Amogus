using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Balloon : MonoBehaviour
{
    public BalloonPopper popper;
    [SerializeField]
    GameObject popParticles;
    [SerializeField]
    ConstantForce force;

    [SerializeField]
    AudioSource source;
    [SerializeField]
    AudioClip[] damageSounds;

    public float lifetime = 40.0f;
    public int health = 1;
    void Start()
    {
        this.name = "Balloon";
        Vector3 offset = transform.position - MovingMap.singleton.gameObject.transform.position;
        force.force += new Vector3(offset.x, 0f, offset.z).normalized * 0.1f;
    }

    public void OnPop()
    {
        if (popParticles != null)
            Destroy(GameObject.Instantiate(popParticles, transform.position + Vector3.up * 0.3f * transform.lossyScale.y, transform.rotation, MovingMap.transform), 10.0f);
    }

    public void OnPopEnded()
    {
        Destroy(gameObject);
    }

    public void Damage()
    {
        if (--health == 0)
        {
            popper.Pop();
        } else
        {
            source?.PlayOneShot(damageSounds[Random.Range(0, damageSounds.Length)]);
        }
    }

    void Update()
    {
        lifetime -= Time.deltaTime;
        if (lifetime < 0f) Destroy(gameObject);
    }
}
