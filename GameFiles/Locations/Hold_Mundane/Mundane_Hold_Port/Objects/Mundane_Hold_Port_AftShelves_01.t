#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Aft_Shelves_01:
    Fixture
    'Aft Shelves 01' 'Aft Shelves 01'
{
    location = Mundane_Hold_Port_Aft;
    label = 'the shelves row 1';
    labelProper = 'The shelves row 1';
    specialDescOrder = 1;
    noun = 'shelves';
    adjective = 'aft' '1';
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
The most forward of the shelves (shelves 1) is filled with office supplies. You see\n
antiquated pads of paper and writing utensils as well as other miscellaneous\n
supplies.\n
        '
    ];

    msgDmg = [
        '
The most forward of the shelves is filled with office supplies. You see\n
antiquated pads of paper and writing utensils as well as other miscellaneous\n
supplies.\n
\b
The shelves have been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the most forward of the rows of shelves.\n
They are filled with office supplies. You see pads of paper, writing utensils,\n
and other miscellaneous supplies.\n
        '
    ];

    exDmg = [
        '
You examine the most forward of the rows of shelves.\n
They are filled with office supplies. You see pads of paper, writing utensils,\n
and other miscellaneous supplies.\n
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
