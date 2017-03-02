#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Aft_Shelves_02:
    Fixture
    'Aft Shelves 02' 'Aft Shelves 02'
{
    location = Mundane_Hold_Port_Aft;
    label = 'the shelves row 2';
    labelProper = 'The shelves row 2';
    specialDescOrder = 10;
    noun = 'shelves';
    adjective = 'aft' '2';
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
        '
    ];

    msgDmg = [
        '
\n
The shelves have been shot and damaged.
        '
    ];

    ex = [
        '
        '
    ];

    exDmg = [
        '
\n
The shelves have been shot and damaged.
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
