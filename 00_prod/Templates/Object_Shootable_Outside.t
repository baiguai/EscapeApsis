#include <adv3.h>
#include <en_us.h>

NAME:
    Fixture
    ''
{
    location = ;
    specialDescOrder = 1;
    noun = '';
    adjective = '';
    isDyst = nil;
    threshold = nil;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    msgDay = [
        '
        '
    ];

    msgNight = [
        '
        '
    ];

    msgDayDmg = [
        '
        '
    ];

    msgNightDmg = [
        '
        '
    ];

    exDay = [
        '
        '
    ];

    exNight = [
        '
        '
    ];

    exDayDmg = [
        '
        '
    ];

    exNightDmg = [
        '
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
