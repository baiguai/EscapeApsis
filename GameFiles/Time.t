#include <adv3.h>
#include <en_us.h>

// --[TIME PASSAGE]-------------------------------------------------------------
TimePassage(interval)
{
    gameMain.CurrentRuntime += 1;
    gameMain.CurrentMinute += interval;
    
    // HANDLE HOUR AND DAY OVERFLOW
    if (gameMain.CurrentMinute >= 60)
    {
        gameMain.CurrentMinute = (gameMain.CurrentMinute - 60);
        gameMain.CurrentHour += 1;

        if (gameMain.CurrentHour >= 24)
        {
            gameMain.CurrentHour = 0;
            gameMain.CurrentDay += 1;
        }
    }

    // Move the NPCs
    MpveTravelers();

    // DEBUGGING MESSAGES
    if (gameMain.DEVMODE == true)
    {
        /*
        "\nTimestamp: <<gameMain.CurrentHour>>:<<gameMain.CurrentMinute < 10 ? '0' + gameMain.CurrentMinute : gameMain.CurrentMinute>> (Day: <<gameMain.CurrentDay>>)\n";
        "Life: <<me.life>>";
        */
    }
};

TaskPassage(interval)
{
    gameMain.CurrentTasktime += interval;

    if (gameMain.CurrentTasktime >= gameMain.TaskInterval)
    {
        gameMain.CurrentRuntime += 1;
        gameMain.CurrentTasktime = 0;
    }
};
// -----------------------------------------------------------------------------


// --[VISIT COUNT AND OBJECT MOVEMENT]------------------------------------------
VisitAdjustment(loc)
{
    if (loc.visitCount != nil)
    {
        loc.visitCount++;
    }

    if (loc.move != nil)
    {
        foreach (local d in loc.move)
        {
            if (d.threshold <= loc.visitCount)
            {
                if (d.isNpc == nil)
                {
                    if (d.isDyst == nil)
                    {
                        d.moveInto(Limbo);
                    }
                    else
                    {
                        d.moveInto(loc);
                    }
                }
                else
                {
                    if (d.isDyst == nil)
                    {
                        d.moveIntoForTravel(Limbo);
                    }
                    else
                    {
                        if (d.life == nil ||
                            d.life > 0)
                        {
                            d.moveIntoForTravel(loc);
                        }
                    }
                }
            }
        }
    }
};
// -----------------------------------------------------------------------------
