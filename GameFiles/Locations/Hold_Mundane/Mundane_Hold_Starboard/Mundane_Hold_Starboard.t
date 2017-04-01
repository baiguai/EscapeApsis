#include <adv3.h>
#include <en_us.h>

/*
    STARBOARD HOLD
    ----------------------------------------------------------------------------
    The starboard hold is primarily a 'junk yard' of any resources that may
    be needed in the maintenance of the ship.
    ----------------------------------------------------------------------------
*/
Mundane_Hold_Starboard:
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
The starboard hold is little more than a massive indoor junkyard.\n
All around you are piles of ship components and spare robot parts.\n
There doesn\'t appear to be any rhyme or reason to the piles that tower up\n
toward the dim ceiling high above you.\n
\b
A narrow path between the stacks of parts leads aft, further into the hold.\n
        '
    ];

    nav = [
        'enter hold door: Exit the hold.',
        'aft: Enter the aft portion of the hold.'
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
    aft: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You follow the path into the aft section of the\n
                hold.');
        };
        room1 = Mundane_Hold_Starboard;
        room2 = Mundane_Hold_Starboard_Aft;
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Mundane_Hold_Access_Starboard_Door_Inside:
    Door -> Mundane_Hold_Access_Starboard_Door
    'hold door' 'hold door'
{
    location = Mundane_Hold_Starboard;
};
// -----------------------------------------------------------------------------
