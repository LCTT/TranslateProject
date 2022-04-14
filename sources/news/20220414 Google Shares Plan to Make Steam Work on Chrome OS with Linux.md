[#]: subject: "Google Shares Plan to Make Steam Work on Chrome OS with Linux"
[#]: via: "https://news.itsfoss.com/chromeos-steam-linux/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Google Shares Plan to Make Steam Work on Chrome OS with Linux
======

Yes, Steam will be coming to Chrome OS soon.

Thanks to Linux for making that possible. But how? Let’s find out.

Google recently announced that they are working on Steam for Chrome OS Alpha.

Now, in a new blog post, Google revealed that they would be sharing more technical details on how they’re making it possible or its progress for developers and users.

It looks like we have some significant information on how Linux helps enable Steam for Chrome OS users. Let me briefly explain what it is all about.

### Steam on ChromeOS Using a Virtual Machine

![][1]

Fret not, you do not need to create a Linux virtual machine from within Chrome OS to access Steam and play games. However, that is the underlying technology being used.

Google utilizes a virtual machine based on a modified Arch Linux image code named “**Borealis**” to run Steam. In this way, users can enable Steam games without affecting the existing functionalities/features of Chrome OS.

This also ensures that if a game works on Linux, it will work well with Borealis. Developers do not have to put additional effort into making their games work on Chrome OS.

Hence, it should be a big win for developers, considering Chrome OS has a major share of the market when compared to Linux desktops and macOS (reference: [Statista][2]).

### Here’s How It Works

![][1]

Technically, with a VM, they get an additional layer of security while keeping things uncomplicated. Games do not have direct access to the host hardware/files, so you do not worry about extras when using Steam on Chrome OS.

By default, you do not get the VM installed. If a user chooses to install Steam, the VM image is downloaded using Chrome OS’s [Downloadable Content (DLC) system][3].

And it is entirely invisible to the user side. You have to install Steam and interact with it to install/manage games without needing to peek at what’s under the hood.

It is obvious to worry about the performance if this is the case. However, Google claims that they have put their best efforts to ensure a near-native performance with the Vulkan virtualization driver and OpenGL.

### Updating the Virtual Machine with Chrome OS

To make sure that the game gets the latest Mesa graphics library, drivers, and dependencies, you will need to update the virtual machine, right?

So, how does that work?

Fortunately, Google plans to update those packages along with Chrome OS updates. So, you can be sure that you always have the latest packages without compatibility issues when running games on Steam.

### Exciting Times, More Technical Insights

Everything looks good on paper; however, I would be skeptical about the performance claims until I see their results.

Considering Arch Linux makes it possible, the gaming ecosystem on Linux seems to be getting a boost, with potentially new users utilizing it without even knowing about it.

That’s what makes it more exciting for the end-users, I think.

You can go through the [official blog post][4] to explore more and what it means for the developers.

_What are your thoughts about Steam running on Chrome OS? Let me know in the comments below._

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/chromeos-steam-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY3NSIgd2lkdGg9IjEyMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[2]: https://www.statista.com/chart/24228/desktop-operating-system-market-share/
[3]: https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/dlcservice/docs/developer.md
[4]: https://chromeos.dev/en/posts/bringing-steam-to-chromeos
