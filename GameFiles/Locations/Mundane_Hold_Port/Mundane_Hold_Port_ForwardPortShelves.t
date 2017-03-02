#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_ForwardPortShelves:
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
        'starboard: Back to the central section of the hold.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        Desc_Location(self);
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    starboard: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You return to the central section of the hold.');
        };
        room1 = Mundane_Hold_Port_ForwardPortShelves;
        room2 = Mundane_Hold_Port;
    };
// -----------------------------------------------------------------------------
};
