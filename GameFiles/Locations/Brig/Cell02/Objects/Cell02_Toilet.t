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
Next to the sink is a toilet.
        '
    ];

    msgDmg = [
        '
Next to the sink is a toilet.
It has been shot and damaged.
        '
    ];

    ex = [
        '
You examine the toilet.
It is solid metal.
There is no lid or seat that can be lifted. It is all one piece.
The water inside it is foul and discolored.
        '
    ];

    exDmg = [
        '
You examine the toilet.
It is solid metal.
There is no lid or seat that can be lifted. It is all one piece.
The water inside it is foul and discolored.
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
