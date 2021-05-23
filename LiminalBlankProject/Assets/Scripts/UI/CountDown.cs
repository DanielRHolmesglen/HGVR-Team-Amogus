using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
/// <summary>
/// Countdown timer for the game, counts down from the set time and when the time is up an event is called
/// </summary>

public class CountDown : MonoBehaviour
{
    //The time that the timer starts at
    private float startingTime;
    //The total time that is given to the player
    public float totalTime;

    //Text so that the timer is visible 
    public Text CountDownText;

    //A float for the minutes of the countdown timer
    private float minutes;
    //A float for the seconds 
    private float seconds;

    public Animator timeUp;
    //Bool to trigger the event on and off
    public bool useEventTimer;
    //Event for the timer
    public UnityEvent TimerEvent;

    //The time which the game starts at is the total time that has been assigned to it
    private void Start()
    {
        startingTime = totalTime;
    }

    //The countdown timer for the game
    private void Update()
    {
        totalTime -= Time.deltaTime;

        minutes = (int)(totalTime / 60);
        seconds = (int)(totalTime % 60);

        if(useEventTimer)
        {
            //Triggers an event once the time is up
            if(minutes<=0 && seconds <=0)
            {
                timeUp.SetBool("TimeUp", true);
                totalTime = 0;                
                TimerEvent.Invoke(); // Used to trigger end of game event.

            }
        }

        CountDownText.text = minutes.ToString() + ":" + seconds.ToString();
    }
}

