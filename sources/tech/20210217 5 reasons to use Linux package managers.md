[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 reasons to use Linux package managers)
[#]: via: (https://opensource.com/article/21/2/linux-package-management)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 reasons to use Linux package managers
======
Package managers track all components of the software you install,
making updates, reinstalls, and troubleshooting much easier.
![Gift box opens with colors coming out][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Today, I'll talk about software repositories

Before I used Linux, I took the applications I had installed on my computer for granted. I would install applications as needed, and if I didn't end up using them, I'd forget about them, letting them languish as they took up space on my hard drive. Eventually, space on my drive would become scarce, and I'd end up frantically removing applications to make room for more important data. Inevitably, though, the applications would only free up so much space, and so I'd turn my attention to all of the other bits and pieces that got installed along with those apps, whether it was media assets or configuration files and documentation. It wasn't a great way to manage my computer. I knew that, but it didn't occur to me to imagine an alternative, because as they say, you don't know what you don't know.

When I switched to Linux, I found that installing applications worked a little differently. On Linux, you were encouraged not to go out to websites for an application installer. Instead, you ran a command, and the application was installed on the system, with every individual file, library, configuration file, documentation, and asset recorded.

### What is a software repository?

The default method of installing applications on Linux is from a distribution software repository. That might sound like an app store, and that's because modern app stores have borrowed much from the concept of software repositories. [Linux has app stores, too][2], but software repositories are unique. You get an application from a software repository through a _package manager_, which enables your Linux system to record and track every component of what you've installed.

Here are five reasons that knowing exactly what's on your system can be surprisingly useful.

#### 1\. Removing old applications

When your computer knows every file that was installed with any given application, it's really easy to uninstall files you no longer need. On Linux, there's no problem with installing [31 different text editors][3] only to later uninstall the 30 you don't love. When you uninstall on Linux, you really uninstall.

#### 2\. Reinstall like you mean it

Not only is an uninstall thorough, a _reinstall_ is meaningful. On many platforms, should something go wrong with an application, you're sometimes advised to reinstall it. Usually, nobody can say why you should reinstall an application. Still, there's often the vague suspicion that some file somewhere has become corrupt (in other words, data got written incorrectly), and so the hope is that a reinstall might overwrite the bad files and make things work again. It's not bad advice, but it's frustrating for any technician not to know what's gone wrong. Worse still, there's no guarantee, without careful tracking, that all files will be refreshed during a reinstall because there's often no way of knowing that all the files installed with an application were removed in the first place. With a package manager, you can force a complete removal of old files to ensure a fresh installation of new files. Just as significantly, you can account for every file and probably find out which one is causing problems, but that's a feature of open source and Linux rather than package management.

#### 3\. Keep your applications updated

Don't let anybody tell you that Linux is "more secure" than other operating systems. Computers are made of code, and we humans find ways to exploit that code in new and interesting ways every day. Because the vast majority of applications on Linux are open source, many exploits are filed publically as Common Vulnerability and Exposures (CVE). A flood of incoming security bug reports may seem like a bad thing, but this is definitely a case when _knowing_ is far better than _not knowing_. After all, just because nobody's told you that there's a problem doesn't mean that there's not a problem. Bug reports are good. They benefit everyone. And when developers fix security bugs, it's important for you to be able to get those fixes promptly, and preferably without having to remember to do it yourself.

A package manager is designed to do exactly that. When applications receive updates, whether it's to patch a potential security problem or introduce an exciting new feature, your package manager application alerts you of the available update.

#### 4\. Keep it light

Say you have application A and application B, both of which require library C. On some operating systems, by getting A and B, you get two copies of C. That's obviously redundant, so imagine it happening several times per application. Redundant libraries add up quickly, and by having no single source of "truth" for a given library, it's nearly impossible to ensure you're using the most up-to-date or even just a consistent version of it.

I admit I don't tend to sit around pondering software libraries all day, but I do remember the days when I did, even though I didn't know that's what was troubling me. Before I had switched to Linux, it wasn't uncommon for me to encounter errors when dealing with media files for work, or glitches when playing different video games, or quirks when reading a PDF, and so on. I spent a lot of time investigating these errors back then. I still remember learning that two major applications on my system each had bundled the same (but different) graphic backend technologies. The mismatch was causing errors when the output of one was imported into the other. It was meant to work, but because of a bug in an older version of the same collection of library files, a hotfix for one application didn't benefit the other.

A package manager knows what backends (referred to as a _dependency_) are needed for each application and refrains from reinstalling software that's already on your system.

#### 5\. Keep it simple

As a Linux user, I appreciate a good package manager because it helps make my life simple. I don't have to think about the software I install, what I need to update, or whether something's really been uninstalled when I'm finished with it. I audition software without hesitation. And when I'm setting up a new computer, I run [a simple Ansible script][4] to automate the installation of the latest versions of all the software I rely upon. It's simple, smart, and uniquely liberating.

### Better package management

Linux takes a holistic view of applications and the operating system. After all, open source is built upon the work of other open source, so distribution maintainers understand the concept of a dependency _stack_. Package management on Linux has an awareness of your whole system, the libraries and support files on it, and the applications you install. These disparate parts work together to provide you with an efficient, optimized, and robust set of applications.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-package-management

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: http://flathub.org
[3]: https://opensource.com/article/21/1/text-editor-roundup
[4]: https://opensource.com/article/20/9/install-packages-ansible
