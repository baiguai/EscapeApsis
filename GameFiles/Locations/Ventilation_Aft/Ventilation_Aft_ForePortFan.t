#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_Forward_ForePortFan:
    Room
{
    roomName = "Ventilation Fan Room";
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
        ''
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
    north: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('');
        };
        room1 = Vent_Aft_MainPipe_Forward_ForePortFan;
        room2 = Vent_Aft_MainPipe_Forward_ForePortFan;
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
// -----------------------------------------------------------------------------
