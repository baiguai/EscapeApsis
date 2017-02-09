#include <adv3.h>
#include <en_us.h>

Brig_Cell01_Cot:
    Fixture
    'cot' 'cot'
{
    location = Brig_Cell01;
    label = 'the cot';
    labelProper = 'The cot';
    specialDescOrder = 1;
    noun = 'cot';
    adjective = '';
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
Along the port wall is a small cot.
        '
    ];

    msgDmg = [
        '
Along the port wall is a small cot.
A smouldering hole has been shot into it.
        ',
        '
Along the port wall is a small cot.
Multiple shots have been fired into the cot.
        '
    ];

    ex = [
        '
You examine the cot.
It is made of a solid block of brushed steel.
A thin mattress has been placed on the metal block.
        '
    ];

    exDmg = [
        '
You examine the cot.
It is made of a solid block of brushed steel.
A thin mattress has been placed on the metal block.
A shot has been fired into the mattress.
        ',
        '
You examine the cot.
It is made of a solid block of brushed steel.
A thin mattress has been placed on the metal block.
Multiple shots have been fired into the mattress.
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
