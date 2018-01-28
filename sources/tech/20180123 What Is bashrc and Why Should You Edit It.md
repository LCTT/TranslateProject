heart4lor translating

What Is bashrc and Why Should You Edit It
======

![](https://www.maketecheasier.com/assets/uploads/2018/01/what-is-bashrc-hero.png)

There are a number of hidden files tucked away in your home directory. If you run macOS or a popular Linux distribution, you'll see a file named ".bashrc" up near the top of your hidden files. What is bashrc, and why is editing bashrc useful?

![finder-find-bashrc][1]

If you run a Unix-based or Unix-like operating system, you likely have bash installed as your default terminal. While many [different shells][2] exist, bash is both the most common and, likely, the most popular. If you don't know what that means, bash interprets your typed input in the Terminal program and runs commands based on your input. It allows for some degree of customization using scripting, which is where bashrc comes in.

In order to load your preferences, bash runs the contents of the bashrc file at each launch. This shell script is found in each user's home directory. It's used to save and load your terminal preferences and environmental variables.

Terminal preferences can contain a number of different things. Most commonly, the bashrc file contains aliases that the user always wants available. Aliases allow the user to refer to commands by shorter or alternative names, and can be a huge time-saver for those that work in a terminal regularly.

![terminal-edit-bashrc-1][3]

You can edit bashrc in any terminal text editor. We will use `nano` in the following examples.

To edit bashrc using `nano`, invoke the following command in Terminal:
```
nano ~/.bashrc
```

If you've never edited your bashrc file before, you might find that it's empty. That's fine! If not, you can feel free to put your additions on any line.

Any changes you make to bashrc will be applied next time you launch terminal. If you want to apply them immediately, run the command below:
```
source ~/.bashrc
```

You can add to bashrc where ever you like, but feel free to use command (proceeded by `#`) to organize your code.

Edits in bashrc have to follow [bash's scripting format][4]. If you don't know how to script with bash, there are a number of resources you can use online. This guide represents a fairly [comprehensive introduction][5] into the aspects of bashrc that we couldn't mention here.

 **Related** : [How to Run Bash Script as Root During Startup on Linux][6]

There's a couple of useful tricks you can do to make your terminal experience more efficient and user-friendly.

### Why should I edit bashrc?

#### Bash Prompt

The bash prompt allows you to style up your terminal and have it to show prompts when you run a command. A customized bash prompt can indeed make your work on the terminal more productive and efficient.

Check out some of the [useful][7] and [interesting][8] bash prompts you can add to your bashrc.

#### Aliases

![terminal-edit-bashrc-3][9]

Aliases can also allow you to access a favored form of a command with a shorthand code. Let's take the command `ls` as an example. By default, `ls` displays the contents of your directory. That's useful, but it's often more useful to know more about the directory, or know the hidden contents of the directory. As such, a common alias is `ll`, which is set to run `ls -lha` or something similar. That will display the most details about files, revealing hidden files and showing file sizes in "human readable" units instead of blocks.

You'll need to format your aliases like so:
```
alias ll = "ls -lha"
```

Type the text you want to replace on the left, and the command on the right between quotes. You can use to this to create shorter versions of command, guard against common typos, or force a command to always run with your favored flags. You can also circumvent annoying or easy-to-forget syntax with your own preferred shorthand. Here are some of the [commonly used aliases][10] you can add to your bashrc.

#### Functions

![terminal-edit-bashrc-2][11]

In addition to shorthand command names, you can combine multiple commands into a single operation using bash functions. They can get pretty complicated, but they generally follow this syntax:
```
function_name () {
 command_1
 command_2
}
```

The command below combines `mkdir` and `cd`. Typing `md folder_name` creates a directory named "folder_name" in your working directory and navigates into it immediately.
```
md () {
  mkdir -p $1
  cd $1 
}
```

The `$1` you see in the function represents the first argument, which is the text you type immediately after the function name.

### Conclusion

Unlike some terminal customization tricks, messing with bashrc is fairly straight-forward and low risk. If you mess anything up, you can always delete the bashrc file completely and start over again. Try it out now and you will be amazed at your improved productivity.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/what-is-bashrc/

作者：[Alexander Fox][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/alexfox/
[1]:https://www.maketecheasier.com/assets/uploads/2018/01/finder-find-bashrc.png (finder-find-bashrc)
[2]:https://www.maketecheasier.com/alternative-linux-shells/
[3]:https://www.maketecheasier.com/assets/uploads/2018/01/terminal-edit-bashrc-1.png (terminal-edit-bashrc-1)
[4]:http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html
[5]:https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
[6]:https://www.maketecheasier.com/run-bash-script-as-root-during-startup-linux/ (How to Run Bash Script as Root During Startup on Linux)
[7]:https://www.maketecheasier.com/8-useful-and-interesting-bash-prompts/
[8]:https://www.maketecheasier.com/more-useful-and-interesting-bash-prompts/
[9]:https://www.maketecheasier.com/assets/uploads/2018/01/terminal-edit-bashrc-3.png (terminal-edit-bashrc-3)
[10]:https://www.maketecheasier.com/install-software-in-various-linux-distros/#aliases
[11]:https://www.maketecheasier.com/assets/uploads/2018/01/terminal-edit-bashrc-2.png (terminal-edit-bashrc-2)
