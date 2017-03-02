#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Aft:
    Room
{
    roomName = "Hold Port";
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
The aft section is filled with narrow shelves. You can see four rows of them,
each aft of the previous.
\n
The row of shelves aft of that appear to be lined with cleaning supplies.
Brooms and mops lay neatly along the lower shelves. Jugs of soaps and
disinfectants have been arranged along the middle shelves and gloves and
other cleaning supplies have been arranged along the upper shelves.
\n
The row aft of that is filled with various power supplies and batteries of
every size and type.
\n
Beyond that row, the final section of shelves are filled with miscellaneous
items.
        '
    ];

    nav = [
        'forward: Back to the central section of the hold'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        if (GuardPost_Cabinet_Uniform.isWornBy(me))
        {
            canSpawn = nil;
        }
        else
        {
            canSpawn = true;
        }

        if (hasSpawned == nil)
        {
            // Perform any spawning
            hasSpawned = true;

            spawner_Guard = new Spawner_Guard;
            spawner_Guard.moveInto(self.location);
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


// --[NAVIGATION]---------------------------------------------------------------
    forward: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('');
        };
        room1 = Mundane_Hold_Port_Aft;
        room2 = Mundane_Hold_Port;
    };
// -----------------------------------------------------------------------------
};
