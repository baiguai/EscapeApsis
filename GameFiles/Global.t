#include <adv3.h>
#include <en_us.h>

// --[CURRENT GOAL]-------------------------------------------------------------
DefineIAction(Goal)
execAction()
{
    "[Goal: <<gameMain.CurrentGoal>>]";
}
;
VerbRule(Goal) 
 'Goal' | 'g'
 : GoalAction
 verbPhrase = 'goal/g'
;
// -----------------------------------------------------------------------------

// --[ADD NOTE]-----------------------------------------------------------------
DefineLiteralAction(AddNote)
execAction()
{
    local lst = gameMain.Notes.append(getLiteral());
    gameMain.Notes = lst;

    "Note added.";
};
VerbRule(AddNote)
    'AddNote' singleLiteral
    : AddNoteAction
    verbPhrase = 'addnote (what)'
;

DefineLiteralAction(DeleteNote)
execAction()
{
    try
    {
        local ix = toInteger(getLiteral());
        local lst = gameMain.Notes.removeElementAt(ix);
        gameMain.Notes = lst;
    }
    catch (Exception ex)
    {
        "Be sure to enter the note number to delete.";
        throw ex;
    }

    "Note removed.";
};
VerbRule(DeleteNote)
    'DeleteNote' singleLiteral
    : DeleteNoteAction
    verbPhrase = 'deletenote (what)'
;

DefineIAction(Notes)
execAction()
{
    local ix = 1;

    "Notes:";
    foreach (local note in gameMain.Notes)
    {
        if (note != '')
        {
            "\n[<<ix>>] <<note>>";
            ix++;
        }
    }
};
VerbRule(Notes)
    'Notes'
    : NotesAction
    verbPhrase = 'notes'
;
// -----------------------------------------------------------------------------


// --[VIEW PLAYER STATS]--------------------------------------------------------
DefineIAction(Stats)
execAction()
{
    cls();
    ShowStats();
};
VerbRule(Stats)
    'Stats'
    : StatsAction
    verbPhrase = 'stats'
;
ShowStats()
{
    "\b\b";
    "Player Stats:\n";
    "Life: <<me.life>>\n";
    "Initiative: <<me.initiative>>\b";
    "Weapon: <<me.weapon.name>>\n";
    "Damage Value: <<me.weapon.damageValue>>\n";
    if (me.weapon.isGun == true)
    {
        "Shot Capacity: <<me.weapon.shotCapacity>>\n";
        "Current Capacity: <<me.weapon.shotCount>>\n";
        if (me.weapon.isEnergy == true)
        {
            "Charge Time: <<me.weapon.chargeTime>>\n";
        }
    }
};
// -----------------------------------------------------------------------------


// --[REGISTER THE TRAVELLING NPCS]---------------------------------------------
MpveTravelers()
{
    foreach (local npc in gameMain.TravelingCharacters)
    {
        if (npc.shotCount == nil || npc.shotCount < 1)
        {
            local ix = npc.travelIndex + 1;
            if (ix > npc.travelPath.length) ix = 1;

            npc.travelIndex = ix;

            if (gameMain.DEVMODE == true)
            {
                "\nNPC: <<npc.label>>\nIX: <<ix>> -- Loc: <<npc.travelPath[ix].roomName>>\n";
            }

            npc.moveIntoForTravel(npc.travelPath[ix]);
        }
    };
};
// -----------------------------------------------------------------------------


// --[ASK A QUESTION]-----------------------------------------------------------
Ask(match, inp, question)
{
    local str = '<NoCase>%b' + question + '%b';

    if (
        match == nil &&
        rexSearch(str, inp) != nil &&
        inp.find('?') != nil
    )
    {
        match = true;
    }
    else
    {
        match = nil;
    }

    return match;
};
// -----------------------------------------------------------------------------


// --[RESPOND]------------------------------------------------------------------
Respond(match, inp, response)
{
    local str = '<NoCase>%b' + response + '%b';

    if (
        match == nil &&
        rexSearch(str, inp) != nil &&
        inp.find('?') == nil
    )
    {
        match = true;
    }
    else
    {
        match = nil;
    }

    return match;
};
// -----------------------------------------------------------------------------


// --[CANCEL TALK]--------------------------------------------------------------
CancelTalk(inp, label)
{
    if (inp.toLower().find('cancel') != nil)
    {
        "You have quit talking to <<label>>.";
        return true;
    }
    else
    {
        return nil;
    }
}
// -----------------------------------------------------------------------------


// --[TIME PASSAGE]-------------------------------------------------------------
TimePassage(interval)
{
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
        "\nTimestamp: <<gameMain.CurrentHour>>:<<gameMain.CurrentMinute < 10 ? '0' + gameMain.CurrentMinute : gameMain.CurrentMinute>> (Day: <<gameMain.CurrentDay>>)\n";
        "Life: <<me.life>>";
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


// --[SHOW ASCII]---------------------------------------------------------------
modify typographicalOutputFilter
isActive = true
activate() { isActive = true; }
deactivate { isActive = nil; }
filterText(ostr, val) { return isActive ? inherited(ostr, val) : val; }
;

showAscii(lst)
{    
typographicalOutputFilter.deactivate();
"<pre>";
foreach(local txt in lst)
{
   txt = txt.findReplace(' ', '\ ', ReplaceAll);
   "<<txt>>\n";
}
"</pre>";
typographicalOutputFilter.activate();
}
// -----------------------------------------------------------------------------



// --[shooting]-------------------------------------------------------------------------
/*
Within the 'shootable' objects add the following along with any logic for what shooting it does to it:

dobjFor(Shoot)
{
verify() { logical; }
action()
{
    if (me.ShootGun(self) == true)
    {
        "BAMM";
    }
}
}
*/

DefineTAction(Shoot);
VerbRule(Shoot)
('shoot') singleDobj
: ShootAction
verbPhrase = 'shoot (what)'
;
modify Thing
dobjFor(Shoot)
{
    verify() 
    {
        /*
        illogicalNow('you cant do that');
        if ([canShoot] != true)
        {
            illogical('\bShooting this would do nothing more than cause damage to it.\b');
            return;
        }
        else
        {
            // Random check
            if ([chance] != nil)
            {
                illogical('\bYou shoot but miss.\b');
            }
        }
        */
    }
    action() 
    {
        'cool!';
    }
}
;
// -----------------------------------------------------------------------------
