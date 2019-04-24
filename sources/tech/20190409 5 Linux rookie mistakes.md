[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Linux rookie mistakes)
[#]: via: (https://opensource.com/article/19/4/linux-rookie-mistakes)
[#]: author: (Jen Wike Huger  https://opensource.com/users/jen-wike/users/bcotton/users/petercheer/users/greg-p/users/greg-p)

5 Linux rookie mistakes
======
Linux enthusiasts share some of the biggest mistakes they made.
![magnifying glass on computer screen, finding a bug in the code][1]

It's smart to learn new skills throughout your life—it keeps your mind nimble and makes you more competitive in the job market. But some skills are harder to learn than others, especially those where small rookie mistakes can cost you a lot of time and trouble when you're trying to fix them.

Take learning [Linux][2], for example. If you're used to working in a Windows or MacOS graphical interface, moving to Linux, with its unfamiliar commands typed into a terminal, can have a big learning curve. But the rewards are worth it, as the millions and millions of people who have gone before you have proven.

That said, the journey won't be without pitfalls. We asked some of Linux enthusiasts to think back to when they first started using Linux and tell us about the biggest mistakes they made.

"Don't go into [any sort of command line interface (CLI) work] with an expectation that commands work in rational or consistent ways, as that is likely to lead to frustration. This is not due to poor design choices—though it can feel like it when you're banging your head against the proverbial desk—but instead reflects the fact that these systems have evolved and been added onto through generations of software and OS evolution. Go with the flow, write down or memorize the commands you need, and (try not to) get frustrated when [things aren't what you'd expect][3]." _—[Gina Likins][4]_

"As easy as it might be to just copy and paste commands to make the thing go, read the command first and at least have a general understanding of the actions that are about to be performed. Especially if there is a pipe command. Double especially if there is more than one. There are a lot of destructive commands that look innocuous until you realize what they can do (e.g., **rm** , **dd** ), and you don't want to accidentally destroy things. (Ask me how I know.)" _—[Katie McLaughlin][5]_

"Early on in my Linux journey, I wasn't as aware of the importance of knowing where you are in the filesystem. I was deleting some file in what I thought was my home directory, and I entered **sudo rm -rf *** and deleted all of the boot files on my system. Now, I frequently use **pwd** to ensure that I am where I think I am before issuing such commands. Fortunately for me, I was able to boot my wounded laptop with a USB drive and recover my files." _—[Don Watkins][6]_

"Do not reset permissions on the entire file system to [777][7] because you think 'permissions are hard to understand' and you want an application to have access to something." _—[Matthew Helmke][8]_

"I was removing a package from my system, and I did not check what other packages it was dependent upon. I just let it remove whatever it wanted and ended up causing some of my important programs to crash and become unavailable." _—[Kedar Vijay Kulkarni][9]_

What mistakes have you made while learning to use Linux? Share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/linux-rookie-mistakes

作者：[Jen Wike Huger (Red Hat)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike/users/bcotton/users/petercheer/users/greg-p/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://opensource.com/resources/linux
[3]: https://lintqueen.com/2017/07/02/learning-while-frustrated/
[4]: https://opensource.com/users/lintqueen
[5]: https://opensource.com/users/glasnt
[6]: https://opensource.com/users/don-watkins
[7]: https://www.maketecheasier.com/file-permissions-what-does-chmod-777-means/
[8]: https://twitter.com/matthewhelmke
[9]: https://opensource.com/users/kkulkarn
