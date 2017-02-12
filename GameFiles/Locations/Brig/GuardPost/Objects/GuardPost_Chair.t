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
In the aft starboard corner of the room is an extra chair.
        '
    ];

    msgDmg = [
        '
In the aft starboard corner of the room is an extra chair.
It has been shot and damaged.
        '
    ];

    ex = [
        '
You examine the chair.
It is made of black leather and chrome.
        '
    ];

    exDmg = [
        '
You examine the chair.
It is made of black leather and chrome.
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
