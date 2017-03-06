#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Aft_Shelves_04:
    Fixture
    'Aft Shelves 02' 'Aft Shelves 04'
{
    location = Mundane_Hold_Port_Aft;
    label = 'the shelves row 4';
    labelProper = 'The shelves row 4';
    specialDescOrder = 30;
    noun = 'shelves';
    adjective = 'aft' '4';
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
Beyond that row, the final section of shelves (shelves 4) are filled with miscellaneous
items.
        '
    ];

    msgDmg = [
        '
Beyond that row, the final section of shelves are filled with miscellaneous
items.
\n
The shelves have been shot and damaged.
        '
    ];

    ex = [
        '
You examine the row of shelves furthest aft.
Beyond that row, the final section of shelves are filled with miscellaneous
items.
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
