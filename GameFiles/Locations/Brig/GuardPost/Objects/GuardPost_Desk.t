#include <adv3.h>
#include <en_us.h>

GuardPost_Desk:
    Fixture
    'desk' 'desk'
{
    location = Brig_GuardPost;
    label = 'the desk';
    labelProper = 'The desk';
    specialDescOrder = 1;
    noun = 'desk';
    adjective = 'guard post' 'forward starboard';
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
In the forward starboard section of the guard post is a desk.\n
        '
    ];

    msgDmg = [
        '
In the forward starboard section of the guard post is a desk.\n
It has been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the guard post desk.\n
It is made of rough steel plates.\n
        '
    ];

    exDmg = [
        '
You examine the guard post desk.\n
It is made of rough steel plates.\n
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
