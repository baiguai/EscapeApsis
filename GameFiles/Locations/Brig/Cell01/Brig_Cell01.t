#include <adv3.h>
#include <en_us.h>

Brig_Cell01:
    Room
{
    roomName = "Cell 01";
    visitCount = 0;
    descCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
        '
    ];

    nav = [
        'enter cell door: Exit cell 1'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        cls();

        Desc_Location(self);

        "
<<Ship.PowerGeneratorOn == nil ?
'
Cell one is bathed in dim red auxiliary light.\n
' :
'
Dim flickering light from the brig\'s overhead flourescents fills the small\n
cell.\n
'
>>
In the starboard wall is the cell door.\n
\b\b
        ";
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_Cell01_Door_Inside:
    LockableWithKey, Door -> Brig_Cell01_Door
    'cell door' 'cell door'
{
    location = Brig_Cell01;
}
// -----------------------------------------------------------------------------
