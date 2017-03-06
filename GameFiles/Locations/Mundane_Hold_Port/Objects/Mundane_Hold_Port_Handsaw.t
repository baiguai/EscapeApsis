#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Handsaw:
    Thing
    'handsaw' 'Handsaw'
{
    location = Mundane_Hold_Port_AftPortShelves_Shelves;
    specialDescOrder = 20;
    noun = 'handsaw';
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
You see a hand saw.
        '
    ];

    ex = [
        '
You exammine the hand saw.
It appears to be in excellent condition and its blade appears to e sharp and
unused.
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
