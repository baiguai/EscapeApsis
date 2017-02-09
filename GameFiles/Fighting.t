#include <adv3.h>
#include <en_us.h>

// --[FIGHTING MODE]------------------------------------------------------------
FightingMode(obj)
{
    local initEnemy = rand(100);
    local initMe = rand(100);
    initEnemy += obj.initiative;
    initMe += me.initiative;

    // Initial attack
    if (initEnemy > initMe)
    {
        KillCheck(obj);
    }

    // Enter the fight loop
    FightTurn(obj);
};
FightTurn(obj)
{
    local inp = '';
    local match = nil;

    do {
        "<.inputline>";
        "\b\bYou are fighting <<obj.label>>>> ";
        "<./inputline>";
        inp = inputManager.getInputLine(nil, nil);
    } while (nil);

    match = nil;

    // Shoot
    if (Respond(match, inp, 'shoot') == true)
    {
        match = true;
        ShootGun(obj);
    }

    if (obj.life > 0)
    {
        FightTurn(obj);
    }
};
// -----------------------------------------------------------------------------






// --[KILL CHECK]---------------------------------------------------------------
KillCheck(obj)
{
    if (obj.isEnemy == nil)
    {
        return nil;
    }

    if (obj.life > 0)
    {
        local rnd = rand(100);
        local chnc = me.chance;

        if (rnd > chnc)
        {
            "\b\b";

            me.life = (me.life -1);

            if (me.life <= 0)
            {
                "
\t
<<finishGameMsg('You have been killed by <<obj.label>>.', [finishOptionUndo])>>
\b\b
                ";
                return true;
            }

            "
\tYou have been attacked by <<obj.label>> and have lost 1 life point,
\tyou have <<me.life>> left.
\b\b
            ";

            return true;
        }
        else
        {
            "
\t<<obj.labelProper>> attempts to attack you but misses.
\b\b
            ";
        }
    }

    return nil;
};
// -----------------------------------------------------------------------------


// --[HEAL]---------------------------------------------------------------------
Heal(obj, healAmount, msgSucceed, msgFail)
{
    if (obj.givenFood == nil)
    {
        obj.givenFood = true;
"<<msgSucceed>>";

        if (me.life < me.maxLife)
        {
            cls();
            "\b\b";

            me.life = me.life + healAmount;
            if (me.life > me.maxLife)
            {
                me.life = me.maxLife;
            }

            "
\t(You have recovered 1 life point - Your current life is: <<me.life>>.
            ";
        }
    }
    else
    {
"<<msgFail>>";
    }
};
// -----------------------------------------------------------------------------


// --[SHOOTING METHODS]---------------------------------------------------------
ShootGun(obj)
{
    local weapon = me.weapon;

    if (weapon == nil || weapon.isGun == nil) // also check weapon type if needed
    {
        "
\b\b
\tYou need a gun before you can shoot it.
\b\b
        ";
        return nil;
    }

    // perform the energy / recharging logic
    local success = true;
    local isEnemy = nil;

    local rnd = rand(100);
    local chnc = 100;
    if (obj.chance != nil)
    {
        chnc = obj.chance;
        isEnemy = true;
    }

    if (rnd > chnc)
    {
        success = nil;
        "\b\tYou shoot but miss <<obj.label>>.\b";
        KillCheck(obj);
        return nil;
    }

    if (weapon.shotCount < 1 && success == true)
    {
        "
\b\b
\tYou need to let the energy pistol recharge a bit before you can fire it again.
\b\b
        ";
        return nil;
    }
    else
    {
        weapon.shotCount--;
        
        "
\b
\t<<weapon.labelProper>>'s readout shows that it has <<weapon.shotCount + 1>> shots left before it needs charged.
        ";
    }
    
    if (weapon.shotCount == 0)
    {
        weapon.currentCharge = 0;
    }

    if (isEnemy == true)
    {
        if (success == true)
        {
            obj.life = (obj.life - weapon.damageValue);
            if (obj.life <= 0)
            {
                "
\b
\tYou have killed <<obj.label>>.
\b\b
                ";
                return true;
            }
            else
            {
                "
\b
\tYou have shot <<obj.label>>.
\n
\t<<obj.labelProper>>'s remaining life: <<obj.life>>
\b\b
                ";
            }
        }

        KillCheck(obj);
    }
    else
    {
        obj.shotCount++;

        if (obj.damageType != nil && weapon.damageType != nil) obj.damageType = weapon.damageType;
    }

    return true;
};
// -----------------------------------------------------------------------------


// --[ENERGY WEAPON CHARGING]---------------------------------------------------
WeaponChargeCheck()
{
    local weapon = me.weapon;

    if (weapon == nil) return;

    if (weapon.isGun == true && weapon.isEnergy == true)
    {
        //if (weapon.shotCount == 0 && weapon.currentCharge < weapon.chargeTime)
        if (weapon.shotCount < weapon.shotCapacity)
        {
            weapon.shotCount++;
        }
        
        if (weapon.shotCount > weapon.shotCapacity)
        {
            weapon.shotCount = weapon.shotCapacity;
        }
    }
};
// -----------------------------------------------------------------------------


// --[ENEMY SPAWNING]-----------------------------------------------------------
SpawnGuard(location)
{
    local name = 'guard';
    local guard = new Guard;
    guard.name = name;
    cmdDict.addWord(guard, name, &noun);
    cmdDict.addWord(guard, 'guard', &noun);
    guard.moveIntoForTravel(location);
    FightingMode(guard);
};
// -----------------------------------------------------------------------------
