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
            /*
            if (k == 'tech')
            {
                cls();
                me.moveInto(TechCenter);
            }
            */
        }
        // ---------------------------------------------------------------------


        // --[GAME INTRO]-------------------------------------------------------
        "
            \b\b
            You are the infamous prisoner Stalinis Maxuel.
            Your lucrative career as an interstellar pirate has come to an end.
            Off the rings of Saturn you were taken prisoner aboard the military
            vessel Apsis.
            \n
            You are being held in the brig.
            \n
            While breaking free of Saturn space the ship inadvertently skimmed
            the rings and was struck by debris damaging its shields and
            navigation system. The resulting momentary power outage disabled
            your restraints long enough to free you.
            \n
            You managed to kill the guard who was in the brig with you at the
            time.
            \n
            If you can get to the bridge, you can take the Apsis.
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
        '); // after room description
    };
};
