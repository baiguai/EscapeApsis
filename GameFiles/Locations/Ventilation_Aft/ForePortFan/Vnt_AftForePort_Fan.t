#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_Port_Forward_ForePortFan:
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
Set into the aft wall is a vent grate.\n
In the starboard wall is a metal vent grate.\n
Both grates appear to have been dislodged.\n
        '
    ];

    nav = [
        'enter starboard vent: Exit the fan room to the starboard pipe.',
        'enter aft vent: Exit the fan room into the main pipe.'
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
Vent_Aft_MainPipe_Port_Forward_ForePortFan_Door:
    Door
    'starboard vent door' 'starboard vent door'
{
    location = Vent_Aft_MainPipe_Port_Forward_ForePortFan;
};
Vent_Aft_MainPipe_Port_Forward_End_Door_Inside:
    Door -> Vent_Aft_MainPipe_Port_Forward_End_Door
    'aft vent door' 'aft vent door'
{
    location = Vent_Aft_MainPipe_Port_Forward_ForePortFan;
};
// -----------------------------------------------------------------------------
