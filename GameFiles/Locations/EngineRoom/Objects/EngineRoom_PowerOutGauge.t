#include <adv3.h>
#include <en_us.h>

EngineRoom_PowerOutGauge:
    Fixture
    'power out gauge' 'Power Out Gauge'
{
    location = EngineRoom;
    label = 'the power out gauge';
    labelProper = 'The power out gauge';
    specialDescOrder = 30;
    noun = 'gauge';
    adjective = 'power out';
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
You see a gauge labeled \'Power Out\'.\n
        '
    ];

    msgDmg = [
        '
You see a gauge labeled \'Power Out\'.\n
It has been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the power out gauge.\n
It reads a power out level of X.\n
        '
    ];

    exDmg = [
        '
You examine the power out gauge.\n
It has been shot and destroyed.\n
Its display is black.\n
        '
    ];

    shootMsg = [
        '
The power out gauge display goes black.
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
