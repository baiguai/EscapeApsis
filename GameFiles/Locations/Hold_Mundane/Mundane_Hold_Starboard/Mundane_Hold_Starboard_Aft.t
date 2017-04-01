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
Set into the base of the port wall you see a ventilation grate. It appears to
be dislodged.
        '
    ];

    nav = [
        'fore: Return to the main section of the starboard hold.',
        'enter vent: Enter the port wall vent.'
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




// --[DOORS]--------------------------------------------------------------------
Mundane_Hold_Starboard_AirShaft:
    Door
    'vent' 'vent'
{
    isOpen = true;
    location = Mundane_Hold_Starboard_Aft;
};
// -----------------------------------------------------------------------------
