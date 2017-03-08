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
Along the aft wall is a filing cabinet.\n
        '
    ];

    msgDmg = [
        '
Along the aft wall is a filing cabinet.\n
It has been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the filing cabinet. You see shelves inside. To look inside the\n
cabinet use \'look in cabinet\'.\n
        '
    ];

    exDmg = [
        '
You examine the filing cabinet.\n
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
    dobjFor(LookIn)
    {
        action()
        {
            if (GuardPost_Cabinet_Uniform.location == GuardPost_Cabinet)
            {
                "
You see a uniform sitting on one of the shelves inside the\n
cabinet.\n
                ";
            }

            "
There are random office supplies and other mundane items stacked on the\n
cabinet\'s shelves.\n
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
