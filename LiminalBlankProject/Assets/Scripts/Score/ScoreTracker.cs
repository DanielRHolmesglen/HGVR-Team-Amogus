using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class ScoreTracker : MonoBehaviour
{
    public static ScoreTracker singleton;

    public int score = 0;
    public static int highScore = 0;

    [SerializeField]
    GameObject scorePopup;
    Text scorePopupText;
    [SerializeField]
    Transform playerHead;
    void Awake()
    {
        singleton = this;
        scorePopupText = scorePopup.GetComponent<Text>();
        scorePopup.transform.localScale = Vector3.zero;
    }

    public bool PushHighScore()
    {
        bool higher = score > highScore;
        highScore = score;
        return higher;
    }


    IEnumerator AnimateScore(GameObject obj)
    {
        float scale = 0.0f;
        while (scale != 1.0f)
        {
            scale = Mathf.Min(1f, scale + Time.unscaledDeltaTime * 4.0f);
            obj.transform.localScale = Vector3.one * scale * 0.2f;
            yield return new WaitForEndOfFrame();
        }
        yield return new WaitForSecondsRealtime(1f);
        while (scale != 0.0f)
        {
            scale = Mathf.Max(0f, scale - Time.unscaledDeltaTime * 4.0f);
            obj.transform.localScale = Vector3.one * scale * 0.2f;
            yield return new WaitForEndOfFrame();
        }
        Destroy(obj);
    }

    public void AddScore(int scorePoints, Vector3 source)
    {
        score += scorePoints;
        scorePopupText.text = "+" + scorePoints;
        Transform head = Camera.main ? Camera.main.transform : playerHead;
        GameObject obj = Instantiate(scorePopup, source, Quaternion.LookRotation(source - head.position, Vector3.up), MovingMap.transform);
        obj.GetComponent<LookAt>().target = head;
        obj.SetActive(true);
        StartCoroutine(AnimateScore(obj));
    }
}
