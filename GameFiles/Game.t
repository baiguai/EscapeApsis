#include <adv3.h>
#include <en_us.h>

versionInfo: GameID
{
    name = 'Escape Apsis'
    byline = 'baiguai'
    authorEmail = 'baiguai.junk@gmail.com'
    desc = 'Fight your way to the bridge and take the ship.'
    version = '1'
    IFID = 'b8563851-6257-77c3-04ee-278ceaeb48ad'
};




gameMain: GameMainDef
{
    GameName = "Escape Apsis";
    DEVMODE = true;
    initialPlayerChar = me;
    CurrentGoal = 'Arm yourself';
    Notes = [ '' ];

    CurrentHour = 19;
    CurrentMinute = 00;
    CurrentDay = 1;
    SunsetHour = 17;
    PassageInterval = 5; // In Minutes

    // Attribute bounds
    lifeMin = 6;
    lifeMax = 24;
    chanceRand = 20;

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
            if (k == 'gp')
            {
                cls();
                me.moveInto(Brig_GuardPost);
            }
        }
        // ---------------------------------------------------------------------


        // --[GAME INTRO]-------------------------------------------------------
        "
            \b\b
            You are the infamous pirate Stalinis Maxuel.
            Your lucrative interstellar career has come to an end.
            Just off Saturn you were taken prisoner aboard the military
            vessel Apsis.
            \n
            You are being held in the brig.
            \n
            While the ship was breaking free of Saturn space it inadvertently
            skimmed her rings and was struck by debris damaging its shields and
            navigation system. The resulting momentary system surge and power
            outage disabled your restraints long enough for you to break free
            just as a guard was bringing your supper.
            \n
            You managed to kill the guard with your bare hands.
            \n
            If you can get to the bridge, you can take the Apsis.
            You know that you are being held somewhere in the ship's aft, and
            assume the brig's door is forward, so your cell's door is in the
            port wall.
            \b\b

            [Goal: <<gameMain.CurrentGoal>>]
            \b\b
            (for help type 'help')
            \b\b
        ";
        // ---------------------------------------------------------------------
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

        reportAfter('
            <<VisitAdjustment(dest)>>
            <<WeaponChargeCheck()>>
            <<TimePassage(gameMain.PassageInterval)>>
            <<Ship.StateUpdate()>>
        '); // after room description
    };
};
