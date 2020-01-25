[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What's your favorite Linux terminal trick?)
[#]: via: (https://opensource.com/article/20/1/linux-terminal-trick)
[#]: author: (Opensource.com https://opensource.com/users/admin)

What's your favorite Linux terminal trick?
======
Take our poll or tell us about your favorite terminal trick. Is it a
nifty productivity shortcut or a fun Easter egg?
![Terminal command prompt on orange background][1]

The beginning of a new year is always a great time to evaluate new ways to become more efficient. Many people try out new productivity tools or figure out how to optimize their most mundane processes. One area to assess is the terminal. Especially in the world of open source, there are tons of ways to make life at the terminal more efficient (and fun!) with shortcuts and commands. 

 

We asked our writers about their favorite terminal trick. They shared their time-saving tips and even a fun terminal Easter egg. Will you adopt one of these keyboard shortcuts or command line hacks? Do you have a favorite you'd like to share? Tell us about it by taking our poll or leaving a comment. 

 

"I couldn't choose a favorite; I use all three of these daily: 

  * **Ctrl + L** to clear screen (instead of typing "clear").
  * **sudo !!** to run previous command with sudo privileges. 
  * **grep -Ev '^#|^$' &lt;file&gt;** will display file content without comments or empty lines."



—Mars Toktonaliev

 

"For me, if I'm in a terminal text editor and I want to make it go away so I can quickly do something else, I background it with **Ctrl + Z**, do whatever I need to do, and then bring it back with **fg**. I will also sometimes do the same thing with **top** or **htop.** I can background it, and bring it back anytime I want to check current performance. I don't see backgrounding and foregrounding done in the wild very often, and it can really enhance multitasking on the terminal."

—Jay LaCroix

 

"Because I tend to do much of the same things at the terminal on a given day, two things are constants in my day:

  * **Ctrl + R** to reverse search my Bash history for a command that I have already run and wish to do so again
  * Caret substitution is the best as I often do things like **sudo dnf** **search &lt;package name&gt;** then if I find a suitable package that way I then do **^search^install** to rerun the command replacing the search with install.



Sure these things are basic but so time-saving for me."

—Steve Morris

 

"My cool terminal trick isn't something I do in the terminal, but _which terminal_ I use. Sometimes I just want the feeling of using an Apple II, or an old amber-on-black terminal. That's when I fire up Cool Retro Term. Screenshots are on the [website][2]."

—Jim Hall

 

"Probably **ssh -X** to run graphical programs on other machines. Copy/pasting (on some terminal emulators, like gnome-terminal) C-S c and C-S v. I'm not sure if this counts (as it goes graphical in the interesting part, but starts with **ssh**). Most recently I had a need to log in to another machine but have my kids be able to follow along on the bigger screen from my laptop. This [link][3] showed me something I'd never before seen: mirroring the active session from another computer screen on my laptop over the local network (x11vnc -desktop) and being able to control it from both machines at the same time."

—Kyle R. Conway

 

"You can install **Install 'sl' $ sudo apt install sl** or **$ sudo dnf install sl**, and when the command **sl** is entered at the Bash prompt a text-based steam locomotive moves across the display."

—Don Watkins

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/linux-terminal-trick

作者：[Opensource.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/admin
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://github.com/Swordfish90/cool-retro-term
[3]: https://elinux.org/Screen_Casting_on_a_Raspberry_Pi
