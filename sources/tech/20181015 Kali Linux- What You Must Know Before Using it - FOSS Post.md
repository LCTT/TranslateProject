Translating by MjSeven


Kali Linux: What You Must Know Before Using it – FOSS Post
======
![](https://i1.wp.com/fosspost.org/wp-content/uploads/2018/10/kali-linux.png?fit=1237%2C527&ssl=1)

Kali Linux is the industry’s leading Linux distribution in penetration testing and ethical hacking. It is a distribution that comes shipped with tons and tons of hacking and penetration tools and software by default, and is widely recognized in all parts of the world, even among Windows users who may not even know what Linux is.

Because of the latter, many people are trying to get alone with Kali Linux although they don’t even understand the basics of a Linux system. The reasons may vary from having fun, faking being a hacker to impress a girlfriend or simply trying to hack the neighbors’ WiFi network to get a free Internet, all of which is a bad thing to do if you are planning to use Kali Linux.

Here are some tips that you should know before even planning to use Kali Linux

### Kali Linux is Not for Beginners

![](https://i0.wp.com/fosspost.org/wp-content/uploads/2018/10/Kali-Linux-000.png?resize=850%2C478&ssl=1)
Kali Linux Default GNOME Desktop

If you are someone who has just started to use Linux few months ago, or if you are don’t consider yourself to be above average in terms of knowledge, then Kali Linux is not for you. If you are going to ask stuff like “How do I install Steam on Kali? How do I make my printer work on Kali? How do I solve the APT sources error on Kali”? Then Kali Linux is not suitable for you.

Kali Linux is mainly made for professionals wanting to run penetration testing suits or people who want to learn ethical hacking and digital forensics. But even if you were from the latter, the average Kali Linux user is expected to face a lot of trouble while using Kali Linux for his day-to-day usage. He’s also expected to take a very careful approach to how he uses the tools and software, it’s not just “let’s install it and run everything”. Every tool must be carefully used, every software you install must be carefully examined.

**Good Read:** [What are the components of a Linux system?][1]

Stuff which the average Linux user can’t do normally. A better approach would be to spend few weeks learning about Linux and its daemons, services, software, distributions and the way it works, and then watch few dozens of videos and courses about ethical hacking, and only then, try to use Kali to apply what you learned.

### it Can Get You Hacked

![](https://i0.wp.com/fosspost.org/wp-content/uploads/2018/10/Kali-Linux-001.png?resize=850%2C478&ssl=1)
Kali Linux Hacking & Testing Tools

In a normal Linux system, there’s one account for normal user and one separate account for root. This is not the case in Kali Linux. Kali Linux uses the root account by default and doesn’t provide you with a normal user account. This is because almost all security tools available in Kali do require root privileges, and to avoid asking you for root password every minute, they designed it that way.

Of course, you could simply create a normal user account and start using it. Well, it’s still not recommended because that’s not how the Kali Linux system design is meant to work. You’ll face a lot of problems then in using programs, opening ports, debugging software, discovering why this thing doesn’t work only to discover that it was a weird privilege bug. You will also be annoyed by all the tools that will require you to enter the password each time you try to do anything on your system.

Now, since you are forced to use it in as a root user, all the software you run on your system will also run with root privileges. This is bad if you don’t know what you are doing, because if there’s a vulnerability in Firefox for example and you visit one of the infected dark web sites, the hacker will be able to get full root permissions on your PC and hack you, which would have been limited if you were using a normal user account. Also, some tools that you may install and use can open ports and leak information without your knowledge, so if you are not extremely careful, people can hack you in the same way you may try to hack them.

If you visit Facebook groups related to Kali Linux on few occasions, you’ll notice that almost a quarter of the posts in these groups are people calling for help because someone hacked them.

### it Can Get You in Jail

Kali Linux provide the software as it is. Then, it is your own responsibility alone of how you use them.

In most advanced countries around the world, using penetration testing tools against public WiFi networks or the devices of others can easily get you in jail. Now don’t think that you can’t be tracked just because you are using Kali, many systems are configured to have complex logging devices to simply track whoever tries to listen or hack their networks, and you may stumble upon one of these, and it will destroy you life.

Don’t ever use Kali Linux tools against devices/networks which do not belong to you or given explicit permission to try hacking them. If you say that you didn’t know what you were doing, it won’t be accepted as an excuse in a court.

### Modified Kernel and Software

Kali is [based][2] on Debian (Testing branch, which means that Kali Linux uses a rolling release model), so it uses most of the software architecture from there, and you will find most of the software in Kali Linux just as they are in Debian.

However, some packages were modified to harden security and fix some possible vulnerabilities. The Linux kernel that Kali uses for example is patched to allow wireless injection on various devices. These patches are not normally available in the vanilla kernel. Also, Kali Linux does not depend on Debian servers and mirrors, but builds the packages by its own servers. Here’s the default software sources in the latest release:

```
    deb http://http.kali.org/kali kali-rolling main contrib non-free
    deb-src http://http.kali.org/kali kali-rolling main contrib non-free
```

That’s why, for some specific software, you will find a different behaviour when using the same program in Kali Linux or using it in Fedora, for example. You can see a full list of Kali Linux software from [git.kali.org][3]. You can also find our [own generated list of installed packages][4] on Kali Linux (GNOME).

More importantly, Kali Linux official documentation extremely suggests to NOT add any other 3rd-party software repositories, because since Kali Linux is a rolling release and depends on Debian Testing, you will most likely break your system by just adding a new repository source due to dependencies conflicts and package hooks.

### Don’t Install Kali Linux

![](https://i0.wp.com/fosspost.org/wp-content/uploads/2018/10/Kali-Linux-002.png?resize=750%2C504&ssl=1)
Running wpscan on fosspost.org using Kali Linux

I use Kali Linux on rare occasions to test the software and servers I deploy. However, I will never dare to install it and use it as a primary system.

If you are going to use it as a primary system, then you will have to keep your own personal files, password, data and everything else on your system. You will also need to install tons of daily-use software in order to ease your life. But as we mentioned above, using Kali Linux is very risky and should be done very carefully, and if you get hacked, you will lose all your data and it may get exposed to a wider audience. Your personal information can also be used to track you if you are doing non-legal stuff. You may even destroy your data by yourself if you are not careful about how you use the tools.

Even professional white hackers don’t recommend installing it as a primary system, but rather, use it from USB to just do your penetration testing work and then leave back to your normal Linux distribution.

### The Bottom Line

As you may see now, using Kali is not an easy decision to take lightly. If you are planning to be a whiter hacker and you need to use Kali to learn, then go for it after learning the basics and spending few months with a normal system. But be careful for what you are doing to avoid being in trouble.

If you are planning to use Kali or if you need any help, I’ll be happy to hear your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://fosspost.org/articles/must-know-before-using-kali-linux

作者：[M.Hanny Sabbagh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fosspost.org/author/mhsabbagh
[b]: https://github.com/lujun9972
[1]: https://fosspost.org/articles/what-are-the-components-of-a-linux-distribution
[2]: https://www.kali.org/news/kali-linux-rolling-edition-2016-1/
[3]: http://git.kali.org
[4]: https://paste.ubuntu.com/p/bctSVWwpVw/
