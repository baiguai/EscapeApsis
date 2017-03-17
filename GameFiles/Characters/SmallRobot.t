#include <adv3.h>
#include <en_us.h>

/*
    SMALL ROBOT
    ----------------------------------------------------------------------------
    If the player has found and picked up a motion actuator, the robot will
    follow the player until it is destroyed.
    If the player has found and picked up a wireless comm link the robot can
    help the player gain access to restricted or secret portions of the ship.
    ----------------------------------------------------------------------------
*/
SmallRobot:
    Actor
    'small robot' 'Small Robot'
{
    location = Vent_Aft_MainPipe_Forward_ForePortFan;
    label = 'the robot';
    labelProper = 'The robot';
    noun = 'robot';
    adjective = 'small';
    pronoun = 'it';
    specialDescOrder = 20;
    corpseObj = nil;
    isDyst = nil;
    threshold = 1;
    isListed = nil;
    descCount = 0;
    exCount = 0;
    canShoot = true;
    shotCount = 0;
    inp = "";
    match = nil;
    whoAreCount = 0;

// --[OUTPUTS]------------------------------------------------------------------
    msg = [
        '
Sitting on the ground in the starboard section of the room lies what appears\n
to be a small discarded robot.\n
        ',
        '
A small robot lies on the floor in the starboard section of the room.\n
        '
    ];

    msgDmg = [
        '
Sitting on the ground in the starboard section of the room lies what appears\n
to be a small discarded robot.\n
It has been shot and destroyed.\n
        ',
        '
A small robot lies on the floor in the starboard section of the room.\n
It has been shot and destroyed.\n
        '
    ];

    ex = [
        '
You examine the small robot.\n
It appears to be discarded. Rust patches cover portions of its white and red\n
painted body.\n
It is cylindrical in shape with a clear, yellow tinted, glass dome at the\n
top and a large ball set into its base for movement.\n
Small indicator lights over its body blink slowly at random intervals.\n
        '
    ];

    exDmg = [
        '
You examine the small robot.\n
It appears to be discarded. Rust patches cover portions of its white and red\n
painted body.\n
It is cylindrical in shape with a clear, yellow tinted, glass dome at the\n
top and a large ball set into its base for movement.\n
It has been shot and destroyed. All of its indicator lights are dark.\n
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
    dobjFor(TalkTo)
    {
        action()
        {
            if (shotCount < 1)
            {
                "You talk to <<label>>.";
                inputCheck();
            }
        };
    };
    dobjFor(Examine)
    {
        action()
        {
            Ex_Shootable(self);
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


// --[HELPER METHODS]-----------------------------------------------------------
inputCheck
{
    if (shotCount < 1)
    {
        do {
            "<.inputline>";
            "\b\bTalk to <<label>> or say cancel>> ";
            "<./inputline>";
            inp = inputManager.getInputLine(nil, nil);
        } while (nil);

        match = nil;

        // Ask his name
        if (Ask(match, inp, 'are you|your name|you called|you here|happened to you|done to you|do to you') == true)
        {
            match = true;
            if (whoAreCount == 0)
            {
                "
I am Ora.23. I am a service mech. My job is to systematically traverse the \n
ship looking for broken or poorly running systems and repairing them.\n
I am a well performing robot and command others like myself.\n
I do not understand why my motion actuators have been removed.\n
My memory processor has been reformatted so I do not recall who did this to\n
me.\n
If you have a spare motion actuator, can you put it in me?\n
With the use of a wireless comm link I can access various ship systems to\n
determine who did this to me.\n
                ";
            }
            if (whoAreCount == 1)
            {
                "
I do not understand why my motion actuators have been removed.\n
My memory processor has been reformatted so I do not recall who did this to\n
me.\n
If you have a spare motion actuator, can you put it in me?\n
With the use of a wireless comm link I can access various ship systems to\n
determine who did this to me.\n
                ";
            }
            if (whoAreCount >= 2)
            {
                "
If you have a spare motion actuator, can you put it in me?\n
With the use of a wireless comm link I can access various ship systems to\n
determine who did this to me.\n
                ";
            }

            whoAreCount++;
        }

        if (CancelTalk(inp, label) == nil)
        {
            inputCheck;
        }
    }
};
// -----------------------------------------------------------------------------
};
