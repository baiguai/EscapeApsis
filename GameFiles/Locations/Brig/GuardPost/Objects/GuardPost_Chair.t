#include <adv3.h>
#include <en_us.h>

GuardPost_Chair:
    Fixture
    'extra chair' 'extra chair'
{
    location = Brig_GuardPost;
    label = 'chiar';
    specialDescOrder = 30;
    noun = 'chair';
    adjective = 'extra';
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
In the aft starboard corner of the room is an extra chair.\n
        '
    ];

    msgDmg = [
        '
In the aft starboard corner of the room is an extra chair.\n
It has been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the chair.\n
It is made of black leather and chrome.\n
        '
    ];

    exDmg = [
        '
You examine the chair.\n
It is made of black leather and chrome.\n
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
