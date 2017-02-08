#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

////////// PRIMARY HELP COMMAND //////////
DefineIAction(Help)
    execAction()
    {
        cls();

        "
Esrevinu uses standard Interactive Fiction commands.
If you are unfamiliar with these basic commands, look on the
internet for further information.
\b
If you are carrying a gun you can shoot it using the following syntax
(In this case to shoot a target):
\b
Shooting things
\n
To shoot something say shoot followed by the thing or person you want
to shoot. For example, to shoot Bob you would say:
\n
shoot Bob
\n
(When you are fighting an enemy, you only have to say shoot)
\n
If your gun is an energy weapon, when it is out of energy reserve
you must wait until it recharges to use it.
\b
Talking to people say talk to. For example, to talk to Bob say:
\n
talk to Bob
\b
When you are hurt, you can restore your life by eating certain
foods, so keep your eyes open for sustenance, and don't be afraid
to ask for it if you think someone might have food to offer.
\b
Notes can be taken to help remember passwords or other information.
\n
To add a note say:
\n
addnote (Followed by the note text)
\n
To delete a note say:
\n
deletenote (Followed by the note number to remove)
\n
To view your notes say:
\n
notes
\b
To view your current stats say:
\n
stats
\b
To view the current goal say:
\n
goal
        ";
    }
;
VerbRule(Help) 
     'help' | '?'
     : HelpAction
     verbPhrase = 'help/?'
;
////////////////////
