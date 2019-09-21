[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Navigate Directories Faster In Linux)
[#]: via: (https://www.ostechnix.com/navigate-directories-faster-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Navigate Directories Faster In Linux
======

![Navigate Directories Faster In Linux][1]

Today we are going to learn some command line productivity hacks. As you already know, we use “cd” command to move between a stack of directories in Unix-like operating systems. In this guide I am going to teach you how to navigate directories faster without having to use “cd” command often. There could be many ways, but I only know the following five methods right now! I will keep updating this guide when I came across any methods or utilities to achieve this task in the days to come.

### Five Different Methods To Navigate Directories Faster In Linux

##### Method 1: Using “Pushd”, “Popd” And “Dirs” Commands

This is the most frequent method that I use everyday to navigate between a stack of directories. The “Pushd”, “Popd”, and “Dirs” commands comes pre-installed in most Linux distributions, so don’t bother with installation. These trio commands are quite useful when you’re working in a deep directory structure and scripts. For more details, check our guide in the link given below.

  * **[How To Use Pushd, Popd And Dirs Commands For Faster CLI Navigation][2]**



##### Method 2: Using “bd” utility

The “bd” utility also helps you to quickly go back to a specific parent directory without having to repeatedly typing “cd ../../.” on your Bash.

Bd is also available in the [**Debian extra**][3] and [**Ubuntu universe**][4] repositories. So, you can install it using “apt-get” package manager in Debian, Ubuntu and other DEB based systems as shown below:

```
$ sudo apt-get update

$ sudo apt-get install bd
```

For other distributions, you can install as shown below.

```
$ sudo wget --no-check-certificate -O /usr/local/bin/bd https://raw.github.com/vigneshwaranr/bd/master/bd

$ sudo chmod +rx /usr/local/bin/bd

$ echo 'alias bd=". bd -si"' >> ~/.bashrc

$ source ~/.bashrc
```

To enable auto completion, run:

```
$ sudo wget -O /etc/bash_completion.d/bd https://raw.github.com/vigneshwaranr/bd/master/bash_completion.d/bd

$ source /etc/bash_completion.d/bd
```

The Bd utility has now been installed. Let us see few examples to understand how to quickly move through stack of directories using this tool.

Create some directories.

```
$ mkdir -p dir1/dir2/dir3/dir4/dir5/dir6/dir7/dir8/dir9/dir10
```

The above command will create a hierarchy of directories. Let us check [**directory structure**][5] using command:

```
$ tree dir1/
dir1/
└── dir2
 └── dir3
 └── dir4
 └── dir5
 └── dir6
 └── dir7
 └── dir8
 └── dir9
 └── dir10

9 directories, 0 files
```

Alright, we have now 10 directories. Let us say you’re currently in 7th directory i.e dir7.

```
$ pwd
/home/sk/dir1/dir2/dir3/dir4/dir5/dir6/dir7
```

You want to move to dir3. Normally you would type:

```
$ cd /home/sk/dir1/dir2/dir3
```

Right? yes! But it not necessary though! To go back to dir3, just type:

```
$ bd dir3
```

Now you will be in dir3.

![][6]

Navigate Directories Faster In Linux Using “bd” Utility

Easy, isn’t it? It supports auto complete, so you can just type the partial name of a directory and hit the tab key to auto complete the full path.

To check the contents of a specific parent directory, you don’t need to inside that particular directory. Instead, just type:

```
$ ls `bd dir1`
```

The above command will display the contents of dir1 from your current working directory.

For more details, check out the following GitHub page.

  * [**bd GitHub repository**][7]



##### Method 3: Using “Up” Shell script

The “Up” is a shell script allows you to move quickly to your parent directory. It works well on many popular shells such as Bash, Fish, and Zsh etc. Installation is absolutely easy too!

To install “Up” on **Bash** , run the following commands one bye:

```
$ curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh

$ echo 'source ~/.config/up/up.sh' >> ~/.bashrc
```

The up script registers the “up” function and some completion functions via your “.bashrc” file.

Update the changes using command:

```
$ source ~/.bashrc
```

On **zsh** :

```
$ curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh

$ echo 'source ~/.config/up/up.sh' >> ~/.zshrc
```

The up script registers the “up” function and some completion functions via your “.zshrc” file.

Update the changes using command:

```
$ source ~/.zshrc
```

On **fish** :

```
$ curl --create-dirs -o ~/.config/up/up.fish https://raw.githubusercontent.com/shannonmoeller/up/master/up.fish

$ source ~/.config/up/up.fish
```

The up script registers the “up” function and some completion functions via “funcsave”.

Now it is time to see some examples.

Let us create some directories.

```
$ mkdir -p dir1/dir2/dir3/dir4/dir5/dir6/dir7/dir8/dir9/dir10
```

Let us say you’re in 7th directory i.e dir7.

```
$ pwd
/home/sk/dir1/dir2/dir3/dir4/dir5/dir6/dir7
```

You want to move to dir3. Using “cd” command, we can do this by typing the following command:

```
$ cd /home/sk/dir1/dir2/dir3
```

But it is really easy to go back to dir3 using “up” script:

```
$ up dir3
```

That’s it. Now you will be in dir3. To go one directory up, just type:

```
$ up 1
```

To go back two directory type:

```
$ up 2
```

It’s that simple. Did I type the full path? Nope. Also it supports tab completion. So just type the partial directory name and hit the tab to complete the full path.

For more details, check out the GitHub page.

  * [**Up GitHub Repository**][8]



Please be mindful that “bd” and “up” tools can only help you to go backward i.e to the parent directory of the current working directory. You can’t move forward. If you want to switch to dir10 from dir5, you can’t! Instead, you need to use “cd” command to switch to dir10. These two utilities are meant for quickly moving you to the parent directory!

##### Method 4: Using “Shortcut” tool

This is yet another handy method to switch between different directories quickly and easily. This is somewhat similar to [**alias**][9] command. In this method, we create shortcuts to frequently used directories and use the shortcut name to go to that respective directory without having to type the path. If you’re working in deep directory structure and stack of directories, this method will greatly save some time. You can learn how it works in the guide given below.

  * [**Create Shortcuts To The Frequently Used Directories In Your Shell**][10]



##### Method 5: Using “CDPATH” Environment variable

This method doesn’t require any installation. **CDPATH** is an environment variable. It is somewhat similar to **PATH** variable which contains many different paths concatenated using **‘:’** (colon). The main difference between PATH and CDPATH variables is the PATH variable is usable with all commands whereas CDPATH works only for **cd** command.

I have the following directory structure.

![][11]

Directory structure

As you see, there are four child directories under a parent directory named “ostechnix”.

Now add this parent directory to CDPATH using command:

```
$ export CDPATH=~/ostechnix
```

You now can instantly cd to the sub-directories of the parent directory (i.e **~/ostechnix** in our case) from anywhere in the filesystem.

For instance, currently I am in **/var/mail/** location.

![][12]

To cd into **~/ostechnix/Linux/** directory, we don’t have to use the full path of the directory as shown below:

```
$ cd ~/ostechnix/Linux
```

Instead, just mention the name of the sub-directory you want to switch to:

```
$ cd Linux
```

It will automatically cd to **~/ostechnix/Linux** directory instantly.

![][13]

As you can see in the above output, I didn’t use “cd <full-path-of-subdir>”. Instead, I just used “cd <subdir-name>” command.

Please note that CDPATH will allow you to quickly navigate to only one child directory of the parent directory set in CDPATH variable. It doesn’t much help for navigating a stack of directories (directories inside sub-directories, of course).

To find the values of CDPATH variable, run:

```
$ echo $CDPATH
```

Sample output would be:

```
/home/sk/ostechnix
```

**Set multiple values to CDPATH**

Similar to PATH variable, we can also set multiple values (more than one directory) to CDPATH separated by colon (:).

```
$ export CDPATH=.:~/ostechnix:/etc:/var:/opt
```

**Make the changes persistent**

As you already know, the above command (export) will only keep the values of CDPATH until next reboot. To permanently set the values of CDPATH, just add them to your **~/.bashrc** or **~/.bash_profile** files.

```
$ vi ~/.bash_profile
```

Add the values:

```
export CDPATH=.:~/ostechnix:/etc:/var:/opt
```

Hit **ESC** key and type **:wq** to save and exit.

Apply the changes using command:

```
$ source ~/.bash_profile
```

**Clear CDPATH**

To clear the values of CDPATH, use **export CDPATH=””**. Or, simply delete the entire line from **~/.bashrc** or **~/.bash_profile** files.

In this article, you have learned the different ways to navigate directory stack faster and easier in Linux. As you can see, it’s not that difficult to browse a pile of directories faster. Now stop typing “cd ../../..” endlessly by using these tools. If you know any other worth trying tool or method to navigate directories faster, feel free to let us know in the comment section below. I will review and add them in this guide.

And, that’s all for now. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/navigate-directories-faster-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2017/12/Navigate-Directories-Faster-In-Linux-720x340.png
[2]: https://www.ostechnix.com/use-pushd-popd-dirs-commands-faster-cli-navigation/
[3]: https://tracker.debian.org/pkg/bd
[4]: https://launchpad.net/ubuntu/+source/bd
[5]: https://www.ostechnix.com/view-directory-tree-structure-linux/
[6]: http://www.ostechnix.com/wp-content/uploads/2017/12/Navigate-Directories-Faster-1.png
[7]: https://github.com/vigneshwaranr/bd
[8]: https://github.com/shannonmoeller/up
[9]: https://www.ostechnix.com/the-alias-and-unalias-commands-explained-with-examples/
[10]: https://www.ostechnix.com/create-shortcuts-frequently-used-directories-shell/
[11]: http://www.ostechnix.com/wp-content/uploads/2018/12/tree-command-output.png
[12]: http://www.ostechnix.com/wp-content/uploads/2018/12/pwd-command.png
[13]: http://www.ostechnix.com/wp-content/uploads/2018/12/cdpath.png
