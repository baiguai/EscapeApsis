#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port:
    Room
{
    roomName = "Hold Port";
    visitCount = 0;
    descCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
You are in one of the ship\'s holds.
It is vast and dim.
\n
In the thick shadows along the port and starboard walls you can make out the
shadowy forms of shelves, rising up over 6 meters.
\n
Aft, in the shadows are more shelves.
        '
    ];

    nav = [
        'enter hold door: Exit the hold.',
        'starboard: Approach the starboard side shelves.',
        'aft: Approach the aft shelves.',
        'port: Approach the port side shelves.'
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
            Desc_Navigation('You approach the starboard side shelves.');
        };
        room1 = Mundane_Hold_Port;
        room2 = Mundane_Hold_Port_ForwardStarboardShelves;
    };
    aft: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You approach the aft shelves.');
        };
        room1 = Mundane_Hold_Port;
        room2 = Mundane_Hold_Port_Aft;
    };
    port: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You approach the port side shelves.');
        };
        room1 = Mundane_Hold_Port;
        room2 = Mundane_Hold_Port_ForwardPortShelves;
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Mindane_Hold_Access_Port_Door_Inside:
    Door -> Mindane_Hold_Access_Port_Door
    'hold door' 'hold door'
{
    location = Mundane_Hold_Port;
};
// -----------------------------------------------------------------------------
