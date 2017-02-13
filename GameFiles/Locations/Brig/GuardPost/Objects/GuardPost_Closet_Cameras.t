#include <adv3.h>
#include <en_us.h>

Brig_GuardPost_Closet_Cameras:
    Fixture
    'camera units' 'camera units'
{
    location = Brig_GuardPost_Closet;
    label = 'the camera units';
    labelProper = 'The camera units';
    specialDescOrder = 10;
    noun = 'units';
    adjective = 'camera';
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
You see some camera units stacked on the floor.
        '
    ];

    msgDmg = [
        '
You see some camera units stacked on the floor.
One of them has been shot and destroyed.
        ',
        '
You see some camera units stacked on the floor.
Some of them have been shot and destroyed.
        '
    ];

    ex = [
        '
You examine the camera units.
They appear to be decommisioned and outdated.
        '
    ];

    exDmg = [
        '
You examine the camera units.
They appear to be decommisioned and outdated.
One of them has been shot and destroyed.
        ',
        '
You examine the camera units.
They appear to be decommisioned and outdated.
Some of them have been shot and destroyed.
        '
    ];

    shootMsg = [
        '
It shatters.
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
