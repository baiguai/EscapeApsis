#include <adv3.h>
#include <en_us.h>

Brig_Cell02_Sink:
    Fixture
    'sink'
{
    location = Brig_Cell02;
    label = 'the sink';
    labelProper = 'The sink';
    specialDescOrder = 1;
    noun = 'sink';
    adjective = 'metal';
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
In the aft starboard corner of the cell is a small sink\n
        '
    ];

    msgDmg = [
        '
The sink has been shot by a weapon.\n
Its metal surface has been marred.\n
        '
    ];

    ex = [
        '
You examine the small sink.\n
It is made of brushed steel.\n
There is no faucet, just a small opening out of which water emits.\n
The drain is a small circle of pin point openings.\n
        '
    ];

    exDmg = [
        '
You examine the small sink.\n
It is made of brushed steel.\n
There is no faucet, just a small opening out of which water emits.\n
The drain is a small circle of pin point openings.\n
It has been shot and damaged.\n
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
            if (damageType == 'smallShot')
            {
                Ex_Shootable(self);
            }
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
