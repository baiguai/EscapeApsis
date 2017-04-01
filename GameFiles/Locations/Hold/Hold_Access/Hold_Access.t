#include <adv3.h>
#include <en_us.h>

Hold_Access:
    DarkRoom
{
    roomName = "Access Hall";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
You are in a wide room.\n
You see a door set into the port and starboard walls.\n
A door is set into the center of the aft wall.\n
The ceiling overhead has been crushed inward.\n
The two flourescent tubes that had lit it up are shattered.\n
Shards of glass are scattered over the floor.\n
\b
In the center of the floor is a small access porthole.
        '
    ];

    nav = [
        'enter aft door: Exit the hold access through the aft wall door.',
        'down: Enter the porthole in the center of the floor.'
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
    down: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You open the porthole and crawl down into it.');
        };
        room1 = Hold_Access;
        room2 = Hold_Access;
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Hold_Access_Aft_Hall_Forward_Door_Inside:
    Door -> Hold_Access_Aft_Hall_Forward_Door
    'aft door' 'aft door'
{
    location = Hold_Access;
};
// -----------------------------------------------------------------------------
