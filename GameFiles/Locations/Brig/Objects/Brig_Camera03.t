#include <adv3.h>
#include <en_us.h>

Brig_Camera03:
    Fixture
    'aft starboard camera' 'aft starboard camera'
{
    location = Brig;
    label = 'the aft starboard camera';
    labelProper = 'The aft starboard camera';
    specialDescOrder = 20;
    noun = 'camera';
    adjective = 'aft starboard';
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
In the aft starboard corner, mounted on the ceiling is a camera.
        '
    ];

    msgDmg = [
        '
In the aft starboard corner, mounted on the ceiling is a camera.
It has been shot and destroyed.
        '
    ];

    ex = [
        '
You examine the aft starboard camera.
It is a small rotating half sphere mounted to the ceiling.
It slowly rotates, scanning the brig.
        '
    ];

    exDmg = [
        '
You examine the aft starboard camera.
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
