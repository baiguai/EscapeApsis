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
    isOn = true;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
In the center of the room is a large ventilation fan unit.\n
It is silent and the large fan behind the metal meshin its side is still.\n
        '
    ];
    msgOn = [
        '
In the center of the room is a large ventilation fan unit.\n
Its large bladed fan is whirring loudly behind a large metal mesh.\n
        '
    ];

    msgDmg = [
        '
In the center of the room is a large ventilation fan unit.\n
\b
It has been shot and destroyed.\n
It has been shot and destroyed.\n
The fan behind the metal mesh in its side sits motionless.\n
        '
    ];

    ex = [
        '
You examine the ventilation fan unit.\n
It is made up of riveted metal plates.\n
Set into one of its sides is a metal mesh. Behind the mesh a large fan\n
sits motionless.\n
        '
    ];
    exOn = [
        '
You examine the ventilation fan unit.\n
It is made up of riveted metal plates.\n
Set into one of its sides is a metal mesh. Behind the mesh a large fan\n
spins loudly.\n
        '
    ];

    exDmg = [
        '
You examine the ventilation fan unit.\n
\b
It has been shot and destroyed.\n
Set into one of its sides is a metal mesh. Behind the mesh a large fan\n
It has been shot and destroyed.\n
The fan behind the metal mesh sits motionless.\n
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
        if (isOn)
        {
            msg = msgOn;
        }

        Desc_Shootable(self);
    };
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(Examine)
    {
        action()
        {
            if (isOn)
            {
                ex = exOn;
            }

            Ex_Shootable(self);
        };
    };
    dobjFor(Shoot)
    {
        verify() { logical; }
        action()
        {
            isOn = nil;

            if (ShootGun(self) == true)
            {
                me.weapon.ShootMsg(self, '', shootMsg);
            };
        };
    };
// -----------------------------------------------------------------------------
};
