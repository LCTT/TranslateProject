[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to submit a bug report with Bugzilla)
[#]: via: (https://opensource.com/article/19/3/bug-reporting)
[#]: author: (David Both (Community Moderator) https://opensource.com/users/dboth)

How to submit a bug report with Bugzilla
======

Submitting bug reports is an easy way to give back and it helps everyone.

![][1]

I spend a lot of time doing research for my books and [Opensource.com][2] articles. Sometimes this leads me to discover bugs in the software I use, including Fedora and the Linux kernel. As a long-time Linux user and sysadmin, I have benefited greatly from GNU/Linux, and I like to give back. I am not a C language programmer, so I don't create fixes and submit them with bug reports, as some people do. But a way I can return some value to the Linux community is by reporting bugs.

Product maintainers use a lot of tools to let their users search for existing bugs and report new ones. Bugzilla is a popular tool, and I use the Red Hat [Bugzilla][3] website to report Fedora-related bugs because I primarily use Fedora on the systems I'm responsible for. It's an easy process, but it may seem daunting if you have never done it before. So let's start with the basics.

### Start with a search

Even though it's tempting, never assume that seemingly anomalous behavior is the result of a bug. I always start with a search of relevant websites, such as the [Fedora wiki][4], the [CentOS wiki][5], and the documentation for the distro I'm using. I also try to check the various distro listservs.

If it appears that no one has encountered this problem before (or if they have, they haven't reported it as a bug), I go to the Red Hat Bugzilla site and begin searching for a bug report that might come close to matching the symptoms I encountered.

You can search the Red Hat Bugzilla site without an account. Go to the Bugzilla site and click on the [Advanced Search tab][6].

![Searching for a bug][7]

For example, if you want to search for bug reports related to Fedora's Rescue mode kernel, enter the following data in the Advanced Search form.

Field | Logic | Data or Selection
---|---|---
Summary | Contains the string | Rescue mode kernel
Classification |  | Fedora
Product |  | Fedora
Component |  | grub2
Status |  | New + Assigned

Then press **Search**. This returns a list of one bug with the ID 1654337 (which happens to be a bug I reported).

![Bug report list][8]

Click on the ID to view my bug report details. I entered as much relevant data as possible in the top section of the report. In the comments, I described the problem and included supporting files, other relevant comments (such as the fact that the problem occurred on multiple motherboards), and the steps to reproduce the problem.

![Bug report details][9]

The more information you can provide here that pertains to the bug, such as symptoms, the hardware and software environments (if they are applicable), other software that was running at the time, kernel and distro release levels, and so on, the easier it will be to determine where to assign your bug. In this case, I originally chose the kernel component, but it was quickly changed to the GRUB2 component because the problem occurred before the kernel loaded.

### How to submit a bug report

The Red Hat [Bugzilla][3] website requires an account to submit new bugs or comment on old ones. It is easy to sign up. On Bugzilla's main page, click **Open a New Account** and fill in the requested information. After you verify your email address, you can fill in the rest of the information to create your account.

_**Advisory:**_ _Bugzilla is a working website that people count on for support. I strongly suggest not creating an account unless you intend to submit bug reports or comment on existing bugs._

To demonstrate how to submit a bug report, I'll use a fictional example of creating a bug against the Xfce4-terminal emulator in Fedora. _Please do not do this unless you have a real bug to report._

Log into your account and click on **New** in the menu bar or the **File a Bug** button. You'll need to select a classification for the bug to continue the process. This will narrow down some of the choices on the next page.

The following image shows how I filled out the required fields (and a couple of others that are not required).

![Reporting a bug][10]

When you type a short problem description in the **Summary** field, Bugzilla displays a list of other bugs that might match yours. If one matches, click **Add Me to the CC List** to receive emails when changes are made to the bug.

If none match, fill in the information requested in the **Description** field. Add as much information as you can, including error messages and screen captures that illustrate the problem. Be sure to describe the exact steps needed to reproduce the problem and how reproducible it is: does it fail every time, every second, third, fourth, random time, or whatever. If it happened only once, it's very unlikely anyone will be able to reproduce the problem you observed.

When you finish adding as much information as you can, press **Submit Bug**.

### Be kind

Bug reporting websites are not for asking questions—they are for searching and reporting bugs. That means you must have performed some work on your own to conclude that there really is a bug. There are many wikis, listservs, and Q&A websites that are appropriate for asking questions. Use sites like Bugzilla to search for existing bug reports on the problem you have found.

Be sure you submit your bugs on the correct bug reporting website. For example, only submit bugs about Red Hat products on the Red Hat Bugzilla, and submit bugs about LibreOffice by following [LibreOffice's instructions][11].

Reporting bugs is not difficult, and it is an important way to participate.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/bug-reporting

作者：[David Both (Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug-insect-butterfly-diversity-inclusion-2.png?itok=TcC9eews
[2]: http://Opensource.com
[3]: https://bugzilla.redhat.com/
[4]: https://fedoraproject.org/wiki/
[5]: https://wiki.centos.org/
[6]: https://bugzilla.redhat.com/query.cgi?format=advanced
[7]: https://opensource.com/sites/default/files/uploads/bugreporting-1.png (Searching for a bug)
[8]: https://opensource.com/sites/default/files/uploads/bugreporting-2.png (Bug report list)
[9]: https://opensource.com/sites/default/files/uploads/bugreporting-4.png (Bug report details)
[10]: https://opensource.com/sites/default/files/uploads/bugreporting-3.png (Reporting a bug)
[11]: https://wiki.documentfoundation.org/QA/BugReport
