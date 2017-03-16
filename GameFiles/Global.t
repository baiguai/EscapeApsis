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

ShowGoal()
{
    "
\b
[Goal: <<gameMain.CurrentGoal>>]
\b
    ";
};
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
    if (me.weapon == nil)
    {
        "Weapon: none\n";
    }
    else
    {
        "Weapon: <<me.weapon.name>>\n";
        "Damage Value: <<me.weapon.damageValue>>\n";
        if (me.weapon.isGun == true)
        {
            "Shot Capacity: <<me.weapon.shotCapacity>>\n";
            "Current Capacity: <<me.weapon.shotCount>>\n";
            if (me.weapon.isEnergy == true && me.weapon.shotCount < me.weapon.shotCapacity)
            {
                "Weapon Charge Status: Charging\n";
            }
            else
            {
                "Weapon Charge Status: Fully Charged\n";
            }
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
                // "\nNPC: <<npc.label>>\nIX: <<ix>> -- Loc: <<npc.travelPath[ix].roomName>>\n";
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



// --[SHOOTING]-----------------------------------------------------------------
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


// --[SPAWNING ITEMS]-----------------------------------------------------------
SpawnBattery(location, battName)
{
    local battery = new Battery;
    battery.name = battName;
    cmdDict.addWord(battery, battName, &noun);
    battery.moveInto(location);

    return battery;
};
SpawnMedCapsule(location, medName)
{
    local capsule = new MedCapsule;
    capsule.name = medName;
    cmdDict.addWord(capsule, medName, &noun);
    capsule.moveInto(location);

    return capsule;
};
SpawnCamera01(location, camName, camAdj)
{
    local camera = new Camera01;
    camera.name = camName;
    cmdDict.addWord(camera, camName, &noun);
    cmdDict.addWord(camera, camAdj, &adjective);
    camera.moveInto(location);

    return camera;
};

SpawnGuard(location, guardName)
{
    local name = guardName;
    local guard = new Guard;
    guard.name = name;
    cmdDict.addWord(guard, name, &noun);
    cmdDict.addWord(guard, 'guard', &noun);

    guard.life = rand(guard.lifeMax) + guard.lifeMin;

    // Add items to the enemy
    if (rand(100) > guard.carryingChance + MedCapsule.carryingAdjustment)
    {
        SpawnMedCapsule(guard, 'med capsule');
    }

    guard.moveIntoForTravel(location);

    guard.specialDesc();

    return guard;
};

// Vanish Items
Vanish(obj)
{
    obj.moveInto(Limbo);
};
// -----------------------------------------------------------------------------
