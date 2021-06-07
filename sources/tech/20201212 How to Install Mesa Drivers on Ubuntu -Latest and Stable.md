[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Mesa Drivers on Ubuntu [Latest and Stable])
[#]: via: (https://itsfoss.com/install-mesa-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install Mesa Drivers on Ubuntu [Latest and Stable]
======

_**This quick tutorial shows the steps to get a newer version of Mesa drivers on Ubuntu, be it stable release or cutting-edge development release.**_

### What is Mesa?

[Mesa][1] itself is not a graphics card like Nvidia or AMD. Instead, it provides open source software implementation of [OpenGL][2], [Vulkan][3], and some other graphics API specifications for Intel and AMD graphics hardware. With Mesa, you can play high-end games and use applications that require such graphics libraries.

More information on Mesa can be found in [this article][4].

### How to install Mesa on Ubuntu?

![][5]

Mesa comes preinstalled on Ubuntu with the open source graphics drivers of Radeon, Intel and Nvidia (sometimes). Though it probably won’t be the latest Mesa version.

You can check if your system uses Mesa and the installed versions using this command:

```
glxinfo | grep Mesa
```

If for some reasons (like playing games), you want to install a newer version of Mesa, this tutorial will help you with that. Since, you’ll be using PPA, I highly recommend reading my [in-depth guide on PPA][6].

Attention!

Installing new Mesa graphics drivers may also need a newer Linux kernel. It will be a good idea to [enable HWE kernel on Ubuntu][7] to reduce the chances of conflict with the kernel. HWE Kernel gives you the latest stable kernel used by Ubuntu on an older LTS release.

### Install the latest stable version of Mesa driver in Ubuntu [Latest point release]

The [Kisak-mesa PPA][8] provides the latest point release of Mesa. You can use it by entering the following commands one by one in the terminal:

```
sudo add-apt-repository ppa:kisak/kisak-mesa
sudo apt update
sudo apt install mesa
```

It will give you the latest Mesa point release.

#### Remove it and go back to original Mesa driver

If you are facing issues and do not want to use the newer version of Mesa, you can revert to the original version.

Install PPA Purge tool first:

```
sudo apt install ppa-purge
```

And then use it to remove the PPA as well as the Mesa package version installed by this PPA.

```
sudo ppa-purge ppa:kisak/kisak-mesa
```

### Install the latest Mesa graphics drivers in Ubuntu [Bleeding edge]

If you want the latest Mesa drivers as they are being developed, this is what you need.

There is this awesome PPA that provides open source graphics drivers packages for Radeon, Intel and Nvidia hardware.

The best thing here is that all driver packages are automatically built twice a day, when there is an upstream change.

If you want the absolute latest Mesa drivers on Ubuntu and do not want to take the trouble of installing it from the source code, use this [PPA by Oibaf][9].

The PPA is available for 20.04, 20.10 and 21.04 at the time of writing this article. It is no longer updated for Ubuntu 18.04 LTS.

Open the terminal and use the following commands one by one:

```
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt update
sudo apt install mesa
```

This will give you the latest Mesa drivers.

#### Remove it and go back to original Mesa driver

You can remove the PPA and the installed latest Mesa driver using the ppa-purge tool.

Install it first:

```
sudo apt-get install ppa-purge
```

Now use it to disable the PPA you had added and revert the Mesa package to the version provided by Ubuntu officially.

```
sudo ppa-purge ppa:oibaf/graphics-drivers
```

I hope this quick tutorial was helpful in getting a newer version of Mesa on Ubuntu. If you have questions or suggestions, please use the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-mesa-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://mesa3d.org
[2]: https://www.opengl.org
[3]: https://www.khronos.org/vulkan/
[4]: https://www.gamingonlinux.com/articles/an-explanation-of-what-mesa-is-and-what-graphics-cards-use-it.9244
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/mesa-ubuntu.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/ppa-guide/
[7]: https://itsfoss.com/ubuntu-hwe-kernel/
[8]: https://launchpad.net/~kisak/+archive/ubuntu/kisak-mesa
[9]: https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers
