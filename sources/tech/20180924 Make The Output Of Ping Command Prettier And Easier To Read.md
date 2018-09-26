HankChow translating

Make The Output Of Ping Command Prettier And Easier To Read
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/prettyping-720x340.png)

As we all know, the **ping** command is used to check if a target host is reachable or not. Using Ping command, we can send ICMP Echo request to our target host, and verify whether the destination host is up or down. If you use ping command often, I’d like to recommend you to try **“Prettyping”**. Prettyping is just a wrapper for the standard ping tool and makes the output of the ping command prettier, easier to read, colorful and compact. The prettyping runs the standard ping command in the background and parses the output with colors and unicode characters. It is free and open source tool written in **Bash** and **awk** and supports most Unix-like operating systems such as GNU/Linux, FreeBSD and Mac OS X. Prettyping is not only used to make the output of ping command prettier, but also ships with other notable features as listed below.

  * Detects the lost or missing packets and marks them in the output.
  * Shows live statistics. The statistics are constantly updated after each response is received, while ping only shows after it ends.
  * Smart enough to handle “unknown messages” (like error messages) without messing up the output.
  * Avoids printing the repeated messages.
  * You can use most common ping parameters with Prettyping.
  * Can run as normal user.
  * Can be able to redirect the output to a file.
  * Requires no installation. Just download the binary, make it executable and run.
  * Fast and lightweight.
  * And, finally makes the output pretty, colorful and very intuitive.



### Installing Prettyping

Like I said already, Prettyping does not requires any installation. It is portable application! Just download the Prettyping binary file using command:

```
$ curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
```

Move the binary file to your $PATH, for example **/usr/local/bin**.

```
$ sudo mv prettyping /usr/local/bin
```

And, make it executable as like below:

```
$ sudo chmod +x /usr/local/bin/prettyping
```

It’s that simple.

### Let us Make The Output Of Ping Command Prettier And Easier To Read

Once installed, ping any host or IP address and see the ping command output in graphical way.

```
$ prettyping ostechnix.com
```

Here is the visually displayed ping output:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/prettyping-in-action.gif)

If you run Prettyping without any arguments, it will keep running until you manually stop it by pressing **Ctrl+c**.

Since Prettyping is just a wrapper to the ping command, you can use most common ping parameters. For instance, you can use **-c** flag to ping a host only a specific number of times, for example **5** :

```
$ prettyping -c 5 ostechnix.com
```

By default, prettynping displays the output in colored format. Don’t like the colored output? No problem! Use `--nocolor` option.

```
$ prettyping --nocolor ostechnix.com
```

Similarly, you can disable mult-color support using `--nomulticolor` option:

```
$ prettyping --nomulticolor ostechnix.com
```

To disable unicode characters, use `--nounicode` option:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/prettyping-without-unicode-support.png)

This can be useful if your terminal does not support **UTF-8**. If you can’t fix the unicode (fonts) in your system, simply pass `--nounicode` option.

Prettyping can redirect the output to a file as well. The following command will write the output of `prettyping ostechnix.com` command in `ostechnix.txt` file.

```
$ prettyping ostechnix.com | tee ostechnix.txt
```

Prettyping has few more options which helps you to do various tasks, such as,

  * Enable/disable the latency legend. (default value is: enabled)
  * Force the output designed to a terminal. (default: auto)
  * Use the last “n” pings at the statistics line. (default: 60)
  * Override auto-detection of terminal dimensions.
  * Override the awk interpreter. (default: awk)
  * Override the ping tool. (default: ping)



For more details, view the help section:

```
$ prettyping --help
```

Even though Prettyping doesn’t add any extra functionality, I personally like the following feature implementations in it:

  * Live statistics – You can see all the live statistics all the time. The standard ping command will only shows the statistics after it ends.
  * Compact – You can see a longer timespan at your terminal.
  * Prettyping detects missing responses.



If you’re ever looking for a way to visually display the output of the ping command, Prettyping will definitely help. Give it a try, you won’t be disappointed.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/prettyping-make-the-output-of-ping-command-prettier-and-easier-to-read/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
