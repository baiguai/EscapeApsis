#include <adv3.h>
#include <en_us.h>

Brig_Table:
    Fixture
    'mess table' 'mess table'
{
    location = Brig;
    label = 'the mess table';
    labelProper = 'The mess table';
    specialDescOrder = 10;
    noun = 'table';
    adjective = 'brig' 'mess';
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
Near the kitchen unit is a mess table that is used by the guards as they work
long shifts.
        '
    ];

    msgDmg = [
        '
Near the kitchen unit is a mess table that is used by the guards as they work
long shifts.
It has been shot and damaged.
        '
    ];

    ex = [
        '
You examine the mess table. It is made of brushed steel plates.
Nothing is sitting on it.
        '
    ];

    exDmg = [
        '
You examine the mess table. It is made of brushed steel plates.
Nothing is sitting on it.
It has been shot and damaged.
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
