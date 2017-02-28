#include <adv3.h>
#include <en_us.h>

/*
CAMERA
--------------------------------------------------------------------------------
Cameras are found throughout level one. If the power generator is functional
a random check is made, if that check succeeds a guard enters the camera's
location.
--------------------------------------------------------------------------------
*/
Camera01:
    Heavy, Thing
    'camera' 'camera'
{
    location = Limbo;
    noun = 'camera';
    adjective = 'security';
    isDyst = nil;
    threshold = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;
    damageType = '';
    guardCheck = 50;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
        '
    ];

    msgDmg = [
        '
        '
    ];

    ex = [
        '
You examine the camera.
It is a semicircular glass dome with the camera inside.
It is slowly rotating, scanning the area.
        '
    ];

    exDmg = [
        '
You examine the camera.
It has been shot and destroyed. It is no longer functional.
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
