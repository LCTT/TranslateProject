[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Here are the Worthy Replacements of CentOS 8 for Your Production Linux Servers)
[#]: via: (https://itsfoss.com/rhel-based-server-distributions/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Here are the Worthy Replacements of CentOS 8 for Your Production Linux Servers
======

CentOS is one of the most popular server distributions in the world. It is an open source fork of Red Hat Enterprise Linux (RHEL) and provides the goodness of RHEL without the cost associated with RHEL.

However, things have changed recently. [Red Hat is converting a stable CentOS to a rolling release model in the form of CentOS Stream][1]. CentOS 8 was supposed to be supported till 2029 but it is now forced discontinued by the end of 2021.

If you are using CentOS for your servers, it may make you wonder where to go from here.

See, the first and foremost choice for replacing CentOS 8 is CentOS Stream. The [process to upgrade CentOS 8 to CentOS Stream is simple][2] and you don’t have to worry about reinstalling anything here.

However, since CentOS Stream is of rolling release nature, you may want to consider something that is more stable for a production server. I’ll help you with that decision by suggestion some recommendations in this article.

### RHEL-based server Linux distributions you may want to consider for replacing CentOS

![][3]

I’ll start the list with some of the RHEL forks that are being developed with the sole purpose of replacing CentOS 8. After that, I’ll list the server distributions that you may use right away.

#### Rocky Linux (under development)

![][4]

The same day Red Hat announced its plans to replace stable CentOS 8 with rolling release CentOS Stream, the original developer of CentOS announced a new project to provide RHEL fork to CentOS users.

This new project is called [Rocky Linux][5]. It is named in the memory of one of the co-creators of the original CentOS project. It’s been forked from RHEL 8 and aims to be “100% bug-for-bug compatible with Red Hat Enterprise Linux”.

The project is under rapid development and may not be usable at the moment. But this is one of the top choices to replace CentOS 8 when the support ends by the end of 2021.

#### Project Lenix (under development)

![][6]

This is another RHEL fork created on a day after the announcement of CentOS Stream becoming the default.

[Project Lenix][7] is being created by CloudLinux, an enterprise oriented service that has been providing customized CentOS server for several years now. Cosnidering their years of experience with CentOS and enterprise servers, Project Lenix should be a promising RHEL fork to replace CentOS Stream.

#### Oracle Linux

![][8]

Probably the only RHEL fork in this list that is read to use in the best possible manner. Not only ready to use, you can even [migrate from existing CentOS install to Oracle Linux][9] without reinstalling it.

Oracle Linux has been available since 2006. It is 00% application binary compatible with Red Hat Enterprise Linux (RHEL) and it provides an equivalent to each RHEL release. And no, you don’t need to sign any agreement with Oracle for using Oracle Linux.

Oracle Linux comes with two choices of Linux kernels: the [Unbreakable Enterprise Kernel][10] (UEK) for Oracle Linux or the Red Hat Compatible Kernel (RHCK).

It’s just that track record of Oracle is not very good with open source projects and probably this is the reason why a true community fork in the form of CentOS was preferred over Oracle Linux. With CentOS being replaced with CentOS Stream, perhaps it is the right time to give Oracle a chance?

#### ClearOS (from HP)

![][11]

[ClearOS][12] is offered by HP on its HPE ProLiant servers. Though it is not clearly mentioned on their website, ClearOS is based on RHEL and CentOS.

[Clear Center][13] and HPE have partnered on this project. The open source ClearOS available for free to the community. They have their own app marketplace with a mix of free and paid applications. You don’t pay for the OS but you may have to pay for the apps, if you opt for a paid one.

It might not be that popular but with CentOS Stream becoming default, ClearOS stands to gain some user base, if HP plays its cards right. Will they do it? I am not so sure. Oracle is trying to lure CentOS users but I have seen no such efforts from HP.

#### Springdale Linux (academic project from Princeton University)

![][14]

A Red Hat fork maintained by academicians? That’s Scientific Linux, right? But Scientific Linux has been dead for over a year.

[Springdale Linux][15] (SDL) is another such project by Princeton University. It was previously known as PUIAS (Princeton University Institute for Advanced Study).

There is no RHEL 8 equivalent of Springdale Linux yet which gives some hint about the speed of development here.

### Server distributions that are not based on Red Hat

Alright! So far, the list mentions the distributions based on Red Hat. It’s time to look at some of the server distributions that have nothing to do with RHEL but the are still a good choice for your production server.

#### YunoHost (Specially customized for web servers)

![][16]

[YunoHost][17] is based on Debian and customized for the purpose of provide you a system for hosting your web servers.

You can use it on [ARM boards like Raspberry Pi][18], old desktops and computers of course on virtual private servers.

YunoHost also provides a web-based admin interface (inspired by [Webmin][19]?) so that you can manage the system graphically. This is a great relief for someone who wants to host a web server but without getting too much into the command line stuff.

#### Debian Linux

![][20]

The universal operating system provides a rock-solid server distribution. An ideal choice for those who want a stable system.

If you had invested too much time and skill in CentOS, you may find [Debian][21] slightly different, specially the package management system. Though, I believe, it should not be much of a trouble for a seasoned Linux sysadmin.

#### openSUSE

![][22]

SUSE is one of the direct competitors of Red Hat. They have the enterprise offering in the form of [SUSE Linux Enterprise][23]. Their open source offering openSUSE is also quite popular, both as desktop and server.

[openSUSE][24] makes up a good choice for a server Linux distribution. People these days won’t understand what a relief [YAST tool of SUSE][25] brought for users in the last 90s and early 2000s. It is still a handy utility for managing the SUSE system.

openSUSE comes in two formats: the rolling release Tumbleweed and the stable point release Leap. I am guessing you are looking for stability so Leap is what you should be aiming for.

#### Ubuntu

![Ubuntu][26]

[Ubuntu][27] is the most popular distribution in the world, [both on servers][28] and desktops. This is the reason why this list could not have been completed without Ubuntu.

Since I have been using Ubuntu for a long time, I feel comfortable hosting my web servers on Ubuntu. But that’s just me. If you are coming from the RHEL domain, package management is different here along with a few networking and management components.

[Ubuntu LTS version][29] come with five years of support which is half of what a CentOS release provided. You may opt for a paid extended support for an outdated LTS version if you don’t want to upgrade versions.

#### What’s your choice?

I have listed some of the top recommendations for RHEL based distributions as well as for generic server distributions.

Now it’s your turn. Which of the above listed distributions you liked the most? Do you have any other suggestions to add to this list? The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/rhel-based-server-distributions/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/centos-stream-fiasco/
[2]: https://linuxhandbook.com/update-to-centos-stream/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/Replace-centos.png?resize=800%2C450&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/rocky-linux.png?resize=800%2C350&ssl=1
[5]: https://rockylinux.org
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/cloudlinux.png?resize=800%2C350&ssl=1
[7]: https://www.reddit.com/r/ProjectLenix/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/oracle-linux.png?resize=800%2C350&ssl=1
[9]: https://github.com/oracle/centos2ol
[10]: https://docs.oracle.com/en/operating-systems/uek/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/clear-os.jpg?resize=795%2C349&ssl=1
[12]: https://www.clearos.com
[13]: https://www.clearcenter.com
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/springdale-linux.png?resize=800%2C350&ssl=1
[15]: https://puias.math.ias.edu
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/yunohost.png?resize=720%2C400&ssl=1
[17]: https://yunohost.org#/
[18]: https://itsfoss.com/raspberry-pi-alternatives/
[19]: https://linuxhandbook.com/use-webmin/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/debian-linux.png?resize=800%2C350&ssl=1
[21]: https://www.debian.org
[22]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/opensuse.jpg?resize=800%2C350&ssl=1
[23]: https://www.suse.com/download/sles/
[24]: https://www.opensuse.org
[25]: https://yast.opensuse.org
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/ubuntu.jpg?resize=800%2C350&ssl=1
[27]: https://ubuntu.com/download/server
[28]: https://www.datanyze.com/market-share/operating-systems--443/ubuntu-market-share
[29]: https://itsfoss.com/long-term-support-lts/
