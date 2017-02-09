#include <adv3.h>
#include <en_us.h>

Brig_Guard:
    Actor
    'Guard' 'guard'
{
    label = 'the guard';
    labelProper = 'The guard';
    location = Brig_Cell04;
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
    life = 0;
    initiative = 1;
    chance = 65;

// --[OUTPUTS]------------------------------------------------------------------
    message = '
    ';

    deadMessage = "
A guard lies dead on the ground.
<<descCount < 1 ?
'
His face is smashed in and blood covers most of his sleek white body suit.
You look down at your knuckles amazed at how easy it had been to kill the
man.
\n
' :
''
>>
<<Brig_Guard_PComm.location == Brig_Cell04 ?
'
Strapped to his belt you see a Personal Communicator (PComm).
' :
''
>>
<<EPistol.location == Brig_Cell04 ?
'
In a holster at the guard\'s waist is an energy pistol.
' :
''
>>
    ";

    shootMsg = [
        '
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        Desc_Shootable(self);
        if (life > 0)
        {
            FightingMode(self);
        }
    };
    
    checkTakeFromInventory(actor, obj)
    {
        "You take the <<obj.name>>.";
    }
// -----------------------------------------------------------------------------
};
