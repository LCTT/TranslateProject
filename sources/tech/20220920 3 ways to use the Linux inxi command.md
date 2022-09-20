[#]: subject: "3 ways to use the Linux inxi command"
[#]: via: "https://opensource.com/article/22/9/linux-inxi-command"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 ways to use the Linux inxi command
======
I use inxi on Linux to check my laptop batter, CPU information, and even the weather.

![Coding on a computer][1]

I was looking for information about the health of my laptop battery when I stumbled upon `inxi`. It's a command line system information tool that provides a wealth of information about your Linux computer, whether it's a laptop, desktop, or server.

The `inxi` command is [licensed][2] with the GPLv3, and many Linux distributions include it. According to its Git repository: "inxi strives to support the widest range of operating systems and hardware, from the most simple consumer desktops, to the most advanced professional hardware and servers."

Documentation is robust, and the project maintains a complete [man page][3] online. Once installed, you can access the man page on your system with the `man inxi` command.

### Install inxi on Linux

Generally, you can install `inxi` from your distribution's software repository or app center. For example, on Fedora, CentOS, Mageia, or similar:

```
$ sudo dnf install inxi
```

On Debian, Elementary, Linux Mint, or similar:

```
$ sudo apt install inxi
```

You can find more information about installation options for your Linux distribution [here][4].

### 3 ways to use inxi on Linux

Once you install `inxi`, you can explore all its options. There are numerous options to help you learn more about your system. The most fundamental command provides a basic overview of your system:

```
$ inxi -b
System:
  Host: pop-os Kernel: 5.19.0-76051900-generic x86_64 bits: 64
        Desktop: GNOME 42.3.1 Distro: Pop!_OS 22.04 LTS
Machine:
  Type: Laptop System: HP product: Dev One Notebook PC v: N/A
        serial: <superuser required>
  Mobo: HP model: 8A78 v: KBC Version 01.03 serial: <superuser required>
        UEFI: Insyde v: F.05 date: 06/14/2022
Battery:
  ID-1: BATT charge: 50.6 Wh (96.9%) condition: 52.2/53.2 Wh (98.0%)
CPU:
  Info: 8-core AMD Ryzen 7 PRO 5850U with Radeon Graphics [MT MCP]
        speed (MHz): avg: 915 min/max: 400/4507
Graphics:
  Device-1: AMD Cezanne driver: amdgpu v: kernel
  Device-2: Quanta HP HD Camera type: USB driver: uvcvideo
  Display: x11 server: X.Org v: 1.21.1.3 driver: X: loaded: amdgpu,ati
        unloaded: fbdev,modesetting,radeon,vesa gpu: amdgpu
        resolution: 1920x1080~60Hz
  OpenGL:
        renderer: AMD RENOIR (LLVM 13.0.1 DRM 3.47 5.19.0-76051900-generic)
        v: 4.6 Mesa 22.0.5
Network:
  Device-1: Realtek RTL8822CE 802.11ac PCIe Wireless Network Adapter
        driver: rtw_8822ce
Drives:
  Local Storage: total: 953.87 GiB used: 75.44 GiB (7.9%)
Info:
  Processes: 347 Uptime: 15m Memory: 14.96 GiB used: 2.91 GiB (19.4%)
  Shell: Bash inxi: 3.3.13
```

### 1. Display battery status

You can check your battery health using the `-B` option. The result shows the system battery ID, charge condition, and other information:

```
$ inxi -B
Battery:
ID-1: BATT charge: 44.3 Wh (85.2%) condition: 52.0/53.2 Wh (97.7%)
```

### 2. Display CPU info

Find out more information about the CPU with the `-C` option:

```
$ inxi -C
CPU:
  Info: 8-core model: AMD Ryzen 7 PRO 5850U with Radeon Graphics bits: 64
	type: MT MCP cache: L2: 4 MiB
  Speed (MHz): avg: 400 min/max: 400/4507 cores: 1: 400 2: 400 3: 400
	4: 400 5: 400 6: 400 7: 400 8: 400 9: 400 10: 400 11: 400 12: 400 13: 400
	14: 400 15: 400 16: 400
```

The output of `inxi` uses colored text by default. You can change that to improve readability, as needed, by using the "color switch."

The command option is `-c` followed by any number between 0 and 42 to suit your tastes.

```
$ inxi -c 42
```

Here is an example of a couple of different options using color 5 and then 7:

![inxi -c 5 command][5]

The software can show hardware temperature, fan speed, and other information about your system using the sensors in your Linux system. Enter `inxi -s` and read the result below:

![inxi -s][6]

### 3. Combine options

You can combine options for `inxi` to get complex output when supported. For example, `inxi -S` provides system information, and `-v` provides verbose output. Combining the two gives the following:

```
$ inxi -S
System:
  Host: pop-os Kernel: 5.19.0-76051900-generic x86_64 bits: 64
        Desktop: GNOME 42.3.1 Distro: Pop!_OS 22.04 LTS

$ inxi -Sv
CPU: 8-core AMD Ryzen 7 PRO 5850U with Radeon Graphics (-MT MCP-)
speed/min/max: 634/400/4507 MHz Kernel: 5.19.0-76051900-generic x86_64
Up: 20m Mem: 3084.2/15318.5 MiB (20.1%) Storage: 953.87 GiB (7.9% used)
Procs: 346 Shell: Bash inxi: 3.3.13
```

### Bonus: Check the weather

Your computer isn't all `inxi` can gather information about. With the `-w` option, you can also get weather information for your locale:

```
$ inxi -w
Weather:
  Report: temperature: 14 C (57 F) conditions: Clear sky
  Locale: Wellington, G2, NZL
        current time: Tue 30 Aug 2022 16:28:14 (Pacific/Auckland)
        Source: WeatherBit.io
```

You can get weather information for other areas of the world by specifying the city and country you want along with `-W` :

```
$ inxi -W rome,italy
Weather:
  Report: temperature: 20 C (68 F) conditions: Clear sky
  Locale: Rome, Italy current time: Tue 30 Aug 2022 06:29:52
        Source: WeatherBit.io
```

### Wrap up

There are many great tools to gather information about your computer. I use different ones depending on the machine, the desktop, or my mood. What are your favorite system information tools?

Image by: (Don Watkins, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/linux-inxi-command

作者：[Don Watkins][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/code_computer_laptop_hack_work.png
[2]: https://github.com/smxi/inxi/blob/master/LICENSE.txt
[3]: https://smxi.org/docs/inxi-man.htm
[4]: https://smxi.org/docs/inxi-installation.htm#inxi-repo-install
[5]: https://opensource.com/sites/default/files/2022-09/inxi-c5.png
[6]: https://opensource.com/sites/default/files/2022-09/inxi-s.png
