#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_Starboard_Forward:
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
The forward section of the main aft ventilation pipe is a large tube running forward and aft through\n
the ship. You find it uncomfortable to breathe in the hot pipe. The vent\n
continues aft into utter darkness.\n
\b
The main pipe continues forward into utter darkness.\n
        '
    ];

    nav = [
        'fore: Travel forward through the main vent pipe.',
        'aft: Travel aft through the main vent pipe.'
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
        room1 = Vent_Aft_MainPipe_Starboard_Forward;
        room2 = Vent_Aft_MainPipe_Starboard_Forward_End;
    };
    aft: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You crawl aft through the main vent pipe.');
        };
        room1 = Vent_Aft_MainPipe_Starboard_Forward;
        room2 = Vent_Aft_MainPipe_Starboard_Forward;
    };
// -----------------------------------------------------------------------------
};
