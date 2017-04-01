#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Starboard_Aft_Shelves:
    Heavy, Platform
    'shelves' 'Shelves'
{
    location = Mundane_Hold_Starboard_Aft;
    label = 'the shelves';
    labelProper = 'The shelves';
    specialDescOrder = 1;
    noun = 'shelves';
    adjective = 'aft' 'wide';
    isPlural = true;
    isDyst = nil;
    threshold = 1;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;
    damageType = '';

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
The aft section of the starboard hold contains a wide set of shelves set along\n
the aft wall. In the dim light you can just make out what appear to be robot\n
components sitting in piles on the shelves.\n
        ',
        '
The aft section of the starboard hold contains a wide set of shelves set along\n
the aft wall.\n
        '
    ];

    msgDmg = [
        '
The aft section of the starboard hold contains a wide set of shelves set along\n
the aft wall.\n
\b
They have been shot and some of the components on them have been destroyed.\n
        '
    ];

    ex = [
        '
You examine the shelves along the hold\'s aft wall. They are wide, \n
industrial grade metal structures that span from the port wall to the starboard.\n
Sitting on the shelves you see piles of robotics components.\n
        '
    ];

    exDmg = [
        '
You examine the shelves along the hold\'s aft wall. They are wide,\n
industrial grade metal structures that span from the port wall to the starboard.\n
Sitting on the shelves you see piles of robotics components.\n
\b
The shelves have been shot and damaged.\n
        '
    ];

    shootMsg = [
        '
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        Desc_Shootable(self);
    };
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(Examine)
    {
        action()
        {
            Ex_Shootable(self);
        };
    };
    dobjFor(Shoot)
    {
        verify() { logical; }
        action()
        {
            if (ShootGun(self) == true)
            {
                me.weapon.ShootMsg(self, '', shootMsg);
            };
        };
    };
// -----------------------------------------------------------------------------
};
