#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Computer:
    Fixture
    'computer' 'computer'
{
    location = Mundane_Hold_Port;
    label = 'the computer terminal';
    labelProper = 'The computer terminal';
    specialDescOrder = 1;
    noun = 'computer' 'terminal' 'screen';
    adjective = 'computer';
    isDyst = nil;
    threshold = 1;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;
    damageType = '';
    inp = '';

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
Aft of the entrance you see a computer terminal, its glowing monitor is much
brighter than the overhead lights.
        ',
        '
Aft of the entrance you see a computer terminal, its monitor is glowing
brightly.
        '
    ];

    msgDmg = [
        '
Aft of the entrance you see a computer terminal. It has been shot and
destroyed. It has gone dark.
        '
    ];

    ex = [
        '
You examine the computer terminal.
Listed on the screen is an inventory of items and their locations within
the hold.
\b
[PORT HOLD INVENTORY]
\n
> Attire - forward port \n
> Computer Parts - aft port \n
> Tools - aft port \n
> Personnel Files - forward starboard \n
> Historical Documents - aft starboard \n
> Fiction Reading - aft starboard \n
> Office Supplies - aft 1 \n
> Cleaning Supplies - aft 2 \n
> Batteries and Power Supplies - aft 3 \n
> Miscellaneous - aft 4
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
            inputCheck();
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
            "\b\bEnter selection or say cancel>> ";
            "<./inputline>";
            inp = inputManager.getInputLine(nil, nil);
        } while (nil);

        match = nil;

        // Attire
        if (Respond(match, inp, 'attire') == true)
        {
            match = true;
            "
\b
[ATTIRE]
\n
- Pants \n
- Shirts \n
- Jumpsuits \n
- Space Suits \n
- Shoes \n
> HOME
\b
            ";
        }

        // Computer Parts
        if (Respond(match, inp, 'computer parts') == true)
        {
            match = true;
            "
\b
[COMPUTER PARTS]
\n
- Monitors \n
- Keyboards \n
- Memory \n
- Units \n
- Projectors \n
- Printers \n
- Networking \n
- Cables \n
> HOME
\b
            ";
        }

        // Tools
        if (Respond(match, inp, 'tools') == true)
        {
            match = true;
            "
\b
[TOOLS]
\n
- Wrenches \n
- Hammers \n
- Screwdrivers \n
- Cutters \n
- Meters \n
- Specialty \n
> HOME
\b
            ";
        }

        // Personnel Files
        if (Respond(match, inp, 'personnel files') == true)
        {
            match = true;
            "
\b
[PERSONNEL FILES]
\n
- Bridge \n
- General Crew \n
- Specialists \n
- Navigation \n
- Maintenance \n
> HOME
\b
            ";
        }

        // Historical Documents
        if (Respond(match, inp, 'historical documents') == true)
        {
            match = true;
            "
\b
[HISTORICAL DOCUMENTS]
\n
- Blueprints \n
- Charter \n
- Missions \n
- Legal \n
> HOME
\b
            ";
        }

        // Fictional Reading
        if (Respond(match, inp, 'fictional reading') == true)
        {
            match = true;
            "
\b
[FICTIONAL READING]
\n
- Mystery \n
- Horror \n
- Sci Fi \n
- Humorous \n
- Religious \n
- Drama \n
- Action / Adventure \n
> HOME
\b
            ";
        }

        // Office Supplies
        if (Respond(match, inp, 'office supplies') == true)
        {
            match = true;
            "
\b
[OFFICE SUPPLIES]
\n
- Paper \n
- Pens \n
- Organization \n
> HOME
\b
            ";
        }

        // Cleaning Supplies
        if (Respond(match, inp, 'cleaning supplies') == true)
        {
            match = true;
            "
\b
[CLEANING SUPPLIES]
\n
- Cleaning Agents \n
- Brooms / Mops \n
- Miscellaneous \n
> HOME
\b
            ";
        }

        // Batteries / Power Supplies
        if (Respond(match, inp, 'batteries and power supplies') == true)
        {
            match = true;
            "
\b
[BATTERIES / POWER SUPPLIES]
\n
- General Batteries \n
- Specialized Batteries \n
- General Power Supplies \n
- Specialized Power Supplies \n
> HOME
\b
            ";
        }

        // Misc
        if (Respond(match, inp, 'miscellaneous') == true)
        {
            match = true;
            "
\b
[MISCELLANEOUS]
\n
- Devices \n
- Other \n
> HOME
\b
            ";
        }

        // Home
        if (Respond(match, inp, 'home') == true)
        {
            match = true;
            "
[PORT HOLD INVENTORY]
\n
> Attire - forward port \n
> Computer Parts - aft port \n
> Tools - aft port \n
> Personnel Files - forward starboard \n
> Historical Documents - aft starboard \n
> Fiction Reading - aft starboard \n
> Office Supplies - aft 1 \n
> Cleaning Supplies - aft 2 \n
> Batteries and Power Supplies - aft 3 \n
> Miscellaneous - aft 4
            ";
        }

        if (CancelTalk(inp, label) == nil)
        {
            inputCheck;
        }
    }
};
// -----------------------------------------------------------------------------
};
