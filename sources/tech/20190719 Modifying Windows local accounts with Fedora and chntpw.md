[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Modifying Windows local accounts with Fedora and chntpw)
[#]: via: (https://fedoramagazine.org/modifying-windows-local-accounts-with-fedora-and-chntpw/)
[#]: author: (Shaun Assam https://fedoramagazine.org/author/sassam/)

Modifying Windows local accounts with Fedora and chntpw
======

![][1]

I recently encountered a problem at work where a client’s Windows 10 PC lost trust to the domain. The user is an executive and the hindrance of his computer can affect real-time mission-critical tasks. He gave me 30 minutes to resolve the issue while he attended a meeting.

Needless to say, I’ve encountered this issue many times in my career. It’s an easy fix using the Windows 7/8/10 installation media to reset the Administrator password, remove the PC off the domain and rejoin it. Unfortunately it didn’t work this time. After 20 minutes of scouring the net and scanning through the Microsoft Docs with no success, I turned to my development machine running Fedora with hopes of finding a solution.

With _dnf search_ I found a utility called **chntpw**:

```
$ dnf search windows | grep password
```

According to the summary, _chntpw_ will “change passwords in Windows SAM files.”

Little did I know at the time there was more to this utility than explained in the summary. Hence, this article will go through the steps I used to successfully reset a Windows local user password using _chntpw_ and a Fedora Workstation Live boot USB. The article will also cover some of the features of _chntpw_ used for basic user administration.

### Installation and setup

If the PC can connect to the internet after booting the live media, install _chntpw_ from the official Fedora repository with:

```
$ sudo dnf install chntpw
```

If you’re unable to access the internet, no sweat! Fedora Workstation Live boot media has all the dependencies installed out-of-the-box, so all we need is the package. You can find the builds for your Fedora version from the [Fedora Project’s Koji][2] site. You can use another computer to download the utility and use a USB thumb drive, or other form of media to copy the package.

First and foremost we need to create the Fedora Live USB stick. If you need instructions, the article on [How to make a Fedora USB stick][3] is a great reference.

Once the key is created shut-down the Windows PC, insert the thumb drive if the USB key was created on another computer, and turn on the PC — be sure to boot from the USB drive. Once the live media boots, select “Try Fedora” and open the Terminal application.

Also, we need to mount the Windows drive to access the files. Enter the following command to view all drive partitions with an NTFS filesystem:

```
$ sudo blkid | grep ntfs
```

Most hard drives are assigned to _/dev/sdaX_ where X is the partition number — virtual drives may be assigned to _/dev/vdX_, and some newer drives (like SSDs) use _/dev/nvmeX_. For this example the Windows C drive is assigned to _/dev/sda2_. To mount the drive enter:

```
$ sudo mount /dev/sda2 /mnt
```

Fedora Workstation contains the _ntfs-3g_ and _ntfsprogs_ packages out-of-the-box. If you’re using a spin that does not have NTFS working out of the box, you can install these two packages from the official Fedora repository with:

```
$ sudo dnf install ntfs-3g ntfsprogs
```

Once the drive is mounted, navigate to the location of the SAM file and verify that it’s there:

```
$ cd /mnt/Windows/System32/config
$ ls | grep SAM
 SAM
 SAM.LOG1
 SAM.LOG2
```

### Clearing or resetting a password

Now it’s time to get to work. The help flag **-h** provides everything we need to know about this utility and how to use it:

```
$ chntpw -h
chntpw: change password of a user in a Windows SAM file,
or invoke registry editor. Should handle both 32 and 64 bit windows and
all version from NT3.x to Win8.1
chntpw [OPTIONS]  [systemfile] [securityfile] [otherreghive] […]
  -h          This message
  -u    Username or RID (0x3e9 for example) to interactively edit
  -l          list all users in SAM file and exit
  -i          Interactive Menu system
  -e          Registry editor. Now with full write support!
  -d          Enter buffer debugger instead (hex editor),
  -v          Be a little more verbose (for debuging)
  -L          For scripts, write names of changed files to /tmp/changed
  -N          No allocation mode. Only same length overwrites possible (very safe mode)
  -E          No expand mode, do not expand hive file (safe mode)

Usernames can be given as name or RID (in hex with 0x first)
See readme file on how to get to the registry files, and what they are.
  Source/binary freely distributable under GPL v2 license. See README for details.
  NOTE: This program is somewhat hackish! You are on your own!
```

Use the **-l** parameter to display a list of users it reads from the SAM file:

```
$ sudo chntpw -l SAM
chntpw version 1.00 140201, (c) Petter N Hagen
Hive  name (from header): <\SystemRoot\System32\Config\SAM>
ROOT KEY at offset: 0x001020 * Subkey indexing type is: 686c
File size 65536 [10000] bytes, containing 7 pages (+ 1 headerpage)
Used for data: 346/37816 blocks/bytes, unused: 23/7016 blocks/bytes.

| RID -|---------- Username ------------| Admin? |- Lock? --|
| 01f4 | Administrator                  | ADMIN  | dis/lock |
| 01f7 | DefaultAccount                 |        | dis/lock |
| 03e8 | defaultuser0                   |        | dis/lock |
| 01f5 | Guest                          |        | dis/lock |
| 03ea | sysadm                         | ADMIN  |          |
| 01f8 | WDAGUtilityAccount             |        | dis/lock |
| 03e9 | WinUser                        |        |          |
```

Now that we have a list of Windows users we can edit the account. Use the **-u** parameter followed by the username and the name of the SAM file. For this example, edit the _sysadm_ account:

```
$ sudo chntpw -u sysadm SAM
chntpw version 1.00 140201, (c) Petter N Hagen
Hive  name (from header): <\SystemRoot\System32\Config\SAM>
ROOT KEY at offset: 0x001020 * Subkey indexing type is: 686c
File size 65536 [10000] bytes, containing 7 pages (+ 1 headerpage)
Used for data: 346/37816 blocks/bytes, unused: 23/7016 blocks/bytes.

================= USER EDIT ====================

RID     : 1002 [03ea]
Username: sysadm
fullname: SysADM
comment :
homedir :

00000220 = Administrators (which has 2 members)

Account bits: 0x0010 =
[ ] Disabled        | [ ] Homedir req.    | [ ] Passwd not req. |
[ ] Temp. duplicate | [X] Normal account  | [ ] NMS account     |
[ ] Domain trust ac | [ ] Wks trust act.  | [ ] Srv trust act   |
[ ] Pwd don't expir | [ ] Auto lockout    | [ ] (unknown 0x08)  |
[ ] (unknown 0x10)  | [ ] (unknown 0x20)  | [ ] (unknown 0x40)  |

Failed login count: 0, while max tries is: 0
Total  login count: 0

- - - User Edit Menu:
1 - Clear (blank) user password
(2 - Unlock and enable user account) [seems unlocked already]
3 - Promote user (make user an administrator)
4 - Add user to a group
5 - Remove user from a group
q - Quit editing user, back to user select
Select: [q] >
```

To clear the password press **1** and ENTER. If successful you will see the following message:

```
...
Select: [q] > 1
Password cleared!
================= USER EDIT ====================

RID     : 1002 [03ea]
Username: sysadm
fullname: SysADM
comment :
homedir :

00000220 = Administrators (which has 2 members)

Account bits: 0x0010 =
[ ] Disabled        | [ ] Homedir req.    | [ ] Passwd not req. |
[ ] Temp. duplicate | [X] Normal account  | [ ] NMS account     |
[ ] Domain trust ac | [ ] Wks trust act.  | [ ] Srv trust act   |
[ ] Pwd don't expir | [ ] Auto lockout    | [ ] (unknown 0x08)  |
[ ] (unknown 0x10)  | [ ] (unknown 0x20)  | [ ] (unknown 0x40)  |

Failed login count: 0, while max tries is: 0
Total  login count: 0
** No NT MD4 hash found. This user probably has a BLANK password!
** No LANMAN hash found either. Try login with no password!
...
```

Verify the change by repeating:

```
$ sudo chntpw -l SAM
chntpw version 1.00 140201, (c) Petter N Hagen
Hive  name (from header): <\SystemRoot\System32\Config\SAM>
ROOT KEY at offset: 0x001020 * Subkey indexing type is: 686c
File size 65536 [10000] bytes, containing 7 pages (+ 1 headerpage)
Used for data: 346/37816 blocks/bytes, unused: 23/7016 blocks/bytes.

| RID -|---------- Username ------------| Admin? |- Lock? --|
| 01f4 | Administrator                  | ADMIN  | dis/lock |
| 01f7 | DefaultAccount                 |        | dis/lock |
| 03e8 | defaultuser0                   |        | dis/lock |
| 01f5 | Guest                          |        | dis/lock |
| 03ea | sysadm                         | ADMIN  | *BLANK*  |
| 01f8 | WDAGUtilityAccount             |        | dis/lock |
| 03e9 | WinUser                        |        |          |

...
```

The “Lock?” column now shows _BLANK_ for the sysadm user. Type **q** to exit and **y** to write the changes to the SAM file. Reboot the machine into Windows and login using the account (in this case _sysadm_) without a password.

### Features

Furthermore, _chntpw_ can perform basic Windows user administrative tasks. It has the ability to promote the user to the administrators group, unlock accounts, view and modify group memberships, and edit the registry.

#### The interactive menu

_chntpw_ has an easy-to-use interactive menu to guide you through the process. Use the **-i** parameter to launch the interactive menu:

```
$ chntpw -i SAM
chntpw version 1.00 140201, (c) Petter N Hagen
Hive  name (from header): <\SystemRoot\System32\Config\SAM>
ROOT KEY at offset: 0x001020 * Subkey indexing type is: 686c
File size 65536 [10000] bytes, containing 7 pages (+ 1 headerpage)
Used for data: 346/37816 blocks/bytes, unused: 23/7016 blocks/bytes.

<>========<> chntpw Main Interactive Menu <>========<>
Loaded hives:
  1 - Edit user data and passwords
  2 - List groups
      - - -
  9 - Registry editor, now with full write support!
  q - Quit (you will be asked if there is something to save)
```

#### Groups and account membership

To display a list of groups and view its members, select option **2** from the interactive menu:

```
...
What to do? [1] -> 2
Also list group members? [n] y
=== Group # 220 : Administrators
    0 | 01f4 | Administrator                   |
    1 | 03ea | sysadm                          |
=== Group # 221 : Users
    0 | 0004 | NT AUTHORITY\INTERACTIVE        |
    1 | 000b | NT AUTHORITY\Authenticated Users |
    2 | 03e8 | defaultuser0                    |
    3 | 03e9 | WinUser                         |
=== Group # 222 : Guests
    0 | 01f5 | Guest                           |
=== Group # 223 : Power Users
...
=== Group # 247 : Device Owners
```

#### Adding the user to the administrators group

To elevate the user with administrative privileges press **1** to edit the account, then **3** to promote the user:

```
...
Select: [q] > 3

=== PROMOTE USER
Will add the user to the administrator group (0x220)
and to the users group (0x221). That should usually be
what is needed to log in and get administrator rights.
Also, remove the user from the guest group (0x222), since
it may forbid logins.

(To add or remove user from other groups, please other menu selections)

Note: You may get some errors if the user is already member of some
of these groups, but that is no problem.

Do it? (y/n) [n] : y

Adding to 0x220 (Administrators) …
sam_put_user_grpids: success exit
Adding to 0x221 (Users) …
sam_put_user_grpids: success exit
Removing from 0x222 (Guests) …
remove_user_from_grp: NOTE: group not in users list of groups, may mean user not member at all. Safe. Continuing.
remove_user_from_grp: NOTE: user not in groups list of users, may mean user was not member at all. Does not matter, continuing.
sam_put_user_grpids: success exit

Promotion DONE!
```

#### Editing the Windows registry

Certainly the most noteworthy, as well as the most powerful, feature of chntpw is the ability to edit the registry and write to it. Select **9** from the interactive menu:

```
...
What to do? [1] -> 9
Simple registry editor. ? for help.

> ?
  Simple registry editor:
  hive []       - list loaded hives or switch to hive number
  cd            - change current key
  ls | dir []   - show subkeys & values,
  cat | type    - show key value
  dpi           - show decoded DigitalProductId value
  hex           - hexdump of value data
  ck []         - Show keys class data, if it has any
  nk            - add key
  dk            - delete key (must be empty)
  ed            - Edit value
  nv            - Add value
  dv            - Delete value
  delallv       - Delete all values in current key
  rdel          - Recursively delete key & subkeys
  ek            - export key to  (Windows .reg file format)
  debug         - enter buffer hexeditor
  st []         - debug function: show struct info
  q             - quit
```

#### Finding help

As we saw earlier, the **-h** parameter allows us to quickly access a reference guide to the options available with chntpw. The man page contains detailed information and can be accessed with:

```
$ man chntpw
```

Also, if you’re interested in a more hands-on approach, spin up a virtual machine. [Windows Server 2019][4] has an evaluation period of 180 days, and [Windows Hyper-V Server 2019][5] is unlimited. Creating a Windows guest VM will provide the basics to modify the Administrator account for testing and learning. For help with quickly creating a guest VM refer to the article [Getting started with virtualization in Gnome Boxes][6].

### Conclusion

_chntpw_ is a hidden gem for Linux administrators and IT professionals alike. While a nifty tool to quickly reset Windows account passwords, it can also be used to troubleshoot and modify local Windows accounts with a no-nonsense feel that delivers. This is perhaps only one such tool for solving the problem, though. If you’ve experienced this issue and have an alternative solution, feel free to put it in the comments below.

This tool, like many other “hacking” tools, holds with it an ethical responsibility. Even chntpw states:

> NOTE: This program is somewhat hackish! You are on your own!

When using such programs, we should remember the three edicts outlined in the message displayed when running **sudo** for the first time:

  1. Respect the privacy of others.
  2. Think before you type.
  3. With great power comes great responsibility.



* * *

_Photo by _[_Silas Köhler_][7]_ on _[_Unsplash_][8]_,_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/modifying-windows-local-accounts-with-fedora-and-chntpw/

作者：[Shaun Assam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sassam/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/chntpw-816x345.jpg
[2]: https://koji.fedoraproject.org/koji/packageinfo?packageID=6945
[3]: https://fedoramagazine.org/make-fedora-usb-stick/
[4]: https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2019
[5]: https://www.microsoft.com/en-us/evalcenter/evaluate-hyper-v-server-2019
[6]: https://fedoramagazine.org/getting-started-with-virtualization-in-gnome-boxes/
[7]: https://unsplash.com/@silas_crioco?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/key-lock?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
