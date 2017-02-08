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
        "
<<Ship.PowerGeneratorOn == nil ?
'
The small cell is bathed in dim red auxiliary light.
' :
'
Dim flickering light from the brig\'s overhead flourescents fills the small
cell.
'
>>
The rest of the cell are bare.
In the west wall is the cell door.
\b\b
        ";

        Desc_Location(self);
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
