How to install pandom: a true random number generator for Linux
============================================================

### On this page

1.  [Introduction][40]
2.  [1 Installation of pandom][41]
    1.  [1.1 Gain root access][1]
    2.  [1.2 Install build dependencies][2]
    3.  [Arch based systems][3]
    4.  [Debian based systems][4]
    5.  [Red Hat based systems][5]
    6.  [SUSE based systems][6]
    7.  [1.3 Download and extract sources][7]
    8.  [1.4 Test before installing (recommended)][8]
    9.  [1.5 Determine init system][9]
    10.  [1.6 Install pandom][10]
    11.  [init.d based init system (e.g: upstart, sysvinit)][11]
    12.  [systemd as init system][12]
3.  [2 Analysis of checkme file][42]
    1.  [2.1 Gain root access][13]
    2.  [2.2 Install build dependencies][14]
    3.  [Arch based systems][15]
    4.  [Debian based systems][16]
    5.  [Red Hat based systems][17]
    6.  [SUSE based systems][18]
    7.  [2.3 Download and extract sources][19]
    8.  [2.4 Install entropyarray][20]
    9.  [2.5 Analyze checkme file][21]
    10.  [2.6 Uninstall entropyarray (optional)][22]
4.  [3 Installation using debian repository][43]
    1.  [3.1 Gain root access][23]
    2.  [3.2 Install keyring][24]
    3.  [3.3 Install sources list][25]
    4.  [Wheezy][26]
    5.  [Jessie][27]
    6.  [Stretch][28]
    7.  [3.4 Update sources list][29]
    8.  [3.5 Test pandom][30]
    9.  [3.6 Install pandom][31]
5.  [4 Managing pandom][44]
    1.  [4.1 Performance test][32]
    2.  [4.2 Entropy and serial correlation test][33]
    3.  [4.3 System service][34]
    4.  [init.d based init system (e.g: upstart, sysvinit)][35]
    5.  [systemd as init system][36]
6.  [5 Increasing unpredictability or performance][45]
    1.  [5.1 Edit source files][37]
    2.  [5.2 Test the unpredictability][38]
    3.  [5.3 Install personalized pandom][39]

This tutorial is for amd64 / x86_64 linux kernel versions greater and equal to 2.6.9\. It explains how to install [pandom][46]: a timing jitter true random number generator maintained by ncomputers.org

### Introduction

The built-in Linux kernel true random number generator provides low throughput under modern circumstances, as for example: personal computers with solid state drives (SSD) and virtual private servers (VPS).

This problem is becoming popular in linux implementations, because of the continuously increasing need for true random numbers, mainly by diverse cryptographic purposes.

Pandom outputs around 8 KiB/s entropy of 64 [ubits][47] / 64 bits, is compatible with physical and virtual environments and assumes, that no other process running as root user writes to /dev/random.

### 1 Installation of pandom

### 1.1 Gain root access

Pandom must be installed as root, run this command if needed.

su -

### 1.2 Install build dependencies

In order to download and install pandom, you need: GNU **as**sembler, GNU **make**, GNU **tar** and GNU **wget** (the last two usually installed already). You may uninstall them later at will.

### Arch based systems

pacman -S binutils make

### Debian based systems

apt-get install binutils make

### Red Hat based systems

dnf install binutils make

yum install binutils make

### SUSE based systems

zypper install binutils make

### 1.3 Download and extract sources

These commands download and extract the sources of pandom from ncomputers.org using **wget** and **tar**.

wget [http://ncomputers.org/pandom.tar.gz][48]
tar xf pandom.tar.gz
cd pandom/amd64-linux

### 1.4 Test before installing (recommended)

This recommended test takes around 8 minutes. It checks for kernel support and generates a file named **checkme** (analyzed on the next section).

make check

### 1.5 Determine init system

Before installing pandom, you need to know, which init software does your system use. If the following command outputs the word **running**, it means that your system is using **systemd**, otherwise it is likely, that your system is using an **init.d** implementation (e.g: upstart, sysvinit). There might be some exceptions, more information in these [unix.stackexchange.com][49] answers.

systemctl is-system-running

```
running
```

### 1.6 Install pandom

Once you know which system does your linux implementation use, then you may install pandom accordingly.

### init.d based init system (e.g: upstart, sysvinit)

Install pandom running this command, if your system is using an **init.d** implementation (e.g: upstart, sysvinit).

make install-init.d

### systemd as init system

Install pandom running this command, if your system is using **systemd**.

make install-systemd

### 2 Analysis of checkme file

Before using pandom for cryptographic purposes, it is highly recommended to analyze **checkme** file generated during the installation process in the previous section of this tutorial. This task is useful for knowing if the numbers are truly random or not. This section explains how to analyze **checkme** file using ncomputers.org/**entropyarray**: a shell script, that tests entropy and serial correlation of its input.

**Note**: this analysis might be run in another computer, such as a laptop or desktop computer. For example: if you are installing pandom in a constrained-resources virtual private server (VPS), you might opt to copy **checkme** file to your personal computer, in order to analyze it there.

### 2.1 Gain root access

Entropyarray must be installed as root, run this command if needed.

su -

### 2.2 Install build dependencies

In order to download and install entropyarray, you need: GNU **g++** compiler, GNU **make**, GNU **tar** and GNU **wget** (the last two usually installed already). You may uninstall them later at will.

### Arch based systems

pacman -S gcc make

### Debian based systems

apt-get install g++ make

### Red Hat based systems

dnf install gcc-c++ make

yum install gcc-c++ make

### SUSE based systems

zypper install gcc-c++ make

### 2.3 Download and extract sources

These commands download and extract the sources of entropyarray from ncomputers.org using **wget** and **tar**.

wget [http://ncomputers.org/rearray.tar.gz][50]
wget [http://ncomputers.org/entropy.tar.gz][51]
wget [http://ncomputers.org/entropyarray.tar.gz][52]

tar xf entropy.tar.gz
tar xf rearray.tar.gz
tar xf entropyarray.tar.gz

### 2.4 Install entropyarray

**Note**: errors regarding -std=c++11 mean that the GNU **g++** compiler version doesn't support ISO C++ 2011 standard. You may try to compile ncomputers.org/**entropy** and ncomputers.org/**rearray** in another system that supports it (e.g: GNU g++ in a newer version of your favorite linux distribution) and then install the compiled binaries using **make install** in the system you would like to run **entropyarray**, or skip this step, despite it is highly recommended that you analyze **checkme** file before using pandom for any cryptographic purpose.

cd rearray; make install; cd ..
cd entropy; make install; cd ..
cd entropyarray; make install; cd ..

### 2.5 Analyze checkme file

**Note**: 64 [ubits][53] / 64 bits pandom implementations should result this test with entropy above **15.977** and **max** frequency below **70**. If your results differ too much, you may try to increase the unpredictability of your pandom implementation as described in the fifth section of this tutorial. In case you skipped the last step, you may use other tools such as [pseudorandom number sequence test][54].

entropyarray checkme

```
entropyarray in /tmp/tmp.mbCopmzqsg
15.977339
min:12
med:32
max:56
15.977368
min:11
med:32
max:58
15.977489
min:11
med:32
max:59
15.977077
min:12
med:32
max:60
15.977439
min:8
med:32
max:59
15.977374
min:13
med:32
max:60
15.977312
min:12
med:32
max:67
```

### 2.6 Uninstall entropyarray (optional)

If you plan to not use entropyarray any more, then you might want to uninstall it at will.

cd entropyarray; make uninstall; cd ..
cd entropy; make uninstall; cd ..
cd rearray; make uninstall; cd ..

### 3 Installation using debian repository

If you would like to keep pandom updated on your debian based system, you may opt to install / reinstall it using ncomputers.org debian repository.

### 3.1 Gain root access

The below debian packages must be installed as root, run this command if needed.

su -

### 3.2 Install keyring

This debian package includes the public key of the ncomputers.org debian repository.

wget [http://ncomputers.org/debian/keyring.deb][55]
dpkg -i keyring.deb
rm keyring.deb

### 3.3 Install sources list

These debian packages include the sources list of the ncomputers.org debian repository according to the latest debian distributions (year 2017).

**Note**: It is also possible to write the commented lines below in **/etc/apt/sources.list**, instead of installing the respective debian package for your debian distribution, but if these sources change in the future, then you would need to update them manually.

### Wheezy

#deb [http://ncomputers.org/debian][56] wheezy main
wget [http://ncomputers.org/debian/wheezy.deb][57]
dpkg -i wheezy.deb
rm wheezy.deb

### Jessie

#deb [http://ncomputers.org/debian][58] jessie main
wget [http://ncomputers.org/debian/jessie.deb][59]
dpkg -i jessie.deb
rm jessie.deb

### Stretch

#deb [http://ncomputers.org/debian][60] stretch main
wget [http://ncomputers.org/debian/stretch.deb][61]
dpkg -i stretch.deb
rm stretch.deb

### 3.4 Update sources list

Once the keyring and sources list are installed.

apt-get update

### 3.5 Test pandom

Once tested, you may uninstall the below package at will.

**Note**: if you have already tested pandom in your linux implementation, you may skip this step.

apt-get install pandom-test
pandom-test

```
generating checkme file, please wait around 8 minutes ...
entropyarray in /tmp/tmp.5SkiYsYG3h
15.977366
min:12
med:32
max:57
15.977367
min:13
med:32
max:57
15.977328
min:12
med:32
max:61
15.977431
min:12
med:32
max:59
15.977437
min:11
med:32
max:57
15.977298
min:11
med:32
max:59
15.977196
min:10
med:32
max:57
```

### 3.6 Install pandom

apt-get install pandom

### 4 Managing pandom

After pandom was installed, you might want to manage it.

### 4.1 Performance test

Pandom offers around 8 kilobytes per second, but its performance may vary depending on the environment.

dd if=/dev/random of=/dev/null bs=8 count=512

```
512+0 records in
512+0 records out
4096 bytes (4.1 kB, 4.0 KiB) copied, 0.451253 s, 9.1 kB/s
```

### 4.2 Entropy and serial correlation test

Besides of ncomputers.org/**entropyarray**, there are more tests, for example [NIST testsuite by Ilja Gerhardt][62].

entropyarray /dev/random 1M

### 4.3 System service

Pandom runs as a system service.

### init.d based init system (e.g: upstart, sysvinit)

/etc/init.d/random status
/etc/init.d/random start
/etc/init.d/random stop
/etc/init.d/random restart

### systemd as init system

systemctl status random
systemctl start random
systemctl stop random
systemctl restart random

### 5 Increasing unpredictability or performance

If you would like to try to increase the unpredictabiity or the performance of your pandom implementation, you may try to add or delete CPU time measurements.

### 5.1 Edit source files

In the source files **test.s** and **tRNG.s** add or remove measurement blocks at will.

```
#measurement block
mov $35,%rax
syscall
rdtsc
[...]

#measurement block
mov $35,%rax
syscall
rdtsc
[...]
```

### 5.2 Test the unpredictability

We recommend to always test any personalized pandom implementation before using it for cryptographic purposes.

make check

### 5.3 Install personalized pandom

If you are happy with the results, then you may install your personalized pandom implementation.

make install

Additional information and updates: [http://ncomputers.org/pandom][63]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/

作者：[Oliver][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/
[1]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-gain-root-access
[2]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-build-dependencies
[3]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#arch-based-systems
[4]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#debian-based-systems
[5]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#red-hat-based-systems
[6]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#suse-based-systems
[7]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-download-and-extract-sources
[8]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-test-before-installing-recommended
[9]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-determine-init-system
[10]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-pandom
[11]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#initd-based-init-system-eg-upstart-sysvinit
[12]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#systemd-as-init-system
[13]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-gain-root-access-2
[14]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-build-dependencies-2
[15]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#arch-based-systems-2
[16]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#debian-based-systems-2
[17]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#red-hat-based-systems-2
[18]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#suse-based-systems-2
[19]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-download-and-extract-sources-2
[20]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-entropyarray
[21]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-analyze-checkme-file
[22]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-uninstall-entropyarray-optional
[23]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-gain-root-access-3
[24]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-keyring
[25]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-sources-list
[26]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#wheezy
[27]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#jessie
[28]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#stretch
[29]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-update-sources-list
[30]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-test-pandom
[31]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-pandom-2
[32]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-performance-test
[33]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-entropy-and-serial-correlation-test
[34]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-system-service
[35]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#initd-based-init-system-eg-upstart-sysvinit-2
[36]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#systemd-as-init-system-2
[37]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-edit-source-files
[38]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-test-the-unpredictability
[39]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-install-personalized-pandom
[40]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#introduction
[41]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-installation-of-pandom
[42]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-analysis-of-checkme-file
[43]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-installation-using-debian-repository
[44]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-managing-pandom
[45]:https://www.howtoforge.com/tutorial/how-to-install-pandom-a-true-random-number-generator/#-increasing-unpredictability-or-performance
[46]:http://ncomputers.org/pandom
[47]:http://ncomputers.org/ubit
[48]:http://ncomputers.org/pandom.tar.gz
[49]:http://unix.stackexchange.com/a/18210/94448
[50]:http://ncomputers.org/rearray.tar.gz
[51]:http://ncomputers.org/entropy.tar.gz
[52]:http://ncomputers.org/entropyarray.tar.gz
[53]:http://ncomputers.org/ubit
[54]:http://www.fourmilab.ch/random/
[55]:http://ncomputers.org/debian/keyring.deb
[56]:http://ncomputers.org/debian
[57]:http://ncomputers.org/debian/wheezy.deb
[58]:http://ncomputers.org/debian
[59]:http://ncomputers.org/debian/jessie.deb
[60]:http://ncomputers.org/debian
[61]:http://ncomputers.org/debian/stretch.deb
[62]:https://gerhardt.ch/random.php
[63]:http://ncomputers.org/pandom
