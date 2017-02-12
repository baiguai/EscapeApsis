#include <adv3.h>
#include <en_us.h>

GuardPost_DeskChair:
    Heavy, Platform
    'desk chair' 'desk chair'
{
    location = Brig_GuardPost;
    label = 'the desk chair';
    labelProper = 'The desk chair';
    specialDescOrder = 20;
    noun = 'chair';
    adjective = 'desk';
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
Positioned behind the desk is a tall-backed black leather chair.
        '
    ];

    msgDmg = [
        '
Positioned behind the desk is a tall-backed black leather chair.
It has been shot and damaged.
        '
    ];

    ex = [
        '
You examine the desk chair.
It is a high-backed chair made of black leather.
        '
    ];

    exDmg = [
        '
You examine the desk chair.
It is a high-backed chair made of black leather.
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
