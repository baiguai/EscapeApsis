#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_ForwardStarboardShelves_Shelves:
    Fixture
    'Starboard Shelves' 'Starboard Shelves'
{
    location = Mundane_Hold_Port_ForwardStarboardShelves;
    label = 'the shelves';
    labelProper = 'The shelves';
    specialDescOrder = 1;
    noun = 'shelves';
    adjective = 'starboard' 'forward';
    isPlural = true;
    isDyst = nil;
    threshold = 1;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;
    damageType = '';

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
The forward starboard shelves are sturdy industrial structures that rise up into\n
the shadows far overhead.\n
\b
The shelves are lined with crates filled with personnel files. Each file\n
is a large hard drive blade that can be plugged into a computer terminal.\n
Along the spine of each file is a last name followed by a first.\n
They are arranged in alphabetical order. You don\'t recognize any of the names.\n
        ',
        '
The forward starboard shelves rise up into\n
the shadows far overhead.\n
\b
The shelves are lined with crates filled with personnel files. Each file\n
is a large hard drive blade that can be plugged into a computer terminal.\n
Along the spine of each file is a last name followed by a first.\n
They are arranged in alphabetical order. You don\'t recognize any of the names.\n
        '
    ];

    msgDmg = [
        '
The forward starboard shelves rise up into\n
the shadows far overhead.\n
\b
The shelves are lined with crates filled with personnel files. Each file\n
is a large hard drive blade that can be plugged into a computer terminal.\n
Along the spine of each file is a last name followed by a first.\n
They are arranged in alphabetical order. You don\'t recognize any of the names.\n
\b
The files have been shot and damaged. One of them has melted and drips\n
slowly over the edge of the shelf it is sitting on.\n
        ',
        '
The forward starboard shelves rise up into\n
the shadows far overhead.\n
\b
The shelves are lined with crates filled with personnel files. Each file\n
is a large hard drive blade that can be plugged into a computer terminal.\n
Along the spine of each file is a last name followed by a first.\n
They are arranged in alphabetical order. You don\'t recognize any of the names.\n
\b
The files have been shot and damaged. Some of them have melted and drip\n
slowly over the edge of the shelf they are sitting on.\n
        '
    ];

    ex = [
        '
You examine the shelves.\n
They are packed full of hard drive blades marked with the names of the\n
individuals they document.\n
        '
    ];

    exDmg = [
        '
You examine the shelves.\n
They are packed full of hard drive blades marked with the names of the\n
individuals they document.\n
\n
One of them has been shot and destroyed. It has melted and drips slowly\n
over the edge of the shelf.\n
        ',
        '
You examine the shelves.\n
They are packed full of hard drive blades marked with the names of the\n
individuals they document.\n
\b
Some of them have been shot and destroyed. They have melted and drip\n
slowly over the edge of the shelves.\n
        '
    ];

    shootMsg = [
        '
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        Desc_Shootable(self);
    };
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(Examine)
    {
        action()
        {
            Ex_Shootable(self);
        };
    };
    dobjFor(Shoot)
    {
        verify() { logical; }
        action()
        {
            if (ShootGun(self) == true)
            {
                me.weapon.ShootMsg(self, '', shootMsg);
            };
        };
    };
// -----------------------------------------------------------------------------
};
