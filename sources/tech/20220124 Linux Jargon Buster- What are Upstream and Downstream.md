[#]: subject: "Linux Jargon Buster: What are Upstream and Downstream?"
[#]: via: "https://itsfoss.com/upstream-and-downstream-linux/"
[#]: author: "Bill Dyer https://itsfoss.com/author/bill/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Jargon Buster: What are Upstream and Downstream?
======

The terms: _upstream_ and _downstream_ are rather ambiguous terms and, I think, not really used by the general public. If you are a Linux user and do not write or maintain software, chances are pretty good that these terms will mean nothing to you, but they can be instructive in how communication between groups within the Linux world works.

The terms are used in networking, programming, kernel, and even in non-computer areas such as supply chains. When we talk about upstream and downstream then, context is important.

In its simplest form, upstream and downstream is the direction of the flow of information.

Since we are all reading this article while we’re connected to the Internet, let’s look at an upstream/downstream example as it applies to Internet Service Providers (ISP). Here, the ISP is concerned with traffic. Upstream traffic is data is coming in from a user from a different ISP. For example, if you have a website that offers a subscription to a newsletter, the information I send, to subscribe, is upstream data.

Downstream traffic is data that is sent from a user to another user at a different ISP, then it is considered as downstream traffic. Using the same subscription example, let’s assume that my request to subscribe is approved and I get a “welcome” note in one email and the latest newsletter in another email. In this case, the data is downstream as it is sent by you (well, probably automated software operating as a representative of you) to me, a user from a different ISP.

Summing up: the thing I need or want (your newsletter) is upstream. The things you provide to me (the welcome note and actual newsletter) come to me, downstream.

Whether data is upstream or downstream is probably unimportant to us as users, but it is important to the server administrators who monitor bandwidth usage, as well as to distributors, and application programmers.

In the Linux world, upstream and downstream have two main contexts. One is concerned with the kernel and the other is concerned with applications. There are others, but I hope that I can get the idea across with these two.

### Upstream and downstream in the context of Linux kernel

![][1]

Linux _is_ the kernel. In creating a distribution (often called a “distro”), Linux distributions initially use the source code from an unmodified kernel. Necessary patches are added and then the kernel is configured. The kernel’s configuration is based upon what features and options the distribution wants to offer. Once decided upon, the kernel is created accordingly.

The original kernel is upstream from the distribution. When the distribution gets the source code, it flows downstream. Once the distribution has the code it stays with the makers of the distribution while work is being done on it. It is still upstream from us, as users, until it is ready for release.

The kernel version that the distribution creates will have patches added and certain features and options enabled. This configuration is determined by the distro builder. This is why there are several flavors of Linux: [Debian][2] vs. [Red Hat][3], for example. The builder of the distro decides on the options to offer to their user base, and compiles the kernel accordingly.

Once that work is completed, it is made ready for release in a repository and we’re allowed to grab a copy. That copy flows downstream to us.

Similarly, if the distributor finds a bug in the kernel, fixes it and then sends the patch to the kernel developers so that they could patch the kernel for everyone downstream. This is called contributing to upstream because here the flow is going upwards to the original source.

### Upstream and downstream in the context of applications

Again, technically, Linux is the kernel, everything else is additional software. The distro builder also adds additional software to their project. In this case, there are several upstreams. A distro can contain any number of applications such as X, KDE, Gnome, and so on.

Let’s imagine that you are using the [nano][4] editor and discover that it isn’t working right so you submit a bug report to the distributor. The programmers working on the distro will look at it and, if they find that they inserted a bug into nano, they will fix it and make a new release available in their repository. If they find that they didn’t make the bug, the distributor will submit a bug report upstream to the nano programmer.

When it comes to things like bug reports, feature requests, etc. it is always best to send them upstream to your distributor since they maintain the kernel and additional applications for the distro you’re using. For example, I use a distro called [Q4OS][5] on a few machines. If I find a bug in a program, I report it to the Q4OS folks. If you happen to be using, say, [Mint][6], you would report it to the Mint project.

If you were to post a problem on a generic Linux board, for example, and you mentioned that you were using Mint, you will surely get a reply that says something like: “This is better handled in a Mint forum.” Using the previous “nano bug” example, it’s possible that the Mint programmers made a change to nano to make it work better in their distro. If they did make a mistake, they would want to know about it and, having made the mistake, they would be the ones to fix it.

Once fixed, the updated program is put into a repository available to you. When you get the update, it comes downstream to you, like so:

  * If a distributor makes the fix, the new version is made available in the distro repository
  * If the programmer of the application makes the fix, it is sent downstream to the distributors who test the new code. Once it’s found to be working right, it is placed in the repository, to flow downstream to you



### Automatic flow downstream

There was a time, when users had to get their own updates. A user would get the updated source code and compile a new executable. As time went on, utilities like apt were created to allow users to pull updated binaries (executables) from the repositories. The apt program is Debian, but other distros have their own, similar program for this.

Programs like apt take care of the upstream/downstream work. If you ran apt with the upgrade option like so:

`sudo apt upgrade`

it would look (upstream) to the distro repository, find any needed updated packages and pull them (downstream) to your machine and install them.

Some distros take this further. Distro programmers and maintainers are always checking over their product. Often times, an application programmer will make improvements to their program. System libraries are updated frequently, security holes get plugged, and so on. These updates are made available to the distributors who then make the new version available in the distro’s repository.

Rather than have you run apt every day, some distros will alert you to updates that are available and ask if you want them. If you want then, just accept and the updates will be sent downstream to your machine and installed.

### Conclusion

I just remembered a bit of my history, having mentioned Red Hat. Back in 1994 or 1995, they placed a job ad and one of the cool workplace benefits listed was, “all the free peanut M&amp;Ms you could eat and all the free Dr. Pepper you could drink.” I had no doubt that I could do the work, and I applied just for those two benefits alone. I didn’t get a call though.

Oh well. Getting back to the point…

Upstream and downstream is really just the direction of data flow. How far upstream or downstream this data flows depends on who ultimately needs to work on it. Basically, the programmers are upstream and the users are downstream.

Again, as users, we really don’t need to be worried about these terms, but the concepts do help in the development and maintenance of software. By being able to direct the work to the appropriate group, duplicate work is avoided. It also ensures that a standard is maintained. The Chrome browser, for example, might need slight changes made to it in order to work on a certain distro, but it will be Chrome at its core – it will look and act like Chrome.

If you do find a bug with any program in your distro, just report it to your distro’s maintainers, which is usually done through their website. You’ll be sending it upstream to them, but it doesn’t matter whether you remember that you’re sending the report upstream.

--------------------------------------------------------------------------------

via: https://itsfoss.com/upstream-and-downstream-linux/

作者：[Bill Dyer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/bill/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/upstream-downstream.png?resize=800%2C450&ssl=1
[2]: https://www.debian.org/
[3]: https://www.redhat.com/
[4]: https://www.nano-editor.org/
[5]: https://q4os.org/
[6]: https://linuxmint.com/
