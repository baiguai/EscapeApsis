#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_Starboard:
    DarkRoom
{
    roomName = "Ventilation Pipe";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
The aft section of the main aft ventilation pipe is a large tube running forward and aft through\n
the ship. You find it uncomfortable to breathe in the hot pipe. The vent\n
continues forward into utter darkness.\n
\b
Branching off to the starboard is a small cramped pipe.\n
        '
    ];

    nav = [
        'fore: Travel forward through the main vent pipe.',
        'starboard: Enter the narrow starboard pipe.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        Desc_Location(self);
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    fore: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You crawl forward through the main vent pipe.');
        };
        room1 = Vent_Aft_MainPipe_Starboard;
        room2 = Vent_Aft_MainPipe_Starboard_Forward;
    };
    starboard: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You crawl into the cramped pipe branching off to
                starboard.');
        };
        room1 = Vent_Aft_MainPipe_Starboard;
        room2 = Vent_Aft_MainPipe_Starboard;
    };
// -----------------------------------------------------------------------------
};
