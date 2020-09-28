[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Use the Firefox Task Manager (to Find and Kill RAM and CPU Eating Tabs and Extensions))
[#]: via: (https://itsfoss.com/firefox-task-manager/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

How to Use the Firefox Task Manager (to Find and Kill RAM and CPU Eating Tabs and Extensions)
======

Firefox is popular among Linux users. It is the default web browser on several Linux distributions.

Among many other features, Firefox provides a task manager of its own.

Now, why would you use it when you have [task manager in Linux][1] in the form of [system monitoring tools][2]? There is a good reason for that.

Suppose your system is taking too much of RAM or CPU. If you use top or some other system [resource monitoring tool like Glances][3], you’ll notice that these tools cannot distinguish the opened tabs or extensions.

Usually, each Firefox tab is displayed as **Web Content**. You can see that some Firefox process is causing the issue but that’s no way to accurately determine which tab or extension it is.

This is where you can use the Firefox task manager. Let me show you how!

### Firefox Task Manager

With Firefox Task Manager, you will be able to list all the tabs, trackers, and add-ons consuming system resources.

![][4]

As you can see in the screenshot above, you get the name of the tab, the type (tab or add-on), the energy impact, and the memory consumed.

While everything is self-explanatory, the **energy impact refers to the CPU usage** and if you are using a Laptop, it is a good indicator to show you what will drain the battery quicker.

#### Access Task Manager in Firefox

Surprisingly, there is no [Firefox keyboard shortcut][5] for the task manager.

To quickly launch Firefox Task Manager, you can type “**about:performance**” in the address bar as shown in the screenshot below.

![Quickly access task manager in Firefox][6]

Alternatively, you can click on the **menu** icon and then head on to “**More**” options as shown in the screenshot below.

![Accessing task manager in Firefox][7]

Next, you will find the option to select “**Task Manager**” — so just click on it.

![][8]

#### Using Firefox task manager

Once there, you can check for the resource usage, expand the tabs to see the trackers and its usage, and also choose to close the tabs right there as highlighted in the screenshot below.

![][9]

Here’s what you should know:

  * Energy impact means CPU consumption.
  * The subframes or the subtasks are usually the trackers/scripts associated with a tab that needs to run in the background.



With this task manager, you can spot a rogue script on a site as well whether it’s causing your browser to slow down.

This isn’t rocket-science but not many people are aware of Firefox task manager. Now that you know it, this should come in pretty handy, don’t you think?

--------------------------------------------------------------------------------

via: https://itsfoss.com/firefox-task-manager/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/task-manager-linux/
[2]: https://itsfoss.com/linux-system-monitoring-tools/
[3]: https://itsfoss.com/glances/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-task-manager-shot.png?resize=800%2C519&ssl=1
[5]: https://itsfoss.com/firefox-keyboard-shortcuts/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-url-performance.jpg?resize=800%2C357&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-task-manager-steps.jpg?resize=800%2C779&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-task-manager-menu.jpg?resize=800%2C465&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/firefox-task-manager-close-tab.png?resize=800%2C496&ssl=1
