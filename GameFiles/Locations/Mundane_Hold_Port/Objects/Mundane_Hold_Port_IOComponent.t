#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_IOComponent:
    Thing
    'IO Component' 'IO Component'
{
    location = Mundane_Hold_Port_AftPortShelves;
    noun = 'io component' 'box';
    adjective = 'small' 'black';
    specialDescOrder = 10;
    isDyst = nil;
    threshold = nil;
    descCount = 0;
    exCount = 0;
    canShoot =nil;
    carryingAdjustment = 0; // < 0 decreases chance of being carried

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
As you look closer you notice a small black box with IO connectors over its
surface. It looks unfamiliar to you.
        '
    ];

    ex = [
        '
You examine the small black box.
Its surface is lined with IO connectors.
It is unlike any computer component you have seen before.
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
