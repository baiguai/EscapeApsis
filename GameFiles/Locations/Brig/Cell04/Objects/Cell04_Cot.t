#include <adv3.h>
#include <en_us.h>

Brig_Cell04_Cot:
    Fixture
    'cot' 'cot'
{
    location = Brig_Cell04;
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
Along the east wall is the small cot you have been sleeping on.
        '
    ];

    msgDmg = [
        '
Along the east wall is the small cot you have been sleeping on.
A smouldering hole has been shot into it.
        ',
        '
Along the east wall is the small cot you have been sleeping on.
Multiple shots have been fired into the cot.
        '
    ];

    ex = [
        '
You examine the cot you have been sleeping on since your capture.
It is made of a solid block of brushed steel.
A thin mattress has been placed on the metal block.
        '
    ];

    exDmg = [
        '
You examine the cot you have been sleeping on since your capture.
It is made of a solid block of brushed steel.
A thin mattress has been placed on the metal block.
A shot has been fired into the mattress.
        ',
        '
You examine the cot you have been sleeping on since your capture.
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
