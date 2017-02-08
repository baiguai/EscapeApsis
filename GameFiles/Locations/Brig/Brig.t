#include <adv3.h>
#include <en_us.h>

Brig:
    Room
{
    roomName = "Brig";
    visitCount = 0;
    descCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
        '
    ];

    nav = [
        'enter brig door: Exit the brig.',
        'enter holding cell: Enter the holding cell.',
        'enter cell 1: Enter the first cell.',
        'enter cell 2: Enter the second cell.',
        'enter cell 3: Enter the third cell.',
        'enter closet: Enter the small closet.',
        'enter cell 4: Enter the forth cell.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        "
The brig is dingy and dim.
<<Ship.PowerGeneratorOn == nil ?
'
Red auxiliary lights glow dimly in the corners of the main room.
It appears that the power generator is still out.
' :
'
It is lit only by a couple of flickering flourescent tubes overhead.
'
>>
The walls are filthy and rust is breaking out here and there along their edges.
\n
It contains four cramped cells arranged along the east, south, and west walls
(north being the ship's forward).
In the north wall, east of the entrance is the guard post.
It is enclosed in thick armored glass.
The entrance to the gard post is in its west wall, nearest the brig's entrance.
\n
A closet is set into the south east corner and a small holding cell is located
in the north west corner.
\n
In the center of the brig is a small kitchen unit and a mess table that are
used by the guards as they work long shifts.
\n
There are three cameras in the brig, all networked to the guard post. You
can see the armored conduit running from each camera back to the guard post
enclosure.
\n
The brig's entrance appears to be locked using a PComm
scanner.
\b\b
        ";

        Desc_Location(self);
    };
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
    north: TravelWithMessage, RoomConnector {
        travelDesc()
        {
            Desc_Navigation('');
        };
        room1 = Brig;
        room2 = Brig;
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_Door:
    LockableWithKey, Door
    'brig door' 'brig door'
{
    location = Brig;
    keyList = [Brig_Guard_PComm];
};
Brig_HoldingCell_Door:
    LockableWithKey, Door
    'holding cell door' 'holding cell door'
{
    location = Brig;
}
Brig_Cell01_Door:
    LockableWithKey, Door
    'cell 1 door' 'cell 1 door'
{
    location = Brig;
}
Brig_Cell02_Door:
    LockableWithKey, Door
    'cell 2 door' 'cell 2 door'
{
    location = Brig;
}
Brig_Cell03_Door:
    LockableWithKey, Door
    'cell 3 door' 'cell 3 door'
{
    location = Brig;
}
Brig_Closet_Door:
    LockableWithKey, Door
    'closet door' 'closet door'
{
    location = Brig;
}
Brig_Cell04_Door:
    LockableWithKey, Door
    'cell 4 door' 'cell 4 door'
{
    location = Brig;
    isLocked = nil;
}
// -----------------------------------------------------------------------------
