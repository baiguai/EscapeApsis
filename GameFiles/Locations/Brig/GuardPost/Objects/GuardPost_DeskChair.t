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
Positioned behind the desk is a tall-backed black leather chair.\n
        '
    ];

    msgDmg = [
        '
Positioned behind the desk is a tall-backed black leather chair.\n
It has been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the desk chair.\n
It is a high-backed chair made of black leather.\n
        '
    ];

    exDmg = [
        '
You examine the desk chair.\n
It is a high-backed chair made of black leather.\n
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
