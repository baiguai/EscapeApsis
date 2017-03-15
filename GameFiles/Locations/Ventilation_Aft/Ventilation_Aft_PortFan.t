#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_PortFan:
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
The room beyond the vent grate is small.\n
A red service light mounted in the center of the port wall is the\n
only source of light.\n
        '
    ];

    nav = [
        ''
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        Desc_Location(self);
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Vent_Aft_MainPipe_PortFanVent_Opening_Inside:
    HiddenDoor -> Vent_Aft_MainPipe_PortFanVent_Opening
    'vent' 'vent'
{
    location = Vent_Aft_MainPipe_PortFan;
};
// -----------------------------------------------------------------------------
