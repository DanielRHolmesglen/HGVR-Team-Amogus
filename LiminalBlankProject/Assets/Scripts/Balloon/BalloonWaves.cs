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

    //Gets the next wave.
    public int NextWave
    {
        get { return nextWave + 1; }
    }
    //Set objects as spawnpoints.
    public Transform[] spawnPoints;
    //The time that the player will have between waves to prepare and collect collectibles.
    public float timeBetweenWaves = 5f;
    //Countdown down between the waves.
    private float waveCountdown;
    //Time for 
    private float searchCountdown = 1f;
    //Giving counting spawn state a variable
    private SpawnState state = SpawnState.COUNTING;
    //
    void Start()
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
            {
                WaveCompleted();
            }
            else
            {
                return;
            }

        }

        //If the countdown for the wave has reached 0, start spawning the next wave.
        if (waveCountdown <= 0)
        {
            //If the game is no longer in the counting stage, spawn enemies.
            if (state != SpawnState.SPAWNING)
            {
                StartCoroutine(SpawnWave(waves[nextWave]));
            }
        }
        else
        //Otherwise keep counting down.
        {
            waveCountdown -= Time.deltaTime;
        }
    }

    //Moves to the next wave.
    void WaveCompleted()
    {
        state = SpawnState.COUNTING;
        waveCountdown = timeBetweenWaves;

        //Counts down the waves.
        if (nextWave + 1 > waves.Length - 1)
        {
            nextWave = 0;
        }
        else
        {
            nextWave++;
        }
    }

    //Checking if an enemy is alive.
    bool EnemyIsAlive()
    {

        searchCountdown -= Time.deltaTime;
        //If our countdown reaches 0, wait a second spawn enemies.
        if (searchCountdown <= 0f)
        {
            searchCountdown = 1f;
            //If there are no objects with the tag enemy then 
            if (GameObject.FindGameObjectWithTag("Enemy") == null)
            {
                return false;
            }
        }
        return true;
    }

    //Spawn enemy and wait.
    IEnumerator SpawnWave(Wave _wave)
    {
        state = SpawnState.SPAWNING;

        for (int i = 0; i < _wave.enemyAmount; i++)
        {
            int randI = Random.Range(0, _wave.enemies.Length);
            Debug.Log(randI);
            SpawnEnemy(_wave.enemies[randI]);
            yield return new WaitForSeconds(1f / _wave.spawnRate);
        }

        state = SpawnState.WAITING;

        yield break;
    }

    //When called spawns the enemy at assigned spawnpoints.
    void SpawnEnemy(Transform _enemy)
    {
        Transform _sp = spawnPoints[Random.Range(0, spawnPoints.Length)];
        Instantiate(_enemy, _sp.position, _sp.rotation);
    }
}
