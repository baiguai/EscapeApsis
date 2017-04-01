#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_AftStarboardShelves_Shelves:
    Fixture
    'Aft Starboard Shelves' 'Aft Starboard Shelves'
{
    location = Mundane_Hold_Port_AftStarboardShelves;
    label = 'the shelves';
    labelProper = 'The shelves';
    specialDescOrder = 1;
    noun = 'shelves';
    adjective = 'starboard' 'aft';
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
The shelves along the aft starboard wall are filled with fictional reading and\n
historical documents.\n
Some of the items are antique books, printed into physical copies, however\n
a vast majority of the items on the shalves are organizers filled with small\n
digital book cards. The fictional literature is divided into alphabetized genres.\n
\b
As you inspect the shelves you see the flash of something metallic behind the\n
sturdy structure.\n
        '
    ];

    msgDmg = [
        '
The shelves along the aft starboard wall are filled with fictional reading and\n
historical documents.\n
Some of the items are antique books, printed into physical copies, however\n
a vast majority of the items on the shalves are organizers filled with small\n
digital book cards. The fictional literature is divided into alphabetized genres.\n
\b
The shelves have been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the starboard wall shelves.\n
They are filled with fictional reading and historical documents.\n
Some of the items are antique books, printed into physical copies, however\n
a vast majority of the items on the shalves are organizers filled with small\n
digital book cards. The fictional literature is divided into alphabetized genres.\n
\b
As you inspect the shelves you see the flash of something metallic behind the\n
sturdy structure.\n
        '
    ];

    exDmg = [
        '
You examine the starboard wall shelves.\n
They are filled with fictional reading and historical documents.\n
Some of the items are antique books, printed into physical copies, however\n
a vast majority of the items on the shalves are organizers filled with small\n
digital book cards. The fictional literature is divided into alphabetized genres.\n
\b
The shelves have been shot and damaged.\n
        '
    ];

    shootMsg = [
        '
        '
    ];
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(LookBehind)
    {
        action()
        {
            "
You look behind the shelves. There is just enough room for you to squeeze\n
into the space between the shelves and the wall. Just above the floor you\n
see a large metal vent cover. It appears to have been dislodged by something.\n
            ";
            discover(Mundane_Hold_Port_AirShaft);
        }
    }
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
