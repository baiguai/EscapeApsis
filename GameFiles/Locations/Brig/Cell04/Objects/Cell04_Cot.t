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
Along the starboard wall is the small cot you have been sleeping on.\n
        '
    ];

    msgDmg = [
        '
Along the starboard wall is the small cot you have been sleeping on.\n
A smouldering hole has been shot into it.\n
        ',
        '
Along the starboard wall is the small cot you have been sleeping on.\n
Multiple shots have been fired into the cot.\n
        '
    ];

    ex = [
        '
You examine the cot you have been sleeping on since your capture.\n
It is made of a solid block of brushed steel.\n
A thin mattress has been placed on the metal block.\n
        '
    ];

    exDmg = [
        '
You examine the cot you have been sleeping on since your capture.\n
It is made of a solid block of brushed steel.\n
A thin mattress has been placed on the metal block.\n
A shot has been fired into the mattress.\n
        ',
        '
You examine the cot you have been sleeping on since your capture.\n
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
