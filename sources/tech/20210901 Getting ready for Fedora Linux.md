[#]: subject: "Getting ready for Fedora Linux"
[#]: via: "https://fedoramagazine.org/getting-ready-for-fedora-linux/"
[#]: author: "Hanku Lee https://fedoramagazine.org/author/hankuoffroad/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Getting ready for Fedora Linux
======

![][1]

Photo by [Jacques Bopp][2] on [Unsplash][3]

### Introduction

Why does Linux remain vastly invisible to ordinary folks who make general use of computers? This article steps through the process to move to Fedora Linux Workstation for non-Linux users. It also describes features of the GUI (Graphic User Interface) and CLI (Command Line Interface) for the newcomer. This is a quick introduction, not an in-depth course.

### Installation and configuration are straightforward

Supposedly, a bootable USB drive is the most baffling experience of starting Linux for a beginner. In all fairness, installation with Fedora Media Writer and Anaconda is intuitive.

##### Step-by-step installation process

  1. [Make a Fedora USB stick][4]: 5 to 7 minutes depending on USB speed
  2. [Understand disk partitions and Linux file systems][5]
  3. [Boot from a USB device][6]
  4. [Install][7] with the Fedora installer, Anaconda: 15 to 20 minutes
  5. Software updates: 5 minutes



Following this procedure, it is easy to help family and friends install Fedora Linux.

##### Package management and configuration

Instead of configuring the OS manually, adding tools and applications you need, you may choose a functional bundle from [Fedora Labs][8] for a specific use case. Design Suite, Scientific, Python Classroom, and more, are available. Plus, all processes are complete without the command line.

##### Connecting devices and services

  * [Add a USB printer][9]: Fedora Linux detects most printers in a few seconds. Some may require the drivers.
  * Configure a USB keyboard: Refer to simple [work-around][10] for a mechanical keyboard.
  * [Sync with Google Drive][11]: Add an account either after installation, or at any time afterward.



### Desktop customization is easy

The default [GNOME desktop][12] is decent and free from distractions.

A shortlist to highlight desktop benefits:

  * Simplicity: Clean design, fluid and elegant application grid.
  * Reduced user effort: No alerts for paid services or long list of user consent.
  * Accommodating software: GNOME requires little specialist knowledge or technical ability.
  * Neat layout of system _Settings_: Larger icons and a better layout.



The image below shows the applications and desktops currently available. Get here by selecting “Activities” and then the “Show Applications” icon at the bottom of the screen at the far right. There you will find LibreOffice for your document, spreadsheet, and presentation creation. Also available is Firefox for your web browsing. More applications are added using the _Software_ icon (second from right at the bottom of the screen).

![GNOME desktop][13]

##### Enable touchpad click (tapping)

A change for [touchpad settings][14] is required for laptop users.

  1. Go to _Activies &gt; Show Applications &gt; Settings &gt; Mouse &amp; Touchpad &gt; Touchpad_
  2. Change the default behavior of touchpad settings (double click) to tap-to-click (single tap) using the built-in touchpad
  3. Select ‘Tap to Click’



##### Add user accounts using the users settings tool

During installation, you set up your first login account. For training or demo purposes, it is common to create a new user account.

  1. Add users: Go to _Settings &gt; Users &gt; Unlock &gt; Authentication&gt; Add user_
  2. Click at the top of the screen at the far right and then navigate to Power Off / Log out, and Select _Switch User_ to relogin as the new user.



### Fedora Linux is beginner-friendly

Yes, Fedora Linux caters to a broader selection of users. Since that is the case, why not dip into the shallow end of the Fedora community?

  * [Fedora Docs][15]: Clarity of self-help content is outstanding.
  * Ask Fedora: Get help for anything about Fedora Linux.
  * Magazine: Useful tips and user story are engaging. Make a suggestion to write about.
  * Nest with Fedora: Warm welcome virtually from Fedora Linux community.
  * Release parties.



### Command line interface is powerful

The command line is a way of giving instructions to a computer (shell) using a terminal. To be fair, the real power behind Fedora Linux is the Bash shell that empowers users to be problem solvers. The good news is that the text-based command is universally compatible across different versions of Linux. The Bash shell comes with the Fedora Linux, so there is no need to install it.

The following will give you a feeling for the command line. However, you can accomplish many if not all day-to-day tasks without using the command line.

#### How to use commands?

Access the command line by selecting “Activities” and then the “Show Applications” icon at the bottom of the screen at the far right. Select _Terminal_.

#### Understand the shell prompt

The standard shell prompt looks like this:

```
[hank@fedora_test ~]$
```

The shell prompt waits for a command.

It shows the name of the user (hank), the computer being used (fedora_test), and the current working directory within the filesystem (~, meaning the user’s home directory). The last character of the prompt, $, indicates that this is a normal user’s prompt.

#### Enter commands

What common tasks should a beginner try out with command lines?

  * Command line information is available from the [Fedora Magazine][16] and [other sites][17].
  * Use _ls_ and _cd_ to list and navigate your file system.
  * Make new directories (folders) with _mkdir_.
  * Delete files with _rm_.
  * Use _lsblk_ command to display partition details.



#### How to deal with the error messages

  * Be attentive to error messages in the terminal. Common errors are missing arguments, typo of file name.
  * Pause to think about why that happened.
  * Figure out the correct syntax using the _man_ command. For example:
_man ls_
displays the manual page for the _ls_ command.



#### Perform administration tasks using _sudo_

When a user executes commands for installation, removal, or change of software, [the _sudo_ command][18] allows users to gain administrative or root access. The actions that required _sudo_ command are often called ‘the administrative tasks’. Sudo stands for **SuperUser DO**. The syntax for the _sudo_ command is as follows:

```
sudo [COMMAND]
```

  1. Replace _COMMAND_ with the command to run as the root user.
  2. Enter password



What are the most used _sudo_ commands to start with?

  * List privileges



```
sudo -l
```

  * Install a package



```
sudo dnf install [package name]
```

  * Update a package



```
sudo dnf update [package name]
```

  * List all packages



```
sudo dnf grouplist [package name]
```

  * Manage disk partitions



```
sudo fdisk -l
```

### Built-in text editor is light and efficient

[Nano][19] is the default command-line-based text editor for Fedora Linux. [vi][20] is another one often used on Fedora Linux. Both are light and fast. Which to us is a personal choice, really. Nano and vi remain essential tools for editing config files and writing scripts. Generally, Nano is much simpler to work with than vi but vi can be more powerful when you get used to it.

##### What does a beginner benefit from a text editor?

  * Learn fundamentals of computing



Linux offers a vast range of customization options and monitoring. Shell scripts make it possible to add new functionality and the editor is used to create the scripts.

  * Build cool things for home automation



Raspberry Pi is a testing ground to build awesome projects for homes. [Fedora can be installed on Raspberry Pi][21]. Schools use the tiny microcomputer for IT training and experiment. Instead of a visual editor, it is easier to use a light and simple Nano editor to write files.

  * Test proof of concept with the public cloud services



Most of the public cloud suppliers offer free sandbox account to spin up a virtual machine or configure the network. Cloud servers run Linux OS, so editing configuration files require a text editor. Without installing additional software, it is easy to invoke Nano on a remote server.

##### How to use Nano text editor

Type _nano_ and file name after the shell prompt $ and press Enter.

```
[hank@fedora_test ~]$ nano [filename]
```

Note that many of the most used commands are displayed at the bottom of the nano screen. The symbol ^ in Nano means to press the Ctrl key.

  * Use the arrow keys on the keyboard to move up and down, left and right.
  * Edit file.
  * Get built-in help by pressing ^G
  * Exit by entering ^X and Y to save your file and return to the shell prompt.



##### Examples of file extensions used for configuration or shell scripts

  * .cfg: User-configurable files in the /etc directory.
  * .yaml: A popular type of configuration file with cross-language data portability.
  * .json: JSON is a lightweight &amp; open standard format for storing and transporting data.
  * .sh: A shell script used universally for Unix/Linux systems.



Above all, this is not a comprehensive guide on Nano or vi. Yet, adventurous learners should be aware of text editors for their next step in becoming accomplished in Fedora Linux.

### Conclusion

Does Fedora Workstation simplify the user experience of a beginner with Linux? Yes, absolutely. It is entirely possible to create a desktop quickly and get the job done without installing additional software or extensions.

Taking it to the next level, how to get more people into Fedora Linux?

  * Make Fedora Linux device available at home. A repurposed computer with the above guide is a starting point.
  * Demonstrate [cool things][22] with Fedora Linux.
  * Share [power user tips][23] with shell scripts.
  * Get involved with Open Source Software community such as the [Fedora project][24].



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-ready-for-fedora-linux/

作者：[Hanku Lee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hankuoffroad/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/ready_for_fedora-816x345.jpg
[2]: https://unsplash.com/@jacquesbopp?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/make-fedora-usb-stick/
[5]: https://docs.fedoraproject.org/en-US/fedora/rawhide/install-guide/appendixes/Disk_Partitions/
[6]: https://docs.fedoraproject.org/en-US/fedora/rawhide/install-guide/install/Booting_the_Installation/
[7]: https://docs.fedoraproject.org/en-US/fedora/rawhide/install-guide/install/Installing_Using_Anaconda/
[8]: https://labs.fedoraproject.org/
[9]: https://docs.fedoraproject.org/en-US/Fedora/14/html/User_Guide/chap-User_Guide-Printing.html
[10]: https://venthur.de/2021-04-30-keychron-c1-on-linux.html
[11]: https://fedoramagazine.org/connect-your-google-drive-to-fedora-workstation/
[12]: https://developer.gnome.org/hig/principles.html
[13]: https://fedoramagazine.org/wp-content/uploads/2021/08/Screenshot-from-2021-08-12-23-27-13-1024x576.png
[14]: https://help.gnome.org/users/gnome-help/stable/mouse-touchpad-click.html.en
[15]: https://docs.fedoraproject.org/en-US/docs/
[16]: https://fedoramagazine.org/?s=command+line
[17]: https://www.redhat.com/sysadmin/essential-linux-commands
[18]: https://fedoramagazine.org/howto-use-sudo/
[19]: https://fedoramagazine.org/gnu-nano-minimalist-console-editor/
[20]: https://www.redhat.com/sysadmin/vim-commands
[21]: https://docs.fedoraproject.org/en-US/quick-docs/raspberry-pi/
[22]: https://fedoramagazine.org/automatically-light-up-a-sign-when-your-webcam-is-in-use/
[23]: https://fedoramagazine.org/?s=bash
[24]: https://docs.fedoraproject.org/en-US/project/
