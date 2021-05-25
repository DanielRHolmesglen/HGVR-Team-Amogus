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
    Rigidbody rigidBody;

    [SerializeField]
    AudioSource source;
    [SerializeField]
    AudioClip[] damageSounds;

    public float lifetime = 40.0f;
    public int health = 1;

    float hitCooldown = 0.0f;
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
        if (hitCooldown > 0.0f) return;
        hitCooldown = 0.1f;
        if (--health == 0)
        {
            popper.Pop();
        } else
        {
            source?.PlayOneShot(damageSounds[Random.Range(0, damageSounds.Length)]);
        }
    }

    public void Damage(Vector3 source)
    {
        Damage();
        if (health > 0)
            rigidBody.AddForce((transform.position - source).normalized, ForceMode.Impulse);
    }

    void Update()
    {
        lifetime -= Time.deltaTime;
        hitCooldown -= Time.deltaTime;
        if (lifetime < 0f) Destroy(gameObject);
    }
}
