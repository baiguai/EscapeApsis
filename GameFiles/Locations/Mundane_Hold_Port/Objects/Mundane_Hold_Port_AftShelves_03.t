#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Aft_Shelves_03:
    Fixture
    'Aft Shelves 02' 'Aft Shelves 03'
{
    location = Mundane_Hold_Port_Aft;
    label = 'the shelves row 3';
    labelProper = 'The shelves row 3';
    specialDescOrder = 20;
    noun = 'shelves';
    adjective = 'aft' '3';
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
The row aft of that is filled with various power supplies and batteries of
every size and type.
        '
    ];

    msgDmg = [
        '
The row aft of that is filled with various power supplies and batteries of
every size and type.
\n
The shelves have been shot and damaged.
        '
    ];

    ex = [
        '
You examine the third row of aft shelves.
It is filled with various power supplies and batteries of every size and type.
        '
    ];

    exDmg = [
        '
You examine the third row of aft shelves.
It is filled with various power supplies and batteries of every size and type.
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
