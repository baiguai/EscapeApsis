#include <adv3.h>
#include <en_us.h>

Game_Intro: Fixture
{
    initialDesc = 0

    desc()
    {
        if (initialDesc == 0)
        {
            "
\b
You wake up disoriented in a place you recognize.
The Saturn Martini Bar.
It seems you've passed out in your barstool.
You are well dressed in a black suit coat, slim
fitted white synth button down shirt and thin black tie.
\n
Holstered at your waist is an energy pistol.
\n
You sit upright and look around.\b
...
\b
You have no idea who you are, or how you got here.
\b
Something is terribly wrong, you can feel it.
            ";
        }

        // initialDesc = 1;
    }
};
