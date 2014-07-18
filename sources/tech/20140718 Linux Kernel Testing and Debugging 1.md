Linux Kernel Testing and Debugging
================================================================================
### Linux Kernel Testing Philosophy ###

Testing is an integral and important part of any software development cycle, open or closed, and Linux kernel is no exception to that. Developer testing, integration testing, regression, and stress testing have different individual goals, however from 1000 feet up, the end goal is the same, to ensure the software continues to work as it did before adding a new body of code, and the new features work as designed.

Ensuring software is stable without regressions before the release, helps avoid debugging and fixing customer and user found bugs after the release. It costs more in time and effort to debug and fix a customer found problem. Hence, testing is very important in the case of any software, not just the Linux kernel. Unlike closed and proprietary operating systems, the development process is open and is not locked down. This process is its strength as well as weakness. With several developers continuing to add new features, and fixing bugs, continuous integration and testing is vital to ensure the kernel continues to work on existing hardware as new hardware support and features get added. In the open source development, developers and users share the testing responsibility. This is another important difference between a closed development model and an open one.

Almost all Linux kernel developers, if not all, are very active Linux users themselves. There is no requirement that testers should be developers, however, users and developers that are not familiar with the new code could be more effective at testing a new piece of code than the original author of that code. In other words, developer testing serves as an important step in verifying the functionality, however, developer testing alone is not sufficient to find interactions with other code, features, and unintended regressions on configurations and/or hardware, developer didn't anticipate and didn't have the opportunity and resources to test. Hence, users play a very important role in the Linux Kernel development process.

So now that we understand the importance of continuous integration testing, we will go into the details of testing itself. Before we talk about testing, I would like to walk through the development process itself to help understand how it works and how the changes funnel into the mainline kernel.

3000+ kernel developers from around the world contribute to the Linux kernel. It is a 24hours, seven days a week, and 365 days of continuous development process that results in a new release once every 2+ months and several stable and extended stable releases. New development and current release integration cycles run in parallel.

For further reading on the development process, please refer to [Greg Kroah-Hartman's presentation on the Linux Kernel Development][1]. 

 It is my intent that this guide should be useful to a beginner as well as an experienced contributor and/or individuals interested in getting involved in the Linux kernel development. Experienced developers can chose to skip sections that go over basic testing and debugging.

This paper will discuss how to test and debug Linux kernel, tools, scripts and debug mechanisms that aid in regression and integration testing. In addition, this paper will go into details on how to use git bisect to isolate a patch that introduced a bug, and what to test before sending patches to the Linux Kernel Mailing List. I will use Linux PM as an example target area for the testing and debugging discussion. Even though this paper is Linux Kernel testing focused, the importance of testing is applicable to any software project.

### Configuring Development and Test System ###

 Let's get started. First order of business is finding a development system that suits your needs. x86-64 systems are a good choice for a basic development system, unless there is a need for a specific architecture and/or configuration.

The second step is to install distribution of your preference. I prefer Ubuntu, hence this document will have the details on how to configure a kernel development system running Ubuntu distribution. Please follow [How to Ubuntu][2] for installing the Ubuntu release of your choice. 

On development and test systems, it is a good idea to ensure there is ample space for kernels in the boot partition. Choosing whole disk install or setting aside 3 GB disk space for the boot partition is recommended.

Once the distribution is installed and the system is ready for development packages, enable root account and also enable sudo for your user account. The system might already have the build-essential package which is what you need to build Linux kernels on an x86_64 system. If build-essential is not already installed, run the following command to install it: 

    sudo apt-get install build-essential

At this point, you may install the following packages as well, so the system is ready for cross-compiling Linux kernels. Note that ncurses-dev is a required package to run make menuconfig.

    sudo apt-get install binutils-multiarch

    sudo apt-get install ncurses-dev

    sudo apt-get install alien

Now let's install a few tools every Linux kernel developer need in his/her tool chest.

    sudo apt-get install git

    sudo apt-get install cscope

    sudo apt-get install meld

    sudo apt-get install gitk

If you would like to get the system configured for cross-compiling other supported architectures non-natively on your x86-64 system, please follow: [Cross-compiling Linux kernel on x86 64][3]. 

The Stable Kernel

Start by cloning the stable kernel git, building and installing the latest stable kernel. You can find information on the latest stable and mainline releases at [The Linux Kernel Archive][4]. 

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

The above step will create a new directory named linux-stable and populate it with the sources.

You can also download just the Linux Kernel source tar-ball instead of cloning the git, and then unpack the tar-ball.

    tar xvf linux-3.x.y.tar.xz

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,0

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://events.linuxfoundation.org/images/stories/pdf/als2012_gregkh.pdf
[2]:http://howtoubuntu.org/
[3]:http://linuxdriverproject.org/mediawiki/index.php/Cross-compiling_Linux_kernel_on_x86_64
[4]:https://www.kernel.org/