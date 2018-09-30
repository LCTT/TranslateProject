How To Run MS-DOS Games And Programs In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/dosbox-720x340.png)

If you ever wanted to try some good-old MS-DOS games and defunct C++ compilers like Turbo C++ in Linux? Good! This tutorial will teach you how to run MS-DOS games and programs under Linux environment using **DOSBox**. It is an x86 PC DOS-emulator that can be used to run classic DOS games or programs. DOSBox emulates an Intel x86 PC with sound, graphics, mouse, joystick, and modem etc., that allows you to run many old MS-DOS games and programs that simply cannot be run on any modern PCs and operating systems, such as Microsoft Windows XP and later, Linux and FreeBSD. It is free, written using C++ programming language and distributed under GPL.

### Install DOSBox In Linux

DOSBox is available in the default repositories of most Linux distributions.

On Arch Linux and its variants like Antergos, Manjaro Linux:
```
$ sudo pacman -S dosbox

```

On Debian, Ubuntu, Linux Mint:
```
$ sudo apt-get install dosbox

```

On Fedora:
```
$ sudo dnf install dosbox

```

### Configure DOSBox

There is no initial configuration required to use DOSBox and it just works out of the box. The default configuration file named `dosbox-x.xx.conf` exists in your **`~/.dosbox`** folder. In this configuration file, you can edit/modify various settings, such as starting DOSBox in fullscreen mode, use double buffering in fullscreen, set preferred resolution to use for fullscreen, mouse sensitivity, enable or disable sound, speaker, joystick and a lot more. As I mentioned earlier, the default settings will work just fine. You need not to make any changes.

### Run MS-DOS Games And Programs In Linux

To launch DOSBox, run the following command from the Terminal:
```
$ dosbox

```

This is how DOSBox interface looks like.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt.png)

As you can see, DOSBox comes with its own DOS-like command prompt with a virtual `Z:\` Drive, so if you’re familiar with MS-DOS, you wouldn’t find any difficulties to work in DOSBox environment.

Here is the output of `dir`command (Equivalent of `ls` command in Linux) output:

![](http://www.ostechnix.com/wp-content/uploads/2018/09/dir-command-output.png)

If you’re a new user and it is the first time you use DOSBox, you can view the short introduction about DOSBox by entering the following command in DOSBox prompt:
```
intro

```

Press ENTER to go through next page of the introduction section.

To view the list of most often used commands in DOS, use this command:
```
help

```

To view list of all supported commands in DOSBox, type:
```
help /all

```

Remember, these commands should be used in the DOSBox prompt, not in your Linux Terminal.

DOSBox also supports a good set of keyboard bindings. Here is the default keyboard shortcuts to effectively use DOSBox.

![](http://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-keyboard-shortcuts.png)

To exit from DOSBox, simply type and hit ENTER:
```
exit

```

By default, DOSBox starts with a normal window-sized screen like above.

To start dosbox directly in fullscreen, edit your `dosbox-x.xx.conf` file and set the value of **fullscreen** variable as **enable**. Now, DosBox will start in fullscreen mode. To go back to normal screen, press **ALT+ENTER**.

Hope you get the basic usage of DOSBox.

Let us go ahead and install some DOS programs and games.

First, we need to create directories to save the programs and games in our Linux system. I am going to create two directories named **`~/dosprograms`** and **`~/dosgames`** , the first one for storing programs and latter for storing games.
```
$ mkdir ~/dosprograms ~/dosgames

```

For the purpose of this guide, I will show you how to install **Turbo C++** program and Mario game. First, we will see how to install Turbo.

Download the latest Turbo C++ compiler, extract it and save the contents file in **`~/dosprograms`** directory. I have save the contents turbo c++ in my **~/dosprograms/TC/** directory.
```
$ ls dosprograms/tc/
BGI BIN CLASSLIB DOC EXAMPLES FILELIST.DOC INCLUDE LIB README README.COM

```

Start Dosbox:
```
$ dosbox

```

And mount the **`~/dosprograms`** directory as virtual drive **C:\** in DOSBox.
```
Z:\>mount c ~/dosprograms

```

You will see an output something like below.
```
Drive C is mounted as local directory /home/sk/dosprograms.

```

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-1.png)

Now, change to the C drive using command:
```
Z:\>c:

```

And then, switch to **tc/bin** directory:
```
Z:\>cd tc/bin

```

Finally, run turbo c++ executable file:
```
Z:\>tc.exe

```

**Note:** Just type first few letters and hit ENTER to autocomplete the file name.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-4.png)

You will now be in Turbo C++ console.

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-5.png)

Create new file (ATL+F) and start coding:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-6.png)

Similarly, you can install and run other classic DOS programs.

**Troubleshooting:**

You might be encountered with following error while running turbo c++ or any other dos programs:
```
DOSBox switched to max cycles, because of the setting: cycles=auto. If the game runs too fast try a fixed cycles amount in DOSBox's options. Exit to error: DRC64:Unhandled memory reference

```

To fix this, edit your **~/.dosbox/dosbox-x.xx.conf** file:
```
$ nano ~/.dosbox/dosbox-0.74.conf

```

Find the following variable and change its value from:
```
core=auto

```

to
```
core=normal

```

Save and close the file. Now you can be able to run the dos programs without any problems.

Now, let us see how to run a dos-based game, for example **Mario Bros VGA**.

Download Mario game from [**here**][1] and extract the contents in **~/dosgames** directory in your Linux machine.

Start DOSBox:
```
$ dosbox

```

We have used virtual drive **c:** for dos programs. For games, let us use **d:** as virtual drive.

At the DOSBox prompt, run the following command to mount **~/dosgames** directory as virtuald drive **d**.
```
Z:\>mount d ~/dosgames

```

Switch to D: drive:
```
Z:\>d:

```

And then go to mario game directory and run the **mario.exe** file to launch the game.
```
Z:\>cd mario

Z:\>mario.exe

```

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Dosbox-prompt-7.png)

Start playing the game:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Mario-game-in-dosbox.png)

Similarly, you can run any dos-based games as described above. You can view the complete list of supported games that can be run using DOSBox [**here**][2].

### Conclusion

Even though DOSBOX is not a complete replacement for MS-DOS and it lacks many of the features found in MS-DOS, it is just enough to install and run most DOS games and programs.

For more details, refer the official [**DOSBox manual**][3].

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-run-ms-dos-games-and-programs-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.dosgames.com/game/mario-bros-vga
[2]: https://www.dosbox.com/comp_list.php
[3]: https://www.dosbox.com/DOSBoxManual.html
