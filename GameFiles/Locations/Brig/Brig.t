#include <adv3.h>
#include <en_us.h>

Brig:
    Room
{
    roomName = "Brig";
    visitCount = 0;
    descCount = 0;
    hasSpawned = nil;
    camera01 = nil;
    camera02 = nil;
    camera03 = nil;
    guard01 = nil;

// --[OUTPUTS]------------------------------------------------------------------
    move = [];

    msg = [
        '
        '
    ];

    nav = [
        'enter brig door: Exit the brig.',
        'enter holding cell: Enter the holding cell.',
        'enter cell 1: Enter the first cell.',
        'enter cell 2: Enter the second cell.',
        'enter cell 3: Enter the third cell.',
        'enter closet: Enter the small closet.',
        'enter cell 4: Enter the forth cell.'
    ];
// -----------------------------------------------------------------------------


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc()
    {
        if (self.hasSpawned == nil)
        {
            camera01 = SpawnCamera01(Brig, 'forward port camera', ['forward','port']);
            camera02 = SpawnCamera01(Brig, 'aft port camera', ['aft','port']);
            camera03 = SpawnCamera01(Brig, 'aft starboard camera', ['aft','starboard']);
            self.hasSpawned = true;
        }

        Desc_Location(self);

        if (me.weapon != nil)
        {
            "To shoot an item or person say: shoot [item name]\n";
        }
        if (Brig_Guard_PComm.isHeldBy(me))
        {
            "To attempt to unlock a door say: unlock [door name] with [key name]\n";
        }
        if (!GuardPost_Cabinet_Uniform.isWornBy(me))
        {
            "To put an item on say: put on [item name]\n";
        }

        "
\b
The brig is dingy and dim.
<<Ship.PowerGeneratorOn == nil ?
'
Red auxiliary lights glow dimly in the corners of the main room.
'
:
'
It is lit only by a couple of flickering flourescent tubes overhead.
'
>>
The walls are filthy and rust is breaking out here and there along their edges.
\n
It contains four cramped cells arranged along the starboard, aft, and port walls
\n
In the forward wall, starboard of the entrance is the guard post.
It is enclosed in thick armored glass.
The entrance to the gard post is in its port wall, nearest the brig's entrance.
\n
A closet is set into the aft starboard corner and a small holding cell is located
in the forward port corner.
\b
<<camera01.shotCount < 1 ?
'In the forward port corner, mounted on the ceiling is a camera.'
:
'In the forward port corner, mounted on the ceiling is a camera.
 It has been shot and destroyed.'
>>
\n
<<camera02.shotCount < 1 ?
'In the aft port corner, mounted on the ceiling is a camera.'
:
'In the aft port corner, mounted on the ceiling is a camera.
 It has been shot and destroyed.'
>>
\n
<<camera03.shotCount < 1 ?
'In the aft starboard corner, mounted on the ceiling is a camera.'
:
'In the aft starboard corner, mounted on the ceiling is a camera.
 It has been shot and destroyed.'
>>
\b
All the cameras are networked to the guard post. You
can see the armored conduit running from each camera back to the guard post
enclosure.
\n
The brig's entrance appears to be locked using a PComm
scanner.
\b\b
        ";

        if (guard01 == nil &&
            !AllCamerasDisabled() &&
            Ship.PowerGeneratorOn)
        {
            guard01 = SpawnGuard(Brig, 'Guard01');
        }
    };
// -----------------------------------------------------------------------------


// --[HELPER METHODS]-----------------------------------------------------------
    CameraCheck()
    {
        "Camera check!!";

        if (camera01.shotCount > 0 &&
            camera02.shotCount > 0 &&
            camera03.shotCount > 0)
        {
            if (gameMain.CurrentGoal == 'Disable the cameras before the power is restored.')
            {
                Achieve_DisableBrigCameras.awardPointsOnce();
                gameMain.CurrentGoal = 'Escape the brig.';
                ShowGoal();
            }
        }
        else
        {
        }
    };

    AllCamerasDisabled()
    {
        if (camera01.shotCount < 1 ||
            camera02.shotCount < 1 ||
            camera03.shotCount < 1)
        {
            return nil;
        }
        else
        {
            return true;
        }
    };
// -----------------------------------------------------------------------------
};


// --[DOORS]--------------------------------------------------------------------
Brig_Door_Inside:
    LockableWithKey, Door -> Brig_Door
    'brig door' 'brig door'
{
    location = Brig;
    keyList = [Brig_Guard_PComm];

    dobjFor(UnlockWith)
    {
        check()
        {
            if(Brig.AllCamerasDisabled() == nil)
            {
                failCheck('The partially disabled security system prevents
                    the door from unlocking.');
            }
        } 
        action()
        {
            if (Achieve_DisableBrigCameras.achieved == nil)
            {
                "\bYou have disabled the cameras.\b";
                Achieve_DisableBrigCameras.awardPointsOnce();
                Achieve_DisableBrigCameras.achieved = true;

                if (Achieve_FindDisguise.achieved == true)
                {
                    gameMain.CurrentGoal = 'Sneak into the hold for supplies.';
                }
                else
                {
                    gameMain.CurrentGoal = 'Find a disguise.';
                }
                ShowGoal();
            }
            inherited;
        }
    }
};
Brig_HoldingCell_Door:
    LockableWithKey, Door
    'holding cell door' 'holding cell door'
{
    location = Brig;
    keyList = [Brig_Guard_PComm];
}
Brig_Cell01_Door:
    LockableWithKey, Door
    'cell 1 door' 'cell 1 door'
{
    location = Brig;
    keyList = [Brig_Guard_PComm];
}
Brig_Cell02_Door:
    LockableWithKey, Door
    'cell 2 door' 'cell 2 door'
{
    location = Brig;
    keyList = [Brig_Guard_PComm];
}
Brig_Cell03_Door:
    LockableWithKey, Door
    'cell 3 door' 'cell 3 door'
{
    location = Brig;
    keyList = [Brig_Guard_PComm];
}
Brig_Closet_Door:
    LockableWithKey, Door
    'closet door' 'closet door'
{
    location = Brig;
}
Brig_Cell04_Door:
    LockableWithKey, Door
    'cell 4 door' 'cell 4 door'
{
    location = Brig;
    isLocked = nil;
    keyList = [Brig_Guard_PComm];
}
Brig_GuardPost_Door:
    LockableWithKey, Door
    'guard post door' 'guard post door'
{
    location = Brig;
    keyList = [Brig_Guard_PComm];

    dobjFor(UnlockWith)
    {
        action()
        {
            if (Achieve_DisableBrigCameras.achieved == nil &&
                Brig.AllCamerasDisabled() == true)
            {
                "\bYou have disabled the cameras.\b";
                Achieve_DisableBrigCameras.awardPointsOnce();
                Achieve_DisableBrigCameras.achieved = true;

                if (Achieve_FindDisguise.achieved == true)
                {
                    gameMain.CurrentGoal = 'Sneak into the hold for supplies.';
                }
                else
                {
                    gameMain.CurrentGoal = 'Find a disguise.';
                }
                ShowGoal();
            }
            inherited;
        }
    }
}
// -----------------------------------------------------------------------------
