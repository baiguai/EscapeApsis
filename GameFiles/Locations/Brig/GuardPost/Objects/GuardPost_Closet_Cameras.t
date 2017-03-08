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
You see some camera units stacked on the floor.\n
        '
    ];

    msgDmg = [
        '
You see some camera units stacked on the floor.\n
One of them has been shot and destroyed.\n
        ',
        '
You see some camera units stacked on the floor.\n
Some of them have been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the camera units.\n
They appear to be decommisioned and outdated.\n
        '
    ];

    exDmg = [
        '
You examine the camera units.\n
They appear to be decommisioned and outdated.\n
One of them has been shot and destroyed.\n
        ',
        '
You examine the camera units.\n
They appear to be decommisioned and outdated.\n
Some of them have been shot and destroyed.\n
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
