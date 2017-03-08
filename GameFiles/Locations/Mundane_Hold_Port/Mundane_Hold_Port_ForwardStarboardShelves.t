#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_ForwardStarboardShelves:
    Room
{
    roomName = "Hold Port";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
        '
    ];

    nav = [
        'port: Back to the central section of the hold.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        cls();

        Desc_Location(self);
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    port: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You return to the central section of the hold.');
        };
        room1 = Mundane_Hold_Port_ForwardStarboardShelves;
        room2 = Mundane_Hold_Port;
    };
// -----------------------------------------------------------------------------
};
