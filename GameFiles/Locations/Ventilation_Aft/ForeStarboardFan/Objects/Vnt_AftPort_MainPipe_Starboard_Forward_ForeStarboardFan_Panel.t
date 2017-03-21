#include <adv3.h>
#include <en_us.h>

Vent_Aft_MainPipe_Starboard_Forward_ForeStarboardFan_Panel:
    Switch
    'control panel' 'Control Panel'
{
    location = Vent_Aft_MainPipe_Starboard_Forward_ForeStarboardFan;
    label = 'the control panel';
    labelProper = 'The control panel';
    specialDescOrder = 10;
    noun = 'panel' 'switch';
    adjective = 'small' 'control';
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
A metal conduit runs down the port wall to a small control panel.\n
        '
    ];

    msgDmg = [
        '
A metal conduit runs down the port wall to a small control panel.\n
It has been shot and destroyed.\n
        '
    ];

    ex = [''];
    exOn = [
        '
You examine the small control panel.\n
It is mounted in the middle of the port wall at the base of a metal conduit\n
that runs down from the ceiling.\n
A large toggle switch is built into the center of the metal panel.\n
The switch is currently set to the \'On\' position.\n
        '
    ];
    exOff = [
        '
You examine the small control panel.\n
It is mounted in the middle of the port wall at the base of a metal conduit\n
that runs down from the ceiling.\n
A large toggle switch is built into the center of the metal panel.\n
The switch is currently set to the \'Off\' position.\n
        '
    ];

    exDmg = [''];
    exDmgOn = [
        '
You examine the small control panel.\n
It has been shot and destroyed.\n
A large toggle switch is built into the center of the metal panel.\n
The switch is currently set to the \'On\' position.\n
        '
    ];
    exDmgOff = [
        '
You examine the small control panel.\n
It has been shot and destroyed.\n
A large toggle switch is built into the center of the metal panel.\n
The switch is currently set to the \'Off\' position.\n
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
            if (Vent_Aft_MainPipe_Starboard_Forward_ForePortFan_Fan.isOn == nil)
            {
                ex  = exOff;
                exDmg = exDmgOff;
            }
            else
            {
                ex = exOn;
                exDmg = exDmgOn;
            }

            Ex_Shootable(self);
        };
    };
    dobjFor(TurnOff)
    {
        verify() 
        {
            if (Vent_Aft_MainPipe_Starboard_Forward_ForePortFan_Fan.isOn == nil)
            {
                illogical('The switch is already off.');
            }
        }
        action()
        {
            Vent_Aft_MainPipe_Starboard_Forward_ForePortFan_Fan.TurnOff();
            "You flip the switch off. The fan stops turning.";
        }
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
