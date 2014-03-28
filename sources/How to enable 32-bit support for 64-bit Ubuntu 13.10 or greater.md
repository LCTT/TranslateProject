crowner translating 
How to enable 32-bit support for 64-bit Ubuntu 13.10 or greater
================================================================================
Most of you who use Ubuntu/Debian based distributions prefer the 64-bit mode, right? That’s because 64-bit architecture utilizes the full capabilities of your hardware. It enables you to use applications with intensive memory requirements and actually use them without having to wait for an hour after every little thing you do. Now, there are merits to 32-bit mode, most notably the fact that there are not many incompatibility problems with it. Every time Java did an update there was confusion as most users didn’t have the required libraries. In the past, some other early applications and drivers simply did not have 64-bit versions.

So let’s say you do have a 64-bit mode architecture and you use applications who have the proper support: Drivers, 64-bit versions and everything you need. No problem then, right? There comes a moment though when you have to use 32-bit applications in your 64-bit system. What then? That’s when you read this article and follow it to the letter. If you don’t have Ubuntu/Debian based distributions 13.10 or greater you used to have to install a meta-package called ia32-libs. Now this package has been deprecated so you have to do it manually.

The following commands work for Ubuntu/Debian based distributions 13.10 or greater.

1st Step: Verifying you have 64-bit kernel architecture.

You open the terminal and type:

    dpkg --print-architecture

You‘ll see something like:

    amd64

That means you’re okay.

2nd Step: Verifying you have multi-arch support enabled. (Multi-arch support allows you to use 32-bit libraries alongside 64-bit libraries.)

Type:

    dpkg --print-foreign-architectures

The output is:

    i386

If you don’t have multi-arch support you have to enable it.

Alternative 2nd Step: Enabling multi-arch support.

Type:

    sudo dpkg --add-architecture i386

    sudo apt -get update

It starts downloading the update and running it.

After that you type:

    sudo apt-get dist-upgrade

It will check if there are newer libraries of the packages you already have.

If there are, it will ask you if you want to update (y/n).

After that you’re done. You have successfully installed 32-bit support for your 64-bit system.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/enable-32-bit-support-64-bit-ubuntu-13-10-greater/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出