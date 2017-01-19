CentOS vs Ubuntu: Which one is better for a server
============================================================

![](https://thishosting.rocks/wp-content/uploads/2017/01/centos-vs-ubuntu.jpg.webp)

Finally decided to get a VPS but can’t decide which Linux distro to use? We’ve all been there. [_The_ choice][3] may even be overwhelming, even for Linux distros, considering all the different flavors and distros that are out there. Though, the two most widely used and most popular server distros are CentOS and Ubuntu. This is the main dilemma among admins, both beginners and professionals. Having experience with both (and more) distros, we decided to do a comparison of CentOS and Ubuntu when used for a server.

### A quick overview:

| ![CentOS](https://thishosting.rocks/wp-content/uploads/2017/01/centos-logo-50.png.webp) CentOS | ![Ubuntu](https://thishosting.rocks/wp-content/uploads/2017/01/ubuntu-logo-50.png.webp) Ubuntu |
| --- | --- |
| Based on Red Hat Linux Enterprise | Based on Debian |
| Less frequently updated | Frequently updated |
| Arguably more stable and secure because of the infrequent updates. | Updated packages may be unstable and not secure, which is unlikely since they are vigorously tested before pushed to official release. |
| Not enough tutorials and has a smaller userbase | Rich documentation, active community and lots of tutorials available online |
| Difficult for beginners, as there are no popular and widely used Red Hat-based Desktop distros | Easier to use for beginners that are already familiar with the Desktop version of Ubuntu |
| Supports cPanel | Doesn't support cPanel |
| .rpm packages and 'yum' package manager | .deb packages and 'apt-get' package manager |
| Try a CentOS server for free at [DigitalOcean][1] | Try an Ubuntu server for free at [DigitalOcean][2] |

### Which one is better for beginners?

Ubuntu. As always, it highly depends on your requirements and previous experiences, but generally, Ubuntu is a better choice for beginners. Mainly because of these 2 reasons:

*   Ubuntu has a big community that’s ready to help for free. And we really do mean big. Thousands of users in hundreds of different online forums and groups. Even real life conventions. You can still find a lot of tutorials and help for CentOS too, especially for simple LAMP stacks and popular applications.
*   Ubuntu server would be a lot easier for someone that has previously used Ubuntu desktop. The same goes for CentOS and Fedora too, but the Ubuntu Desktop version is far more popular than any other Linux-based distro for home-use.

So, if you are a beginner and don’t have any special requirements, go with an Ubuntu server. Even better if you get a server from a [cheap managed provider][4], so you can experiment on your server and have a [professional 24/7 support team][5] ready to help you.

### Which one is better for businesses?

CentOS. And again, you can still use Ubuntu for a business website or an internal company server, but CentOS has its advantages:

*   CentOS is (arguably) more stable and secure. Since CentOS has less frequent updates, that means that the software is tested for a longer period of time and only truly stable versions get released. You won’t get any stability issues from a new, buggy release of an app if you use CentOS because you won’t actually get that new, buggy release.
*   Most control panels (including the most popular one – cPanel) support CentOS only. So that means if you are a web hosting company, or if you are a web agency with a lot of clients and need a control panel – CentOS is a better option.

### Try them out and just pick one

If you still can’t decide, you can just try them out for free. You can install them locally or use a live image. You can also get a cheap VPS ($5/mo) from [Vultr][6] and [DigitalOcean][7]. You can spin up a CentOS/Ubuntu server in seconds. When you sign up through an affiliate link (like ours) you’ll probably get free credits – meaning you’ll actually get to try them out for free.

### Which one is faster?

They are the same in terms of speed. They are as fast as your hardware. They’ll be as fast as you configure them. You should properly configure and secure all your servers, configurations and applications, no matter what.

Which distro do you use? Wanna tell us how we are a bunch of [insert distro here] fanboys? Feel free to leave a comment below.

--------------------------------------------------------------------------------

作者简介：

![](https://secure.gravatar.com/avatar/434d2dd9d04f6ef4952470e716b4d20c?s=80&d=retro&r=pg)

Most all of my Linux server deployments are for business clients, so I am bewildered by article author in referencing GUI Client version in regard any Server admin capability or functions. Often WebMin, VirtualAdmin or similar tools are used as control panels on CentOS, Ubuntu, or frequently deployed OpenSuse Leap and FreeBSD 10+ Server OS by many services providers, even in a Virtual Private Server (VPN) environment.

Centos has distinct advantage over Ubuntu for many business applications, as well as advanced Networking/Virtualization and Cloud Computing environments, and CentOS makes excellent use of SELinux framework for hardened security layer, not currently available (or easily) in Ubuntu.

This type comparison is generally superfluous, since there almost are always specific and nuanced requirements and needs for Server implementation that will dictate which distribution has more advantage or purpose – based on technologists/hosting company’s expertise and broad experience with that distribution.

--------------------------------------------------------------------------------

via: https://thishosting.rocks/centos-vs-ubuntu-server/

作者：[W. Anderson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://thishosting.rocks/centos-vs-ubuntu-server/
[1]:https://thishosting.rocks/go/digitalocean/
[2]:https://thishosting.rocks/go/digitalocean/
[3]:https://thishosting.rocks/how-to-choose-web-hosting/
[4]:https://thishosting.rocks/best-cheap-managed-vps/
[5]:https://thishosting.rocks/support/
[6]:https://thishosting.rocks/go/vultr/
[7]:https://thishosting.rocks/go/digitalocean/
