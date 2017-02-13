#include <adv3.h>
#include <en_us.h>

Brig_GuardPost_Closet_Cables:
    Fixture
    'network cables' 'network cables'
{
    location = Brig_GuardPost_Closet;
    specialDescOrder = 20;
    noun = 'cables';
    adjective = 'coiled' 'network';
    isPlural = true;
    isDyst = nil;
    threshold = nil;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = nil;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
Near the cameras are coiled piles of network cables.
        '
    ];

    ex = [
        '
You examine the network cables.
They are neatly coiled on the floor.
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
