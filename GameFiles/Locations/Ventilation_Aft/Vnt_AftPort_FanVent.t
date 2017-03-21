#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_Port_PortFanVent:
    DarkRoom
{
    roomName = "Ventilation Pipe";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [''];
    msgOff = [
        '
The port side vent pipe is cramped and hot.\n
\b
At the port end is a vent opening with a metal grate covering it.\n
\b
At the starboard end it enters into a larger vent pipe.\n
        '
    ];
    msgOn = [
        '
The port side vent pipe is cramped and hot.\n
Air blows through the pipe.\n
\b
At the port end is a vent opening with a metal grate covering it.\n
\b
At the starboard end it enters into a larger vent pipe.\n
        '
    ];

    nav = [
        'starboard: Travel into the main ventilation pipe.',
        'enter vent: Exit the cramped vent pipe.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        if (Vent_Aft_MainPipe_Port_PortFan_Fan.isOn == true)
        {
            msg = msgOn;
        }
        else
        {
            msg = msgOff;
        }

        Desc_Location(self);
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    starboard: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('You travel starboard into the main ventilation\n
                pipe.');
        };
        room1 = Vent_Aft_MainPipe_Port_PortFanVent;
        room2 = Vent_Aft_MainPipe_Port_Forward;
    };
// -----------------------------------------------------------------------------
};




// --[DOORS]--------------------------------------------------------------------
Vent_Aft_MainPipe_Port_PortFanVent_Opening:
    HiddenDoor
    'vent' 'vent'
{
    isOpen = true;
    location = Vent_Aft_MainPipe_Port_PortFanVent;
};
// -----------------------------------------------------------------------------
