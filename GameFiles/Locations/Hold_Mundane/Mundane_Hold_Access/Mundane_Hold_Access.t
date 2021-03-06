#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Access:
    Room
{
    roomName = "Access Hall";
    visitCount = 0;
    descCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [''];

    nav = [
        'enter forward door: Enter door in the center of the forward wall.',
        'enter aft port door: Enter the aft wall port door.',
        'enter aft starboard door: Enter the aft wall starboard door.',
        'enter brig door: Enter the brig hall.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        cls();

        Desc_Location(self);

        "
The access hall is a wide spacious room.\n
<<Ship.PowerGeneratorOn == nil ?
'
Red auxiliary lights glow in the corner of the hall, dimly illuminating it.\n
'
:
'
Flourescent tubes flicker overhead.\n
'
>>
A door is set into the center of the forward wall.\n
\b
In the aft wall are three doors, one in the port section of the wall, one in\n
the starboard section of the wall, and the door to the brig in the center.\n
        ";
    };
// -----------------------------------------------------------------------------
};



// --[DOORS]--------------------------------------------------------------------
Mundane_Hold_Access_Forward_Door:
    Door
    'forward door' 'forward door'
{
    location = Mundane_Hold_Access;
};
Mundane_Hold_Access_Port_Door:
    Door
    'aft port door' 'aft port door'
{
    location = Mundane_Hold_Access;
};
Mundane_Hold_Access_Starboard_Door:
    Door
    'aft starboard door' 'aft starboard door'
{
    location = Mundane_Hold_Access;
};
Mundane_Hold_Access_Door_Inside:
    Door -> Mundane_Hold_Access_Door
    'brig door' 'brig door'
{
    location = Mundane_Hold_Access;
};
// -----------------------------------------------------------------------------
