Ultimate Plumber – Writing Linux Pipes With Instant Live Preview
======

![](https://www.ostechnix.com/wp-content/uploads/2018/10/Ultimate-Plumber-720x340.jpg)

As you may already know, **Pipe** command is used to send the output of one command/program/process to another command/program/process for further processing in Unix-like operating systems. Using the Pipe command, we can combine two or more commands and redirect the standard input or output of one command to another easily and quickly. A pipe is represented by a vertical bar character ( **|** ) between two or more Linux commands. The general syntax of a pipe command is given below.

```
Command-1 | Command-2 | Command-3 | …| Command-N
```

If you use Pipe command often, I have a good news for you. Now, you can preview the Linux pipes results instantly while writing them. Say hello to **“Ultimate Plumber”** , shortly **UP** , a command line tool for writing Linux pipes with instant live preview. It is used to build complex Pipelines quickly, easily with instant, scrollable preview of the command results. The UP tool is quite handy if you often need to repeat piped commands to get the desired result.

In this brief guide, I will show you how to install UP and build complex Linux pipelines easily.

**Important warning:**

Please be careful when using this tool in production! It could be dangerous and you might inadvertently delete any important data. You must particularly be careful when using “rm” or “dd” commands with UP tool. You have been warned!

### Writing Linux Pipes With Instant Live Preview Using Ultimate Plumber

Here is a simple example to understand the underlying concept of UP. For example, let us pipe the output of **lshw** command into UP. To do so, type the following command in your Terminal and press ENTER:

```
$ lshw |& up
```

You will see an input box at the top of the screen as shown in the below screenshot.
![](https://www.ostechnix.com/wp-content/uploads/2018/10/Ultimate-Plumber.png)
In the input box, start typing any pipelines and press ENTER key to execute the command you just typed. Now, the Ultimate Plumber utility will immediately show you the output of the pipeline in the **scrollable window** below. You can browse through the results using **PgUp/PgDn** or **Ctrl+ <left arrow)/Ctrl+<right arrow>** keys.

Once you’re satisfied with the result, press **Ctrl-X** to exit the UP. The Linux pipe command you just built will be saved in a file named **up1.sh** in the current working directory. If this file is already exists, an additional file named **up2.sh** will be created to save the result. This will go on until 1000 files. If you don’t want to save the output, just press **Ctrl-C**.

You can view the contents of the upX.sh file with cat command. Here is the output of my **up2.sh** file:

```
$ cat up2.sh
#!/bin/bash
grep network -A5 | grep : | cut -d: -f2- | paste - -
```

If the command you piped into UP is long running, you will see a **~** (tilde) character in the top-left corner of the window. It means that UP is still waiting for the inputs. In such cases, you may need to freeze the Up’s input buffer size temporarily by pressing **Ctrl-S**. To unfreeze UP back, simply press **Ctrl-Q**. The current input buffer size of Ultimate Plumber is **40 MB**. Once you reached this limit, you will see a **+** (plus) sign on the top-left corner of the screen.

Here is the short demo of UP tool in action:
![](https://www.ostechnix.com/wp-content/uploads/2018/10/up.gif)

### Installing Ultimate Plumber

Liked it? Great! Go ahead and install it on your Linux system and start using it. Installing UP is quite easy! All you have to do is open your Terminal and run the following two commands to install UP.

Download the latest Ultimate Plumber binary file from the [**releases page**][1] and put it in your path, for example **/usr/local/bin/**.

```
$ sudo wget -O /usr/local/bin/up wget https://github.com/akavel/up/releases/download/v0.2.1/up
```

Then, make the UP binary as executable using command:

```
$ sudo chmod a+x /usr/local/bin/up
```

Done! Start building Linux pipelines as described above!!

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ultimate-plumber-writing-linux-pipes-with-instant-live-preview/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://github.com/akavel/up/releases
