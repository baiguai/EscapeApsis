#include <adv3.h>
#include <en_us.h>

Brig_Hall:
    Room
{
    roomName = "hall";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

    canSpawn = nil;
    spawner_Guard = nil;

    spawners = [
        spawner_Guard
    ];

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
You are in a short hall.\n
<<Ship.PowerGeneratorOn == nil ?
'
It is filled with the dim red of auxiliary lights.\n
'
:
'
Overhead pale flourescent tubes buzz and flicker.\n
'
>>
\b
In the aft wall is the door back into the brig.\n
\b
In the forward wall is another door.\n
        '
    ];

    nav = [
        'enter forward door: Enter the forward wall door.',
        'enter brig door: Enter the brig.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        cls();

        if (Ship.PowerGeneratorOn)
        {
            canSpawn = true;
        }
        else
        {
            canSpawn = nil;
        }

        if (self.hasSpawned == nil)
        {
            spawner_Guard = new Spawner_Guard;
            spawner_Guard.moveInto(Brig_Hall);

            self.hasSpawned = true;
        }

        Desc_Location(self);

        if (descCount < 2)
        {
            foreach (local s in spawners)
            {
                s.specialDesc();
            }
        }
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_Door:
    LockableWithKey, Door
    'brig door' 'brig door'
{
    location = Brig_Hall;
    keyList = [Brig_Guard_PComm];
};
Mundane_Hold_Access_Door:
    Door
    'forward door' 'forward door'
{
    location = Brig_Hall;
};
// -----------------------------------------------------------------------------
