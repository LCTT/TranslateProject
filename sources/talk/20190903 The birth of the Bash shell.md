[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The birth of the Bash shell)
[#]: via: (https://opensource.com/19/9/command-line-heroes-bash)
[#]: author: (Matthew Broberg https://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberg)

The birth of the Bash shell
======
This week's Command Line Heroes podcast delves into the most widely used
and de facto standard scripting language, its early inspirations as part
of the Free Software Foundation, and its author.
![Listen to the Command Line Heroes Podcast][1]

Shell scripting is an essential discipline for anyone in a sysadmin type of role, and the predominant shell in which people write scripts today is Bash. Bash comes as default on nearly all Linux distributions and modern MacOS versions and is slated to be a native part of [Windows Terminal][2] soon enough. Bash, you could say, is everywhere.

So how did it get to this point? This week's [Command Line Heroes][3] podcast dives deeply into that question by asking the very people who wrote the code.

### It started with Unix

Like all programming things, we have to go back to Unix. A little shell history: In 1971, Ken Thompson released the first Unix shell—the Thompson shell. But there were severe limitations to the amount of scripting users could do. And that meant serious limitations for automation and, consequently, for the whole field of IT operations.

This [fantastic piece of research][4] outlines the challenges to early attempts at scripting (bold added to highlight commands):

> Similar to its predecessor in Multics, this shell (**/bin/sh**) was an independent user program that executed outside of the kernel. Concepts like globbing (pattern matching for parameter expansion, such as ***.txt**) were implemented in a separate utility called **glob**, as was the **if** command to evaluate conditional expressions. This separation kept the shell small, at under 900 lines of C source.
>
> The shell introduced a compact syntax for redirection (**&lt; &gt;** and **&gt;&gt;**) and piping (**|** or **^**) that has survived into modern shells. You can also find support for invoking sequential commands (with **;**) and asynchronous commands (with **&amp;**).
>
> What the Thompson shell lacked was the ability to script. Its sole purpose was as an interactive shell (command interpreter) to invoke commands and view results.

As the access to terminals grew, an interest in automation grew along with it.

### Bourne shell is a step forward

Six years after Thompson's release, in 1977, Stephen Bourne released the Bourne shell, which was meant to solve the scripting limitations of the Thompson shell. (Chet Ramey, the primary maintainer of the Bash language since 1990, discusses it on this episode of Command-Line Heroes). It was the natural evolution of technology coming out of Bell Labs as part of the Unix system.

What did Bourne intend to do differently? [Researcher M. Jones][4] outlines it well: 

> The Bourne shell had two primary goals: serve as a command interpreter to interactively execute commands for the operating system and for scripting (writing reusable scripts that could be invoked through the shell). In addition to replacing the Thompson shell, the Bourne shell offered several advantages over its predecessors. Bourne introduced control flows, loops, and variables into scripts, providing a more functional language to interact with the operating system (both interactively and noninteractively). The shell also permitted you to use shell scripts as filters, providing integrated support for handling signals, but lacked the ability to define functions. Finally, it incorporated a number of features we use today, including command substitution (using back quotes) and HERE documents to embed preserved string literals within a script.

Bourne, in a [previous interview][5], described it this way:

> The original shell wasn’t really a language; it was a recording—a way of executing a linear sequence of commands from a file, the only control flow primitive being GOTO a label. These limitations to the original shell that Ken Thompson wrote were significant. You couldn’t, for example, easily use a command script as a filter because the command file itself was the standard input. And in a filter, the standard input is what you inherit from your parent process, not the command file.
>
> The original shell was simple but, as people started to use Unix for application development and scripting, it was too limited. It didn’t have variables, it didn’t have control flow, and it had very inadequate quoting capabilities.

This new shell was a huge step forward for scripters, but only if you had access to it.

### Rethinking Bourne's shell as free software

Until then, the dominant shells were proprietary software that was owned and operated at Bell Labs. If you were fortunate enough, your university might have access to a Unix shell. But that restricted access was far from the world that the Free Software Foundation (FSF) wanted to achieve. 

Richard Stallman and a group of like-minded developers were writing all the features of Unix with a license that is freely available under the GNU license. One of those developers was tasked with making a shell. That developer was Brian Fox. And the way he talks about his task absolutely fascinates me. As he says on the podcast:

> The reason it was so challenging was that we had to faithfully mimic all of the behaviors of the Bourne shell, while at the same time being allowed to extend it to make it a better tool for people to use.

This was also at a time when people were discussing what it meant to be a shell standard. With this history as background and competition in the foreground, the popular Bourne shell was reimagined; born again.

### The shell, Bourne-Again

These two catalysts—the free software mission and competition—brought the Bourne-Again shell (Bash) to life. In an unusual move for the time, Fox didn't name his shell after himself, and he focused on the evolution from Unix to free software. (Although Fox Shell could have beaten Fish shell to the fsh command #missedopportunity). That naming choice seems aligned with his personality. As Fox says in the episode, he wasn't interested in even the perception of personal glory; he was trying to help the culture of programming evolve. He was not, however, above a good pun.

It was nice to hear that Bourne didn't feel slighted by the play on words. Bourne tells a story about when someone walked up to him and gave him a Bash t-shirt at a conference. That person was Brian Fox.

Shell | Released | Creator
---|---|---
Thompson Shell | 1971 | Ken Thompson
Bourne Shell | 1977 | Stephen Bourne
Bourne-Again Shell | 1989 | Brian Fox

With time, Bash grew in adoption. Other engineers started using it and submitting improvements to its design. Indeed, years later, Fox would insist that learning to give up control of Bash was one of the most important things he did in his life. As Unix gave way to Linux and the open source software movement, Bash became the key scripting force in an open source world. Great projects seem to grow beyond the scope of a single person's vision.

### What can we learn from shells?

A shell is a technology that is so integral to everyday laptop use that it's easy to forget it needed invention. The story of going from Thompson to Bourne to Bash shells draws some familiar takeaways:

  * Motivated individuals can make great strides with the right mission in mind.
  * Much of what we rely on today is built on the work of still-living legends in our industry.
  * The software that tends to survive are the ones that evolve beyond the vision of their original creators.



Command Line Heroes has covered programming languages for all of Season 3 and is approaching its finale. [Be sure to subscribe to learn everything you want to know about the origin of programming languages][3], and I would love to hear your shell stories in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/19/9/command-line-heroes-bash

作者：[Matthew Broberg][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberghttps://opensource.com/users/mbbroberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/commnad_line_hereoes_ep6_blog-header-292x521.png?itok=Bs1RlwoW (Listen to the Command Line Heroes Podcast)
[2]: https://devblogs.microsoft.com/commandline/introducing-windows-terminal/
[3]: https://www.redhat.com/en/command-line-heroes
[4]: https://developer.ibm.com/tutorials/l-linux-shells/
[5]: https://www.computerworld.com.au/article/279011/-z_programming_languages_bourne_shell_sh
