#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Starboard_Aft_Map:
    Thing
    'map' 'Map'
{
    location = Mundane_Hold_Starboard_Aft_Shelves;
    label = 'the map';
    labelProper = 'The map';
    specialDescOrder = 1;
    noun = 'map';
    adjective = '' '';
    isDyst = nil;
    threshold = 1;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;
    damageType = '';
    inp = '';
    match = nil;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
Sitting on the shelves amid the robot components is a small, thin screen.\n
It is a map.\n
        '
    ];

    msgDmg = [
        '
Sitting on the shelves amid the robot components is a small, thin screen.\n
It is a map.\n
\b
It has been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the map. It appears to be in working order.\n
You tap the screen and it flickers into an active state.\n
A three dimensional menu materializes above the map unit.\n
\b
        '
    ];

    exDmg = [
        '
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

            if (shotCount < 1)
            {
                "
It is a menu of the ship's floors.\n
To view the map's data for a given floor, enter one of the following:\n
level 1 : The ship's first floor.\n
level 2 : The ship's second floor.\n
level 3 : The ship's third floor.\n
                ";

                inputCheck();
            }
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


// --[HELPER METHODS]-----------------------------------------------------------
inputCheck
{
    if (shotCount < 1)
    {
        do {
            "<.inputline>";
            "\b\bEnter a level to view or say cancel>> ";
            "<./inputline>";
            inp = inputManager.getInputLine(nil, nil);
        } while (nil);

        match = nil;

        // Level 1
        if (Respond(match, inp, 'level 1|floor 1') == true)
        {
            match = true;
            "
Level 1 materializes above the map.\n
In the center of the ship's aft you see the engine control room.\n
A narrow passage leads forward into a long hall of fuel cells.\n
Forward of the fuel cells is an engine room.\n
The map cuts off there.\n
            ";
        }

        // Level 2
        if (Respond(match, inp, 'level 2|floor 2') == true)
        {
            match = true;
            "
Level 2 materializes above the map.\n
In the center of the aft is the brig.\n
A narrow hall leads forward to a hold access hall.\n
In the port and starboard sides of the ship you see the two holds.\n
Forward of the hold access is a narrow passage leading to a second\n
hold access hall.\n
In the port side of this is a crew hold.\n
To the starboard is a weapon hold.\n
Forward of this hte map cuts off.\n
            ";
        }

        // Level 3
        if (Respond(match, inp, 'level 3|floor 3') == true)
        {
            match = true;
            "
Level 3 materializes above the map.\n
In the middle of the ship is a shield control room.\n
To the port and starboard of this are narrow passages leading to the \n
shields.\n
Forward of the control room is the generator and forward of this is the\n
power control room.\n
Forward of the power control room the map cuts off.\n
            ";
        }

        if (Respond(match, inp, 'cancel'))
        {
            match = true;
            "You deactivate the map.";
        }
        else
        {
            inputCheck;
        }
    }
};
// -----------------------------------------------------------------------------
};
