#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Starboard_Piles:
    Heavy, Platform
    'components piles' 'Components Piles'
{
    location = Mundane_Hold_Starboard;
    specialDescOrder = 1;
    noun = 'piles';
    adjective = 'components';
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
All around you are piles of ship components and spare robot parts.\n
There doesn\'t appear to be any rhyme or reason to the piles that tower up\n
toward the dim ceiling high above you.\n
        '
    ];

    ex = [
        '
You examine the piles of components.\n
You see various extra ship parts as well as spare robot components.\n
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
