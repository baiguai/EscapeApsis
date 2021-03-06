#include <adv3.h>
#include <en_us.h>

/*
Generic Guard
--------------------------------------------------------------------------------
Guards are the enemies the player will encounter iin the first level. They
are the easiest enemy to kill. This class is used to spawn random guards.
--------------------------------------------------------------------------------
*/
Guard:
    Actor
    'Guard' 'guard'
{
    label = 'the guard';
    labelProper = 'The guard';
    location = Limbo;
    noun = 'guard';
    adjective = '';
    isDyst = true;
    isNpc = true;
    threshold = 2;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 2;

    // FIGHTING ATTRIBUTES
    isEnemy = true;
    life = 2;
    lifeMin = 2;
    lifeMax = 1;
    initiative = 1;
    chance = 65;
    carryingChance = 50;

// --[OUTPUTS]------------------------------------------------------------------
    message = '
A guard appears and attacks you.
    ';

    deadMessage = "
A guard lies dead on the ground.
    ";

    shootMsg = [
        '
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        // Desc_Shootable(self);
        if (self.life > 0)
        {
            "<<message>>";
            FightingMode(self);
        }
        else
        {
            "<<deadMessage>>";
        }
    };
    
    checkTakeFromInventory(actor, obj)
    {
        "You take the <<obj.name>>.";
    }
// -----------------------------------------------------------------------------
};
