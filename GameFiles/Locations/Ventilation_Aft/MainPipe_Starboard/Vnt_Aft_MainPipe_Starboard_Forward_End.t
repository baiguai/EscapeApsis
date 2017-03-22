#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_Starboard_Forward_End:
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
Further forward in the main ventilation pipe it ends. A vent grate is set\n
into the pipe\'s end wall.\n
        '
    ];

    nav = [
        'enter vent: Enter the vent in the fore end of the pipe.',
        'aft: Aft through the main ventilation pipe.'
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
            Desc_Navigation('You crawl aft through the main ventilation pipe.');
        };
        room1 = Vent_Aft_MainPipe_Starboard_Forward_End;
        room2 = Vent_Aft_MainPipe_Starboard_Forward_End;
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Vent_Aft_MainPipe_Starboard_Forward_End_Door:
    Door
    'vent door' 'vent door'
{
    isOpen = true;
    location = Vent_Aft_MainPipe_Starboard_Forward_End;
};
// -----------------------------------------------------------------------------
