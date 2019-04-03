[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Quickly Go Back To A Specific Parent Directory Using bd Command In Linux)
[#]: via: (https://www.2daygeek.com/bd-quickly-go-back-to-a-specific-parent-directory-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Quickly Go Back To A Specific Parent Directory Using bd Command In Linux
======

Two days back we had written an article about autocd. It’s a builtin shell variable that helps us to **[navigate to inside a directory without cd command][1]**.

If you want to come back to previous directory then you have to type `cd ..`.

If you want to go back to two directories then you have to type `cd ../..`.

It’s normal in Linux but if you want to come back from 9th directory to 3rd directory, then it’s horrible to use cd command.

What will be the solution for this.

Yes, we have a solution in Linux for everything. We can go with bd command, to make easy this kind of situation.

### What Is bd Command?

bd command allow users to quickly go back to a parent directory in Linux instead of typing `cd ../../..` repeatedly.

You can list the contents of a given directory without mentioning the full path `ls `bd Directory_Name``. It supports following other commands such as ls, ln, echo, zip, tar etc..

Also, it allow us to execute a shell file without mentioning the full path `bd p`/shell_file.sh`.

### How To Install bd Command in Linux?

There is no official distribution package for bd except Debian/Ubuntu. Hence, we need to perform manual method.

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][2]** or **[APT Command][3]** to install bd.

```
$ sudo apt install bd
```

For other Linux distributions.

Download the bd executable binary file using **[wget command][4]**.

```
$ sudo wget --no-check-certificate -O /usr/local/bin/bd https://raw.github.com/vigneshwaranr/bd/master/bd
```

Set executable permission to the bd binary file.

```
$ sudo chmod +rx /usr/local/bin/bd
```

Append the below values in the `.bashrc` file.

```
$ echo 'alias bd=". bd -si"' >> ~/.bashrc
```

Run the following command to make the changes to take effect.

```
$ source ~/.bashrc
```

To enable auto completion, perform the following two steps.

```
$ sudo wget -O /etc/bash_completion.d/bd https://raw.github.com/vigneshwaranr/bd/master/bash_completion.d/bd  
$ sudo source /etc/bash_completion.d/bd
```

We have successfully installed and configured the bd utility on the system. It’s time to test it.

I’m going to take the below directory path for this testing.

Run the `pwd` command or `dirs` command or `tree` command to know your current location.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ pwd
or
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ dirs

/usr/share/icons/Adwaita/256x256/apps
```

I’m currently in `/usr/share/icons/Adwaita/256x256/apps` and if i want to go to `icons` directory quickly then simple type the following command.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ bd icons
/usr/share/icons/
daygeek@Ubuntu18:/usr/share/icons$
```

Even, you no need to type full directory name instead you can type few letters.

```
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ bd i
/usr/share/icons/
daygeek@Ubuntu18:/usr/share/icons$ 
```

`Note:` If there are more than one directories with same name up in the hierarchy, bd will take you to the closest. (Not considering the immediate parent.)

If you would like to list a given directory contents then the following format. It prints the contents of `/usr/share/icons/`.

```
$ ls -lh `bd icons`
or
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ ls -lh `bd i`
total 64K
drwxr-xr-x 12 root root 4.0K Jul 25  2018 Adwaita
lrwxrwxrwx  1 root root   51 Feb 25 14:32 communitheme -> /snap/communitheme/current/share/icons/communitheme
drwxr-xr-x  2 root root 4.0K Jul 25  2018 default
drwxr-xr-x  3 root root 4.0K Jul 25  2018 DMZ-Black
drwxr-xr-x  3 root root 4.0K Jul 25  2018 DMZ-White
drwxr-xr-x  9 root root 4.0K Jul 25  2018 gnome
drwxr-xr-x  3 root root 4.0K Jul 25  2018 handhelds
drwxr-xr-x 20 root root 4.0K Mar  9 14:52 hicolor
drwxr-xr-x  9 root root 4.0K Jul 25  2018 HighContrast
drwxr-xr-x 12 root root 4.0K Jul 25  2018 Humanity
drwxr-xr-x  7 root root 4.0K Jul 25  2018 Humanity-Dark
drwxr-xr-x  4 root root 4.0K Jul 25  2018 locolor
drwxr-xr-x  3 root root 4.0K Feb 25 15:46 LoginIcons
drwxr-xr-x  3 root root 4.0K Jul 25  2018 redglass
drwxr-xr-x 10 root root 4.0K Feb 25 15:46 ubuntu-mono-dark
drwxr-xr-x 10 root root 4.0K Feb 25 15:46 ubuntu-mono-light
drwxr-xr-x  3 root root 4.0K Jul 25  2018 whiteglass
```

If you want to execute a file somewhere in a parent directory then use the following format. It will run the following shell file `/usr/share/icons/users-list.sh`.

```
$ `bd i`/users-list.sh
or
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ `bd icon`/users-list.sh
daygeek
thanu
renu
2gadmin
testuser
demouser
sudha
suresh
user1
user2
user3
```

If you reside in `/usr/share/icons/Adwaita/256x256/apps` and would you like to navigate to different parent directory then use the following format. The below command will navigate to `/usr/share/icons/gnome` directory.

```
$ cd `bd i`/gnome
or
daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ cd `bd icon`/gnome
daygeek@Ubuntu18:/usr/share/icons/gnome$ 
```

If you reside in `/usr/share/icons/Adwaita/256x256/apps` and would you like to create a new directory under `/usr/share/icons/` then use the following format.

```
$ daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ sudo mkdir `bd icons`/2g

daygeek@Ubuntu18:/usr/share/icons/Adwaita/256x256/apps$ ls -ld `bd icon`/2g
drwxr-xr-x 2 root root 4096 Mar 16 05:44 /usr/share/icons//2g
```

This tutorial allows you to quickly go back to a specific parent directory but there is no option to move forward quickly.

We have another solution for this, will come up with new solution shortly. Please stay tune with us.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bd-quickly-go-back-to-a-specific-parent-directory-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/navigate-switch-directory-without-using-cd-command-in-linux/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/wget-command-line-download-utility-tool/
