[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Huawei’s Linux Distribution openEuler is Available Now!)
[#]: via: (https://itsfoss.com/openeuler/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Huawei’s Linux Distribution openEuler is Available Now!
======

Huawei offers a CentOS based enterprise Linux distribution called EulerOS. Recently, Huawei has released a community edition of EulerOS called [openEuler][1].

The source code of openEuler is released as well. You won’t find it on Microsoft owned GitHub – the source code is available at [Gitee][2], a Chinese [alternative of GitHub][3].

There are two separate repositories, one for the [source code][2] and the other as a [package source][4] to store software packages that help to build the OS.

![][5]

The openEuler infrastructure team shared their experience to make the source code available:

> We are very excited at this moment. It was hard to imagine that we will manage thousands of repositories. And to ensure that they can be compiled successfully, we would like to thank all those who participated in contributing

### openEuler is a Linux distribution based on CentOS

Like EulerOS, openEuler OS is also based on [CentOS][6] but is further developed by Huawei Technologies for enterprise applications.

It is tailored for ARM64 architecture servers and Huawei claims to have made changes to boost its performance. You can read more about it at [Huawei’s dev blog][7].

![][8]

At the moment, as per the official openEuler announcement, there are more than 50 contributors with nearly 600 commits for openEuler.

The contributors made it possible to make the source code available to the community.

It is also worth noting that the repositories also include two new projects (or sub-projects) associated with it, [iSulad][9] **and A-Tune**.

A-Tune is an AI-based OS tuning software and iSulad is a lightweight container runtime daemon that is designed for IoT and Cloud infrastructure, as mentioned on [Gitee][2].

Also, the official [announcement post][10] mentioned that these systems are built on the Huawei Cloud through script automation. So, that is definitely something interesting.

### Downloading openEuler

![][11]

As of now, you won’t find the documentation for it in English – so you will have to wait for it or choose to help them with the [documentation][12].

You can download the ISO directly from its [official website][13] to test it out:

[Download openEuler][13]

### What do you think of Huawei openEuler?

As per cnTechPost, Huawei had announced that EulerOS would become open source under the new name openEuler.

At this point, it’s not clear if openEuler is replacing EulerOS or both will exist together like CentOS (community edition) and Red Hat (commercial edition).

I haven’t tested it yet so I cannot say if openEuler is suitable for English speaking users or not.

Are you willing to give this a try? In case you’ve already tried it out, feel free to let me know your experience with it in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/openeuler/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://openeuler.org/en/
[2]: https://gitee.com/openeuler
[3]: https://itsfoss.com/github-alternatives/
[4]: https://gitee.com/src-openeuler
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/openEuler-website.jpg?ssl=1
[6]: https://www.centos.org/
[7]: https://developer.huaweicloud.com/en-us/euleros/euleros-introduction.html
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/openeuler-gitee.jpg?ssl=1
[9]: https://gitee.com/openeuler/iSulad
[10]: https://openeuler.org/en/news/20200101.html
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/openEuler.jpg?ssl=1
[12]: https://gitee.com/openeuler/docs
[13]: https://openeuler.org/en/download.html
