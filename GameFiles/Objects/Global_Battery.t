#include <adv3.h>
#include <en_us.h>

/*
BATTERIES
--------------------------------------------------------------------------------
Batteries are primarily used with flashlights, but could possibly apply to
other tech.
--------------------------------------------------------------------------------
*/
Battery:
    Thing
    'battery' 'Battery'
{
    location = Limbo;
    specialDescOrder = 1;
    noun = 'battery';
    adjective = '' '';
    isDyst = nil;
    threshold = nil;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = nil;

    powerLevel = 100;

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
You examine the battery. The charge level display reads <<powerLevel>>%
            ";

            if (exCount == 1)
            {
                "
\b
To use the batter, put it in an object that uses it by saying:
\n
put battery in [object]
\b
                ";
            }
        };
    };
// -----------------------------------------------------------------------------
};
