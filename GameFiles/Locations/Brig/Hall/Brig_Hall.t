#include <adv3.h>
#include <en_us.h>

Brig_Hall:
    Room
{
    roomName = "hall";
    visitCount = 0;
    descCount = 0;

    guard01 = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
You are in a short hall.
<<Ship.PowerGeneratorOn == nil ?
'
It is filled with the dim red of auxiliary lights.
'
:
'
Overhead pale flourescent tubes buzz and flicker.
'
>>
\n
In the aft wall is the door back into the brig.
\n
In the forward wall is another door.
        '
    ];

    nav = [
        'enter forward door: Enter the forward wall door.',
        'enter brig door: Enter the brig.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        if (Ship.PowerGeneratorOn &&
            guard01 == nil)
        {
            guard01 = SpawnGuard(Brig_Hall, 'Guard01');
        }

        Desc_Location(self);
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_Door:
    LockableWithKey, Door
    'brig door' 'brig door'
{
    location = Brig_Hall;
    keyList = [Brig_Guard_PComm];
};
Mundane_Hold_Access_Door:
    Door
    'forward door' 'forward door'
{
    location = Brig_Hall;
};
// -----------------------------------------------------------------------------
