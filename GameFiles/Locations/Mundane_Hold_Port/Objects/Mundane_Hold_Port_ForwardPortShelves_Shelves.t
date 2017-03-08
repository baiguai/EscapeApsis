#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_ForwardPortShelves_Shelves:
    Fixture
    'Forward Port Shelves' 'Forward Port Shelves'
{
    location = Mundane_Hold_Port_ForwardPortShelves;
    label = 'the shelves';
    labelProper = 'The shelves';
    specialDescOrder = 1;
    noun = 'shelves';
    adjective = 'port' 'forward';
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
The forward port shelves are sturdy industrial structures that rise up into the\n
shadows far overhead.\n
\b
Neatly folded jumpsuits and various other uniforms have been set on them\n
in perfect stacks. On the lower shelves are civilian clothes and rows of\n
work boots and shoes.\n
        ',
        '
The forward port shelves rise up into the shadows far overhead.\n
\b
Neatly folded jumpsuits and various other uniforms have been set on them\n
in perfect stacks. On the lower shelves are civilian clothes and rows of\n
work boots and shoes.\n
        '
    ];

    msgDmg = [
        '
The forward port shelves rise up into the shadows far overhead.\n
\b
Neatly folded jumpsuits and various other uniforms have been set on them\n
in perfect stacks. On the lower shelves are civilian clothes and rows of\n
work boots and shoes.\n
\b
They have been shot and damaged. Some of the clothes are still smouldering.\n
        '
    ];

    ex = [
        '
You examine the shelves. They line the port wall in the forward of the\n
hold. They are made of hefty industrial metal.\n
\b
Neatly folded jumpsuits and various other uniforms have been set on them\n
in perfect stacks. On the lower shelves are civilian clothes and rows of\n
work boots and shoes.\n
        '
    ];

    exDmg = [
        '
You examine the shelves. They line the port wall in the forward of the\n
hold. They are made of hefty industrial metal.\n
\b
Neatly folded jumpsuits and various other uniforms have been set on them\n
in perfect stacks. On the lower shelves are civilian clothes and rows of\n
work boots and shoes.\n
\b
They have been shot and damaged. Some of the clothes are still smouldering.\n
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
