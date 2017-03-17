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
You are in a small ventilation fan room.\n
A red service light mounted in the center of the forward wall is the only\n
source of light.\n
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
};


// --[DOORS]--------------------------------------------------------------------
Vent_Aft_MainPipe_Forward_End_Door_Inside:
    Door -> Vent_Aft_MainPipe_Forward_End_Door
    'vent door' 'vent door'
{
    location = Vent_Aft_MainPipe_Forward_ForePortFan;
};
// -----------------------------------------------------------------------------
