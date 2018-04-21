translating---geekpi

Yet Another TUI Graphical Activity Monitor, Written In Go
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/Gotop-720x340.png)
You already know about “top” command, don’t you? Yes, It provides dynamic real-time information about running processes in any Unix-like operating systems. A few developers have built graphical front-ends for top command, so the users can easily find out their system’s activity in a graphical window. One of them is **Gotop**. As the name implies, Gotop is a TUI graphical activity monitor, written in **Go** language. It is completely free, open source and inspired by [gtop][1] and [vtop][2] programs.

In this brief guide, we are going to discuss how to install and use Gotop program to monitor a Linux system’s activity.

### Installing Gotop

Gotop is written using Go, so we need to install it first. To install Go programming language in Linux, refer the following guide.

After installing Go, download the latest Gotop binary using the following command.
```
$ sh -c "$(curl https://raw.githubusercontent.com/cjbassi/gotop/master/download.sh)"

```

And, then move the downloaded binary to your $PATH, for example **/usr/local/bin/**.
```
$ cp gotop /usr/local/bin

```

Finally, make it executable using command:
```
$ chmod +x /usr/local/bin/gotop

```

If you’re using Arch-based systems, Gotop is available in **AUR** , so you can install it using any AUR helper programs.

Using [**Cower**][3]:
```
$ cower -S gotop

```

Using [**Pacaur**][4]:
```
$ pacaur -S gotop

```

Using [**Packer**][5]:
```
$ packer -S gotop

```

Using [**Trizen**][6]:
```
$ trizen -S gotop

```

Using [**Yay**][7]:
```
$ yay -S gotop

```

Using [yaourt][8]:
```
$ yaourt -S gotop

```

### Usage

Gotop usage is easy! All you have to do is to run the following command from the Terminal.
```
$ gotop

```

There you go! You will see the usage of your system’s CPU, disk, memory, network, cpu temperature and process list in a simple TUI window.

![][10]

To show only CPU, Mem and Process widgets, use **-m** flag like below.
```
$ gotop -m

```

![][11]

You can sort the process table by using the following keyboard shortcuts.

  * **c** – CPU
  * **m** – Mem
  * **p** – PID



For process navigation, use the following keys.

  * **UP/DOWN** arrows or **j/k** keys to go up and down.
  * **Ctrl-d** and **Ctrl-u** – up and down half a page.
  * **Ctrl-f** and **Ctrl-b** – up and down a full page.
  * **gg** and **G** – iump to top and bottom.



Press **< TAB>** to toggle process grouping. To kill the selected process or process group, type **dd**. To select a process, just click on it. To scroll down/up, use the mouse scroll button. To zoom in and zoom out CPU and memory graphs, use **h** and **l**. To display the help menu at anytime, just press **?**.

**Recommended read:**

And, that’s all for now. Hope this helps. More good stuffs to come. Stay tuned!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/gotop-yet-another-tui-graphical-activity-monitor-written-in-go/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/aksakalli/gtop
[2]:https://github.com/MrRio/vtop
[3]:https://www.ostechnix.com/cower-simple-aur-helper-arch-linux/
[4]:https://www.ostechnix.com/install-pacaur-arch-linux/
[5]:https://www.ostechnix.com/install-packer-arch-linux-2/
[6]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[7]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[8]:https://www.ostechnix.com/install-yaourt-arch-linux/
[9]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]:http://www.ostechnix.com/wp-content/uploads/2018/04/Gotop-1.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/04/Gotop-2.png
