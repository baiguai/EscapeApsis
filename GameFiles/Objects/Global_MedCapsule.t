#include <adv3.h>
#include <en_us.h>

/*
Med Capsule
--------------------------------------------------------------------------------
Med Capsules are used to heal the player. This class is used to spawn capsules
that can be carried by enemies. It can be retrieved after killing the enemy.
--------------------------------------------------------------------------------
*/
MedCapsule:
    Thing, Food
    'Med Capsule'
{
    location = Limbo;
    noun = 'capsule' 'pill';
    adjective = 'med' 'medical';
    isDyst = nil;
    threshold = nil;
    descCount = 0;
    exCount = 0;
    canShoot =nil;
    carryingAdjustment = 0; // < 0 decreases chance of being carried

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        ''
    ];

    ex = [
        '
You examine the med capsule. It is a small transparent pill, red in color.
It can heal wounds and help cure illnesses.
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        Desc_General(self);
    };
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(Examine)
    {
        action()
        {
            Ex_General(self);
        };
    };

    dobjFor(Eat)
    {
        action()
        {
            Heal(self, 1,
                    'You take the med capsule and immediately feel revived.',
                    '');
            self.moveInto(Limbo);
        };
    }
// -----------------------------------------------------------------------------
};
