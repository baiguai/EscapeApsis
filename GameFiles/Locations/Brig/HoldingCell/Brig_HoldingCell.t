#include <adv3.h>
#include <en_us.h>

Brig_HoldingCell:
    Room
{
    roomName = "Holding Cell";
    visitCount = 0;
    descCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
The holding cell is even smaller than the other cells in the brig.\n
It doesn\'t contain a cot.\n
In the starboard wall of the cell is a door.\n
        '
    ];

    nav = [
        'enter cell door: Exit the holding cell.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        cls();

        Desc_Location(self);
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_HoldingCell_Door_Inside:
    LockableWithKey, Door -> Brig_HoldingCell_Door
    'cell door' 'cell door'
{
    location = Brig_HoldingCell;
}
// -----------------------------------------------------------------------------

