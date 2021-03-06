using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Balloon : MonoBehaviour
{
    public BalloonPopper popper;
   
    [SerializeField]
    AudioSource source;
    [SerializeField]
    AudioClip[] damageSounds;
    [SerializeField]
    AudioClip[] icedSounds;
    [SerializeField]
    ParticleSystem icedParticles;
    [SerializeField]
    bool immuneToIce = false;

    public bool immuneToBlast = false;

    public Vector3 force = Vector3.up;
    private Vector3 temporaryForce = Vector3.zero;
    public float lifetime = 40.0f;
    public int health = 1;
    public int scoreOnPop = 100;

    float hitCooldown = 0.0f;

    public IEnumerator SpeedModifier(float multiplier, float time)
    {
        force *= multiplier;
        yield return new WaitForSeconds(time);
        force /= multiplier;
    }

    IEnumerator Iced()
    {
        source.pitch = GameSystem.singleton.timeScale;
        source.PlayOneShot(icedSounds[Random.Range(0, icedSounds.Length)]);
        icedParticles.Play();
        lifetime += 8.0f;
        yield return SpeedModifier(0.2f, 10.0f);
        icedParticles.Stop();
    }

    public void IceUp()
    {
        if (!immuneToIce)
            StartCoroutine(Iced());
    }

    public void Awake()
    {
        this.name = "Balloon";
        force += new Vector3(transform.localPosition.x, 0f, transform.localPosition.z).normalized * 0.11f;
    }

    public void OnPop()
    {
        ScoreTracker.singleton.AddScore(scoreOnPop, transform.position + Vector3.up * 0.5f);
        Fireworks.singleton.Emit();
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
        } else if (source) {
            source.pitch = GameSystem.singleton.timeScale;
            source.PlayOneShot(damageSounds[Random.Range(0, damageSounds.Length)]);
        }
    }

    public void Damage(Vector3 source)
    {
        Damage();
        if (health > 0) temporaryForce += (transform.position - source).normalized;
    }

    void Update()
    {
        lifetime -= Time.deltaTime;
        hitCooldown -= Time.deltaTime;
        if (lifetime < 0f) Destroy(gameObject);
        transform.localPosition += (force + temporaryForce) * Time.deltaTime;
        temporaryForce *= Mathf.Max(0f, 1f - Time.deltaTime);
    }
}
