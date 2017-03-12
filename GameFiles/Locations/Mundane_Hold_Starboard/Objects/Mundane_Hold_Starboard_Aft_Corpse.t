#include <adv3.h>
#include <en_us.h>

/*
    THE CORPSE IN THE HOLD
    ----------------------------------------------------------------------------
    The player finds a corpse in the starboard hold. This is a victim of the
    mutiny that has occured on the Apsis - that the player is unaware of.
    At level two the player will encounter some of the reprogrammed robots
    that the mutineers are using to protect themselves. - Level two enemies.
    ----------------------------------------------------------------------------
*/
Mundane_Hold_Starboard_Aft_Corpse:
    Fixture
    'corpse' 'Corpse'
{
    location = Mundane_Hold_Starboard_Aft;
    label = 'the corpse';
    labelProper = 'The corpse';
    specialDescOrder = 10;
    noun = 'corpse' 'form' 'pile';
    adjective = 'dark';
    isDyst = nil;
    threshold = 1;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = nil;
    isKnown = nil;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
        ',
        ''
    ];

    ex = [
        '
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        Desc_General(self);

        "
<<isKnown == true ?
'
A corpse lies on the ground near the shelves.\n
'
:
'
A dark form, just port of the shelves is lying on the floor.\n
'
>>
        ";
    };
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(Examine)
    {
        action()
        {
            Ex_General(self);

            "
<<isKnown == true ?
'
    You examine the corpse.
'
:
'
    You examine the dark form and are taken aback.
    It is a corpse.
    \b
'
>>
It is a male body, dressed in an officer's uniform.\n
There is a large hole shot into his chest and wet blood has soaked his uniform.\n
He has been stripped of his weapon, PComm, and any other equipment he may have\n
been carrying.\n
            ";

            isKnown = true;
        };
    };
// -----------------------------------------------------------------------------
};
