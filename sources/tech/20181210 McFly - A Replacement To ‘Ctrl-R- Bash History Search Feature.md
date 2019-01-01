[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (McFly – A Replacement To ‘Ctrl+R’ Bash History Search Feature)
[#]: via: (https://www.ostechnix.com/mcfly-a-replacement-to-ctrlr-bash-history-search-feature/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

McFly – A Replacement To ‘Ctrl+R’ Bash History Search Feature
======
![](https://www.ostechnix.com/wp-content/uploads/2018/12/mcfly-720x340.png)
If you spend a lot of time on CLI mode, you should definitely used or heard about **reverse search** function in BASH. The keyboard shortcut to do reverse search in Bash is **Ctrl+r**. Using bash reverse search, we can bring up all commands which we used previously executed without having to re-type them every time. You can, of course, use UP/DOWN arrows to search your bash history. However, Ctrl+r will make this process much easier and faster. Today, I Stumbled upon a replacement to ‘Ctrl+r’ Bash history search feature. Meet **“McFly”** , a simple tool written in **Rust** programming language that replaces the default Ctrl+r Bash history search with an intelligent search engine. All command suggestions made by McFly are prioritized in real time with a small **neural network**.

McFly rebinds Ctrl+r functionality to bring up all recently executed commands from your Bash history. It augments your shell history by tracking the following:

  * Command exit status,
  * timestamp (When you run the command),
  * and execution directory (Where you run the command).



It saves all tracking details in a SQLite database. Since it tracks the command’s historical exit status, you can simply ignore the old failed commands. Cool, yeah?

When suggesting a command, McFly considers the following facts:

  * On which directory you ran the command. You’re likely to repeat that command in the same directory in future.
  * What commands you typed before the command.
  * How often you run the command.
  * When you last ran the command.
  * If you’ve selected the command in McFly before.
  * The command’s historical exit status. Because, you probably don’t want to run old failed commands, right?



McFly maintains your default Bash history file, so you can stop using McFly at any time. McFly is not just for BASH, it is also extendable for other shells as well.

### Installing McFly

McFly can be installed using Linuxbrew on Linux. If you haven’t installed Linuxbrew yet, refer the following link.

[Linuxbrew – A Common Package Manager For Linux And Mac OS X][1]

Once Linuxbrew installed, run the following commands to install McFly:

```
$ brew tap cantino/mcfly https://github.com/cantino/mcfly

$ brew install mcfly
```

After the installation is completed, you will see the following output.

```
==> Installing mcfly from cantino/mcfly
==> Downloading https://github.com/cantino/mcfly/releases/download/v0.2.5/mcfly-v0
==> Downloading from https://github-production-release-asset-2e65be.s3.amazonaws.c
######################################################################## 100.0%
==> ONE MORE STEP! Edit ~/.bashrc and add the following:

if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
. $(brew --prefix)/opt/mcfly/mcfly.bash
fi
🍺 /home/linuxbrew/.linuxbrew/Cellar/mcfly/v0.2.5: 4 files, 3.5MB, built in 33 seconds
```
![](https://www.ostechnix.com/wp-content/uploads/2018/12/install-mcfly.png)
As you can see, we need to do one more step before start using McFly.

Add the following lines to your **~/.bashrc** file:

```
if [ -f $(brew --prefix)/opt/mcfly/mcfly.bash ]; then
. $(brew --prefix)/opt/mcfly/mcfly.bash
fi
```

Finally, run the following command to take effects changes:

```
$ source ~/.bashrc
```

Your BASH history will be imported to McFly database when you run this command for the first time. It will take a few moments depending upon size of your bash history file. Once the import is done, you will see the following message.

```
McFly: Importing Bash history for the first time. This may take a minute or two...done.
```

You can now start using McFly.


### Usage

To search through your command history, just type ‘mcfly search’ followed by the part of the command name and hit ENTER key. Mcfly will display the command suggestions based on the search query you just type.

```
$ mcfly search <part-of-the-command>
```

For instance, I type the following command:

```
$ mcfly search mk
```

Here is the sample output from my Ubuntu machine:

![](https://www.ostechnix.com/wp-content/uploads/2018/12/mcfly-command-1.png)

As you can see, I have used ‘mkdir’ command two times. If you want to run a command from the list of suggestions, just use **UP/DOWN** arrows to select it and hit ENTER to run it immediately. If you want to edit a command, choose it and hit **TAB** key to bring it back to your Terminal and then edit before running it. To delete the selected command from the history, just press **F2**.

Alternatively, type the following command to open the history search and then type any command or part of the command to view the suggestions from your history.

```
$ mcfly search
```

McFly will display the command suggestions as you type.

Here is a short video demonstration of McFly:
![](https://www.ostechnix.com/wp-content/uploads/2018/12/mcfly-demo.gif)
View help:

```
$ mcfly --help
```


### Remove McFly

Don’t like McFly, no problem! Remove it using the following commands:

```
$ brew uninstall mcfly

$ brew untap cantino/mcfly
```

Finally, remove the lines which we added earlier from **~/.bashrc** file.

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/mcfly-a-replacement-to-ctrlr-bash-history-search-feature/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
