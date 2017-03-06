#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe:
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
The main aft ventilation pipe is a large tube running forward and aft through
the ship.
        '
    ];

    nav = [
        ''
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        Desc_Location(self);
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    north: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('');
        };
        room1 = Vent_Aft_MainPipe;
        room2 = Vent_Aft_MainPipe;
    };
// -----------------------------------------------------------------------------
};
