#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_AftStarboardShelves:
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
        'port: Back to the aft section of the hold.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        Desc_Location(self);
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    port: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You return to the aft section of the hold.');
        };
        room1 = Mundane_Hold_Port_AftStarboardShelves;
        room2 = Mundane_Hold_Port_Aft;
    };
// -----------------------------------------------------------------------------
};



// --[DOORS]--------------------------------------------------------------------
Mundane_Hold_Port_AirShaft:
    HiddenDoor
    'ventilation shaft' 'ventilation shaft'
{
    isOpen = true;
    location = Mundane_Hold_Port_AftStarboardShelves;
};
// -----------------------------------------------------------------------------
