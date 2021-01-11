[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why I like the FED text editor)
[#]: via: (https://opensource.com/article/21/1/fed-editor)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Why I like the FED text editor
======
The FED editor lets me code my FreeDOS projects easily and efficiently.
Learn to make the most of this flexible Linux, Windows, and DOS editor.
![Person using a laptop][1]

When I’m not [at work on my Linux desktop][2], you can usually find me writing code for a legacy 16-bit system. [FreeDOS][3] is an open source DOS-compatible operating system that you can use to play classic DOS games, run legacy business software, or develop embedded systems. Any program that works on MS-DOS should also run on FreeDOS.

I grew up with DOS. My family’s first personal computer was an Apple II clone, but we eventually upgraded to an IBM PC running DOS. I was a DOS user for over ten years, from the early 1980s until 1993, when I [discovered Linux][4].

I was impressed by the freedom afforded by Linux and open source software. So when Microsoft announced the end of DOS in 1994, with the forthcoming Windows 95, I decided to write my own open source DOS. That’s [how FreeDOS started][4].

All these years later, and I continue working on FreeDOS. It is an excellent hobby system, where I can run my favorite DOS applications and games. And yes, I still write code for FreeDOS.

My favorite editor for DOS programming is the FED editor. FED is a minimal text editor without a lot of visual flair. This minimal approach helps me make the most of the standard 80x25 screen in DOS. When editing a file, FED displays a single status line at the bottom of the screen, leaving you the remaining 24 lines to write your code. FED also supports color syntax highlighting to display different parts of your code in various colors, making it easier to spot typos before they become bugs.

![Writing a Solitaire game with FED][5]

Writing a Solitaire game with FED - opensource.com

When you need to do something in the menus, press the **Alt** key on the keyboard, and FED displays a menu on the top line. FED supports keyboard shortcuts too, but be careful about the defaults. For example, **Ctrl-C** will close a file, and **Ctrl-V** will change the view. If you don’t like these default keys, you can change the key mapping in the **Config** menu.

![Tap the Alt key to bring up the menu][6]

Tap the Alt key to bring up the menu - opensource.com

If you don’t like the default black-on-white text display, you can change the colors under the **Config** menu. I prefer white-on-blue for my main text, with keywords in bright white, comments in bright blue, special characters in cyan, and numbers in green. FED makes it easy to set the colors you want.

![My preferred colors when programming on DOS][7]

My preferred colors when programming on DOS - opensource.com

FED is also a folding text editor, which means that it can collapse or expand portions of my code so that I can see more of my file. Tap **Ctrl-F** on a function name and FED will collapse the entire function. Folding works on other code, as well. I also use folding to hide **for** and **while** loops or other flow controls like **if** and **switch** blocks.

![Folding a function lets you see more of the file][8]

Folding a function lets you see more of the file - opensource.com

Shawn Hargreaves wrote and maintained FED from 1994 to 2004. Robert Riebisch has maintained FED since then. FED is distributed under the GNU GPL and supports DOS, Linux, and Windows.

You can download FED at <https://www.bttr-software.de/products/fed/>

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/fed-editor

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/19/9/business-creators-open-source-tools
[3]: https://opensource.com/article/19/6/freedos-anniversary
[4]: https://opensource.com/article/17/5/how-i-got-started-linux-jim-hall-freedos
[5]: https://opensource.com/sites/default/files/1-fed.png
[6]: https://opensource.com/sites/default/files/2-fed.png
[7]: https://opensource.com/sites/default/files/3-fed.png
[8]: https://opensource.com/sites/default/files/4-fed.png
