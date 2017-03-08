#include <adv3.h>
#include <en_us.h>

Brig_KitchenUnit:
    Fixture
    'kitchen unit' 'kitchen unit'
{
    location = Brig;
    label = 'the kitchen unit';
    labelProper = 'The kitchen unit';
    specialDescOrder = 1;
    noun = 'kitchen unit';
    adjective = 'brig';
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
In the center of the brig is a small kitchen unit\n
        '
    ];

    msgDmg = [
        '
In the center of the brig is a small kitchen unit\n
It has been shot and destroyed. Smoke coils up through the air from the hole\n
left in it.\n
        ',
        '
In the center of the brig is a small kitchen unit\n
It has been shot and destroyed. Smoke coils up through the air from the holes\n
left in it.\n
        '
    ];

    ex = [
        '
You examine the kitchen unit.\n
It is a small black cube. A touch screen is set into its top surface.\n
You cannot see where the prepared food is delivered.\n
It is more modern than any cooking unit you\'ve seen before.\n
        '
    ];

    exDmg = [
        '
You examine the kitchen unit.\n
It is a small black cube. A touch screen is set into its top surface.\n
It has been shot and destroyed. Smoke rises from the hole that has been \n
shot into it.\n
        ',
        '
You examine the kitchen unit.\n
It is a small black cube. A touch screen is set into its top surface.\n
It has been shot and destroyed. Smoke rises from the holes that have been \n
shot into it.\n
        '
    ];

    shootMsg = [
        '
Sparks fly from the hole that has been made in it.\n
        ',
        '
Another hole is shot into the destroyed unit.\n
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
