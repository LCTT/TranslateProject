[#]: subject: "Don’t Suspend Ubuntu When Laptop Lid is Closed"
[#]: via: "https://itsfoss.com/laptop-lid-suspend-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Don’t Suspend Ubuntu When Laptop Lid is Closed
======
If you use Ubuntu on a laptop, you might have noticed that the system is suspended when you close the lid.

That’s the expected behavior. It saves the battery as well as your work. You lift the lid, the system wakes up, and you can log in and continue your work.

That all sounds good except when you work with a multi-monitor setup. A few people, like me, prefer to have the laptop closed and only use the external monitor(s).

But if closing the laptop lid suspends the system, it creates a problem.

Let me show you how you can change this behavior.

### Don’t suspend when laptop lid is closed

Actually, I have noticed that the recent versions of Ubuntu are smarter in this sense. When the laptop is connected to a docking station and you close the lid, it doesn’t go in suspend mode.

That’s the normal expected behavior but it may not work all the time for reasons known to Ubuntu gods.

The good thing is that you can force change this behavior using both GUI and command line.

Let me share both methods.

#### Method 1: Using GNOME Tweaks 

If you are using the default GNOME desktop, you are in luck. [Install GNOME Tweaks tool in Ubuntu][1] from the software center or use this command:

```
sudo apt install gnome-tweaks
```

Once installed, start the Tweaks application. In the **General tab** from the sidebar, **toggle off the ‘Suspend when laptop lid is closed’ button**.

![change lid close behavior ubuntu][2]

That’s it. You should not need a restart for changes to take effect.

Now, let’s talk about the command line method.

#### Method 2: Change login configuration (for advanced users)

If you look into the content of the file /etc/systemd/logind.conf, you’ll see three different types of default settings for the laptop lid closing.

* HandleLidSwitch: When the laptop is on battery power
* HandleLidSwitchExternalPower: When the laptop is plugged into a power outlet
* HandleLidSwitchDocked: When the laptop is connected to a docking station

![Default laptop lid closing settings][3]

As you can see, the laptop will suspend if the lid is closed irrespective of whether it is connected to power or not. Lid closing is ignored for docking station connections.

If you want, you can change the value of those parameters to one of these as per your preference:

* lock: lock when lid is closed
* ignore: do nothing
* poweroff: shutdown
* hibernate: hibernate when lid is closed

I would suggest going with `ignore` if you don’t want your system do anything special when the laptop lid is closed.

You can either edit the /etc/systemd/logind.conf file and uncomment the said settings and change their value, or you create a new file in /etc/systemd/logind.conf.d directory. Create this directory if it doesn’t exist.

I am not going to give you the exact commands. If you are familiar with the command line, you should be able to do it. If you are uncomfortable with the command line, please stick with the earlier GUI method.

I hope this helps you. Let me know if you have any questions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/laptop-lid-suspend-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/gnome-tweak-tool/
[2]: https://itsfoss.com/wp-content/uploads/2022/08/change-lid-close-behavior-ubuntu.png
[3]: https://itsfoss.com/wp-content/uploads/2022/08/laptop-lid-settings-ubuntu.png
