#include <adv3.h>
#include <en_us.h>

/*
GUARD UNIFORM
--------------------------------------------------------------------------------
This item is critical. If the player is wearing it, they can get into certain
places undetected.
To make this check use:
GuardPost_Cabinet_Uniform.isWornBy(me)
--------------------------------------------------------------------------------
*/
GuardPost_Cabinet_Uniform:
    Wearable
    'uniform' 'uniform'
{
    location = GuardPost_Cabinet;
    noun = 'uniform';
    adjective = 'guard' 'post';
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

            "
The uniform looks identical to the uniforms worn by the ship\'s guards.
            ";
        };
    };
// -----------------------------------------------------------------------------
};
