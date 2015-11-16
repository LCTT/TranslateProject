Remember sed and awk? All Linux admins should
================================================================================
![](http://images.techhive.com/images/article/2015/03/linux-100573790-primary.idge.jpg)

Credit: Shutterstock

**We aren’t doing the next generation of Linux and Unix admins any favors by forgetting init scripts and fundamental tools**

I happened across a post on Reddit by chance, [asking about textfile manipulation][1]. It was a fairly simple request, similar to those that folks in Unix see nearly every day. In this case, it was how to remove all duplicate lines in a file, keeping one instance of each. This sounds relatively easy, but can get a bit complicated if the source file is sufficiently large and random. 

There are countless answers to this problem. You could write a script in nearly any language to do this, with varying levels of complexity and time investment, which I suspect is what most would do. It might take 20 or 60 minutes depending on skill level, but armed with Perl, Python, or Ruby, you could make quick work of it. 

Or you could use the answer stated in that thread, which warmed my heart: Just use awk.

That answer is the most concise and simplest solution to the problem by far. It’s one line:

    awk '!seen[$0]++' <filename>. 

Let’s take a look at this. 

In this command, there’s a lot of hidden code. Awk is a text processing language, and as such it makes a lot of assumptions. For starters, what you see here is actually the meat of a for loop. Awk assumes you want to loop through every line of the input file, so you don’t need to explicitly state it. Awk also assumes you want to print the postprocessed output, so you don’t need to state that either. Finally, Awk then assumes the loop ends when the last statement finishes, so no need to state it. 

The string seen in this example is the name given to an associative array. $0 is a variable that represents the entirety of the current line of the file. Thus, this command translates to “Evaluate every line in this file, and if you haven’t seen this line before, print it.” Awk does this by adding $0 to the seen array if it doesn’t already exist and incrementing the value so that it will not match the pattern the next time around and, thus, not print. 

Some will see this as elegant, while others may see this as obfuscation. Anyone who uses awk on a daily basis will be in the first group. Awk is designed to do this. You can write multiline programs in awk. You can even write [disturbingly complex functions in awk][2]. But at the end of the day, awk is designed to do text processing, generally within a pipe. Eliminating the extraneous cruft of loop definition is simply a shortcut for a very common use case. If you like, you could write the same thing as the following: 

    awk '{ if (!seen[$0]) print $0; seen[$0]++ }’ 

It would lead to the same result. 

Awk is the perfect tool for this job. Nevertheless, I believe many admins -- especially newer admins -- would jump into [Bash][3] or Python to try to accomplish this task, because knowledge of awk and what it can do seems to be fading as time goes on. I think it may be an indicator of things to come, where problems that have been solved for decades suddenly emerge again, based on lack of exposure to the previous solutions. 

The shell, grep, sed, and awk are fundaments of Unix computing. If you’re not completely comfortable with their use, you’re artificially hamstrung because they form the basis of interaction with Unix systems via the CLI and shell scripting. One of the best ways to learn how these tools work is by observing and working with live examples, which every Unix flavor has in spades with their init systems -- or had, in the case of Linux distros that have adopted [systemd][4]. 

Millions of Unix admins learned how shell scripting and Unix tools worked by reading, writing, modifying, and working with init scripts. Init scripts differ greatly from OS to OS, even from distribution to distribution in the case of Linux, but they are all rooted in sh, and they all use core CLI tools like sed, awk, and grep. 

I’ve heard many complaints that init scripts are “ancient” and “difficult,” but in fact, init scripts use the same tools that Unix admins work with every day, and thus provide an excellent way to become more familiar and comfortable with those tools. Saying that init scripts are hard to read or difficult to work with is to admit that you lack fundamental familiarity with the Unix toolset. 

Speaking of things found on Reddit, I also came across this question from a budding Linux sys admin, [asking whether he should bother to learn sysvinit][5]. Most of the answers in the thread are good -- yes, definitely learn sysvinit and systemd. One commenter even notes that init scripts are a great way to learn Bash, and another states that the Fortune 50 company he works for has no plans to move to a systemd-based release. 

But it concerns me that this is a question at all. If we continue down the path of eliminating scripts and roping off core system elements within our operating systems, we will inadvertently make it harder for new admins to learn the fundamental Unix toolset due to the lack of exposure. 

I’m not sure why some want to cover up Unix internals with abstraction after abstraction, but such a path may reduce a generation of Unix admins to hapless button pushers dependent on support contracts. I’m pretty sure that would not be a good development. 

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2985804/linux/remember-sed-awk-linux-admins-should.html

作者：[Paul Venezia][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Paul-Venezia/
[1]:https://www.reddit.com/r/linuxadmin/comments/3lwyko/how_do_i_remove_every_occurence_of_duplicate_line/
[2]:http://intro-to-awk.blogspot.com/2008/08/awk-more-complex-examples.html
[3]:http://www.infoworld.com/article/2613338/linux/linux-how-to-script-a-bash-crash-course.html
[4]:http://www.infoworld.com/article/2608798/data-center/systemd--harbinger-of-the-linux-apocalypse.html
[5]:https://www.reddit.com/r/linuxadmin/comments/3ltq2y/when_i_start_learning_about_linux_administration/
