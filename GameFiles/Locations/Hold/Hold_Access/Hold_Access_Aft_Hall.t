#include <adv3.h>
#include <en_us.h>

Hold_Access_Aft_Hall:
    Room
{
    roomName = "Hall";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;
    canSpawn = true;
    spawner_Guard = nil;

    spawners = [
        spawner_Guard
    ];

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [''];

    nav = [
        'enter forward: Exit the hall through the forward door.',
        'enter aft: Exit the hall through the aft door.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        cls();

        if (self.hasSpawned == nil)
        {
            spawner_Guard = new Spawner_Guard;
            spawner_Guard.moveInto(Hold_Access_Aft_Hall);

            self.hasSpawned = true;
        }

        Desc_Location(self);

        "
You are in a long narrow hall.\n
There is a door set into the aft and forward walls.\n
<<Ship.PowerGeneratorOn == nil ?
'
Red auxiliary lights glow in the corner of the hall, dimly illuminating it.\n
'
:
'
Flourescent tubes flicker overhead.\n
'
>>
        ";

        if (descCount < 2)
        {
            foreach (local s in spawners)
            {
                s.specialDesc();
            }
        }
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    north: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('');
        };
        room1 = Hold_Access_Aft_Hall;
        room2 = Hold_Access_Aft_Hall;
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Hold_Access_Aft_Hall_Forward_Door:
    Door
    'forward door' 'forward door'
{
    location = Hold_Access_Aft_Hall;
};
Mundane_Hold_Access_Forward_Door_Inside:
    Door -> Mundane_Hold_Access_Forward_Door
    'aft door' 'aft door'
{
    location = Hold_Access_Aft_Hall;
};
// -----------------------------------------------------------------------------
