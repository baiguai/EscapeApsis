#include <adv3.h>
#include <en_us.h>

versionInfo: GameID
{
    name = 'Escape Apsis'
    byline = 'baiguai'
    authorEmail = 'baiguai.junk@gmail.com'
    desc = 'Fight your way to the bridge and take the ship.'
    version = '1'
    IFID = 'E6E7B6D7-E68A-491B-8447-0939E46E3A58'

    showCredit()
    {
        "\bCredits...\b";
    }
    showAbout()
    {
        "\bAbout...\b";
    }
};




gameMain: GameMainDef
{
    GameName = "Escape Apsis";
    DEVMODE = true;
    VERBOSE = nil;
    initialPlayerChar = me;
    CurrentGoal = 'Arm yourself';
    Notes = [ '' ];

    // Time Handling

    /*
        Abstract time passage, used by game components.
        Back end time.
        Every time the player issues a command the task
        interval increases. When it reaches the task
        interval the run time increases by 1 and the 
        task time is zero'd out.

    */
    CurrentRuntime = 0;
    CurrentTasktime = 0;
    TaskInterval = 5;

    /*
        Real time passage. This is game facing time.
        Every time the player travels time minutes increase
        by the passage interval.
    */
    CurrentHour = 19;
    CurrentMinute = 00;
    CurrentDay = 1;
    SunsetHour = 17;
    PassageInterval = 5; // In Minutes

    // Attribute bounds
    lifeMin = 6;
    lifeMax = 24;
    chanceRand = 20;
    retreatCost = 3;

    TravelingCharacters = [
    ];

    showIntro()
    {
        // --[INITIAL SHIP ATTRIBUTE SETUP]-------------------------------------
        Ship.PowerOff();
        SpawnMedCapsule(Brig_Guard, 'med capsule');
        // ---------------------------------------------------------------------

        // --[ONE TIME PLAYER ATTRIBUTE SETTING]--------------------------------
        if (me.life == 0)
        {
            me.life = rand(lifeMax) + lifeMin;
            me.maxLife = me.life;
        }
        if (me.chance == 0)
        {
            me.chance = 100 - (rand(chanceRand) + 50);
        }
        // ---------------------------------------------------------------------


        // --[BEGIN THE ADMIN TOOL]---------------------------------------------
        if (DEVMODE)
        {
            local k;
            do {
                "<.inputline>";
                "\b\bEnter admin commands>> ";
                "<./inputline>";
                k = inputManager.getInputLine(nil, nil);
            } while (nil);

            if (k == '') // Just to avoid a Warning
            {}
            if (k == 'vent')
            {
                cls();
                me.weapon = EPistol;
                me.moveInto(Vent_Aft_PortHoldVent);
            }
            if (k == 'gp')
            {
                cls();
                me.weapon = EPistol;
                me.moveInto(Brig_GuardPost);
            }
            if (k == 'hold')
            {
                cls();
                me.weapon = EPistol;
                me.moveInto(Mundane_Hold_Port);
            }
            if (k == 'bh')
            {
                cls();
                me.weapon = EPistol;
                me.moveInto(Brig_Hall);
            }
            if (k == 'sh')
            {
                cls();
                me.weapon = EPistol;
                me.moveInto(Mundane_Hold_Starboard);
            }
        }
        // ---------------------------------------------------------------------


        // --[GAME INTRO]-------------------------------------------------------
        "
\b\b
You are the infamous pirate Stalinis Maxuel.\n
Your lucrative interstellar career has come to an end.\n
Just off Saturn you were taken prisoner aboard the military\n
vessel Apsis.\n
\b
You are being held in the brig.\n
\b
...
\b
While the ship was breaking free of Saturn space it inadvertently\n
skimmed her rings and was struck by debris damaging its shields and\n
navigation system.\n
Somehow during the momentary power surge and following outage, your\n
restraints became disabled allowing you to break free just as\n
a guard was bringin your supper.\n
\b
You managed to kill the guard with your bare hands.\n
\b
...
\b
If you can get to the bridge, you can take the Apsis.\n
You know that you are being held somewhere in the ship's aft, and\n
assume the brig's door is forward, so your cell's door is in the\n
port wall.\n
\b\b

[Goal: <<gameMain.CurrentGoal>>]
\b\b
(for help type 'help')
\b\b
--------------------------------------------------------------------------------
\b\b
        ";
        // ---------------------------------------------------------------------
    }

    showGoodbye()
    {
        "Thank you for playing Escape from Apsis!";
    }
};


me: Actor
{
    location = Brig_Cell04; // initial location
    height = 5; // player height
    weapon = nil; // only allow player to carry one weapon
    maxLife = 0;
    life = 0;
    initiative = 1;
    chance = 0;

    rememberTravel(origin, dest, backConnector)
    {
        // Call any methods we need to have fired every time the player
        // travels

        inherited(origin, dest, backConnector);

        // VisitAdjustment - Time.t
        // TimePassage - Time.t
        // WeaponChargeCheck - Fighting.t

        "<<TimePassage(gameMain.PassageInterval)>>";

        reportAfter('
            <<VisitAdjustment(dest)>>
            <<WeaponChargeCheck()>>
            <<Ship.StateUpdate()>>
        '); // after room description
    };

    // Commands such as examine issued
    nonIdleTurn()
    {
        /*
        "\b\bTask Interval: <<gameMain.CurrentTasktime>>\b";
        "Run Time: <<gameMain.CurrentRuntime>>\b\b";
        */
        "
            <<TaskPassage(1)>>
        ";
    };

    // Non-commands such as look issued
    noteConditionAfter()
    {
        /*
        "\b\bTask Interval: <<gameMain.CurrentTasktime>>\b";
        "Run Time: <<gameMain.CurrentRuntime>>\b\b";
        */
        "
            <<TaskPassage(1)>>
        ";
    };
};
