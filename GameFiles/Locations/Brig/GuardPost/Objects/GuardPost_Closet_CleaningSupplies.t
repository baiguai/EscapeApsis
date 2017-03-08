#include <adv3.h>
#include <en_us.h>

Brig_GuardPost_Closet_CleaningSupplies:
    Fixture
    'cleaning supplies' 'cleaning supplies'
{
    location = Brig_GuardPost_Closet;
    specialDescOrder = 1;
    noun = 'supplies';
    adjective = 'cleaning';
    isDyst = nil;
    threshold = nil;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = nil;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
The guard post closet is filled with cleaning supplies and old computer parts.\n
        '
    ];

    ex = [
        '
You examine the cleaning supplies.\n
You see a push broom and a mop and bucket as well as cleaning solutions.\n
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
