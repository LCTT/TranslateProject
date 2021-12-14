[#]: subject: "Get All Kind of System Information in Linux Terminal With inxi"
[#]: via: "https://itsfoss.com/inxi-system-info-linux/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get All Kind of System Information in Linux Terminal With inxi
======

inxi is a CLI tool that lists information about your Linux system. This includes both hardware and software details. You get simple details like which computer model you have, which kernel, distribution and desktop environment you are using etc. You also get details like which RAM slot of your motherboard is occupied by memory modules etc.

It can also be used to monitor processes that are running on your computer that are either consuming CPU resources or memory resources, or both.

In this tutorial, I’ll show some of the popular use cases of inxi to get information for your Linux system.

But first, let me quickly show you how to install inxi.

### Install inxi on your Linux distribution

[Inxi][1] is a popular software that is available in the repository of most Linux distributions. Not popular enough to have it installed by default.

To install inxi on Ubuntu and Debian based distributions, use this command:

```

    sudo apt install inxi

```

To install inxi on Fedora and RHEL8-based distributions, use:

```

    sudo dnf install -y epel-release
    sudo dnf install -y inxi

```

To install inxi on Arch Linux and it’s derivatives, run the following command:

```

    sudo pacman -S inxi

```

### Using inxi to get Linux system details

You can get an overview of your system information by simply running the inxi command in your terminal.

```

    inxi

```

As you can see in the image below, it gives a brief overview of CPU information, clockspeed, Kernel, RAM (displayed with Mem) and storage information along with number of running processes and shell version details.

![The default output of inxi command][2]

You can also use the “-b” flag to show a more detailed overview of your system information. It will show more information regarding your CPU, drives, currently running processes, motherboard UEFI version, GPU, display resolution, network devices etc

```

    inxi -b

```

![Detailed hardware and software information about machine as reported by inxi][3]

As you might have noticed by the use of the “-b” flag, inxi, just like any command line utility, it has a lot of flags that influence the output of inxi once executed. You can use these flags or combine them to get only certain detailed information.

Let me show a few example.

#### Get details of audio devices

Using the “-A” flag will present you with information about your audio [output] devices. That will display the physical audio [output] devices, sound server and the audio driver details.

```

    inxi -A

```

![Output of inxi command when “-A” flag is used][4]

#### Get battery information

The “-B” flag will show details about your battery (if there is a battery present). You will get details like the current battery charge in Wh (Watt hours) and the condition.

Since I use a desktop, here is a sample output of what the output would look like if the “-B” flag was used with inxi with a battery attached

```

    Battery:   ID-1: BAT0 charge: 50.0 Wh (100.0%) condition: 50.0/50.0

```

#### Get detailed CPU information

The -C flag shows detailed CPU information. That includes your CPU cache size, speed in MHz (of each core, if there are multiple cores), number of cores, CPU model and also if [your CPU is 32-bit or 64-bit][5].

```

    inxi -C

```

![Detailed CPU information displayed by inxi][6]

Make note, if you run inxi -C in a virtual machine, detecting your CPU’s minimum and maximum CPU frequency can be quite tricky for inxi. Below is a sample output of using the “-C” flag with inxi in a quad core Debian 11 Virtual Machine.

![An example output of using the “-C” flag in a Virtual Machine][7]

#### Get even more detailed system information

The “-F” flag will show detailed system information (like the “-b” flag, but even more in depth). It includes almost everything to get a high level overview of the system that you are dealing with.

```

    inxi -F

```

![][8]

#### Get graphics related information

The “-G” flag displays the data about everything related to Graphics.

It shows you all your Graphics Devices (GPUs), the [GPU] driver that is being used (helpful to check if you are using the Nvidia driver or the nouveau driver), display output resolution and driver version.

```

    inxi -G

```

![][9]

#### Get running process info

The “-I” (upper case i) shows detailed information about running processes, your current shell, memory (and memory usage) and inxi version.

![inxi get running process info][10]

#### Get RAM information

As you might have guessed, the -m flag shows you memory (RAM) related information.

It provides information such as total available memory, maximum capacity of memory supported [by your hardware platform or by your CPU manufacturer], number of physical memory slots available on the motherboard, if ECC is present or not, the memory slots that are populated and also what is the size of each module along with the speed that said module is running at, per enumerated slot(s).

```

    inxi -m

```

To take advantage of the in-depth details provided by the “-m” flag, like the maximum capacity, RAM module details that is at each slot, you need super-user privileges.

```

    sudo inxi -m

```

![][11]

If you just want the output to be short and not in this in-depth, you can use the “–memory-short” flag with inxi.

Using the “–memory-short” flag will only show total memory that is available and how much of it is currently in use.

#### See which package repository is in use

When you use the “-r” flag with inxi, it will present you with a list of all the repositories that your package manager is currently using or updating local repository cache with.

![List of repositories in use][12]

#### Get RAID devices details

The “-R” flag shows you information about all the RAID devices.

Surprisingly, it even shows information about ZFS RAID (because this file system is not included in many Linux distributions by default). It shows details about the file system on the RAID device, status – if it is online or offline, total size and available size.

```

    inxi -R

```

![][13]

#### Check weather information in Linux terminal (yes, that’s possible too)

And, as a bonus, you can even check the weather of any place on Earth with the “-W” flag.

The “-W” flag needs to be followed by either one of the following location descriptors

  * Postal code or zip code
  * Latitude,longitude
  * City[,state],country (must not contain spaces; replace spaces with the “+” sign)



```

    inxi -W Baroda,India

```

![Use of the “-W” flag with inxi followed by the city,country location descriptor][14]

### Monitoring the usage of system resource(s) with inxi

Along with all the verbose information that inxi provides about your installed hardware and the software that drives it, it can also be used for resource monitoring purposes.

Use the “-t” flag to show processes. You can also use the non-mandatory options “c” (for CPU) and “m” (for RAM). These options can also be combined with a numerical value that lists desired amount of processes.

Below are a few examples of using the “-t” flag to monitor system resources.

```

    inxi -t

```

If you run inxi with “-t” flag but without the non-mandatory options, it will output assuming that you typed added the “cm5” options.

![No difference in output of “inti -t” and “inxi -t cm5”][15]

```

    inxi -t cm10

```

![][16]

That’s fine for rare use but there are [dedicated system resource monitoring tools][17] that are easier to use and have more functionalities.

### In the end…

For the individuals who have to diagnose issues with computers and it’s system information that they are not aware about, inxi can be incredibly helpful. It shows the processes that are consuming CPU, memory; you can check if the correct graphics drivers are being used, if the motherboard UEFI/BIOS is up to date, and much more.

In fact, on [It’s FOSS Community forum][18], we ask members to share the output of inxi command while seeking help so that it is easier to see what kind of system is in use.

I know there are other tools that provide [hardware info on Linux][19] but inxi combines both hardware and software details and that’s why I like it.

Do you use inxi or some other tool? Share your experience in the comments please.

--------------------------------------------------------------------------------

via: https://itsfoss.com/inxi-system-info-linux/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://github.com/smxi/inxi
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/01_inxi.webp?resize=800%2C450&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/02_inxi_flag_b.webp?resize=800%2C450&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/03_inxi_flag_a.webp?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/32-bit-64-bit-ubuntu/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/04_inxi_flag_c.webp?resize=800%2C450&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/05_inxi_flag_c_vm.webp?resize=800%2C396&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/06_inxi_flag_f.webp?resize=800%2C450&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/07_inxi_flag_g.webp?resize=800%2C450&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/inxi-get-running-process-info.png?resize=768%2C272&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/08_inxi_flag_m.webp?resize=800%2C450&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/package-repo-info-with-inxi.png?resize=800%2C339&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/09_inxi_flag_r.webp?resize=800%2C450&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/12_inxi_flag_w.webp?resize=800%2C450&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/10_inxi_flag_t.webp?resize=800%2C450&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/11_inxi_flag_t_cm10.webp?resize=800%2C450&ssl=1
[17]: https://itsfoss.com/linux-system-monitoring-tools/
[18]: https://itsfoss.community/
[19]: https://itsfoss.com/hardinfo/
