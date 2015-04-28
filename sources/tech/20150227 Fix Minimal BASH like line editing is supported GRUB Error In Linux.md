Fix Minimal BASH like line editing is supported GRUB Error In Linux
================================================================================
The other day when I [installed Elementary OS in dual boot with Windows][1], I encountered a Grub error at the reboot time. I was presented with command line with error message:

**Minimal BASH like line editing is supported. For the first word, TAB lists possible command completions. anywhere else TAB lists possible device or file completions.**

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu_Linux_1.jpeg)

Indeed this is not an error specific to Elementary OS. It is a common [Grub][2] error that could occur with any Linux OS be it Ubuntu, Fedora, Linux Mint etc.

In this post we shall see **how to fix this “minimal BASH like line editing is supported” Grub error in Ubuntu** based Linux systems.

> You can read this tutorial to fix similar and more frequent issue, [error: no such partition grub rescue in Linux][3].

### Prerequisites ###

To fix this issue, you would need the followings:

- A live USB or disk of the same OS and same version
- A working internet connection in the live session

Once you make sure that you have the prerequisites, let’s see how to fix the black screen of death for Linux (if I can call it that ;)).

### How to fix this “minimal BASH like line editing is supported” Grub error in Ubuntu based Linux ###

I know that you might point out that this Grub error is not exclusive to Ubuntu or Ubuntu based Linux distributions, then why am I putting emphasis on the world Ubuntu? The reason is, here we will take an easy way out and use a tool called **Boot Repair** to fix our problem. I am not sure if this tool is available for other distributions like Fedora. Without wasting anymore time, let’s see how to solve minimal BASH like line editing is supported Grub error.

### Step 1: Boot in lives session ###

Plug in the live USB and boot in to the live session.

### Step 2: Install Boot Repair ###

Once you are in the lives session, open the terminal and use the following commands to install Boot Repair:

    sudo add-apt-repository ppa:yannubuntu/boot-repair
    sudo apt-get update
    sudo apt-get install boot-repair

Note: Follow this tutorial to [fix failed to fetch cdrom apt-get update cannot be used to add new CD-ROMs error][4], if you encounter it while running the above command.

### Step 3: Repair boot with Boot Repair ###

Once you installed Boot Repair, run it from the command line using the following command:

    boot-repair &

Actually things are pretty straight forward from here. You just need to follow the instructions provided by Boot Repair tool. First, click on **Recommended repair** option in the Boot Repair.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu.png)

It will take couple of minutes for Boot Repair to analyze the problem with boot and Grub. Afterwards, it will provide you some commands to use in the command line. Copy the commands one by one in terminal. For me it showed me a screen like this:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu_1.png)

It will do some processes after you enter these commands:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu_2.png)

Once the process finishes, it will provide you a URL which consists of the logs of the boot repair. If your boot issue is not fixed even now, you can go to the forum or mail to the dev team and provide them the URL as a reference. Cool, isn’t it?

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Final_Ubuntu.png)

After the boot repair finishes successfully, shutdown your computer, remove the USB and boot again. For me it booted successfully but added two additional lines in the Grub screen. Something which was not of importance to me as I was happy to see the system booting normally again.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Boot_Repair_Ubuntu_Linux_2.jpeg)

### Did it work for you? ###

So this is how I fixed **minimal BASH like line editing is supported Grub error in Elementary OS Freya**. How about you? Did it work for you? Feel free to ask a question or drop a suggestion in the comment box below.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-minimal-bash-line-editing-supported-grub-error-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/guide-install-elementary-os-luna/
[2]:http://www.gnu.org/software/grub/
[3]:http://itsfoss.com/solve-error-partition-grub-rescue-ubuntu-linux/
[4]:http://itsfoss.com/fix-failed-fetch-cdrom-aptget-update-add-cdroms/