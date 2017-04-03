#include <adv3.h>
#include <en_us.h>

EngineRoom_PowerInGauge:
    Fixture
    'power in gauge' 'Power In Gauge'
{
    location = EngineRoom;
    label = 'the power in gauge';
    labelProper = 'The power in gauge';
    specialDescOrder = 20;
    noun = 'gauge';
    adjective = 'power in';
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
You see a gauge labeled \'Power In\'.\n
        '
    ];

    msgDmg = [
        '
You see a gauge labeled \'Power In\'.\n
It has been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the power in gauge.\n
It reads a power in level of X.\n
        '
    ];

    exDmg = [
        '
You examine the power in gauge.\n
It has been shot and destroyed.\n
Its display is black.\n
        '
    ];

    shootMsg = [
        '
The power in gauge display goes black.
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
