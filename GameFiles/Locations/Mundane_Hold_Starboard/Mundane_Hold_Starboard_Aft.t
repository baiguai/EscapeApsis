#include <adv3.h>
#include <en_us.h>

/*
    STARBOARD HOLD - AFT
    ----------------------------------------------------------------------------
    The aft portion of the starboard hold has one set of shelves along the
    aft wall. Here the player finds a dead body.
    ----------------------------------------------------------------------------
*/
Mundane_Hold_Starboard_Aft:
    Room
{
    roomName = "Hold Starboard";
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
        'fore: Return to the main section of the starboard hold.'
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
    fore: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You return to the central area of the starboard\n
                hold.');
        };
        room1 = Mundane_Hold_Starboard_Aft;
        room2 = Mundane_Hold_Starboard;
    };
// -----------------------------------------------------------------------------
};
