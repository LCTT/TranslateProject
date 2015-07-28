Understanding Shell Commands Easily Using “Explain Shell” Script in Linux
================================================================================
While working on Linux platform all of us need help on shell commands, at some point of time. Although inbuilt help like man pages, whatis command is helpful, but man pages output are too lengthy and until and unless one has some experience with Linux, it is very difficult to get any help from massive man pages. The output of whatis command is rarely more than one line which is not sufficient for newbies.

![Explain Shell Commands in Linux Shell](http://www.tecmint.com/wp-content/uploads/2015/07/Explain-Shell-Commands-in-Linux-Shell.jpeg)

Explain Shell Commands in Linux Shell

There are third-party application like ‘cheat‘, which we have covered here “[Commandline Cheat Sheet for Linux Users][1]. Although Cheat is an exceptionally good application which shows help on shell command even when computer is not connected to Internet, it shows help on predefined commands only.

There is a small piece of code written by Jackson which is able to explain shell commands within the bash shell very effectively and guess what the best part is you don’t need to install any third party package. He named the file containing this piece of code as `'explain.sh'`.

#### Features of Explain Utility ####

- Easy Code Embedding.
- No third-party utility needed to be installed.
- Output just enough information in course of explanation.
- Requires internet connection to work.
- Pure command-line utility.
- Able to explain most of the shell commands in bash shell.
- No root Account involvement required.

**Prerequisite**

The only requirement is `'curl'` package. In most of the today’s latest Linux distributions, curl package comes pre-installed, if not you can install it using package manager as shown below.

    # apt-get install curl 	[On Debian systems]
    # yum install curl 		[On CentOS systems]

### Installation of explain.sh Utility in Linux ###

We have to insert the below piece of code as it is in the `~/.bashrc` file. The code should be inserted for each user and each `.bashrc` file. It is suggested to insert the code to the user’s .bashrc file only and not in the .bashrc of root user.

Notice the first line of code that starts with hash `(#)` is optional and added just to differentiate rest of the codes of .bashrc.

# explain.sh marks the beginning of the codes, we are inserting in .bashrc file at the bottom of this file.

    # explain.sh begins
    explain () {
      if [ "$#" -eq 0 ]; then
        while read  -p "Command: " cmd; do
          curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
        done
        echo "Bye!"
      elif [ "$#" -eq 1 ]; then
        curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"
      else
        echo "Usage"
        echo "explain                  interactive mode."
        echo "explain 'cmd -o | ...'   one quoted command to explain it."
      fi
    }

### Working of explain.sh Utility ###

After inserting the code and saving it, you must logout of the current session and login back to make the changes taken into effect. Every thing is taken care of by the ‘curl’ command which transfer the input command and flag that need explanation to the mankier server and then print just necessary information to the Linux command-line. Not to mention to use this utility you must be connected to internet always.

Let’s test few examples of command which I don’t know the meaning with explain.sh script.

**1. I forgot what ‘du -h‘ does. All I need to do is:**

    $ explain 'du -h'

![Get Help on du Command](http://www.tecmint.com/wp-content/uploads/2015/07/Get-Help-on-du-Command.png)

Get Help on du Command

**2. If you forgot what ‘tar -zxvf‘ does, you may simply do:**

    $ explain 'tar -zxvf'

![Tar Command Help](http://www.tecmint.com/wp-content/uploads/2015/07/Tar-Command-Help.png)

Tar Command Help

**3. One of my friend often confuse the use of ‘whatis‘ and ‘whereis‘ command, so I advised him.**

Go to Interactive Mode by simply typing explain command on the terminal.

    $ explain

and then type the commands one after another to see what they do in one window, as:

    Command: whatis
    Command: whereis

![Whatis Whereis Commands Help](http://www.tecmint.com/wp-content/uploads/2015/07/Whatis-Whereis-Commands-Help.png)

Whatis Whereis Commands Help

To exit interactive mode he just need to do Ctrl + c.

**4. You can ask to explain more than one command chained by pipeline.**

    $ explain 'ls -l | grep -i Desktop'

![Get Help on Multiple Commands](http://www.tecmint.com/wp-content/uploads/2015/07/Get-Help-on-Multiple-Commands.png)

Get Help on Multiple Commands

Similarly you can ask your shell to explain any shell command. All you need is a working Internet connection. The output is generated based upon the explanation needed from the server and hence the output result is not customizable.

For me this utility is really helpful and it has been honored being added to my .bashrc. Let me know what is your thought on this project? How it can useful for you? Is the explanation satisfactory?

Provide us with your valuable feedback in the comments below. Like and share us and help us get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/explain-shell-commands-in-the-linux-shell/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/cheat-command-line-cheat-sheet-for-linux-users/