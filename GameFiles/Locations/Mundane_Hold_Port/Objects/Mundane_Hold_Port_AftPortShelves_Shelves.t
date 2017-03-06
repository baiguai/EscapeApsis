#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_AftPortShelves_Shelves:
    Fixture
    'Aft Port Shelves' 'Aft Port Shelves'
{
    location = Mundane_Hold_Port_AftPortShelves;
    label = 'the shelves';
    labelProper = 'The shelves';
    specialDescOrder = 1;
    noun = 'shelves';
    adjective = 'port' 'aft';
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
The towering shelves along the port wall reach up into the shadows.
They are filled with various computer components.
\n
The bottom shelf is filled with boxes of random tools. You see hammers,
screwdrivers, welders, and soldering guns.
Near the saw is a flashlight.
Folded in another box are rags
        '
    ];

    msgDmg = [
        '
        '
    ];

    ex = [
        '
        '
    ];

    exDmg = [
        '
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
