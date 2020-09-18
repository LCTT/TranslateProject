[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Fix “Repository is not valid yet” Error in Ubuntu Linux)
[#]: via: (https://itsfoss.com/fix-repository-not-valid-yet-error-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Fix “Repository is not valid yet” Error in Ubuntu Linux
======

I recently [installed Ubuntu server on my Raspberry Pi][1]. I [connected it to the Wi-Fi from Ubuntu terminal][2] and went about doing what I do after installing any Linux system which is to update the system.

When I used the ‘sudo apt update’ command, it gave me an error which was kind of unique to me. It complained that release file for the repository was invalid for a certain time period.

**E: Release file for <http://ports.ubuntu.com/ubuntu-ports/dists/focal-security/InRelease> is not valid yet (invalid for another 159d 15h 20min 52s). Updates for this repository will not be applied.**

Here’s the complete output:

```
[email protected]:~$ sudo apt update
Hit:1 http://ports.ubuntu.com/ubuntu-ports focal InRelease
Get:2 http://ports.ubuntu.com/ubuntu-ports focal-updates InRelease [111 kB]
Get:3 http://ports.ubuntu.com/ubuntu-ports focal-backports InRelease [98.3 kB]
Get:4 http://ports.ubuntu.com/ubuntu-ports focal-security InRelease [107 kB]
Reading package lists... Done
E: Release file for http://ports.ubuntu.com/ubuntu-ports/dists/focal/InRelease is not valid yet (invalid for another 21d 23h 17min 25s). Updates for this repository will not be applied.
E: Release file for http://ports.ubuntu.com/ubuntu-ports/dists/focal-updates/InRelease is not valid yet (invalid for another 159d 15h 21min 2s). Updates for this repository will not be applied.
E: Release file for http://ports.ubuntu.com/ubuntu-ports/dists/focal-backports/InRelease is not valid yet (invalid for another 159d 15h 21min 32s). Updates for this repository will not be applied.
E: Release file for http://ports.ubuntu.com/ubuntu-ports/dists/focal-security/InRelease is not valid yet (invalid for another 159d 15h 20min 52s). Updates for this repository will not be applied.
```

### Fixing “release file is not valid yet” error in Ubuntu and other Linux distributions

![][3]

The reason for the error is the difference in the time on the system and the time in real world.

You see, every repository file is signed on some date and you can see this information by viewing the release file:

```
sudo head /var/lib/apt/lists/ports.ubuntu.com_ubuntu_dists_focal_InRelease
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Origin: Ubuntu
Label: Ubuntu
Suite: focal
Version: 20.04
Codename: focal
Date: Thu, 23 Apr 2020 17:33:17 UTC
Architectures: amd64 arm64 armhf i386 ppc64el riscv64 s390x
```

Now, for some reasons, the time on my Ubuntu server was in the past and this is why Ubuntu complained that the release file is not valid yet for X many days.

If you are connected to the internet, you may **wait a few minutes for your system to synchronize the time**.

If it doesn’t work, you may force the system to use local time as real time clock (hardware clock):

```
sudo timedatectl set-local-rtc 1
```

The timedatectl command enables you to configure time, date and [change timezone on Linux][4].

You shouldn’t need to restart. It works immediately and you can verify it by [updating your Ubuntu system][5] again.

If the problem is solved, you may set the [real time clock][6] to use UTC (as recommended by Ubuntu).

```
sudo timedatectl set-local-rtc 0
```

**Did it fix the issue for you?**

I hope this quick tip helped you to fix this error. If you are still facing the issue, let me know in the comment section and I’ll try to help you out.

--------------------------------------------------------------------------------

via: https://itsfoss.com/fix-repository-not-valid-yet-error-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[2]: https://itsfoss.com/connect-wifi-terminal-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/Repository-not-valid-yet-error-ubuntu.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/change-timezone-ubuntu/
[5]: https://itsfoss.com/update-ubuntu/
[6]: https://www.computerhope.com/jargon/r/rtc.htm
