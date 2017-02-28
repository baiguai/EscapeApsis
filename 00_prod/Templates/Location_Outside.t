#include <adv3.h>
#include <en_us.h>

NAME:
    OutdoorRoom
{
    roomName = "";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [
    ];

    msgDay = [
        '
        '
    ];

    msgNight = [
        '
        '
    ];

    nav = [
        ''
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        if (hasSpawned == nil)
        {
            // Perform any spawning
            hasSpawned = true;
        }

        Desc_Location(self);
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    north: TravelWithMessage, RoomConnector {
        travenDesc()
        {
            Desc_Navigation('');
        };
        room1 = ;
        room2 = ;
    };
// -----------------------------------------------------------------------------
};

