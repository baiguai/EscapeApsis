#include <adv3.h>
#include <en_us.h>

/*
    ENGINE ROOM
    ----------------------------------------------------------------------------
    Before the player can take the ship, the engines must be fixed.
    ----------------------------------------------------------------------------
*/
EngineRoom:
    Room
{
    roomName = "Engine Room";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
You are in a hot room filled with thick metal pipes that snake from wall to\n
wall and ceiling to floor. The air is thick with the smell of fuel and hot\n
metal. Red service lights glow in each corner of the room.\n
It appears you are in an engine room.\n
Along the forward wall are three gauges.\n
        '
    ];

    nav = [
        'up: Exit to the access room.',
        'enter aft door: Exit through the aft door.'
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
    up: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You ascend the porthole into the hold access.');
        };
        room1 = EngineRoom;
        room2 = Hold_Access;
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
EngineRoom_Door:
    Door
    'aft door' 'aft door'
{
    location = EngineRoom;
};
// -----------------------------------------------------------------------------
