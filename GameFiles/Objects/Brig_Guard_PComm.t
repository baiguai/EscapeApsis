#include <adv3.h>
#include <en_us.h>

/*
Guard's PComm
--------------------------------------------------------------------------------
The player will want to pick this up. It serves as the key to the brig cells,
guard room, and brig door. It may also open other doors in the ship.
Serves as access to level 01 areas.
--------------------------------------------------------------------------------
*/
Brig_Guard_PComm:
    Key
    'pcomm' 'PComm'
{
    location = me //Brig_Guard;
    noun = 'PComm';
    adjective = '';
    isDyst = nil;
    threshold = nil;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = nil;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
        '
    ];

    ex = [
        '
You examine the dead guard\'s PComm.
It is locked with a passcode. You make a few guesses at it, but not surprising,
fail to unlock it.
        ',
        '
You examine the dead guard\'s PComm.
It is locked with a passcode.
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        Desc_General(self);
    };
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(Examine)
    {
        action()
        {
            Ex_General(self);
        };
    };
// -----------------------------------------------------------------------------
};
