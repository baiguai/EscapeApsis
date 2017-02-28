#include <adv3.h>
#include <en_us.h>

/*
THE SHIP
--------------------------------------------------------------------------------
The ship fixture houses all the attributes of the Apsis.
--------------------------------------------------------------------------------
*/
Ship:
    Fixture
{
    PowerGeneratorOn = nil;
    PowerDownTime = 0;
    PowerRepairTime = 0;

    // Methods
    StateUpdate()
    {

        if (PowerGeneratorOn == nil)
        {
            PowerDownTime++;

            if (gameMain.DEVMODE == true)
            {
                /*
                "
Power Outage Stats:\n
Downtime: <<PowerDownTime>>\n
RepairTime: <<PowerRepairTime>>\n
                ";
                */
            }

            if (PowerDownTime >= PowerRepairTime)
            {
                PowerOn();
            }
        }
    };

    PowerOff()
    {
        local rnd = rand(3) + 3; // 3-6 Range

        PowerGeneratorOn = nil;
        PowerDownTime = 0;
        PowerRepairTime = rnd;
    };
    PowerOn()
    {
        PowerGeneratorOn = true;
        "
\b
[ALERT]
\n
The ship's power has been restored to full capacity.
\b
        ";
    };
};
