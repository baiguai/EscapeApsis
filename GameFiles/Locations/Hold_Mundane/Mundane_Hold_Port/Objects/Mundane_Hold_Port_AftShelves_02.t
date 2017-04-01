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
The row of shelves aft of that (shelves 2) appear to be lined with cleaning supplies.\n
Brooms and mops lay neatly along the lower shelves. Jugs of soaps and\n
disinfectants have been arranged along the middle shelves and gloves and\n
other cleaning supplies have been arranged along the upper shelves.\n
        ',
        '
The row of shelves aft of that are lined with cleaning supplies.\n
Brooms and mops lay neatly along the lower shelves. Jugs of soaps and\n
disinfectants have been arranged along the middle shelves and gloves and\n
other cleaning supplies have been arranged along the upper shelves.\n
        '
    ];

    msgDmg = [
        '
The row of shelves aft of that are lined with cleaning supplies.\n
Brooms and mops lay neatly along the lower shelves. Jugs of soaps and\n
disinfectants have been arranged along the middle shelves and gloves and\n
other cleaning supplies have been arranged along the upper shelves.\n
\b
The shelves have been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the second set of aft shelves.\n
They are lined with cleaning supplies.\n
Brooms and mops lay neatly along the lower shelves. Jugs of soaps and\n
disinfectants have been arranged along the middle shelves and gloves and\n
other cleaning supplies have been arranged along the upper shelves.\n
        '
    ];

    exDmg = [
        '
You examine the second set of aft shelves.\n
They are lined with cleaning supplies.\n
Brooms and mops lay neatly along the lower shelves. Jugs of soaps and\n
disinfectants have been arranged along the middle shelves and gloves and\n
other cleaning supplies have been arranged along the upper shelves.\n
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
