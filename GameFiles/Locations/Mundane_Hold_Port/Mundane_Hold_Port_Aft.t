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
Along the port and starboard walls are towering shelves that reach up into the
shadows far above.
\n
        '
    ];

    nav = [
        'forward: Back to the central section of the hold.',
        'starboard: Approach the starboard wall shelves.',
        'port: Approach the port wall shelves.'
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
            Desc_Navigation('You return to the central section of the hold.');
        };
        room1 = Mundane_Hold_Port_Aft;
        room2 = Mundane_Hold_Port;
    };
    starboard: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You approach the starboard wall shelves.');
        };
        room1 = Mundane_Hold_Port_Aft;
        room2 = Mundane_Hold_Port_AftStarboardShelves;
    };
    port: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You approach the port wall shelves.');
        };
        room1 = Mundane_Hold_Port_Aft;
        room2 = Mundane_Hold_Port_AftPortShelves;
    };
// -----------------------------------------------------------------------------
};
