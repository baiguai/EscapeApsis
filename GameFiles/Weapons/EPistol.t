#include <adv3.h>
#include <en_us.h>

EPistol: Thing 'energy pistol' 'Energy Pistol'
{
    location = Brig_Cell04; // UtopiaRingCity_TechCenter_West_Car
    label = 'the energy pistol';
    labelGen = 'the pistol';
    labelProper = 'The energy pistol';
    noun = 'pistol' 'gun';
    adjective = 'energy' 'lazer';
    sightPresence = true;
    isListed = true;
    isPlural = nil;
    isGun = true;
    isEnergy = true;
    damageValue = 1;
    shotCapacity = 5
    shotCount = 5
    chargeTime = 3
    currentCharge = 0;
    damageType = 'smallShot';

    desc()
    {
        "
You inspect the pistol.
It is sleek and dark gray. When you hold it indicators along its sides
illuminate pale white. It has been paired with your prints.
Near the back of the pistol is a small charge indicator.
        ";
    };

    dobjFor(Take)
    {
        verify()
        {
            if (me.weapon != nil)
            {
                illogicalAlready('You are already carrying a weapon.');
            }
        }
        
        action()
        {
            if (EPistol.location == Brig_Guard)
            {
                "
                ";
            }
            me.weapon = EPistol;
            inherited();
        }
    };

    dobjFor(TakeFrom)
    {
        verify()
        {
            if (me.weapon != nil)
            {
                illogicalAlready('You are already carrying a weapon.');
            }
        }
        
        action()
        {
            if (EPistol.location == Brig_Guard)
            {
                "
                ";
            }
            me.weapon = EPistol;
            inherited();
        }
    };

    dobjFor(Drop)
    {
        action()
        {
            me.weapon = nil;
            inherited();
        }
    };

    ShootMsg(target, customDesc, result)
    {
        if (customDesc != '')
        {
            customDesc;
        }
        else
        {
            "
                You fire <<label>> at <<target.label>>.
                A charge bursts from the end of the barrel.
            ";
        }

        if (result != nil)
        {
            Shoot_General(target);
        }
    }
};
