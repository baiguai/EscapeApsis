#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Starboard_Cylinder:
    Thing
    'cylinder' 'Cylinder'
{
    location = Mundane_Hold_Starboard_Piles;
    specialDescOrder = 1;
    noun = 'cylinder' 'coupler';
    adjective = 'chrome' 'navigation';
    isDyst = nil;
    threshold = nil;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = nil;
    isKnown = nil;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
Among the part is a small chrome cylinder that you don\'t recognize.\n
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
You examine the chrome cylinder.\n
Set into the top and bottom of it are female recepticles.\n
<<isKnown == nil ?
'
You don\'t recognize it.\n
'
:
'
It is a navigation unit coupler.\n
'
>>
            ";
        };
    };
// -----------------------------------------------------------------------------
};
