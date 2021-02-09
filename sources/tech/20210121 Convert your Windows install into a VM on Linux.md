[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Convert your Windows install into a VM on Linux)
[#]: via: (https://opensource.com/article/21/1/virtualbox-windows-linux)
[#]: author: (David Both https://opensource.com/users/dboth)

Convert your Windows install into a VM on Linux
======
Here's how I configured a VirtualBox VM to use a physical Windows drive
on my Linux workstation.
![Puzzle pieces coming together to form a computer screen][1]

I use VirtualBox frequently to create virtual machines for testing new versions of Fedora, new application programs, and lots of administrative tools like Ansible. I have even used VirtualBox to test the creation of a Windows guest host.

Never have I ever used Windows as my primary operating system on any of my personal computers or even in a VM to perform some obscure task that cannot be done with Linux. I do, however, volunteer for an organization that uses one financial program that requires Windows. This program runs on the office manager's computer on Windows 10 Pro, which came preinstalled.

This financial application is not special, and [a better Linux program][2] could easily replace it, but I've found that many accountants and treasurers are extremely reluctant to make changes, so I've not yet been able to convince those in our organization to migrate.

This set of circumstances, along with a recent security scare, made it highly desirable to convert the host running Windows to Fedora and to run Windows and the accounting program in a VM on that host.

It is important to understand that I have an extreme dislike for Windows for multiple reasons. The primary ones that apply to this case are that I would hate to pay for another Windows license – Windows 10 Pro costs about $200 – to install it on a new VM. Also, Windows 10 requires enough information when setting it up on a new system or after an installation to enable crackers to steal one's identity, should the Microsoft database be breached. No one should need to provide their name, phone number, and birth date in order to register software.

### Getting started

The physical computer already had a 240GB NVMe m.2 storage device installed in the only available m.2 slot on the motherboard. I decided to install a new SATA SSD in the host and use the existing SSD with Windows on it as the storage device for the Windows VM. Kingston has an excellent overview of various SSD devices, form factors, and interfaces on its web site.

That approach meant that I wouldn't need to do a completely new installation of Windows or any of the existing application software. It also meant that the office manager who works at this computer would use Linux for all normal activities such as email, web access, document and spreadsheet creation with LibreOffice. This approach increases the host's security profile. The only time that the Windows VM would be used is to run the accounting program.

### Back it up first

Before I did anything else, I created a backup ISO image of the entire NVMe storage device. I made a partition on a 500GB external USB storage drive, created an ext4 filesystem on it, and then mounted that partition on **/mnt**. I used the **dd** command to create the image.

I installed the new 500GB SATA SSD in the host and installed the Fedora 32 Xfce spin on it from a Live USB. At the initial reboot after installation, both the Linux and Windows drives were available on the GRUB2 boot menu. At this point, the host could be dual-booted between Linux and Windows.

### Looking for help in all the internet places

Now I needed some information on creating a VM that uses a physical hard drive or SSD as its storage device. I quickly discovered a lot of information about how to do this in the VirtualBox documentation and the internet in general. Although the VirtualBox documentation helped me to get started, it is not complete, leaving out some critical information. Most of the other information I found on the internet is also quite incomplete.

With some critical help from one of our Opensource.com Correspondents, Joshua Holm, I was able to break through the cruft and make this work in a repeatable procedure.

### Making it work

This procedure is actually fairly simple, although one arcane hack is required to make it work. The Windows and Linux operating systems were already in place by the time I was ready for this step.

First, I installed the most recent version of VirtualBox on the Linux host. VirtualBox can be installed from many distributions' software repositories, directly from the Oracle VirtualBox repository, or by downloading the desired package file from the VirtualBox web site and installing locally. I chose to download the AMD64 version, which is actually an installer and not a package. I use this version to circumvent a problem that is not related to this particular project.

The installation procedure always creates a **vboxusers** group in **/etc/group**. I added the users intended to run this VM to the **vboxusers** and **disk** groups in **/etc/group**. It is important to add the same users to the **disk** group because VirtualBox runs as the user who launched it and also requires direct access to the **/dev/sdx** device special file to work in this scenario. Adding users to the **disk** group provides that level of access, which they would not otherwise have.

I then created a directory to store the VMs and gave it ownership of **root.vboxusers** and **775** permissions. I used **/vms** for the directory, but it could be anything you want. By default, VirtualBox creates new virtual machines in a subdirectory of the user creating the VM. That would make it impossible to share access to the VM among multiple users without creating a massive security vulnerability. Placing the VM directory in an accessible location allows sharing the VMs.

I started the VirtualBox Manager as a non-root user. I then used the VirtualBox **Preferences ==&gt; General** menu to set the Default Machine Folder to the directory **/vms**.

I created the VM without a virtual disk. The **Type** should be **Windows**, and the **Version** should be set to **Windows 10 64-bit**. Set a reasonable amount of RAM for the VM, but this can be changed later so long as the VM is off. On the **Hard disk** page of the installation, I chose the "Do not add a virtual hard disk" and clicked on **Create**. The new VM appeared in the VirtualBox Manager window. This procedure also created the **/vms/Test1** directory.

I did this using the **Advanced** menu and performed all of the configurations on a single page, as seen in Figure 1. The **Guided Mode** obtains the same information but requires more clicks to go through a window for each configuration item. It does provide a little more in the way of help text, but I did not need that.

![VirtualBox dialog box to create a new virtual machine but do not add a hard disk][3]

opensource.com

Figure 1: Create a new virtual machine but do not add a hard disk.

Then I needed to know which device was assigned by Linux to the raw Windows drive. As root in a terminal session, use the **lshw** command to discover the device assignment for the Windows disk. In this case, the device that represents the entire storage device is **/dev/sdb**.


```
# lshw -short -class disk,volume
H/W path           Device      Class          Description
=========================================================
/0/100/17/0        /dev/sda    disk           500GB CT500MX500SSD1
/0/100/17/0/1                  volume         2047MiB Windows FAT volume
/0/100/17/0/2      /dev/sda2   volume         4GiB EXT4 volume
/0/100/17/0/3      /dev/sda3   volume         459GiB LVM Physical Volume
/0/100/17/1        /dev/cdrom  disk           DVD+-RW DU-8A5LH
/0/100/17/0.0.0    /dev/sdb    disk           256GB TOSHIBA KSG60ZMV
/0/100/17/0.0.0/1  /dev/sdb1   volume         649MiB Windows FAT volume
/0/100/17/0.0.0/2  /dev/sdb2   volume         127MiB reserved partition
/0/100/17/0.0.0/3  /dev/sdb3   volume         236GiB Windows NTFS volume
/0/100/17/0.0.0/4  /dev/sdb4   volume         989MiB Windows NTFS volume
[root@office1 etc]#
```

Instead of a virtual storage device located in the **/vms/Test1** directory, VirtualBox needs to have a way to identify the physical hard drive from which it is to boot. This identification is accomplished by creating a ***.vmdk** file, which points to the raw physical disk that will be used as the storage device for the VM. As a non-root user, I created a **vmdk** file that points to the entire Windows device, **/dev/sdb**.


```
$ VBoxManage internalcommands createrawvmdk -filename /vms/Test1/Test1.vmdk -rawdisk /dev/sdb
RAW host disk access VMDK file /vms/Test1/Test1.vmdk created successfully.
```

I then used the **VirtualBox Manager File ==&gt; Virtual Media Manager** dialog to add the **vmdk** disk to the available hard disks. I clicked on **Add**, and the default **/vms** location was displayed in the file management dialog. I selected the **Test1** directory and then the **Test1.vmdk** file. I then clicked **Open**, and the **Test1.vmdk** file was displayed in the list of available hard drives. I selected it and clicked on **Close**.

The next step was to add this **vmdk** disk to the storage devices for our VM. In the settings menu for the **Test1 VM**, I selected **Storage** and clicked on the icon to add a hard disk. This opened a dialog that showed the **Test1vmdk** virtual disk file in a list entitled **Not attached.** I selected this file and clicked on the **Choose** button. This device is now displayed in the list of storage devices connected to the **Test1 VM**. The only other storage device on this VM is an empty CD/DVD-ROM drive.

I clicked on **OK** to complete the addition of this device to the VM.

There was one more item to configure before the new VM would work. Using the **VirtualBox Manager Settings** dialog for the **Test1 VM**, I navigated to the **System ==&gt; Motherboard** page and placed a check in the box for **Enable EFI**. If you do not do this, VirtualBox will generate an error stating that it cannot find a bootable medium when you attempt to boot this VM.

The virtual machine now boots from the raw Windows 10 hard drive. However, I could not log in because I did not have a regular account on this system, and I also did not have access to the password for the Windows administrator account.

### Unlocking the drive

No, this section is not about breaking the encryption of the hard drive. Rather, it is about bypassing the password for one of the many Windows administrator accounts, which no one at the organization had.

Even though I could boot the Windows VM, I could not log in because I had no account on that host and asking people for their passwords is a horrible security breach. Nevertheless, I needed to log in to the VM to install the **VirtualBox Guest Additions**, which would provide seamless capture and release of the mouse pointer, allow me to resize the VM to be larger than 1024x768, and perform normal maintenance in the future.

This is a perfect use case for the Linux capability to change user passwords. Even though I am accessing the previous administrator's account to start, in this case, he will no longer support this system, and I won't be able to discern his password or the patterns he uses to generate them. I will simply clear the password for the previous sysadmin.

There is a very nice open source software tool specifically for this task. On the Linux host, I installed **chntpw**, which probably stands for something like, "Change NT PassWord."


```
`# dnf -y install chntpw`
```

I powered off the VM and then mounted the **/dev/sdb3** partition on **/mnt**. I determined that **/dev/sdb3** is the correct partition because it is the first large NTFS partition I saw in the output from the **lshw** command I performed previously. Be sure not to mount the partition while the VM is running; that could cause significant corruption of the data on the VM storage device. Note that the correct partition might be different on other hosts.

Navigate to the **/mnt/Windows/System32/config** directory. The **chntpw** utility program does not work if that is not the present working directory (PWD). Start the program.


```
# chntpw -i SAM
chntpw version 1.00 140201, (c) Petter N Hagen
Hive &lt;SAM&gt; name (from header): &lt;\SystemRoot\System32\Config\SAM&gt;
ROOT KEY at offset: 0x001020 * Subkey indexing type is: 686c &lt;lh&gt;
File size 131072 [20000] bytes, containing 11 pages (+ 1 headerpage)
Used for data: 367/44720 blocks/bytes, unused: 14/24560 blocks/bytes.

&lt;&gt;========&lt;&gt; chntpw Main Interactive Menu &lt;&gt;========&lt;&gt;

Loaded hives: &lt;SAM&gt;

  1 - Edit user data and passwords
  2 - List groups
      - - -
  9 - Registry editor, now with full write support!
  q - Quit (you will be asked if there is something to save)

What to do? [1] -&gt;
```

The **chntpw** command uses a TUI (Text User Interface), which provides a set of menu options. When one of the primary menu items is chosen, a secondary menu is usually displayed. Following the clear menu names, I first chose menu item **1**.


```
What to do? [1] -&gt; 1

===== chntpw Edit User Info &amp; Passwords ====

| RID -|---------- Username ------------| Admin? |- Lock? --|
| 01f4 | Administrator                  | ADMIN  | dis/lock |
| 03ec | john                           | ADMIN  | dis/lock |
| 01f7 | DefaultAccount                 |        | dis/lock |
| 01f5 | Guest                          |        | dis/lock |
| 01f8 | WDAGUtilityAccount             |        | dis/lock |

Please enter user number (RID) or 0 to exit: [3e9]
```

Next, I selected our admin account, **john**, by typing the RID at the prompt. This displays information about the user and offers additional menu items to manage the account.


```
Please enter user number (RID) or 0 to exit: [3e9] 03eb
================= USER EDIT ====================

RID     : 1003 [03eb]
Username: john
fullname:
comment :
homedir :

00000221 = Users (which has 4 members)
00000220 = Administrators (which has 5 members)

Account bits: 0x0214 =
[ ] Disabled        | [ ] Homedir req.    | [ ] Passwd not req. |
[ ] Temp. duplicate | [X] Normal account  | [ ] NMS account     |
[ ] Domain trust ac | [ ] Wks trust act.  | [ ] Srv trust act   |
[X] Pwd don't expir | [ ] Auto lockout    | [ ] (unknown 0x08)  |
[ ] (unknown 0x10)  | [ ] (unknown 0x20)  | [ ] (unknown 0x40)  |

Failed login count: 0, while max tries is: 0
Total  login count: 47

\- - - - User Edit Menu:
 1 - Clear (blank) user password
 2 - Unlock and enable user account [probably locked now]
 3 - Promote user (make user an administrator)
 4 - Add user to a group
 5 - Remove user from a group
 q - Quit editing user, back to user select
Select: [q] &gt; 2
```

At this point, I chose menu item **2**, "Unlock and enable user account," which deletes the password and enables me to log in without a password. By the way – this is an automatic login. I then exited the program. Be sure to unmount **/mnt** before proceeding.

I know, I know, but why not! I have already bypassed security on this drive and host, so it matters not one iota. At this point, I did log in to the old administrative account and created a new account for myself with a secure password. I then logged in as myself and deleted the old admin account so that no one else could use it.

There are also instructions on the internet for using the Windows Administrator account (01f4 in the list above). I could have deleted or changed the password on that account had there not been an organizational admin account in place. Note also that this procedure can be performed from a live USB running on the target host.

### Reactivating Windows

So I now had the Windows SSD running as a VM on my Fedora host. However, in a frustrating turn of events, after running for a few hours, Windows displayed a warning message indicating that I needed to "Activate Windows."

After following many more dead-end web pages, I finally gave up on trying to reactivate using an existing code because it appeared to have been somehow destroyed. Finally, when attempting to follow one of the on-line virtual support chat sessions, the virtual "Get help" application indicated that my instance of Windows 10 Pro was already activated. How can this be the case? It kept wanting me to activate it, yet when I tried, it said it was already activated.

### Or not

By the time I had spent several hours over three days doing research and experimentation, I decided to go back to booting the original SSD into Windows and come back to this at a later date. But then Windows – even when booted from the original storage device – demanded to be reactivated.

Searching the Microsoft support site was unhelpful. After having to fuss with the same automated support as before, I called the phone number provided only to be told by an automated response system that all support for Windows 10 Pro was only provided by internet. By now, I was nearly a day late in getting the computer running and installed back at the office.

### Back to the future

I finally sucked it up, purchased a copy of Windows 10 Home – for about $120 – and created a VM with a virtual storage device on which to install it.

I copied a large number of document and spreadsheet files to the office manager's home directory. I reinstalled the one Windows program we need and verified with the office manager that it worked and the data was all there.

### Final thoughts

So my objective was met, literally a day late and about $120 short, but using a more standard approach. I am still making a few adjustments to permissions and restoring the Thunderbird address book; I have some CSV backups to work from, but the ***.mab** files contain very little information on the Windows drive. I even used the Linux **find** command to locate all the ones on the original storage device.

I went down a number of rabbit holes and had to extract myself and start over each time. I ran into problems that were not directly related to this project, but that affected my work on it. Those problems included interesting things like mounting the Windows partition on **/mnt** on my Linux box and getting a message that the partition had been improperly closed by Windows (yes – on my Linux host) and that it had fixed the inconsistency. Not even Windows could do that after multiple reboots through its so-called "recovery" mode.

Perhaps you noticed some clues in the output data from the **chntpw** utility. I cut out some of the other user accounts that were displayed on my host for security reasons, but I saw from that information that all of the users were admins. Needless to say, I changed that. I am still surprised by the poor administrative practices I encounter, but I guess I should not be.

In the end, I was forced to purchase a license, but one that was at least a bit less expensive than the original. One thing I know is that the Linux piece of this worked perfectly once I had found all the necessary information. The issue was dealing with Windows activation. Some of you may have been successful at getting Windows reactivated. If so, I would still like to know how you did it, so please add your experience to the comments.

This is yet another reason I dislike Windows and only ever use Linux on my own systems. It is also one of the reasons I am converting all of the organization's computers to Linux. It just takes time and convincing. We only have this one accounting program left, and I need to work with the treasurer to find one that works for her. I understand this – I like my own tools, and I need them to work in a way that is best for me.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/virtualbox-windows-linux

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/article/20/7/godbledger
[3]: https://opensource.com/sites/default/files/virtualbox.png
