#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_MaintComm:
    Thing
    'maintenance comm port' 'Maintenance Comm Port'
{
    location = Mundane_Hold_Port_AftPortShelves_Shelves;
    label = 'the maintenance comm port';
    labelProper = 'The maintenance comm port';
    specialDescOrder = 10;
    noun = 'comm port' 'comm' 'port';
    adjective = 'maintenance' 'comm';
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
You see a maintenance comm port, use to hack program robots, other than that\n
most of the pieces appear to be useless on their own.\n
        '
    ];

    msgDmg = [
        '
You see a maintenance comm port, use to hack program robots, other than that\n
most of the pieces appear to be useless on their own.\n
\b
It has been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the maintenance comm port. It is a small box with a screen on the\n
top. It has a small hole below the screen to listen for voice commands.\n
A few cords protrude from its sides with various connectors at the ends of them.\n
        '
    ];

    exDmg = [
        '
You examine the maintenance comm port. It is a small box with a screen on the\n
top. It has a small hole below the screen to listen for voice commands.\n
A few cords protrude from its sides with various connectors at the ends of them.\n
\b
It has been shot and destroyed. Its screen is shattered and there is a large\n
hole blown into it.\n
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
