#include <adv3.h>
#include <en_us.h>

Text_Elevator: Fixture
    'elevator'
{


// --[OUTPUT EVENTS]------------------------------------------------------------
    desc_General()
    {
        "
You push the button to summon the elevator. After a few moments you hear a ding,
the doors open and you step inside.
\n
To the right side of the doors are the various floor buttons.
\n
        ";
    };

    desc_Move()
    {
        "
The doors close and the elevator begins to move. After a moment it stops and
the doors open again.\b
        ";
    };

    desc_01()
    {
        "
The first floor button is lit up.
\n
        ";
    };

    desc_02()
    {
        "
The second floor button is lit up.
\n
        ";
    };

    desc_03()
    {
        "
The third floor button is lit up.
\n
        ";
    };

    desc_04()
    {
        "
The fourth floor button is lit up.
\n
        ";
    };

    desc_05()
    {
        "
The fifth floor button is lit up.
\n
        ";
    };

    desc_06()
    {
        "
The sixth floor button is lit up.
\n
        ";
    };

    desc_P1()
    {
        "
The P1 floor button is lit up.
\n
        ";
    };

    desc_P2()
    {
        "
The P2 floor button is lit up.
\n
        ";
    };

    desc_Buttons()
    {
        "
\b
You see buttons for the following floors:
\n
p1, p2, 01, 02, 03, 04, 05, 06
        ";
    };
// -----------------------------------------------------------------------------
};
