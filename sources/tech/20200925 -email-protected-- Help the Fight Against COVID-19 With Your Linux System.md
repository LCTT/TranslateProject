[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: ([email protected]: Help the Fight Against COVID-19 With Your Linux System)
[#]: via: (https://itsfoss.com/boinc-setup/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

[email protected]: Help the Fight Against COVID-19 With Your Linux System
======

Want to contribute to the research on coronavirus? You don’t necessarily have to be a scientist for this. You may contribute with part of your computer’s computing power thanks to [[email protected]][1] project.

Sounds interesting? Let me share more details on it.

### What is [[email protected]][1]?

[[email protected]][1] is a [distributed computing][2] project for protein structure prediction, based at the Baker laboratory at the University of Washington and running on the Berkeley Open Infrastructure for Network Computing (BOINC) open source platform, which was originally developed to support the [[email protected]][3].

**Not enough computing power? Utilize the power of distributed computing**

To predict and design the structures of naturally occurring proteins is very computationally intensive. To speed up the process, [Dr. David Becker][4] had filled the entire lab and the hallway with desktop computers. Then they started getting complaints of heating up the building, but still didn’t have enough computing power to accurately predict and design protein structures.

**How does [[email protected]][1] work?**

[[email protected]][1] uses idle computer processing power from volunteers’ computers to perform calculations on individual work units. When a requested task is being completed, the client sends the results to a central project server where they are validated and incorporated into project databases.

![][5]

As of 28th March 2020 the computing power of [[email protected]][1] has been increased up to 1.7 PetaFlops, due to the recently joined users looking to participate in the fight against the COVID-19 pandemic. Thanks to that, **On 26th June 2020, [[email protected]][1] researchers announced they had created antiviral proteins that neutralized SARS-CoV-2 in the lab.**

Is BOINC platform safe?

After few years of operation on millions of systems, there have been no security incidents reported due to BOINC. This fact doesn’t mean that there is no possibility of a security risks.

BOINC uses a mechanism called **code signing**, based on _public-key cryptography_, that eliminates the vulnerability, as long as projects use proper practice. Each project has a code-signing key pair consisting of a public key and a private key which is used to create “signatures” for programs. The BOINC client will only run programs with valid signatures.

Projects are instructed to keep the private key only on a computer that is permanently offline to create signatures. Therefore hackers cannot trick BOINC into running malware.

Most BOINC projects follow these practices. If you’re concerned about security, you should attach to a project only if you know it follows the code-signing procedure correctly. If in doubt, you may ask project administrators to describe how they do code signing.

### Contributing to [[email protected]][1] with BOINC platform

![][6]

If you are interested in contributing to the scientific research by donating some computing power, you’ll find rest of this article helpful.

I’ll discuss the following:

  * Prerequisite for joining BOINC platform
  * Using BOINC platform to donate computing power to a project of your choice via your desktop Linux
  * Using Raspberry Pi to run BOINC all the time



#### System Requirements of the BOINC platform

The BOINC distributed computing platform with which you can access [[email protected]][1] is available on a 64bit operating system such as Windows, Linux, and macOS and FreeBSD.

You will need a CPU of at least 500 MHz, 200 megabytes of free disk space, 512 megabytes of RAM, and Internet connectivity.

**The more CPU cores your system has, the more RAM is required as a work unit will “feed” each core.**

#### Create a user account on BOINC platform

Before you configure the BOINC platform, [create an account][7] using your computer. If you will use a Raspberry Pi, you can join the “crunch-on-arm” team.

**Please note that the same account can be used to multiple machines at a time. All of your machines will appear on your account.**

#### **Install BOINC platform** on various Linux distributions

BOINC application has the following element:

  * boinc-client (daemon that runs the platform)
  * boinctui: terminal based interface for selecting projects and other settings
  * boinc-manager: GUI-based interface for selecting projects and other settings



If you are using a server, you should install boinctui. If you are using Linux desktop, you can opt for boinc-manager.

I’ll stick with the GUI tool in this part of the tutorial.

**On Debian/Ubuntu**

BOINC tools are available in the universe repository in Ubuntu 20.04 so make sure that you have [universe repository enabled on your Ubuntu system][8].

Use the following commands to install it:

```
sudo apt install boinc-client boinc-manager
```

Install BOINC on Fedora

Open a terminal and enter the following command:

```
sudo dnf install boinc-client boinc-manager
```

Install BOINC on RedHat/CentOS

First, make sure that the EPEL repository is enabled, by running following command on a terminal:

```
sudo yum install epel-release
```

You can now install the necessary packages:

```
sudo yum install boinc-client boinc-manager
```

#### Open the BOINC manager and add a project

After installing, open BOINC manager. You will be asked to add a project and to create an account or login to an existing.

![][9]

Add your credentials and click finish when prompted.

![][10]

After a few minutes, the status will change to running.

![][11]

You don’t need to worry if your system resources will be consumed when you want to use your computer. **By default, if the BOINC manager notices that the user needs more than the 25% of CPU resources, the BOINC computation will be suspended.**

If you want the application to be suspended at a lower or higher CPU usage, you can change your profile settings on the website where you created your account.

### [[email protected]][1] on a Raspberry Pi 4

An ideal device to run 24/7 the [[email protected]][1] application is a Raspberry Pi, which is powerful enough and with very low power consumption.

To fight COVID-19 using a Raspberry Pi 4, you need a model with 2 GB RAM or more. My personal recommendation is the 4 GB RAM option, because with my 2 GB model one of the cores is idling as it is running out of memory.

#### **Step 1: Install Ubuntu Server** (Recommended)

You need to have some [operating system on your Raspberry Pi][12]. [Installing Ubuntu server on Raspberry Pi][13] is one of the most convenient choices.

#### **Step 2: Install BOINC platform**

To install the BOINC client and the command line management interface run the following command on server running on the Raspberry Pi.

```
sudo apt install boinc-client boinctui
```

**Additional steps for Raspberry Pi 2 GB model**

Your account by default is set to utilize 90% of the memory when the user is idling. The Rosetta work units require 1.9gb of memory to run on the Quad core Raspberry Pi, so there is a possibility for the client not be able to start due to the initial reading. If the Raspberry Pi runs out of memory, it will suspend one of the 4 running tasks as mentioned earlier. To override the 1.9gb threshold add the following lines to the location below:

```
sudo nano /var/lib/boinc-client/global_prefs_override.xml
```

**Add now these lines**

```
<global_preferences>
   <ram_max_used_busy_pct>100.000000</ram_max_used_busy_pct>
   <ram_max_used_idle_pct>100.000000</ram_max_used_idle_pct>
   <cpu_usage_limit>100.000000</cpu_usage_limit>
</global_preferences>
```

![][14]

This setting will increase the default memory available to Rosetta to the maximum amount of memory on the board.

#### Step 3: Add [[email protected]][1] project

On your Raspberry Pi command line type ‘boinctui’ and click enter to load the terminal GUI. 

```
boinctui
```

Press **F9** on the keyboard, to bring down the menu choices. Use the arrow keys to go to Projects and press Enter.

You may notice a few available projects to choose from but if you are interested to actively support the fight against COVID-19 choose Rosetta. You will be prompted to either create a user account or to use an existing account.

Select “Existing User” and the enter the credentials you created on the website at the initial step.  As you can see, I have already selected the Rosetta project.

![][15]

It will take a moment to download the work units, and then automatically it will start crunching data on your Raspberry Pi 4!

#### Conclusion

_**If you want to stop using BOINC, simply delete the boinc packages you installed earlier. I believe you know how to use your distribution’s package manager for removing software.**_

One of the benefits of distributing computing is to allow user’s to donate their system resources for the common good. Despite the grief the pandemic has spread worldwide, it can make us also to realize the necessity of volunteering in one way or the other.

If you ever wondered about a [good use of your Raspberry Pi][16], [[email protected]][1] can be included to the list.

Let us know at the comments below if you started “cruching” and which platform you chose. Stay safe!

--------------------------------------------------------------------------------

via: https://itsfoss.com/boinc-setup/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/cdn-cgi/l/email-protection
[2]: https://www.computerhope.com/jargon/d/distribs.htm
[3]: https://en.wikipedia.org/wiki/SETI@home
[4]: https://www.ipd.uw.edu/people/ipd-faculty-staff/david-baker/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/rosetta-sharing-example.jpg?resize=780%2C278&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/rosetta-home-linux.png?resize=800%2C450&ssl=1
[7]: http://boinc.bakerlab.org
[8]: https://itsfoss.com/ubuntu-repositories/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/boinc-manager.png?resize=800%2C600&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/boinc-credentials.png?resize=800%2C600&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/boinc-manager-running.png?resize=800%2C800&ssl=1
[12]: https://itsfoss.com/raspberry-pi-os/
[13]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/rosetta-settings-local-override.png?resize=800%2C600&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/rosetta-add-project.png?resize=800%2C600&ssl=1
[16]: https://itsfoss.com/raspberry-pi-projects/
