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
The aft section of the main aft ventilation pipe is a large tube running forward and aft through
the ship. You find it uncomfortable to breathe in the hot pipe. The vent
continues forward into utter darkness.
\n
Branching off to the port is a varrow short pipe back to the Port side hold.
        '
    ];

    nav = [
        'fore: Travel forward through the main vent pipe.',
        'port: Enter the narrow pipe toward the hold.'
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
        room1 = Vent_Aft_MainPipe;
        room2 = Vent_Aft_MainPipe_Forward;
    };
    port: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You crawl into the cramped pipe branching off to
                port.');
        };
        room1 = Vent_Aft_MainPipe;
        room2 = Vent_Aft_PortHoldVent;
    };
// -----------------------------------------------------------------------------
};
