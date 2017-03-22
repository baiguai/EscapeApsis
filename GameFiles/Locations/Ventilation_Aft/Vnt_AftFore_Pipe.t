#include <adv3.h>
#include <en_us.h>

Vent_Aft_Forward_Pipe:
    DarkRoom
{
    roomName = "Ventilation Pipe";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
The section of ventilation pipe you are in runs port to starboard. It is\n
cramped and hot.\n
At either end is a dislodged metal vent grate.\n
        '
    ];

    nav = [
        'enter starboard vent: Exit through the starboard vent grate.',
        'enter port vent: Exit through the port side vent grate.'
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
Vent_Aft_MainPipe_Port_Forward_ForePortFan_Door_Inside:
    Door -> Vent_Aft_MainPipe_Port_Forward_ForePortFan_Door
    'port vent door' 'port vent door'
{
    isOpen = true;
    location = Vent_Aft_Forward_Pipe;
};
Vent_Aft_MainPipe_Starboard_Forward_End_Door_Inside:
    Door -> Vent_Aft_MainPipe_Starboard_Forward_End_Door
    'starboard vent door' 'starboard vent door'
{
    isOpen = true;
    location = Vent_Aft_Forward_Pipe;
};
// -----------------------------------------------------------------------------
