#include <adv3.h>
#include <en_us.h>

Mundane_Hold_Port_Aft_Shelves_03:
    Fixture
    'Aft Shelves 02' 'Aft Shelves 03'
{
    location = Mundane_Hold_Port_Aft;
    label = 'the shelves row 3';
    labelProper = 'The shelves row 3';
    specialDescOrder = 20;
    noun = 'shelves';
    adjective = 'aft' '3';
    isPlural = true;
    isDyst = nil;
    threshold = 1;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;
    damageType = '';
    hasSpawned = nil;

    battery01 = nil;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
        '
    ];

    msgDmg = [
        '
The row aft of that (shelves 3) is filled with various power supplies\n
Next to the power supplies you see three batteries.\n
\b
The shelves have been shot and damaged.\n
        '
    ];

    ex = [
        '
You examine the third row of aft shelves.\n
It is filled with various power supplies and batteries.\n
        '
    ];

    exDmg = [
        '
You examine the third row of aft shelves.\n
It is filled with various power supplies and batteries.\n
\b
The shelves have been shot and damaged.\n
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
        if (hasSpawned == nil)
        {
            battery01 = SpawnBattery(gameMain.DEVMODE ? me : Mundane_Hold_Port_Aft_Shelves_03, 'battery');

            hasSpawned = true;
        }

        Desc_Shootable(self);

        local battCnt = 0;
        if (battery01.location == self.location) battCnt++;

        "The row aft of that is filled with various power supplies\n";
        if (battCnt > 0)
        {
            "Next to the power supplies you see <<battCnt>> batteries.\n";
        }
    };
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(Examine)
    {
        action()
        {
            Ex_Shootable(self);

            local battCnt = 0;
            if (battery01.location == self.location) battCnt++;

            "You examine the third aft row of shelves. They are filled with\n
            various power supplies\n";
            if (battCnt > 0)
            {
                "Next to the power supplies you see <<battCnt>> batteries.\n";
            }
        };
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
