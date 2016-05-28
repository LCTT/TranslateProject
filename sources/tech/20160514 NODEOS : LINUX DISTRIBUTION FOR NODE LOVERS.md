translating----geekpi

NODEOS : LINUX DISTRIBUTION FOR NODE LOVERS
================================================

![](http://itsfoss.com/wp-content/uploads/2016/05/node-os-linux.jpg)

[NodeOS][1], the operating system based on [Node.js][2], is now heading towards its version 1.0 following the release of its first [Release Candidate][3] last year.

If this is the first time you’re hearing about it, NodeOS is the first ever operating system powered by Node.js & [npm][4] and built on top of the [Linux][5] Kernel. [Jacob Groundwater][6] introduced this project in mid-2013. The primary technologies used in building the system are:

- **Linux Kernel**: The entire OS is built off the Linux Kernel.
- **Node.js runtime**: Node is used as the primary runtime.
- **npm Packages**: npm is used for package management.

NodeOS source is hosted on [Github Repository][7]. So, anybody interested can easily contribute and report bugs. Users can build from source or use the [pre-built images][8] available. The build process and quick start guide can be found at project repository.

The idea behind NodeOS is to provide just enough to let npm run on it and then the rest of the functionalities will come from npm packages. So, the users have access the vast collection of about 250,000 packages and that number is continuously increasing every day. And everything being open-source, it’s always easy to patch bugs and add more packages to npm according to your need.

NodeOS core development is separated into layers and the general structure includes:

- **barebones** – custom Linux kernel along with an initramfs that boots to a Node.js REPL
- **initramfs** – Initram filesystem to mount the users partition & boot the system
- **rootfs** – Read-only partition image hosting the Linux kernel & initramfs files
- **usersfs** – multi-user filesystem (as traditional OSes)

NodeOS aims to be able to run on virtually any platforms, including –  **Real Hardware** (personal computers or SOCs), **Cloud platforms, Virtual machines, PaaS providers, Containers** (Docker & Vagga ) etc. And so far, it seems that they’re doing pretty good. On March 3, [Jesús Leganés Combarro][9], NodeOS member on GitHub, [announced][10] that:

>**NodeOS is not a toy OS anymore**, and it’s very capable to be used on production environments for real use cases from now on.

So, if you are a die-hard fan of Node.js and/or have a knack for trying new things, this might be the thing for you to try. And in related post, you should read about these niche [Linux distributions for specific usage][11].


--------------------------------------------------------------------------------

via: http://itsfoss.com/nodeos-operating-system/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[Munif Tanjim][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://itsfoss.com/author/munif/
[1]: http://node-os.com/
[2]: https://nodejs.org/en/
[3]: https://github.com/NodeOS/NodeOS/releases/tag/v1.0-RC1
[4]: https://www.npmjs.com/
[5]: http://itsfoss.com/tag/linux/
[6]: https://github.com/groundwater
[7]: https://github.com/nodeos/nodeos
[8]: https://github.com/NodeOS/NodeOS/releases
[9]: https://github.com/piranna
[10]: https://github.com/NodeOS/NodeOS/issues/216
[11]: http://itsfoss.com/weird-ubuntu-based-linux-distributions/
