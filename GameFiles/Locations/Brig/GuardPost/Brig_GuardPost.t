#include <adv3.h>
#include <en_us.h>

Brig_GuardPost:
    Room
{
    roomName = "Guard Post";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
        '
    ];

    nav = [
        'enter guard door: Exit guard post.',
        'enter closet: Enter the closet.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        if (hasSpawned == nil)
        {
            SpawnCamera01(Brig_GuardPost, 'camera', '');
            hasSpawned = true;
        }

        Desc_Location(self);

        "
<<Ship.PowerGeneratorOn == nil ?
'
Red auxiliary light floods into the guard post.
' :
'
Pale flourescent light from above fills the guard post.
'
>>
It is a cramped square shaped room.
\n
At the port side of the cabinet is a large closet.
In the port wall is the door leading back to the main brig area.
Forward of the door is a camera mounted into the ceiling.
\b\b
        ";
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_GuardPost_Door_Inside:
    LockableWithKey, Door -> Brig_GuardPost_Door
    'guard post door' 'guard post door'
{
    location = Brig_GuardPost;
}

Brig_GuardPost_Closet_Door:
    Door
    'closet door' 'closet door'
{
    location = Brig_GuardPost;
    isOpen = true;
};
// -----------------------------------------------------------------------------
