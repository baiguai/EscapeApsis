#include <adv3.h>
#include <en_us.h>

// --[DAY / NIGHT LIST]---------------------------------------------------------
Get_DayNightList(obj, isEx, isDmg)
{
    local ls = nil;
    local isNight = nil;

    if (isEx == true)
    {
        if (obj.ex == nil)
        {
            if (gameMain.CurrentHour > gameMain.SunsetHour)
            {
                isNight = true;
            }

            if (isNight == true)
            {
                if (isDmg == true)
                {
                    ls = obj.exNightDmg;
                }
                else
                {
                    ls = obj.exNight;
                }
            }
            else
            {
                if (isDmg == true)
                {
                    ls = obj.exDmgDay;
                }
                else
                {
                    ls = obj.exDay;
                }
            }
        }
        else
        {
            if (isDmg == true)
            {
                ls = obj.exDmg;
            }
            else
            {
                ls = obj.ex;
            }
        }
    }
    else
    {
        if (obj.msg == nil)
        {
            if (gameMain.CurrentHour > gameMain.SunsetHour)
            {
                isNight = true;
            }

            if (isNight == true)
            {
                if (isDmg == true)
                {
                    ls = obj.exNightDmg;
                }
                else
                {
                    ls = obj.msgNight;
                }
            }
            else
            {
                if (isDmg == true)
                {
                    ls = obj.msgDayDmg;
                }
                else
                {
                    ls = obj.msgDay;
                }
            }
        }
        else
        {
            if (isDmg == true)
            {
                ls = obj.msgDmg;
            }
            else
            {
                ls = obj.msg;
            }
        }
    }

    return ls;
};
// -----------------------------------------------------------------------------

// --[LOCATION]-----------------------------------------------------------------
Desc_Location(obj)
{
    local ix = 0;
    local ls = Get_DayNightList(obj, nil, nil);

    // navigation
    "<<Navigation(obj.nav)>>";

    foreach (local txt in ls)
    {
        if (obj.descCount == ix ||
            ix == ls.length() - 1)
        {
            "<<txt>>";
            obj.descCount++;
            return;
        }

        ix++;
    };
};
// -----------------------------------------------------------------------------


// --[NAVIGATION]---------------------------------------------------------------
Navigation(lst)
{
"-- Navigation --\n";
foreach(local txt in lst)
{
    "<<txt>>\n";
}
"\b\b";
};
// -----------------------------------------------------------------------------


// --[NAVIGATION MESSAGE]-------------------------------------------------------
Desc_Navigation(message)
{
    // cls();
    "
\b
<<message>>
    ";
};
// -----------------------------------------------------------------------------


// --[SHOOTABLE DESC]-----------------------------------------------------------
Desc_Shootable(obj)
{
    // Enemies use simpler messaging
    if (obj.isEnemy != nil)
    {
        Do_Enemy_Message(obj.life, obj.message, obj.deadMessage);
        return;
    }


    local ls = Get_DayNightList(obj, nil, nil);
    local lsDmg = Get_DayNightList(obj, nil, true);
    Do_Desc_Shootable(obj.descCount, ls, obj.shotCount, lsDmg);
    obj.descCount++;
};
Ex_Shootable(obj)
{
    // Enemies use simpler messaging
    if (obj.isEnemy != nil)
    {
        Do_Enemy_Message(obj.life, obj.message, obj.deadMessage);
        return;
    }

    local ls = Get_DayNightList(obj, true, nil);
    local lsDmg = Get_DayNightList(obj, true, true);
    Do_Desc_Shootable(obj.exCount, ls, obj.shotCount, lsDmg);
    obj.exCount++;
};
Do_Desc_Shootable(calledCount, messages, shotCount, messagesDmg)
{
    local ix = 0;

    if (shotCount > 0)
    {
        foreach(local txt in messagesDmg)
        {
            if (ix == (shotCount - 1) ||
                ix == messagesDmg.length() - 1)
            {
                "<<txt>>";
                break;
            }

            ix++;
        }
    }
    else
    {
        foreach(local txt in messages)
        {
            if (ix == calledCount ||
                ix == messages.length() - 1)
            {
                "<<txt>>";
                break;
            }

            ix++;
        }
    }
};

Do_Enemy_Message(life, message, deadMessage)
{
    if (gameMain.DEVMODE == true)
    {
        // "\bLife: <<life>>\b";
    }

    "
\b
    ";

    if (life > 0)
    {
        "<<message>>";
    }
    else
    {
        // "<<deadMessage>>";
    }

"
\b
    ";
};
// -----------------------------------------------------------------------------


// --[GENERAL DESC]-------------------------------------------------------------
Desc_General(obj)
{
    local ls = Get_DayNightList(obj, nil, nil);
    Do_Desc_General(obj.descCount, ls);
    obj.descCount++;
};
Ex_General(obj)
{
    local ls = Get_DayNightList(obj, true, nil);
    Do_Desc_General(obj.exCount, ls);
    obj.exCount++;
};
Shoot_General(obj)
{
    local ix = obj.shotCount;
    if (ix > 0) ix = (ix - 1);
    Do_Desc_General(ix, obj.shootMsg);
};
Do_Desc_General(calledCount, messages)
{
    local ix = 0;

    foreach(local txt in messages)
    {
        if (ix == calledCount ||
            ix == messages.length() - 1)
        {
            "<<txt>>";
            break;
        }

        ix++;
    }
};
// -----------------------------------------------------------------------------

// --[RANDOM DESC]--------------------------------------------------------------
Desc_Random(obj)
{
    local ls = Get_DayNightList(obj, nil, nil);
    Do_Desc_Random(ls);
};
Ex_Random(obj)
{
    local ls = Get_DayNightList(obj, true, nil);
    Do_Desc_Random(ls);
};
Do_Desc_Random(messages)
{
    local rnd = rand(messages.length() - 1);
    local ix = 0;

    foreach(local txt in messages)
    {
        if (ix == rnd)
        {
            "<<txt>>";
            break;
        }

        ix++;
    }
};
// -----------------------------------------------------------------------------

// --[RANDOM SHOOTABLE DESC]----------------------------------------------------
Desc_ShootableRandom(obj)
{
    local ls = Get_DayNightList(obj, nil, nil);
    local lsDmg = Get_DayNightList(obj, nil, true);
    Do_Desc_ShootableRandom(ls, obj.shotCount, lsDmg);
};
Ex_ShootableRandom(obj)
{
    local ls = Get_DayNightList(obj, true, nil);
    local lsDmg = Get_DayNightList(obj, true, true);
    Do_Desc_ShootableRandom(ls, obj.shotCount, lsDmg);
};
Do_Desc_ShootableRandom(messages, shotCount, messagesDmg)
{
    local rnd = rand(messages.length() - 1);
    local ix = 0;

    if (shotCount > 0)
    {
        foreach(local txt in messagesDmg)
        {
            if (ix == (shotCount - 1) ||
                ix == messagesDmg.length() - 1)
            {
                "<<txt>>";
                break;
            }

            ix++;
        }
    }
    else
    {
        foreach(local txt in messages)
        {
            if (ix == rnd)
            {
                "<<txt>>";
                break;
            }

            ix++;
        }
    }
};
// -----------------------------------------------------------------------------
