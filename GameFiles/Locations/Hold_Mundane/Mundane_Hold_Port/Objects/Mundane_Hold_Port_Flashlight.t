#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Flashlight:
    Flashlight, FueledLightSource, OpenableContainer
    'flashlight' 'Flashlight'
{
    location = gameMain.DEVMODE ? me : Mundane_Hold_Port_AftPortShelves_Shelves;
    label = 'the flashlight';
    labelProper = 'The flashlight';
    specialDescOrder = 30;
    noun = 'flashlight';
    adjective = '' '';
    isDyst = nil;
    threshold = 1;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;
    damageType = '';

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
        '
    ];

    msgDmg = [
        '
        '
    ];

    ex = [
        '
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
    dovjFor(Take)
    {
        "You can use the flashlight by saying:\nturn on flashlight";
        inherited;
    };
    dobjFor(Examine)
    {
        action()
        {
            Ex_Shootable(self);
        };
    };
    dobjFor(TurnOn)
    {
        /*
        check()
        {
            if(!Mundane_Hold_Port_Aft_Shelves_03.battery01.isIn(self) || shotCount > 0)
            {
                "Nothing happens. ";
                exit;
            }
        }
        */
    };
    notifyRemove(obj)
    {
        /*
        if(isOn)
        { 
            "Removing the battery causes the flashlight to go out. ";
            makeOn(nil);        
        }
        */   
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
};
