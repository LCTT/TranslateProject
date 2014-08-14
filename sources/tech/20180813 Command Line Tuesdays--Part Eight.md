Translating by GOLinux ...
Command Line Tuesdays – Part Eight
================================================================================
Yo yo, geekos! Here we are, for the final chapter of our CLT hangout. Today, we’ll be talking about job control through which we’ll learn how to control processes running on our computer!

### An Example ###

As we have learned, we can run programs directly from the CLI by simply typing the name of the program. For example, dolphin. If we type:

    dolphin

…dolphin, the file manager, opens. If you look at the terminal while this process is opened, you can not access the command prompt and you can not write a new command inside the same window. If you terminate dolphin, the prompt reappears and you can type a new command into the shell. Now, how can we run a program from CLI, while also having our prompt available for further command issuing.

    dolphin &

…and you have your dolphin file manager running in background, with the terminal free to type another command you need.

Now imagine you forgot to type the ‘&’ character after dolphin. Simply type ‘ctrl+z’, which will stop your process and put it in idle. To resume the stopped process, type:

    bg

…which will restart the process from the background.

### jobs, ps ###

Now that we have processes running in the background, you can list them either using jobs, or using ps. Try it. Just type jobs, or type ps. Here’s what I get:

    nenad@linux-zr04:~> ps
    PID TTY          TIME CMD
    8356 pts/1    00:00:00 bash
    8401 pts/1    00:00:00 dolphin
    8406 pts/1    00:00:00 kbuildsycoca4
    8456 pts/1    00:00:00 ps

### Kill a Process ###

How do you get rid of a process if it’s become unresponsive? By using the kill command. Let’s try it out on our previously mentioned dolphin process. First, we have to identify the PID of the process by using ps. In my aforementioned case it’s 8401 for dolphin. So to kill it, I simply type:

    kill 8401

…and it kills off dolphin.

### More About Kill ###

Kill doesn’t exist only for terminating processes, but it was originally designed to send signals to processes. And of course, there are a number of kill signals you can use, which can be different in regard to the application you use. See the table below:

![](https://news.opensuse.org/wp-content/uploads/2014/08/snapshot1.png)

Do try them out.

### Conclusion ###

With this lesson, we conclude our CLT series and our tuesday hanging out. I hope that other n00bs like me managed to demistify the console in their minds and learn the basics. Now all that’s left is for you to play around (just don’t mess around the / directory too much so you don’t bork something :D).

We’ll be seeing a lot more of each other soon, as there’s more series of articles from where these came from. Stay tuned, and meanwhile…
 
### …have a lot of fun! ###

--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/08/12/command-line-tuesdays-part-eight/

作者：[Nenad Latinović][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://news.opensuse.org/author/holden87/
