[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn about computer security with the Raspberry Pi and Kali Linux)
[#]: via: (https://opensource.com/article/19/3/computer-security-raspberry-pi)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

Learn about computer security with the Raspberry Pi and Kali Linux
======
Raspberry Pi is a great way to learn about computer security. Learn how in the 11th article in our getting-started series.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_privacy_lock.png?itok=ZWjrpFzx)

Is there a hotter topic in technology than securing your computer? Some experts will tell you that there is no such thing as perfect security. They joke that if you want your server or application to be truly secure, then turn off your server, unplug it from the network, and put it in a safe somewhere. The problem with that should be obvious: What good is an app or server that nobody can use?

That's the conundrum around security. How can we make something secure enough and still usable and valuable? I am not a security expert by any means, although I hope to be one day. With that in mind, I thought it would make sense to share some ideas about what you can do with a Raspberry Pi to learn more about security.

I should note that, like the other articles in this series dedicated to Raspberry Pi beginners, my goal is not to dive in deep, rather to light a fire of interest for you to learn more about these topics.

### Kali Linux

When it comes to "doing security things," one of the Linux distributions that comes to mind is [Kali Linux][1]. Kali's development is primarily focused on forensics and penetration testing. It has more than 600 preinstalled [penetration-testing programs][2] to test your computer's security, and a [forensics mode][3], which prevents it from touching the internal hard drive or swap space of the system being examined.

![](https://opensource.com/sites/default/files/uploads/raspberrypi_11_kali.png)

Like Raspbian, Kali Linux is based on the Debian distribution, and you can find directions on installing it on the Raspberry Pi in its main [documentation portal][4]. If you installed Raspbian or another Linux distribution on your Raspberry Pi, you should have no problem installing Kali. Kali Linux's creators have even put together [training, workshops, and certifications][5] to help boost your career in the security field.

### Other Linux distros

Most standard Linux distributions, like Raspbian, Ubuntu, and Fedora, also have [many security tools available][6] in their repositories. Some great tools to explore include [Nmap][7], [Wireshark][8], [auditctl][9], and [SELinux][10].

### Projects

There are many other security-related projects you can run on your Raspberry Pi, such as [Honeypots][11], [Ad blockers][12], and [USB sanitizers][13]. Take some time and learn about them!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/computer-security-raspberry-pi

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://www.kali.org/
[2]: https://en.wikipedia.org/wiki/Kali_Linux#Development
[3]: https://docs.kali.org/general-use/kali-linux-forensics-mode
[4]: https://docs.kali.org/kali-on-arm/install-kali-linux-arm-raspberry-pi
[5]: https://www.kali.org/penetration-testing-with-kali-linux/
[6]: https://linuxblog.darkduck.com/2019/02/9-best-linux-based-security-tools.html
[7]: https://nmap.org/
[8]: https://www.wireshark.org/
[9]: https://linux.die.net/man/8/auditctl
[10]: https://opensource.com/article/18/7/sysadmin-guide-selinux
[11]: https://trustfoundry.net/honeypi-easy-honeypot-raspberry-pi/
[12]: https://pi-hole.net/
[13]: https://www.circl.lu/projects/CIRCLean/
