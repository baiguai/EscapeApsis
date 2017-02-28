#include <adv3.h>
#include <en_us.h>

Brig_Cell04:
    Room
{
    roomName = "Cell 04";
    visitCount = 0;
    descCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
        '
    ];

    nav = [
        'enter cell door: Exit cell 4'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        Desc_Location(self);

        "
<<Ship.PowerGeneratorOn == nil ?
'
Your small cell is bathed in dim red auxiliary light.
It appears that the power generator is still out.
' :
'
Dim flickering light from the brig\'s overhead flourescents fills the small
cell.
'
>>
The rest of the cell is bare.
In the port wall is the cell door.
\b
To examine an item or a person say: examine (or x) [item name]
\n
To attempt to take an item say: take [item name]
\b\b
        ";
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_Cell04_Door_Inside:
    LockableWithKey, Door -> Brig_Cell04_Door
    'cell door' 'cell door'
{
    location = Brig_Cell04;
}
// -----------------------------------------------------------------------------
