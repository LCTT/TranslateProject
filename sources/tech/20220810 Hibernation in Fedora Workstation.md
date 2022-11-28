[#]: subject: "Hibernation in Fedora Workstation"
[#]: via: "https://fedoramagazine.org/hibernation-in-fedora-36-workstation/"
[#]: author: "Alexander Wellbrock https://fedoramagazine.org/author/w4tsn/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Hibernation in Fedora Workstation
======

![][1]

Photo by [Beth Jnr][2] on [Unsplash][3]

This article walks you through the manual setup for hibernation in Fedora Linux 36 Workstation using BTRFS and is based on a [gist by eloylp on github][4].

### Goal and Rationale

Hibernation stores the current runtime state of your machine – effectively the contents of your RAM, onto disk and does a clean shutdown. Upon next boot this state is restored from disk to memory such that everything, including open programs, is how you left it.

Fedora Workstation uses ZRAM. This is a sophisticated approach to swap using compression inside a portion of your RAM to avoid the slower on-disk swap files. Unfortunately this means you don’t have persistent space to move your RAM upon hibernation when powering off your machine.

### How it works

The technique configures _systemd_ and _dracut_ to store and restore the contents of your RAM in a temporary swap file on disk. The swap file is created just before and removed right after hibernation to avoid trouble with ZRAM. A persistent swap file is not recommended in conjunction with ZRAM, as it creates some confusing problems compromising your systems stability.

### A word on compatibility and expectations

Hibernation following this guide might not work flawless on your particular machine(s). Due to possible shortcomings of certain drivers you might experience glitches like non-working wifi or display after resuming from hibernation. In that case feel free to reach out to the comment section of the [gist on github][4], or try the tips from the troubleshooting section at the bottom of this article.

The changes introduced in this article are linked to the systemd hibernation.service and hibernation.target units and hence won’t execute on their own nor interfere with your system if you don’t initiate a hibernation. That being said, if it does not work it still adds some small bloat which you might want to remove.

### Hibernation in Fedora Workstation

The first step is to create a btrfs sub volume to contain the swap file.

```

    $ btrfs subvolume create /swap

```

In order to calculate the size of your swap file use _swapon_ to get the size of your _zram_ device.

```

    $ swapon
    NAME       TYPE      SIZE USED PRIO
    /dev/zram0 partition   8G   0B  100

```

In this example the machine has 16G of RAM and a 8G zram device. ZRAM stores roughly double the amount of system RAM compressed in a portion of your RAM. Let that sink in for a moment. This means that in total the memory of this machine can hold 8G * 2 + 8G of RAM which equals 24G uncompressed data. Create and configure the swapfile using the following commands.

```

    $ touch /swap/swapfile
    # Disable Copy On Write on the file
    $ chattr +C /swap/swapfile
    $ fallocate --length 24G /swap/swapfile
    $ chmod 600 /swap/swapfile
    $ mkswap /swap/swapfile

```

Modify the dracut configuration and rebuild your initramfs to include the

resume

module, so it can later restore the state at boot.

```

    $ cat <<-EOF | sudo tee /etc/dracut.conf.d/resume.conf
    add_dracutmodules+=" resume "
    EOF
    $ dracut -f

```

In order to configure grub to tell the kernel to resume from hibernation using the swapfile, you need the UUID and the physical offset.

Use the following command to determine the UUID of the swap file and take note of it.

```

    $ findmnt -no UUID -T /swap/swapfile
    dbb0f71f-8fe9-491e-bce7-4e0e3125ecb8

```

Calculate the correct offset. In order to do this you’ll unfortunately need _gcc_ and the [source of the btrfs_map_physical tool][5], which computes the physical offset of the swapfile on disk. Invoke gcc in the directory you placed the source in and run the tool.

```

    $ gcc -O2 -o btrfs_map_physical btrfs_map_physical.c
    $ ./btrfs_map_physical /path/to/swapfile

    FILE OFFSET  EXTENT TYPE  LOGICAL SIZE  LOGICAL OFFSET  PHYSICAL SIZE  DEVID  PHYSICAL OFFSET
    0            regular      4096          2927632384      268435456      1      <4009762816>
    4096         prealloc     268431360     2927636480      268431360      1      4009766912
    268435456    prealloc     268435456     3251634176      268435456      1      4333764608
    536870912    prealloc     268435456     3520069632      268435456      1      4602200064
    805306368    prealloc     268435456     3788505088      268435456      1      4870635520
    1073741824   prealloc     268435456     4056940544      268435456      1      5139070976
    1342177280   prealloc     268435456     4325376000      268435456      1      5407506432
    1610612736   prealloc     268435456     4593811456      268435456      1      5675941888

```

The first value in the _PHYSICAL OFFSET_ column is the relevant one. In the above example it is **4009762816**.

Take note of the _pagesize_ you get from _getconf PAGESIZE_.

Calculate the kernel _resume_offset_ through division of _physical offset_ by the _pagesize_. In this example that is _4009762816 / 4096 = 978946_.

Update your grub configuration file and add the _resume_ and _resume_offset_ kernel cmdline parameters.

```

    grubby --args="resume=UUID=dbb0f71f-8fe9-491e-bce7-4e0e3125ecb8 resume_offset=2459934" --update-kernel=ALL

```

The created _swapfile_ is only used in the hibernation stage of system shutdown and boot hence not configured in _fstab_. Systemd units control this behavior, so create the two units _hibernate-preparation.service_ and _hibernate-resume.service_.

```

    $ cat <<-EOF | sudo tee /etc/systemd/system/hibernate-preparation.service
    [Unit]
    Description=Enable swap file and disable zram before hibernate
    Before=systemd-hibernate.service

    [Service]
    User=root
    Type=oneshot
    ExecStart=/bin/bash -c "/usr/sbin/swapon /swap/swapfile && /usr/sbin/swapoff /dev/zram0"

    [Install]
    WantedBy=systemd-hibernate.service
    EOF
    $ systemctl enable hibernate-preparation.service
    $ cat <<-EOF | sudo tee /etc/systemd/system/hibernate-resume.service
    [Unit]
    Description=Disable swap after resuming from hibernation
    After=hibernate.target

    [Service]
    User=root
    Type=oneshot
    ExecStart=/usr/sbin/swapoff /swap/swapfile

    [Install]
    WantedBy=hibernate.target
    EOF
    $ systemctl enable hibernate-resume.service

```

Systemd does memory checks on login and hibernation. In order to avoid issues when moving the memory back and forth between _swapfile_ and _zram_ disable some of them.

```

    $ mkdir -p /etc/systemd/system/systemd-logind.service.d/
    $ cat <<-EOF | sudo tee /etc/systemd/system/systemd-logind.service.d/override.conf
    [Service]
    Environment=SYSTEMD_BYPASS_HIBERNATION_MEMORY_CHECK=1
    EOF
    $ mkdir -p /etc/systemd/system/systemd-hibernate.service.d/
    $ cat <<-EOF | sudo tee /etc/systemd/system/systemd-hibernate.service.d/override.conf
    [Service]
    Environment=SYSTEMD_BYPASS_HIBERNATION_MEMORY_CHECK=1
    EOF

```

**Reboot your machine for the changes to take effect**. The following SELinux configuration won’t work if you don’t reboot first.

SELinux won’t like hibernation attempts just yet. Change that with a new policy. An easy although “brute” approach is to initiate hibernation and use the audit log of this failed attempt via _audit2allow_. The following command will fail, returning you to a login prompt.

```

    systemctl hibernate

```

After you’ve logged in again check the audit log, compile a policy and install it. The _-b_ option filters for audit log entries from last boot. The _-M_ option compiles all filtered rules into a module, which is then installed using _semodule -i_.

```

    $ audit2allow -b
    #============= systemd_sleep_t ==============
    allow systemd_sleep_t unlabeled_t:dir search;
    $ cd /tmp
    $ audit2allow -b -M systemd_sleep
    $ semodule -i systemd_sleep.pp

```

Check that hibernation is working via _systemctl hibernate_ again. After resume check that ZRAM is indeed the only active swap device.

```

    $ swapon
    NAME       TYPE      SIZE USED PRIO
    /dev/zram0 partition   8G   0B  100

```

You now have hibernation configured.

### GNOME Shell hibernation integration

You might want to add a hibernation button to the GNOME Shell “Power Off / Logout” section. Check out the extension [Hibernate Status Button][6] to do so.

### Troubleshooting

A first place to troubleshoot any problems is through _journalctl -b_. Have a look around the end of the log, after trying to hibernate, to pin-point log entries that tell you what might be wrong.

Another source of information on errors is the Problem Reporting tool. Especially problems, that are not common but more specific to your hardware configuration. Have a look at it before and after attempting hibernation and see if something comes up. Follow up on any issues via BugZilla and see if others experience similar problems.

### Revert the changes

To reverse the changes made above, follow this check-list:

  * remove the swapfile
  * remove the swap subvolume
  * remove the dracut configuration and rebuild dracut
  * remove kernel cmdline args via _grubby –remove-args=_
  * disable and remove hibernation preparation and resume services
  * remove systemd overrides for _systemd-logind.service_ and _systemd-hibernation.service_
  * remove SELinux module via _semodule -r systemd_sleep_



### Credits and Additional Resources

This article is a community effort based primarily on the work of eloylp. As author of this article I’d like to make transparent that I’ve participated in the discussion to advance the gist behind this but many more minds contributed to make this work. Make certain to check out the [discussion on github][7].

There are already some _ansible_ playbooks and shell scripts to automate the process depicted in this guide. For example check out the shell scripts by [krokwen][8] and [pietryszak][9] or the _ansible_ playbook by [jorp][10]

See the [arch wiki][11] for the full guide on how to calculate the swapfile offset.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/hibernation-in-fedora-36-workstation/

作者：[Alexander Wellbrock][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/w4tsn/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/08/Hibernation_in_Fedora_Workstation-816x345.jpg
[2]: https://unsplash.com/@bthjnr?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/late-night-on-the-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://gist.github.com/eloylp/b0d64d3c947dbfb23d13864e0c051c67
[5]: https://github.com/osandov/osandov-linux/blob/master/scripts/btrfs_map_physical.c
[6]: https://github.com/arelange/gnome-shell-extension-hibernate-status
[7]: https://gist.github.com/eloylp/b0d64d3c947dbfb23d13864e0c051c67?permalink_comment_id=3889734#gistcomment-3889734
[8]: https://pastebin.com/nLSkaMQZ
[9]: https://github.com/pietryszak/fedora-hibernation
[10]: https://github.com/jorp/fedora_hibernate
[11]: https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Hibernation_into_swap_file_on_Btrfs
