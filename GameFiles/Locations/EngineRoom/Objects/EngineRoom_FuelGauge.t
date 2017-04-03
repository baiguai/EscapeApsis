#include <adv3.h>
#include <en_us.h>

EngineRoom_FuelGauge:
    Fixture
    'fuel gauge' 'Fuel Gauge'
{
    location = EngineRoom;
    label = 'the fuel gauge';
    labelProper = 'The fuel gauge';
    specialDescOrder = 1;
    noun = 'gauge';
    adjective = 'fuel';
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
You see a gauge labeled \'Fuel\'.\n
        '
    ];

    msgDmg = [
        '
You see a gauge labeled \'Fuel\'.\n
It has been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the fuel gauge.\n
It reads a fuel level of X.\n
        '
    ];

    exDmg = [
        '
You examine the fuel gauge.\n
It has been shot and destroyed.\n
Its display is black.\n
        '
    ];

    shootMsg = [
        '
The fuel gauge display goes black.
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
