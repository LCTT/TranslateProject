CPU Power Manager – Control And Manage CPU Frequency In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Manage-CPU-Frequency-720x340.jpeg)

If you are a laptop user, you probably know that power management on Linux isn’t really as good as on other OSes. While there are tools like **TLP** , [**Laptop Mode Tools** and **powertop**][1] to help reduce power consumption, overall battery life on Linux isn’t as good as Windows or Mac OS. Another way to reduce power consumption is to limit the frequency of your CPU. While this is something that has always been doable, it generally requires complicated terminal commands, making it inconvenient. But fortunately, there’s a gnome extension that helps you easily set and manage your CPU’s frequency – **CPU Power Manager**. CPU Power Manager uses the **intel_pstate** frequency scaling driver (supported by almost every Intel CPU) to control and manage CPU frequency in your GNOME desktop.

Another reason to use this extension is to reduce heating in your system. There are many systems out there which can get uncomfortably hot in normal usage. Limiting your CPU’s frequency could reduce heating. It will also decrease the wear and tear on your CPU and other components.

### Installing CPU Power Manager

First, go to the [**extension’s page**][2], and install the extension.

Once the extension has installed, you’ll get a CPU icon at the right side of the Gnome top bar. Click the icon, and you get an option to install the extension:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager-icon.png)

If you click **“Attempt Installation”** , you’ll get a password prompt. The extension needs root privileges to add policykit rule for controlling CPU frequency. This is what the prompt looks like:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager-1.png)

Type in your password and Click **“Authenticate”** , and that finishes installation. The last action adds a policykit file – **mko.cpupower.setcpufreq.policy** at **/usr/share/polkit-1/actions**.

After installation is complete, if you click the CPU icon at the top right, you’ll get something like this:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager.png)

### Features

  * **See the current CPU frequency:** Obviously, you can use this window to see the frequency that your CPU is running at.
  * **Set maximum and minimum frequency:** With this extension, you can set maximum and minimum frequency limits in terms of percentage of max frequency. Once these limits are set, the CPU will operate only in this range of frequencies.
  * **Turn Turbo Boost On and Off:** This is my favorite feature. Most Intel CPU’s have “Turbo Boost” feature, whereby the one of the cores of the CPU is boosted past the normal maximum frequency for extra performance. While this can make your system more performant, it also increases power consumption a lot. So if you aren’t doing anything intensive, it’s nice to be able to turn off Turbo Boost and save power. In fact, in my case, I have Turbo Boost turned off most of the time.
  * **Make Profiles:** You can make profiles with max and min frequency that you can turn on/off easily instead of fiddling with max and frequencies.



### Preferences

You can also customize the extension via the preferences window:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager-preferences.png)

As you can see, you can set whether CPU frequency is to be displayed, and whether to display it in **Mhz** or **Ghz**.

You can also edit and create/delete profiles:

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager-preferences-1.png)

You can set maximum and minimum frequencies, and turbo boost for each profile.

### Conclusion

As I said in the beginning, power management on Linux is not the best, and many people are always looking to eek out a few minutes more out of their Linux laptop. If you are one of those, check out this extension. This is a unconventional method to save power, but it does work. I certainly love this extension, and have been using it for a few months now.

What do you think about this extension? Put your thoughts in the comments below!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cpu-power-manager-control-and-manage-cpu-frequency-in-linux/

作者：[EDITOR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[1]: https://www.ostechnix.com/improve-laptop-battery-performance-linux/
[2]: https://extensions.gnome.org/extension/945/cpu-power-manager/
