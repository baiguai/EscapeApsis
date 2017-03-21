#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_Starboard_Forward_ForeStarboardFan:
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
In the port wall is a metal vent grate.\n
Both grates appear to have been dislodged.\n
        '
    ];

    nav = [
        'enter port vent: Exit the fan room through the port vent.'
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
Vent_Aft_MainPipe_Starboard_Forward_ForeStarboardFan_Door_Inside:
    Door
    'port vent door' 'port vent door'
{
    isOpen = true;
    location = Vent_Aft_MainPipe_Starboard_Forward_ForeStarboardFan;
};
// -----------------------------------------------------------------------------
