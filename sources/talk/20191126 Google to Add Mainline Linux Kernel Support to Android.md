[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Google to Add Mainline Linux Kernel Support to Android)
[#]: via: (https://itsfoss.com/mainline-linux-kernel-android/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Google to Add Mainline Linux Kernel Support to Android
======

The current Android ecosystem is polluted with hundreds of different versions of Android, each running a different variant of the Linux kernel. Each version is designed for a different phone and it’s different configurations. Google has been working to fix the problem by adding the mainline Linux kernel to Android.

### How the Linux kernel is currently handled in Android

Before it reaches you, the Linux kernel on your cellphone goes through [three major steps][1].

First, Google takes the LTS (Long Term Support) version of the Linux kernel and adds all of the Android-specific code. This becomes the “Android Common kernel”.

Google then sends this code to the company that creates the System on a Chip (SoC) that runs your phone. This is usually Qualcomm.

Once the SoC maker finishes add code to support the CPU and other chips, the kernel is then passed on to the actual device maker, such as Samsung or Motorola. The device maker then adds code to support the rest of the phone, such as the display and camera.

Each of these steps takes a while to complete and results in a kernel that won’t work with any other device. It also means that the kernel is very old, usually about two years old. For example, the Google Pixel 4, which shipped last month, has a kernel from November 2017, which will never get updated.

Google has pledged to create security patches for older devices, which means they’re stuck keeping an eye on a huge hodge-podge of old code.

### The Future

![][2]

Last year, Google announced [plans][3] to fix this mess. This year they revealed what progress they made at the 2019 Linux Plumbers Conference.

> “We know what it takes to run Android but not necessarily on any given hardware. So our goal is to basically find all of that out, then upstream it and try to be as close to mainline as possible.”
>
> Sandeep Patil, [Android Kernel Team Lead][1]

They did show off a Xiaomi Poco F1 running Android with a proper Linux kernel. However, it some things did not [appear to be working][4], such as the battery percentage which was stuck at 0%.

So, how does Google plan to make this work? By taking a page from their [Project Treble][5] playbook. Before Project Treble, the low-level code that interacted with the device and Android itself was one big mess of code. Project Treble separated the two and made them modular so that Android updates could be shipped quicker and the low-level code could remain unchanged between updates.

Google wants to bring the same modularity to the kernel. Their [plan][1] “involves stabilizing Linux’s in-kernel ABI and having a stable interface for the Linux kernel and hardware vendors to write to. Google wants to decouple the Linux kernel from its hardware support.”

So this means that Google would ship a kernel and hardware drivers would be loaded as kernel modules. Currently, this is just a proposal. There are still quite a few technical problems that have to be solved. so, this won’t happen any time soon.

### Opposition from Open Source

The Open Source community will not be happy with the idea of putting proprietary code in the kernel. The [Linux kernel guidelines][6] state that drivers have to have a GPL license to be included in the kernel. They also point out that if a change in the driver causes an error, it will be resolved by the person who created the error. This means less work for device makers in the long run.

### Final Thoughts on including mainline kernel to Andorid

So far, this is just a proposal. There is a good chance that Google will start working on the project only to abandon it once they realize how much work this will take. Just take a look at how many projects Google has [already abandoned][7].

[Android Police][4] made a good point by mentioned that Google is working on its [Fuchsia operating system][8], which seems to have the goal of replacing Android one day.

So, the question is which monumental task will Google try to complete, getting Android running with a mainline Linux kernel or complete work on their unified Android replacement? Only time can answer that.

What are your thoughts on this topic? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][9].

--------------------------------------------------------------------------------

via: https://itsfoss.com/mainline-linux-kernel-android/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://arstechnica.com/gadgets/2019/11/google-outlines-plans-for-mainline-linux-kernel-support-in-android/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/mainline_linux_kernel_android.png?ssl=1
[3]: https://lwn.net/Articles/771974/
[4]: https://www.androidpolice.com/2019/11/19/google-wants-android-to-use-regular-linux-kernel-potentially-improving-updates-and-security/
[5]: https://www.computerworld.com/article/3306443/what-is-project-treble-android-upgrade-fix-explained.html
[6]: https://www.kernel.org/doc/Documentation/process/stable-api-nonsense.rst
[7]: https://killedbygoogle.com/
[8]: https://itsfoss.com/fuchsia-os-what-you-need-to-know/
[9]: https://reddit.com/r/linuxusersgroup
