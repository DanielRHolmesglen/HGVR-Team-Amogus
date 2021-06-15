using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class ScoreDisplay : MonoBehaviour
{
    [SerializeField]
    Text scoreText;
    [SerializeField]
    GameObject highScoreObject;
    [SerializeField]
    AudioSource source;
    [SerializeField]
    AudioClip tickSound;
    [SerializeField]
    AudioClip celebrationSound;
    [SerializeField]
    Rigidbody rigidBody;
    [SerializeField]
    Transform winnerBalloon;
    [SerializeField]
    AudioClip inflationSound;

    int hits = 0;
    void Awake()
    {
        transform.localScale = Vector3.forward;
        winnerBalloon.localRotation = Quaternion.Euler(Random.Range(-10f, 10f), Random.Range(-10f, 10f), Random.Range(-10f, 10f));
        gameObject.SetActive(false);
    }

    void Update()
    {
        transform.localScale = Vector3.Lerp(transform.localScale, Vector3.one, Time.deltaTime);
    }
    public void Knockout()
    {
        if (++hits >= 2)
        {
            rigidBody.isKinematic = false;
            rigidBody.AddForce(Vector3.forward, ForceMode.VelocityChange);
        }
    }

    IEnumerator ShowScore()
    {
        ScoreTracker scoreTracker = ScoreTracker.singleton;
        bool newHighScore = scoreTracker.PushHighScore();
        yield return new WaitForSeconds(2.0f);
        winnerBalloon.gameObject.SetActive(true);
        Quaternion rot = winnerBalloon.localRotation;
        source.PlayOneShot(inflationSound);
        for (int i = 0; i != 100; ++i)
        {
            float p = 1f - Mathf.Sqrt(1f - (i / 99f));
            winnerBalloon.localRotation = Quaternion.Lerp(rot, Quaternion.identity, p);
            winnerBalloon.localScale = Vector3.one * p;
            scoreText.text = Mathf.RoundToInt(scoreTracker.score * p).ToString();
            source.pitch = 0.75f + p * 0.5f;
            source.PlayOneShot(tickSound);
            yield return new WaitForSeconds(0.02f);
        }
        winnerBalloon.GetComponent<BalloonPopper>().Pop();
        yield return new WaitForSeconds(0.5f);
        if (newHighScore)
        {
            source.pitch = 1.0f;
            source.PlayOneShot(celebrationSound);
            Fireworks.singleton.Celebrate();
            highScoreObject.SetActive(true);
        }
    }

    public void Activate()
    {
        gameObject.SetActive(true);
        StartCoroutine(ShowScore());
    }
}
