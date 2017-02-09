#include <adv3.h>
#include <en_us.h>

Brig_Camera01:
    Fixture
    'forward camera' 'forward camera'
{
    location = Brig;
    label = 'the forward camera';
    labelProper = 'The forward camera';
    specialDescOrder = 1;
    noun = 'camera';
    adjective = 'forward';
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
In the forward, near the brig door, mounted on the ceiling is a camera.
        '
    ];

    msgDmg = [
        '
In the forward, near the brig door, mounted on the ceiling is a camera.
It has been shot and destroyed.
        '
    ];

    ex = [
        '
You examine the forward camera.
It is a small rotating half sphere mounted to the ceiling.
It slowly rotates, scanning the brig.
        '
    ];

    exDmg = [
        '
You examine the forward camera.
It has been shot and destroyed.
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
                Brig.CameraCheck();
            };
        };
    };
// -----------------------------------------------------------------------------
};
