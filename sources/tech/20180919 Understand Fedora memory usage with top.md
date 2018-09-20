Understand Fedora memory usage with top
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/memory-top-816x345.jpg)

Have you used the top utility in a terminal to see memory usage on your Fedora system? If so, you might be surprised to see some of the numbers there. It might look like a lot more memory is consumed than your system has available. This article will explain a little more about memory usage, and how to read these numbers.

### Memory usage in real terms

The way the operating system (OS) uses memory may not be self-evident. In fact, some ingenious, behind-the-scenes techniques are at play. They help your OS use memory more efficiently, without involving you.

Most applications are not self contained. Instead, each relies on sets of functions collected in libraries. These libraries are also installed on the system. In Fedora, the RPM packaging system ensures that when you install an app, any libraries on which it relies are installed, too.

When an app runs, the OS doesn’t necessarily load all the information it uses into real memory. Instead, it builds a map to the storage where that code is stored, called virtual memory. The OS then loads only the parts it needs. When it no longer needs portions of memory, it might release or swap them out as appropriate.

This means an app can map a very large amount of virtual memory, while using less real memory on the system at one time. It might even map more RAM than the system has available! In fact, across a whole OS that’s often the case.

In addition, related applications may rely on the same libraries. The Linux kernel in your Fedora system often shares memory between applications. It doesn’t need to load multiple copies of the same library for related apps. This works similarly for separate instances of the same app, too.

Without understanding these details, the output of the top application can be confusing. The following example will clarify this view into memory usage.

### Viewing memory usage in top

If you haven’t tried yet, open a terminal and run the top command to see some output. Hit **Shift+M** to see the list sorted by memory usage. Your display may look slightly different than this example from a running Fedora Workstation:

<https://fedoramagazine.org/wp-content/uploads/2018/09/Screenshot-from-2018-09-17-14-23-17.png>

There are three columns showing memory usage to examine: VIRT, RES, and SHR. The measurements are currently shown in kilobytes (KB).

The VIRT column is the virtual memory mapped for this process. Recall from the earlier description that virtual memory is not actual RAM consumed. For example, the GNOME Shell process gnome-shell is not actually consuming over 3.1 gigabytes of actual RAM. However, it’s built on a number of lower and higher level libraries. The system must map each of those to ensure they can be loaded when necessary.

The RES column shows you how much actual (resident) memory is consumed by the app. In the case of GNOME Shell, that’s about 180788 KB. The example system has roughly 7704 MB of physical memory, which is why the memory usage shows up as 2.3%.

However, of that number, at least 88212 KB is shared memory, shown in the SHR column. This memory might be, for example, library functions that other apps also use. This means the GNOME Shell is using about 92 MB on its own not shared with other processes. Notice that other apps in the example share an even higher percentage of their resident memory. In some apps, the shared portion is the vast majority of the memory usage.

There is a wrinkle here, which is that sometimes processes communicate with each other via memory. That memory is also shared, but can’t necessarily be detected by a utility like top. So yes — even the above clarifications still have some uncertainty!

### A note about swap

Your system has another facility it uses to store information, which is swap. Typically this is an area of slower storage (like a hard disk). If the physical memory on the system fills up as needs increase, the OS looks for portions of memory that haven’t been needed in a while. It writes them out to the swap area, where they sit until needed later.

Therefore, prolonged, high swap usage usually means a system is suffering from too little memory for its demands. Sometimes an errant application may be at fault. Or, if you see this often on your system, consider upgrading your machine’s memory, or restricting what you run.

Photo courtesy of [Stig Nygaard][1], via [Flickr][2] (CC BY 2.0).


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/understand-fedora-memory-usage-top/

作者：[Paul W. Frields][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[1]: https://www.flickr.com/photos/stignygaard/
[2]: https://www.flickr.com/photos/stignygaard/3138001676/
