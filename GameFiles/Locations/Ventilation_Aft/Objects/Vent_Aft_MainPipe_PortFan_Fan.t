#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_PortFan_Fan:
    Fixture
    'vent fan unit' 'Vent fan unit'
{
    location = Vent_Aft_MainPipe_PortFan;
    label = 'the fan unit';
    labelProper = 'The fan unit';
    specialDescOrder = 1;
    noun = 'fan' 'unit';
    adjective = 'vent' 'fan';
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
In the center of the room is a large ventilation fan unit.\n
        '
    ];

    msgDmg = [
        '
In the center of the room is a large ventilation fan unit.\n
\b
It has been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the ventilation fan unit.\n
        '
    ];

    exDmg = [
        '
You examine the ventilation fan unit.\n
\b
It has been shot and destroyed.\n
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
