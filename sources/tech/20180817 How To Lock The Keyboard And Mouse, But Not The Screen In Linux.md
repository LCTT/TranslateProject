FSSlc Translating
How To Lock The Keyboard And Mouse, But Not The Screen In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2017/09/Lock-The-Keyboard-And-Mouse-720x340.jpg)

My 4-years-old niece is a curious-kid. She loves “Avatar” movie very much. When the Avatar movie is on, she became so focused and her eyes are glued to the screen. But the problem is she often touches a key in the keyboard or move the mouse or click the mouse button while watching the movie. Sometimes, she accidentally close or pause the movie by pressing a key in the keyboard. So I was looking for a way to lock down both the keyboard and mouse, but not the screen. Luckily, I came across a perfect solution in Ubuntu forum. If you don’t want your cat or puppy walking on your keyboard or your kid messing up with the keyboard and mouse while you watching something important on the screen, I suggest you to try **“xtrlock”** utility. It is a simple, yet useful utility to lock the X display till the user enters their password at the keyboard. In this brief tutorial, I will show you how to lock the keyboard and mouse, but not the screen in Linux. This trick will work on all Linux operating systems.

### Install xtrlock

The xtrlock package is available in the default repositories of most Linux operating systems. So, you can install it using your distribution’s package manager.

On **Arch Linux** and derivatives, run the following command to install it.
```
$ sudo pacman -S xtrlock

```

On **Fedora** :
```
$ sudo dnf install xtrlock

```

On **RHEL, CentOS** :
```
$ sudo yum install xtrlock

```

On **SUSE/openSUSE** :
```
$ sudo zypper install xtrlock

```

On **Debian, Ubuntu, Linux Mint** :
```
$ sudo apt-get install xtrlock

```

### Lock the Keyboard and Mouse, but not the Screen using xtrlock

Once xtrlock installed, create a keyboard shortcut. You need this to lock the keyboard and mouse using the key combination of your choice.

Create a new file called **lockkbmouse** in **/usr/local/bin**.
```
$ sudo vi /usr/local/bin/lockkbmouse

```

Add the following lines into it.
```
#!/bin/bash
sleep 1 && xtrlock

```

Save the file and close the file.

Make it as executable using the following command:
```
$ sudo chmod a+x /usr/local/bin/lockkbmouse

```

Next, we need to create keyboard a shortcut.

**In Arch Linux MATE desktop:**

Go to **System - > Preferences -> Hardware -> keyboard Shortcuts**.

Click **Add** to create a new shortcut.

![][2]

Enter the name for your shortcut and add the following line in the command box, and click **Apply** button.
```
bash -c "sleep 1 && xtrlock"

```

![][3]

To assign the shortcut key, just select or double click on it and type the key combination of your choice. For example, I use **Alt+k**.

![][4]

To clear the key combination, press BACKSPACE key. Once you finished, close the Keyboard Settings window.

**In Ubuntu GNOME DE:**

Go to **System Settings - > Devices -> Keyboard**. Click the **+** symbol at the end.

Enter the name for your shortcut and add the following line in the command box, and click **Add** button.
```
bash -c "sleep 1 && xtrlock"

```

![][5]

Next, assign the shortcut key to the newly created shortcut. To do so, just select or double click on it and click on **“Set shortcut”** button.

![][6]

You will now see the following screen.

![][7]

Type the key combination of your choice. For example, I use **Alt+k**.

![][8]

To clear the key combination, press BACKSPACE key. The shortcut key has been assigned. Once you finished, close the Keyboard Settings window.

From now on, whenever you press the keyboard shortcut key (ALT+k in our case), the mouse pointer will turn into a a padlock. Now, the keyboard and mouse have been locked, so you can freely watch the movies or whatever you want to. Even your kid or pet touches some keys on the keyboard or clicks a mouse button, they won’t work.

Here is xtrclock in action.

![][9]

Do you see the a small lock button? It means that the keyboard and mouse have been locked. Even if you move the lock button, nothing will happen. The task in the background will keep running until you unlock your screen and manually close the running task.

### Unlock keyboard and mouse

To unlock the keyboard and mouse, simply type your password and hit “Enter”. You will not see the password as you type it. Just type the password anyway and hit ENTER key. The mouse and keyboard will start to work after you entered the correct password. If you entered an incorrect password, you will hear a bell sound. Press **ESC** key to clear the incorrect password and re-enter the correct password again. To remove one character of a partially typed password, press either **BACKSPACE** or **DELETE** keys.

### What if I permanently get locked out of the screen?

The xtrclock tool may not work on some DEs, for example GDM. It may permanently lock you out of the screen. Please test it in a virtual machine and then try it in your personal or official desktop if it really works. I tested this on Arch Linux MATE desktop and Ubuntu 18.04 GNOME desktop. It worked just fine.

Just in case, you are locked out of the screen permanently, switch to the TTY (CTRL+ALT+F2) then run:
```
$ sudo killall xtrlock

```

Alternatively, you can use the **chvt** command to switch between TTY and X session.

For example, to switch to TTY1, run:
```
$ sudo chvt 1

```

To switch back to the X session again, type:
```
$ sudo chvt 7

```

Different distros uses different key combinations to switch between TTYs. Please refer your distribution’s official website for more details.

For more details about xtrlock, refer man pages.
```
$ man xtrlock

```

And, that’s all for now. Hope this helps. If you find our guides useful, please spend a moment to share them on your social, professional networks and support OSTechNix.

**Resource:**

  * [**Ubuntu forum**][10]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/lock-keyboard-mouse-not-screen-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/09/Keyboard-Shortcuts_001.png
[3]:http://www.ostechnix.com/wp-content/uploads/2017/09/Keyboard-Shortcuts_002.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/09/Keyboard-Shortcuts_003.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/01/Add-xtrlock-shortcut.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/01/set-shortcut-key-1.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/01/set-shortcut-key-2.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/01/set-shortcut-key-3.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/01/xtrclock-1.png
[10]:https://ubuntuforums.org/showthread.php?t=993800
