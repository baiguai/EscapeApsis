#include <adv3.h>
#include <en_us.h>

Brig_Cell03_Cot:
    Fixture
    'cot' 'cot'
{
    location = Brig_Cell03;
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
Along the aft wall is a small cot.\n
        '
    ];

    msgDmg = [
        '
Along the aft wall is a small cot.\n
A smouldering hole has been shot into it.\n
        ',
        '
Along the aft wall is a small cot.\n
Multiple shots have been fired into the cot.\n
        '
    ];

    ex = [
        '
You examine the cot.\n
It is made of a solid block of brushed steel.\n
A thin mattress has been placed on the metal block.\n
        '
    ];

    exDmg = [
        '
You examine the cot.\n
It is made of a solid block of brushed steel.\n
A thin mattress has been placed on the metal block.\n
A shot has been fired into the mattress.\n
        ',
        '
You examine the cot.\n
It is made of a solid block of brushed steel.\n
A thin mattress has been placed on the metal block.\n
Multiple shots have been fired into the mattress.\n
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
