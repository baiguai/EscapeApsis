#include <adv3.h>
#include <en_us.h>

EngineRoom_HeatGauge:
    Fixture
    'heat gauge' 'Heat Gauge'
{
    location = EngineRoom;
    label = 'the heat gauge';
    labelProper = 'The heat gauge';
    specialDescOrder = 10;
    noun = 'gauge';
    adjective = 'heat';
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
You see a gauge labeled \'Heat\'.\n
        '
    ];

    msgDmg = [
        '
You see a gauge labeled \'Heat\'.\n
It has been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the heat gauge.\n
It reads a heat level of X.\n
        '
    ];

    exDmg = [
        '
You examine the heat gauge.\n
It has been shot and destroyed.\n
Its display is black.\n
        '
    ];

    shootMsg = [
        '
The heat gauge display goes black.
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
