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
        if (descCount > 0)
        {
            cls();
        }

        Desc_Location(self);

        "
<<Ship.PowerGeneratorOn == nil ?
'
Your small cell is bathed in dim red auxiliary light.\n
It appears that the power generator is still out.\n
' :
'
Dim flickering light from the brig\'s overhead flourescents fills the small\n
cell.\n
'
>>
The rest of the cell is bare.\n
\b
In the port wall is the cell door.\n
\b
To examine an item or a person say: examine (or x) [item name]\n
\b
To attempt to take an item say: take [item name]\n
\b
To look around say: look (or l)\n
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
