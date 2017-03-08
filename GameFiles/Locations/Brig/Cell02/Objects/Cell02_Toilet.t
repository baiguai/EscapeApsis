#include <adv3.h>
#include <en_us.h>

Brig_Cell02_Toilet:
    Fixture
    'toilet'
{
    location = Brig_Cell02;
    label = 'the toilet';
    labelProper = 'The toilet';
    specialDescOrder = 1;
    noun = 'toilet';
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
Next to the sink is a toilet.\n
        '
    ];

    msgDmg = [
        '
Next to the sink is a toilet.\n
It has been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the toilet.\n
It is solid metal.\n
There is no lid or seat that can be lifted. It is all one piece.\n
The water inside it is foul and discolored.\n
        '
    ];

    exDmg = [
        '
You examine the toilet.\n
It is solid metal.\n
There is no lid or seat that can be lifted. It is all one piece.\n
The water inside it is foul and discolored.\n
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
