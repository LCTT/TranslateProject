[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Hegemon – A Modular System And Hardware Monitoring Tool For Linux)
[#]: via: (https://www.2daygeek.com/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Hegemon – A Modular System And Hardware Monitoring Tool For Linux
======

I know that everybody is preferring for **[TOP Command][1]** to monitor system utilization.

It’s one of the best and native command which used by vast of Linux administrators.

In Linux there is an alternative for everything respective of packages.

There are many utilities are available for this purpose in Linux and i prefer **[HTOP Command][2]**.

If you want to know about other alternatives, i would suggest you to navigate to the each link to know more about it.

Those are htop, CorFreq, glances, atop, Dstat, Gtop, Linux Dash, Netdata, Monit, etc.

All these tools only allow us to monitor system utilization and not for the system hardware’s.

But Hegemon is allow us to monitor both in the single dashboard.

If you are looking for system hardware monitoring then i would suggest you to check **[lm_sensors][3]** and **[s-tui Stress Terminal UI][4]** utilities.

### What’s Hegemon?

Hegemon is a work-in-progress modular system monitor written in safe Rust.

It allow users to monitor both utilization in a single dashboard. It’s system utilization and hardware temperatures.

### Currently Available Features in Hegemon

  * Monitor CPU and memory usage, temperatures, and fan speeds
  * Expand any data stream to reveal a more detailed graph and additional information
  * Adjustable update interval
  * Clean MVC architecture with good code quality
  * Unit tests



### Planned Features include

  * macOS and BSD support (only Linux is supported at the moment)
  * Monitor disk and network I/O, GPU usage (maybe), and more
  * Select and reorder data streams
  * Mouse control



### How to Install Hegemon in Linux?

Hegemon is requires Rust 1.26 or later and the development files for libsensors. So, make sure these packages were installed before your perform Hegemon installation.

libsensors library package is available in most of the distribution official repository so, use the following command to install it.

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][5]** or **[APT Command][6]** to install libsensors on your systems.

```
# apt install lm_sensors-devel
```

For **`Fedora`** system, use **[DNF Package Manager][7]** to install libsensors on your system.

```
# dnf install libsensors4-dev
```

Run the following command to install Rust programming language and follow the instruction. Navigate to the following URL if you want handy tutorials for **[Rust installation][8]**.

```
$ curl https://sh.rustup.rs -sSf | sh
```

If you have successfully installed Rust. Run the following command to install Hegemon.

```
$ cargo install hegemon
```

### How to Lunch Hegemon in Linux?

Once you successfully install Hegemon package. Run run the below command to launch it.

```
$ hegemon
```

![][10]

I was facing an issue when i was launching the “Hegemon” application due to libsensors.so.4 libraries issue.

```
$ hegemon
error while loading shared libraries: libsensors.so.4: cannot open shared object file: No such file or directory manjaro
```

I’m using Manjaro 18.04. It has the libsensors.so & libsensors.so.5 shared libraries and not for libsensors.so.4. So, i just created the following symlink to fix the issue.

```
$ sudo ln -s /usr/lib/libsensors.so /usr/lib/libsensors.so.4
```

Here is the sample gif file which was taken from my Lenovo-Y700 laptop.
![][11]

By default it shows only overall summary and if you would like to see the detailed output then you need to expand the each section. See the expanded output with Hegemon.
![][12]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/top-command-examples-to-monitor-server-performance/
[2]: https://www.2daygeek.com/linux-htop-command-linux-system-performance-resource-monitoring-tool/
[3]: https://www.2daygeek.com/view-check-cpu-hard-disk-temperature-linux/
[4]: https://www.2daygeek.com/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency/
[5]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[7]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[8]: https://www.2daygeek.com/how-to-install-rust-programming-language-in-linux/
[9]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]: https://www.2daygeek.com/wp-content/uploads/2019/01/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux-1.png
[11]: https://www.2daygeek.com/wp-content/uploads/2019/01/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux-2a.gif
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux-3.png
