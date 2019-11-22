[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Cross-Platform Source Explorer Sourcetrail is Now Open Source)
[#]: via: (https://itsfoss.com/sourcetrail/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

The Cross-Platform Source Explorer Sourcetrail is Now Open Source
======

[Sourcetrail][1] is a cross-platform source explorer that lets you visualize the unfamiliar source code by using graph visualization.

![][2]

In other words, it makes it easy to understand the structure of source code and how it works (technically) by visually representing them using a graph.

This is particularly helpful when you join a project and you have to work on existing code written in the past by several developers.

You can use it with your favorite IDE like Eclipse, IntelliJ IDEA, PyCharm or code editors like Atom, Visual Studio Code, Sublime Text etc. It supports C, C++, Java and Python.

This old video gives you the introduction to Sourcetrail:

Even though it was free for non-commercial use, they charged for a commercial license. However, they recently decided to make the whole thing free and open source.

So, yes, you can find their source code listed on [GitHub][3] now.

### What Has Changed for Sourcetrail?

The reason they switched as an open-source solution is that they wanted their tool to be accessible to more developers.

Their commercial licensing plan was supposed to help them make money – however, it limited the reach of their project.

In their [announcement post][4], they mentioned their idea of this decision as follows:

> We have been going back and forth, discussing and testing potential solutions to many of those issues for a long time now. Many of our thoughts revolved around how to make more money and use it to solve those issues. Looking at other companies in the field, it seemed that to make more money, our only option was making our licenses more and more expensive, which in turn would limit our audience to fewer developers. We always dismissed the idea because **we started to make Sourcetrail to benefit as many developers as possible** and not to be a premium product for a few people in a handful of companies.

Also, they found it tough to provide cross-platform support while trying to reproduce the issues and apply a fix to them, especially for Linux distros. So, making their project open source was an ideal choice.

To further clarify the situation they also explained why their commercial licensing plan wasn’t working out:

> Initially we received a couple of public grants that allowed us to launch Sourcetrail publicly. We decided to go down the traditional road of selling software licenses to sustain further development. Of course that meant to keep the code private if we wanted to protect our business…In retrospect, this decision really narrowed down our user base, making it hard for developers to start using Sourcetrail for multiple reasons

You can find all the details for what they plan for the future in their [announcement post][4].

### How to get Sourcetrail on Linux?

You can find and download the latest release of Sourcetrail on its release page on GitHub:

[Download Sourcetrail][5]

Extract the downloaded file and you’ll see a Sourcetrail.sh shell script. Run this script with sudo to install Sourcerail.

You should [read the documentation][6] for the project setup. They also have some [useful tutorial videos on their YouTube channel][7].

Sourcetrail was free before but now it’s free in the true sense. It’s good to see that the developers have made it open source and now more programmers can use this tool to understand large, shared code base. You may also checkout a slightly similar open source tool [Sourcegraph][8].

--------------------------------------------------------------------------------

via: https://itsfoss.com/sourcetrail/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.sourcetrail.com/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/sourcetrail-ui.png?ssl=1
[3]: https://github.com/CoatiSoftware/Sourcetrail
[4]: https://www.sourcetrail.com/blog/open_source/
[5]: https://github.com/CoatiSoftware/Sourcetrail/releases
[6]: https://www.sourcetrail.com/documentation/#PROJECTSETUP
[7]: https://www.youtube.com/channel/UCuKthdG-V4n2RZ1HDJhGVpQ/videos
[8]: https://itsfoss.com/sourcegraph/
