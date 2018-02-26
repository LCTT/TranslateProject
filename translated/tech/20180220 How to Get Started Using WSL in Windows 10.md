20180220 How to Get Started Using WSL in Windows 10.md

How to Get Started Using WSL in Windows 10
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wsl-main.png?itok=wJ5WrU9U)

In the [previous article][1], we talked about the Windows Subsystem for Linux (WSL) and its target audience. In this article, we will walk through the process of getting started with WSL on your Windows 10 machine.

### Prepare your system for WSL

You must be running the latest version of Windows 10 with Fall Creator Update installed. Then, check which version of Windows 10 is installed on your system by searching on “About” in the search box of the Start menu. You should be running version 1709 or the latest to use WSL.

Here is a screenshot from my system.

![kHFKOvrbG1gXdB9lsbTqXC4N4w0Lbsz1Bul5ey9m][2]

If an older version is installed, you need to download and install the Windows 10 Fall Creator Update (FCU) from [this][3] page. Once FCU is installed, go to Update Settings (just search for “updates” in the search box of the Start menu) and install any available updates.

Go to Turn Windows Features On or Off (you know the drill by now) and scroll to the bottom and tick on the box Windows Subsystem for Linux, as shown in the following figure. Click Ok. It will download and install the needed packages.

![oV1mDqGe3zwQgL0N3rDasHH6ZwHtxaHlyrLzjw7x][4]

Upon the completion of the installation, the system will offer to restart. Go ahead and reboot your machine. WSL won’t launch without a system reboot, as shown below:

![GsNOQLJlHeZbkaCsrDIhfVvEoycu3D0upoTdt6aN][5]

Once your system starts, go back to the Turn features on or off setting to confirm that the box next to Windows Subsystem for Linux is selected.

### Install Linux in Windows

There are many ways to install Linux on Windows, but we will choose the easiest way. Open the Windows Store and search for Linux. You will see the following option:

![YAR4UgZiFAy2cdkG4U7jQ7_m81lrxR6aHSMOdED7][6]

Click on Get the apps, and Windows Store will provide you with three options: Ubuntu, openSUSE Leap 42, and SUSE Linux Enterprise Server. You can install all three distributions side by side and run all three distributions simultaneously. To be able to use SLE, you need a subscription.

In this case, I am installing openSUSE Leap 42 and Ubuntu. Select your desired distro and click on the Get button to install it. Once installed, you can launch openSUSE in Windows. It can be pinned to the Start menu for quick access.

![4LU6eRrzDgBprDuEbSFizRuP1J_zS3rBnoJbU2OA][7]

### Using Linux in Windows

When you launch the distro, it will open the Bash shell and install the distro. Once installed, you can go ahead and start using it. Simple. Just bear in mind that there is no user in openSUSE and it runs as root user, whereas Ubuntu will ask you to create a user. On Ubuntu, you can perform administrative tasks as sudo user.

You can easily create a user on openSUSE:
```
# useradd [username]

# passwd [username]

```

Create a new password for the user and you are all set. For example:
```
# useradd swapnil

# passwd swapnil

```

You can switch from root to this use by running the su command:
```
su swapnil

```

You do need non-root use to perform many tasks, like using commands like rsync to move files on your local machine.

The first thing you need to do is update the distro. For openSUSE:
```
zypper up

```

For Ubuntu:
```
sudo apt-get update

sudo apt-get dist-upgrade

```

![7cRgj1O6J8yfO3L4ol5sP-ZCU7_uwOuEoTzsuVW9][8]

You now have native Linux Bash shell on Windows. Want to ssh into your server from Windows 10? There’s no need to install puTTY or Cygwin. Just open Bash and then ssh into your server. Easy peasy.

Want to rsync files to your server? Go ahead and use rsync. It really transforms Windows into a usable machine for those Windows users who want to use native Linux command linux tools on their machines without having to deal with VMs.

### Where is Fedora?

You may be wondering about Fedora. Unfortunately, Fedora is not yet available through the store. Matthew Miller, the release manager of Fedora said on Twitter, “We're working on resolving some non-technical issues. I'm afraid I don't have any more than that right now.”

We don’t know yet what these non-technical issues are. When some users asked why the WSL team could not publish Fedora themselves --- after all it’s an open source project -- Rich Turner, a project manager at Microsoft [responded][9], “We have a policy of not publishing others' IP into the store. We believe that the community would MUCH prefer to see a distro published by the distro owner vs. seeing it published by Microsoft or anyone else that isn't the authoritative source.”

So, Microsoft can’t just go ahead and publish Debian or Arch Linux on Windows Store. The onus is on the official communities to bring their distros to Windows 10 users.

### What’s next

In the next article, we will talk about using Windows 10 as a Linux machine and performing most of the tasks that you would perform on your Linux system using the command-line tools.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/2/how-get-started-using-wsl-windows-10

作者：[SWAPNIL BHARTIYA][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/learn/2018/2/windows-subsystem-linux-bridge-between-two-platforms
[2]:https://lh6.googleusercontent.com/kHFKOvrbG1gXdB9lsbTqXC4N4w0Lbsz1Bul5ey9mr_E255GiiBxf8cRlatrte6z23yvo8lHJG8nQ_WeHhUNYqPp7kHuQTTMueqMshCT71JsbMr2Wih9KFHuHgNg1BclWz-iuBt4O
[3]:https://www.microsoft.com/en-us/software-download/windows10
[4]:https://lh4.googleusercontent.com/oV1mDqGe3zwQgL0N3rDasHH6ZwHtxaHlyrLzjw7xF9M9_AcHPNSxM18KDWK2ZpVcUOfxVVpNH9LwUJT5EtRE7zUrJC_gWV5f345SZRAgXcJzOE-8rM8-RCPTNtns6vVP37V5Eflp
[5]:https://lh5.googleusercontent.com/GsNOQLJlHeZbkaCsrDIhfVvEoycu3D0upoTdt6aNEozAcQA59Z3hDu_SxT6I4K4gwxLPX0YnmUsCKjaQaaG2PoAgUYMcN0Zv0tBFaoUL3sZryddM4mdRj1E2tE-IK_GLK4PDa4zf
[6]:https://lh3.googleusercontent.com/YAR4UgZiFAy2cdkG4U7jQ7_m81lrxR6aHSMOdED7MKEoYxEsX_yLwyMj9N2edt3GJ2JLx6mUsFEZFILCCSBU2sMOqveFVWZTHcCXhFi5P2Xk-9Ikc3NK9seup5CJObIcYJPORdPW
[7]:https://lh6.googleusercontent.com/4LU6eRrzDgBprDuEbSFizRuP1J_zS3rBnoJbU2OAOH3Mx7nfOROfyf81k1s4YQyLBcu0qSXOoaqbYkXL5Wpp9gNCdKH_WsEcqWzjG6uXzYvCYQ42psOz6Iz3NF7ElsPrdiFI0cYv
[8]:https://lh6.googleusercontent.com/7cRgj1O6J8yfO3L4ol5sP-ZCU7_uwOuEoTzsuVW9cU5xiBWz_cpZ1IBidNT0C1wg9zROIncViUzXD0vPoH5cggQtuwkanRfRdDVXOI48AcKFLt-Iq2CBF4mGRwqqWvSOhb0HFpjm
[9]:https://github.com/Microsoft/WSL/issues/2584
