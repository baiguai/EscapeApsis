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
Near the kitchen unit is a mess table that is used by the guards as they work\n
long shifts.\n
        '
    ];

    msgDmg = [
        '
Near the kitchen unit is a mess table that is used by the guards as they work\n
long shifts.\n
It has been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the mess table. It is made of brushed steel plates.\n
Nothing is sitting on it.\n
        '
    ];

    exDmg = [
        '
You examine the mess table. It is made of brushed steel plates.\n
Nothing is sitting on it.\n
It has been shot and damaged.\n
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
