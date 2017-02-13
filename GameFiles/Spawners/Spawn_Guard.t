#include <adv3.h>
#include <en_us.h>

Spawn_Guard:
    Fixture
    'guard spawner'
{
    location = Limbo;
    specialDescOrder = 1;
    noun = '' '';
    adjective = '' '';
    isDyst = nil;
    threshold = nil;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = nil;
    spawnChance = 40;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
        '
    ];

    ex = [
        '
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        Desc_General(self);

        // If the criteria here is met, a guard is spawned
        if (Ship.PowerGeneratorOn == true)
        {
            if (rand(100) < spawnChance)
            {
                SpawnGuard(self.location, 'guard');
            }
        }
    };
// -----------------------------------------------------------------------------
};
