[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Modularity in Fedora 28 Server Edition)
[#]: via: (https://fedoramagazine.org/wp-content/uploads/2018/05/f28-server-modularity-816x345.jpg)
[#]: author: (Stephen Gallagher https://fedoramagazine.org/author/sgallagh/)

Modularity in Fedora 28 Server Edition
======

![](https://fedoramagazine.org/wp-content/uploads/2018/05/f28-server-modularity-816x345.jpg)

### What is Modularity?

A classic conundrum that all open-source distributions have faced is the “too fast/too slow” problem. Users install an operating system in order to enable the use of their applications. A comprehensive distribution like Fedora has an advantage and a disadvantage to the large amount of available software. While the package the user wants may be available, it might not be available in the version needed. Here’s how Modularity can help solve that problem.

Fedora sometimes moves too fast for some users. Its rapid release cycle and desire to carry the latest stable software can result in breaking compatibility with applications. If a user can’t run a web application because Fedora upgraded a web framework to an incompatible version, it can be very frustrating. The classic answer to the “too fast” problem has been “Fedora should have an LTS release.” However, this approach only solves half the problem and makes the flip side of this conundrum worse.

There are also times when Fedora moves too slowly for some of its users. For example, a Fedora release may be poorly-timed alongside the release of other desirable software. Once a Fedora release is declared stable, packagers must abide by the [Stable Updates Policy][1] and not introduce incompatible changes into the system.

Fedora Modularity addresses both sides of this problem. Fedora will still ship a standard release under its traditional policy. However, it will also ship a set of modules that define alternative versions of popular software. Those in the “too fast” camp still have the benefit of Fedora’s newer kernel and other general platform enhancements. In addition, they still have access to older frameworks or toolchains that support their applications.

In addition, those users who like to live closer to the edge can access newer software than was available at release time.

### What is Modularity not?

Modularity is not a drop-in replacement for [Software Collections][2]. These two technologies try to solve many of the same problems, but have distinct differences.

Software Collections install different versions of packages in parallel on the system. However, their downside is that each installation exists in its own namespaced portion of the filesystem. Furthermore, each application that relies on them needs to be told where to find them.

With Modularity, only one version of a package exists on the system, but the user can choose which one. The advantage is that this version lives in a standard location on the system. The package requires no special changes to applications that rely on it. Feedback from user studies shows most users don’t actually rely on parallel installation. Containerization and virtualization solve that problem.

### Why not just use containers?

This is another common question. Why would a user want modules when they could just use containers? The answer is, someone still has to maintain the software in the containers. Modules provide pre-packaged content for those containers that users don’t need to maintain, update and patch on their own. This is how Fedora takes the traditional value of a distribution and moves it into the new, containerized world.

Here’s an example of how Modularity solves problems for users of Node.js and Review Board.

### Node.js

Many readers may be familiar with Node.js, a popular server-side JavaScript runtime. Node.js has an even/odd release policy. Its community supports even-numbered releases (6.x, 8.x, 10.x, etc.) for around 30 months. Meanwhile, they support odd-numbered releases that are essentially developer previews for 9 months.

Due to this cycle, Fedora carried only the most recent even-numbered version of Node.js in its stable repositories. It avoided the odd-numbered versions entirely since their lifecycle was shorter than Fedora, and generally not aligned with a Fedora release. This didn’t sit well with some Fedora users, who wanted access to the latest and greatest enhancements.

Thanks to Modularity, Fedora 28 shipped with not just one, but three versions of Node.js to satisfy both developers and stable deployments. Fedora 28’s traditional repository shipped with Node.js 8.x. This version was the most recent long-term stable version at release time. The Modular repositories (available by default on Fedora 28 Server edition) also made the older Node.js 6.x release and the newer Node.js 9.x development release available.

Additionally, Node.js released 10.x upstream just days after Fedora 28\. In the past, users who wanted to deploy that version had to wait until Fedora 29, or use sources from outside Fedora. However, thanks again to Modularity, Node.js 10.x is already [available][3] in the Modular Updates-Testing repository for Fedora 28.

### Review Board

Review Board is a popular Django application for performing code reviews. Fedora included Review Board from Fedora 13 all the way until Fedora 21\. At that point, Fedora moved to Django 1.7\. Review Board was unable to keep up, due to backwards-incompatible changes in Django’s database support. It remained alive in EPEL for RHEL/CentOS 7, simply because those releases had fortunately frozen on Django 1.6\. Nevertheless, its time in Fedora was apparently over.

However, with the advent of Modularity, Fedora could again ship the older Django as a non-default module stream. As a result, Review Board has been restored to Fedora as a module. Fedora carries both supported releases from upstream: 2.5.x and 3.0.x.

### Putting the pieces together

Fedora has always provided users with a wide range of software to use. Fedora Modularity now provides them with deeper choices for which versions of the software they need. The next few years will be very exciting for Fedora, as developers and users start putting together their software in new and exciting (or old and exciting) ways.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/wp-content/uploads/2018/05/f28-server-modularity-816x345.jpg

作者：[Stephen Gallagher][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sgallagh/
[b]: https://github.com/lujun9972
[1]: https://fedoraproject.org/wiki/Updates_Policy#Stable_Releases
[2]: https://www.softwarecollections.org
[3]: https://bodhi.fedoraproject.org/updates/FEDORA-MODULAR-2018-2b0846cb86
