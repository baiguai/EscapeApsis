#include <adv3.h>
#include <en_us.h>

Spawner_Guard:
    Fixture
    'Guard Spawner' 'Guard Spawner'
{
    location = Limbo;
    label = '';
    labelProper = '';
    specialDescOrder = 999999;
    isListed = nil;
    lastSpawned = 0;
    spawnWait = 3;


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        local lapse = gameMain.CurrentRuntime - lastSpawned;

        if (Ship.PowerGeneratorOn == true &&
            self.location.canSpawn == true &&
            lapse > spawnWait)
        {
            lastSpawned = gameMain.CurrentRuntime;
            SpawnGuard(self.location, 'Guard');
        }
    };
// -----------------------------------------------------------------------------
};
