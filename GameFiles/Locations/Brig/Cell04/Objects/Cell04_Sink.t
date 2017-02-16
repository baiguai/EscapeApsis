#include <adv3.h>
#include <en_us.h>

Brig_Cell04_Sink:
    Fixture
    'sink'
{
    location = Brig_Cell04;
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
In the forward starboard corner of the cell is a small sink
        '
    ];

    msgDmg = [
        '
The sink has been shot by a weapon.
Its metal surface has been marred.
        '
    ];

    ex = [
        '
You examine the small sink.
It is made of brushed steel.
There is no faucet, just a small opening out of which water emits.
The drain is a small circle of pin point openings.
        '
    ];

    exDmg = [
        '
You examine the small sink.
It is made of brushed steel.
There is no faucet, just a small opening out of which water emits.
The drain is a small circle of pin point openings.
It has been shot and damaged.
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
