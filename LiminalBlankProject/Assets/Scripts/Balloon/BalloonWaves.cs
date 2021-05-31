using System.Collections;
using UnityEngine;
/// <summary>
/// WaveSystem controls balloons spawning
/// </summary>

public class BalloonWaves : MonoBehaviour
{
    //Setting the different states of spawning at spawn points.
    public enum SpawnState { SPAWNING, WAITING, COUNTING }

    //Wave holds important variables.
    [System.Serializable]
    public class Wave
    {
        //Name of the wave.
        public string name;
        //Amount of the enemies.
        public int enemyAmount;
        //Rate which the enemies spawn into the map.
        public float spawnRate;
        //Reference to our enemy transforms.
        public Transform[] enemies;
    }
    //An array to make separate waves.
    public Wave[] waves;
    //Stores the index of the next wave.
    private int nextWave = 0;

    //Set objects as spawnpoints.
    public Transform[] spawnPoints;
    //The time that the player will have between waves to prepare.
    public float timeBetweenWaves = 5f;
    //Countdown down between the waves.
    private float waveCountdown;
    //Giving counting spawn state a variable
    private SpawnState state = SpawnState.COUNTING;

    [SerializeField]
    private Transform spawnedTransform;

    void Awake()
    {
        waveCountdown = timeBetweenWaves;
    }

    void Update()
    {
        //If the player is waiting then check if an enemy is alive.
        if (state == SpawnState.WAITING)
        {
            //If our enemy isn't alive then our wave is completed.
            if (!EnemyIsAlive())
                WaveCompleted();
                if (nextWave == waves.Length)
                {
                    enabled = false;
                    return;
                }
            else
                return;

        }

        //If the countdown for the wave has reached 0, start spawning the next wave.
        if (waveCountdown <= 0f)
        {
            //If the game is no longer in the counting stage, spawn enemies.
            if (state != SpawnState.SPAWNING)
                StartCoroutine(SpawnWave(waves[nextWave]));
        }
        else //Otherwise keep counting down.
            waveCountdown -= Time.deltaTime;
    }

    //Moves to the next wave or disables the script if there are no more waves.
    void WaveCompleted()
    {
        state = SpawnState.COUNTING;
        waveCountdown = timeBetweenWaves;

        //Increment wave index to the next wave.
        nextWave++;
    }

    //Checking if an enemy is alive.
    bool EnemyIsAlive()
    {
        return spawnedTransform.Find("Balloon") != null;
    }

    //Spawn enemy and wait.
    IEnumerator SpawnWave(Wave wave)
    {
        state = SpawnState.SPAWNING;

        for (int i = 0; i < wave.enemyAmount; i++)
        {
            int randI = Random.Range(0, wave.enemies.Length);
            SpawnEnemy(wave.enemies[randI]);
            yield return new WaitForSeconds(1f / wave.spawnRate);
        }

        state = SpawnState.WAITING;

        yield break;
    }

    //When called spawns the enemy at assigned spawnpoints.
    void SpawnEnemy(Transform enemy)
    {
        Transform sp = spawnPoints[Random.Range(0, spawnPoints.Length)];
        Instantiate(enemy, sp.position, sp.rotation, spawnedTransform);
    }
}
