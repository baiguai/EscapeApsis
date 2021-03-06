#include <adv3.h>
#include <en_us.h>

/*
BONDS
--------------------------------------------------------------------------------
The bonds that bound you before the power generator disruption.
If you pick these up, trouble will follow you, they have a homing device
built into them.
--------------------------------------------------------------------------------
*/
Brig_Cell04_Bonds:
    Thing
    'bonds' 'bonds'
{
    location = Brig_Cell04;
    specialDescOrder = 1;
    noun = 'bonds';
    adjective = 'disabled' 'enabled';
    isPlural = true;
    isDyst = nil;
    threshold = nil;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = nil;
    disabled = true;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
        '
    ];

    ex = [
        '
        '
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    specialDesc()
    {
        if (Ship.PowerGeneratorOn == true)
        {
            disabled = nil;
        }
        else
        {
            disabled = true;
        }

        if (Brig_Cell04_Bonds.location == Brig_Cell04)
        {
            "
Your bonds lay <<disabled == true ? 'disabled' : 'activated' >> on the floor.
\b\b
            ";
        }
        else
        {
            "
The bonds bonds that had held you are <<disabled == true ? 'disabled' : 'activated' >>.
\b\b
            ";
        }

        Desc_General(self);
    };
// -----------------------------------------------------------------------------


// --[EVENTS]-------------------------------------------------------------------
    dobjFor(Examine)
    {
        action()
        {
            "
You examine the bonds that had held you captive.\n
<<disabled == true ?
'
They are disabled. It appears when the ship was damaged they became deactivated.\n
' :
'
They are activated and blue bars of light glow over their surface. When the\n
power generator was repaired the problem with the bonds was corrected.\n
'
>>
            ";

            Ex_General(self);
        };
    };
// -----------------------------------------------------------------------------
};
