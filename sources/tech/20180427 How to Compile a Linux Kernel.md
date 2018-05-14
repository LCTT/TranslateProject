icecoobe translating

How to Compile a Linux Kernel
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/chester-alvarez-644-unsplash.jpg?itok=aFxG9kUZ)

Once upon a time the idea of upgrading the Linux kernel sent fear through the hearts of many a user. Back then, the process of upgrading the kernel involved a lot of steps and even more time. Now, installing a new kernel can be easily handled with package managers like apt. With the addition of certain repositories, you can even easily install experimental or specific kernels (such as real-time kernels for audio production) without breaking a sweat.

Considering how easy it is to upgrade your kernel, why would you bother compiling one yourself? Here are a few possible reasons:

  * You simply want to know how it’s done.

  * You need to enable or disable specific options into a kernel that simply aren’t available via the standard options.

  * You want to enable hardware support that might not be found in the standard kernel.

  * You’re using a distribution that requires you compile the kernel.

  * You’re a student and this is an assignment.




Regardless of why, knowing how to compile a Linux kernel is very useful and can even be seen as a right of passage. When I first compiled a new Linux kernel (a long, long time ago) and managed to boot from said kernel, I felt a certain thrill coursing through my system (which was quickly crushed the next time I attempted and failed).
With that said, let’s walk through the process of compiling a Linux kernel. I’ll be demonstrating on Ubuntu 16.04 Server. After running through a standard sudo apt upgrade, the installed kernel is 4.4.0-121. I want to upgrade to kernel 4.17. Let’s take care of that.

A word of warning: I highly recommend you practice this procedure on a virtual machine. By working with a VM, you can always create a snapshot and back out of any problems with ease. DO NOT upgrade the kernel this way on a production machine… not until you know what you’re doing.

### Downloading the kernel

The first thing to do is download the kernel source file. This can be done by finding the URL of the kernel you want to download (from [Kernel.org][1]). Once you have the URL, download the source file with the following command (I’ll demonstrate with kernel 4.17 RC2):
```
wget https://git.kernel.org/torvalds/t/linux-4.17-rc2.tar.gz

```

While that file is downloading, there are a few bits to take care of.

### Installing requirements

In order to compile the kernel, we’ll need to first install a few requirements. This can be done with a single command:
```
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison

```

Do note: You will need at least 12GB of free space on your local drive to get through the kernel compilation process. So make sure you have enough space.

### Extracting the source

From within the directory housing our newly downloaded kernel, extract the kernel source with the command:
```
tar xvzf linux-4.17-rc2.tar.gz

```

Change into the newly created directory with the command cd linux-4.17-rc2.

### Configuring the kernel

Before we actually compile the kernel, we must first configure which modules to include. There is actually a really easy way to do this. With a single command, you can copy the current kernel’s config file and then use the tried and true menuconfig command to make any necessary changes. To do this, issue the command:
```
cp /boot/config-$(uname -r) .config

```

Now that you have a configuration file, issue the command make menuconfig. This command will open up a configuration tool (Figure 1) that allows you to go through every module available and enable or disable what you need or don’t need.


![menuconfig][3]

Figure 1: The make menuconfig in action.

[Used with permission][4]

It is quite possible you might disable a critical portion of the kernel, so step through menuconfig with care. If you’re not sure about an option, leave it alone. Or, better yet, stick with the configuration we just copied from the running kernel (as we know it works). Once you’ve gone through the entire list (it’s quite long), you’re ready to compile!

### Compiling and installing

Now it’s time to actually compile the kernel. The first step is to compile using the make command. So issue make and then answer the necessary questions (Figure 2). The questions asked will be determined by what kernel you’re upgrading from and what kernel you’re upgrading to. Trust me when I say there’s a ton of questions to answer, so give yourself plenty of time here.


![make][6]

Figure 2: Answering the questions for the make command.

[Used with permission][4]

After answering the litany of questions, you can then install the modules you’ve enabled with the command:
```
make modules_install

```

Once again, this command will take some time, so either sit back and watch the output, or go do something else (as it will not require your input). Chances are, you’ll want to undertake another task (unless you really enjoy watching output fly by in a terminal).

Now we install the kernel with the command:
```
sudo make install

```

Again, another command that’s going to take a significant amount of time. In fact, the make install command will take even longer than the make modules_install command. Go have lunch, configure a router, install Linux on a few servers, or take a nap.

### Enable the kernel for boot

Once the make install command completes, it’s time to enable the kernel for boot. To do this, issue the command:
```
sudo update-initramfs -c -k 4.17-rc2

```

Of course, you would substitute the kernel number above for the kernel you’ve compiled. When that command completes, update grub with the command:
```
sudo update-grub

```

You should now be able to restart your system and select the newly installed kernel.

### Congratulations!

You’ve compiled a Linux kernel! It’s a process that may take some time; but, in the end, you’ll have a custom kernel for your Linux distribution, as well as an important skill that many Linux admins tend to overlook.

Learn more about Linux through the free ["Introduction to Linux" ][7] course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/4/how-compile-linux-kernel-0

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.kernel.org/
[2]:/files/images/kernelcompile1jpg
[3]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kernel_compile_1.jpg?itok=ZNybYgEt (menuconfig)
[4]:/licenses/category/used-permission
[5]:/files/images/kernelcompile2jpg
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kernel_compile_2.jpg?itok=TYfV02wC (make)
[7]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
