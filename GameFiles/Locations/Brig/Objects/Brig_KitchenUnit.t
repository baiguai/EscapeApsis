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
In the center of the brig is a small kitchen unit
        '
    ];

    msgDmg = [
        '
In the center of the brig is a small kitchen unit
It has been shot and destroyed. Smoke coils up through the air from the hole
left in it.
        ',
        '
In the center of the brig is a small kitchen unit
It has been shot and destroyed. Smoke coils up through the air from the holes
left in it.
        '
    ];

    ex = [
        '
You examine the kitchen unit.
It is a small black cube. A touch screen is set into its top surface.
You cannot see where the prepared food is delivered.
It is more modern than any cooking unit you\'ve seen before.
        '
    ];

    exDmg = [
        '
You examine the kitchen unit.
It is a small black cube. A touch screen is set into its top surface.
It has been shot and destroyed. Smoke rises from the hole that has been 
shot into it.
        ',
        '
You examine the kitchen unit.
It is a small black cube. A touch screen is set into its top surface.
It has been shot and destroyed. Smoke rises from the holes that have been 
shot into it.
        '
    ];

    shootMsg = [
        '
Sparks fly from the hole that has been made in it.
        ',
        '
Another hole is shot into the destroyed unit.
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
