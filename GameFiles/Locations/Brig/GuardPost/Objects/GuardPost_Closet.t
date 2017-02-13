#include <adv3.h>
#include <en_us.h>

Brig_GuardPost_Closet:
    Room
{
    roomName = "closet";
    visitCount = 0;
    descCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
        '
    ];

    nav = [
        'enter closet door: Exit to the guard post.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        Desc_Location(self);
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_GuardPost_Closet_Door_Inside:
    Door -> Brig_GuardPost_Closet_Door
    'closet door' 'closet door'
{
    location = Brig_GuardPost_Closet;
    isOpen = true;
};
// -----------------------------------------------------------------------------
