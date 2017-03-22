#include <adv3.h>
#include <en_us.h>

Vent_Aft_StarboardHoldVent:
    Room
{
    roomName = "Ventilation Pipe";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
The narrow pipe that connects the hold wall vent with the central ventilation\n
system is very cramped.\n
You are already breaking into a sweat and, although you have no problems with\n
enclosed spaces, you feel claustrophobic and panicky.\n
        '
    ];

    nav = [
        'enter vent: Exit to the hold.',
        'port: Enter the main ventilation pipe.'
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
            Desc_Navigation('You crawl deeper into the vent');
        };
        room1 = Vent_Aft_StarboardHoldVent;
        room2 = Vent_Aft_MainPipe_Starboard;
    };
// -----------------------------------------------------------------------------
};




// --[DOORS]--------------------------------------------------------------------
Mundane_Hold_Starboard_AirShaft_Inside:
    Door -> Mundane_Hold_Starboard_AirShaft
    'vent' 'vent'
{
    isOpen = true;
    location = Vent_Aft_StarboardHoldVent;
};
// -----------------------------------------------------------------------------
