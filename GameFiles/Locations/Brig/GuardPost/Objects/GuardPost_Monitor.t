#include <adv3.h>
#include <en_us.h>

/*
COMPUTER MONITOR
--------------------------------------------------------------------------------
This gives the player access to the ship's system, if the player has the guard's
PComm.
TODO: Code the doors that can be opened, or systems accessed via the computer.
--------------------------------------------------------------------------------
*/
GuardPost_Monitor:
    Fixture
    'computer monitor' 'computer monitor'
{
    location = GuardPost_Desk;
    label = 'the computer monitor';
    labelProper = 'The computer monitor';
    specialDescOrder = 10;
    noun = 'monitor' 'screen';
    adjective = 'guard post' 'computer';
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
Sitting on the desk is a computer monitor.\n
        '
    ];

    msgDmg = [
        '
Sitting on the desk is a computer monitor.\n
It has been shot and destroyed.\n
Its shattered screen is blank.\n
        '
    ];

    ex = [
        '
You examine the computer monitor.\n
        '
    ];

    exDmg = [
        '
You examine the computer monitor.\n
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
