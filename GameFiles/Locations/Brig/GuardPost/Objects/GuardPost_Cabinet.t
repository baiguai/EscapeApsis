#include <adv3.h>
#include <en_us.h>

GuardPost_Cabinet:
    Heavy, Container
    'cabinet' 'cabinet'
{
    location = Brig_GuardPost;
    label = 'the cabinet';
    labelProper = 'The cabinet';
    specialDescOrder = 40;
    noun = 'cabinet';
    adjective = 'guard post' 'filing';
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
Along the aft wall is a filing cabinet.
        '
    ];

    msgDmg = [
        '
Along the aft wall is a filing cabinet.
It has been shot and damaged.
        '
    ];

    ex = [
        '
You examine the filing cabinet.
        '
    ];

    exDmg = [
        '
You examine the filing cabinet.
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
    dobjFor(LookIn)
    {
        action()
        {
            if (GuardPost_Cabinet_Uniform.location == GuardPost_Cabinet)
            {
                "
You see a uniform sitting on one of the shelves inside the
cabinet.
                ";
            }

            "
There are random office supplies and other mundane items stacked on the
cabinet\'s shelves.
            ";
        };
    };
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
