[#]: subject: "How to Upgrade from RHEL 7 to RHEL 8"
[#]: via: "https://www.2daygeek.com/upgrading-from-rhel-7-to-rhel-8/"
[#]: author: "Prakash Subramanian https://www.2daygeek.com/author/prakash/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Upgrade from RHEL 7 to RHEL 8
======

As you would have already known that the Red Hat Enterprise Linux (RHEL) 7 maintenance support phase will come to an end in June 2024.

It’s time to prepare for the upgrade from RHEL 7 to RHEL 8 because during Extended Life Phase, Red Hat will provide limited ongoing technical support, and support will only be supplied on existing installations.

In this article, we will show you how to perform in-place upgrade from RHEL 7 to RHEL 8 using Leapp utility.

In place upgrade is more straightforward method, which results in minimal disruption to hosted services.

### What is Leapp utility

Leapp is the supported tool used to perform in-place system upgrades from one major version of Red Hat Enterprise Linux to another. Leapp uses several Python programs as part of a workflow. These Python programs are called actors and can make changes to your system.

###### Leapp operations consist of two phases:

  * **Preupgrade :** A process that examines many aspects of the system and runs checks to determine if the OS can be upgraded. During this phase, the Leapp utility collects data about the system, assesses upgradability, and generates a pre-upgrade report. It summarizes potential problems and suggests recommended solutions.
  * **Upgrade :** If the system is upgradable, Leapp downloads necessary data and prepares an RPM transaction for the upgrade. Once upgrade process complete then reboot the system. The system boots into a RHEL 8-based initial RAM disk image, initramfs and upgrades all packages and automatically reboots to the RHEL 8 system.



The Leapp data file contains the following metadata files, which are required by leapp utility for upgrade.

  * **pes-events.json –** RPM package changes
  * **repomap.json –** RPM repository mapping
  * **device_driver_deprecation_data.json –** Information about removed or unsupported kernel drivers



**Make a Note:**
As on today ( **12-June-2023** ), the latest version of Leapp data file is **`'leapp-data-22.tar.gz'`** , which supports **RHEL 7.9** to **8.8** directly, and if you want to go to any other RHEL 8.x minor version, you may need to perform **“lift and shift”** actions (New server build and data copy), which could cause significant disruption to workflow.

### Prerequisites:

  * Leapp upgrade supports only RHEL 7.9, so upgrade your system if you are running any other minor versions of RHEL 7.x.
  * **/var** partition need more space as leapp dumps all files under the directory **‘/var/lib/leapp’** , so recommend to create a separate filesystem with 10GB.
  * **/** partition should have at-least 4-5 GB of free space.
  * **/tmp** should be mounted with ‘exec’ permission.
  * Enable ‘rhel-7-server-extras-rpms’ in order to install Leapp utility.
  * Backup the system, which required for roll back.
  * **Downtime –** The upgrade process can take several hours 2-3 hours, including Roll Back plan.
  * Check version computability for third party software like Antivirus, ect,. Temporarily disable Antivirus software to prevent the upgrade from failing.



### Preparing a RHEL 7 system for the upgrade

To prevent issues after the upgrade and to ensure that your system is ready to be upgraded to the next major version of RHEL, complete all necessary preparation steps before upgrading.

This procedure describes the steps that are necessary before performing an in-place upgrade from RHEL 7.9 to RHEL 8.8 by using the Leapp utility.

Check if you have the Red Hat Enterprise Linux Server **[subscription attached to the system][1]**.

```

    subscription-manager list --installed

    +-------------------------------------------+
              Installed Product Status
    +-------------------------------------------+
    Product Name:   Red Hat Enterprise Linux Server
    Product ID:     69
    Version:        7.9
    Arch:           x86_64
    Status:         Subscribed
    Status Details:
    Starts:         Monday 12 Jun 2023
    Ends:           Tuesday 11 Jun 2024

```

If not, attach a subscription using the following command.

```

    subscription-manager attach --auto

```

Make sure that your system running with latest version of RHEL 7.9. If not, perform the upgrade using yum command and reboot if any new kernel installed as part of yum update.

```

    yum update
    reboot

```

Ensure that you have RHEL 7 **‘Base & Extra’** repositories enabled. If not, enable it as shown below.

```

    subscription-manager repos --enable rhel-7-server-rpms --enable rhel-7-server-extras-rpms

```

Set the Red Hat Subscription Manager to use the latest RHEL 7 content.

```

    subscription-manager release --unset

```

If you use the ‘yum-plugin-versionlock’ plug-in to lock packages to a specific version, clear the lock by running:

```

    yum versionlock clear

```

Install the Leapp utility:

```

    yum install leapp

```

Check if **`/tmp`** is mounted with exec option. If not, remount it.

```

    mount -o remount,exec /tmp

```

#### Creating a FileSystem

As updated earlier, we will be creating a new filesystem for **/var/lib/leapp** directory. Once disk added to the system, run the following commands.

```

    for host in `ls /sys/class/scsi_host`; do echo "Scanning $host...Completed"; echo "- - -" > /sys/class/scsi_host/$host/scan; done

    Scanning host0...Completed
    Scanning host1...Completed
    Scanning host2...Completed

```

Create PV, VG, LV and filesystem.

```

    pvcreate /dev/sde                            #Create PV
    vgcreate leapp_vg /dev/sde                      #Create VG
    lvcreate -l 100%FREE -n leapp_lv leapp_vg       #Create LV
    mkfs.xfs /dev/mapper/leapp_vg-leapp_lv          #Create FS

```

Add Filesystem information to the **[/etc/fstab file][2]**.

```

    echo "/dev/mapper/leapp_vg-leapp_lv /var/lib/leapp xfs default 0 0" >> /etc/fstab

```

Mount the filesystem

```

    mount -a

```

#### Downloading Leapp Data File

To perform in-place upgrade of RHEL system using leap utility, the data file attached to the below Red Hat article must be downloaded and extracted into the **`'/etc/leapp/files'`** directory on the target system.

**Note:** Please ensure you are always using the latest builds of leapp and leapp-repository packages.

<https://access.redhat.com/articles/3664871> – (login required)

Once downloaded, copy the file to the target host and run:

```

    tar -xzf leapp-data-22.tar.gz -C /etc/leapp/files && rm leapp-data-22.tar.gz

```

### Performing the pre-upgrade from RHEL 7 to RHEL 8

To assess upgradability of your system, start the pre-upgrade process by using the **`'leapp preupgrade'`** command. During this phase, the Leapp utility perform various checks and generates a pre-upgrade report and logs, which can be found in the following locations. Review the pre-upgrade report and fix it, if you found any inhibitors as this prevent you from upgrading. The pre-upgrde output shows as **`GREEN`** in order to perform an actual upgrade.

  * /var/log/leapp/leapp-report.txt
  * /var/log/leapp/leapp-preupgrade.log



```

    leapp preupgrade

```

You may see the output same as below post fixing all inhibitors.

![][3]

#### How to fix Inhibitors?

I have fixed few inhibitors during my upgrade activity, which can be found below. You may get few others depends on your installed packages.

**Inhibitor:** Missing required answers in the answer file.
**Solution:** Execute the command given under command section, in my case:

```

    leapp answer --section remove_pam_pkcs11_module_check.confirm=True

```

**Inhibitor:** Detected loaded kernel drivers (pata_acpi) which have been removed in RHEL 8. Upgrade cannot proceed.
**Solution:** rmmod pata_acpi – Support for this device driver has been removed in RHEL 8, so remove the driver.

```

    rmmod pata_acpi

```

**Inhibitor:** The installed OS version is not supported for the in-place upgrade to RHEL 8
**Solution:** Upgrade your system to latest version of RHEL 7.9

```

    yum update
    reboot

```

**Inhibitor:** Possible problems with remote login using root account
**Solution:** PermitRootLogin no – Change from Yes to No and save the file. Restart sshd.

```

    vi /etc/ssh/sshd_config
    PermitRootLogin no

    systemctl restart sshd

```

### Performing the upgrade from RHEL 7 to RHEL 8

If the system is upgradable, Leapp downloads necessary data and prepares an RPM transaction for the upgrade. To run the upgrade, execute:

```

    leapp upgrade

```

You may see the output similar to the below one.

![][4]

Finally reboot the system. In this phase, the system boots into a RHEL 8 based initial RAM disk image, initramfs and upgrades all packages and automatically reboots to the RHEL 8 system.

```

    reboot

```

### Verifying the post-upgrade state of the RHEL 8 system

The below list of verification steps recommended to perform after an in-place upgrade to RHEL 8.

Verify the current OS version is Red Hat Enterprise Linux 8:

```

    cat /etc/redhat-release
    Red Hat Enterprise Linux release 8.8 (Ootpa)

```

Check the OS kernel version:

```

    uname -r
    4.18.0-477.13.1.el8_8.x86_64

```

Verify that the correct product is installed:

```

    subscription-manager list --installed

    +-------------------------------------------+
              Installed Product Status
    +-------------------------------------------+
    Product Name:   Red Hat Enterprise Linux Server
    Product ID:     479
    Version:        8.8
    Arch:           x86_64
    Status:         Subscribed
    Status Details:
    Starts:         Monday 12 Jun 2023
    Ends:           Tuesday 11 Jun 2024

```

### Performing post-upgrade tasks of the RHEL 8 system

The following major tasks are recommended after an in-place upgrade to RHEL 8.

Remove any remaining Leapp packages from the exclude list in the /etc/dnf/dnf.conf, which are automatically added to the exclude list during the upgrade.

```

    yum config-manager --save --setopt exclude=''

```

##### 1) Remove remaining RHEL 7 packages:

To determine old kernel versions, run:

```

    cd /lib/modules && ls -ld *.el7*

    total 12k
    drwxr-xr-x. 2 root root 217 Mar 22 22:56 3.10.0-1160.80.1.el7.x86_64
    drwxr-xr-x. 2 root root 217 Mar 23 09:21 3.10.0-1160.81.1.el7.x86_64
    drwxr-xr-x. 2 root root 217 May 11 01:03 3.10.0-1160.83.1.el7.x86_64

```

Remove weak modules from the old kernel. If you have multiple old kernels, repeat the following step for each kernel:

```

    [ -x /usr/sbin/weak-modules ] && /usr/sbin/weak-modules --remove-kernel <version>

```

Replace **‘version’** with the kernel version determined in the previous step. As i have three older kernel so, running below three commands.

```

    [ -x /usr/sbin/weak-modules ] && /usr/sbin/weak-modules --remove-kernel 3.10.0-1160.80.1.el7.x86_64
     [ -x /usr/sbin/weak-modules ] && /usr/sbin/weak-modules --remove-kernel 3.10.0-1160.81.1.el7.x86_64
     [ -x /usr/sbin/weak-modules ] && /usr/sbin/weak-modules --remove-kernel 3.10.0-1160.83.1.el7.x86_64

```

Remove the old kernel from the boot loader entry. If you have multiple old kernels, repeat this step for each kernel:

```

    /bin/kernel-install remove <version> /lib/modules/<version>/vmlinuz

```

Replace **‘version’** with the kernel version determined in the previous step. As i have three older kernel so, running below three commands.

```

    /bin/kernel-install remove 3.10.0-1160.80.1.el7.x86_64 /lib/modules/3.10.0-1160.80.1.el7.x86_64/vmlinuz
    /bin/kernel-install remove 3.10.0-1160.81.1.el7.x86_64 /lib/modules/3.10.0-1160.81.1.el7.x86_64/vmlinuz
    /bin/kernel-install remove 3.10.0-1160.83.1.el7.x86_64 /lib/modules/3.10.0-1160.83.1.el7.x86_64/vmlinuz

```

To find remaining RHEL 7 packages, run:

```

    rpm -qa | grep -e '\.el[67]' | grep -vE '^(gpg-pubkey|libmodulemd|katello-ca-consumer)' | sort

```

Remove remaining RHEL 7 packages, which are determined in the previous step.

```

    dnf remove [Packages_from_above_output]

```

Remove remaining Leapp dependency packages:

```

    dnf remove leapp-deps-el8 leapp-repository-deps-el8

```

Remove any remaining empty directories:

```

    rm -r /lib/modules/*el7*

```

Remove all remaining upgrade-related data from the system:

```

    rm -rf /var/log/leapp /root/tmp_leapp_py3 /var/lib/leapp

```

##### 2) Replace the old rescue kernel and initial RAM disk with the current kernel and disk:

Remove the existing rescue kernel and initial RAM disk:

```

    rm /boot/vmlinuz-*rescue* /boot/initramfs-*rescue*

```

Reinstall the current kernel to recover the rescue kernel and related initial RAM disk:

```

    dnf reinstall -y kernel-core-$(uname -r)

```

Verify that the old kernels have been removed from the bootloader entry:

```

    grubby --info=ALL | grep "\.el7" || echo "Old kernels are not present in the bootloader."

```

Verify that the previously removed rescue kernel and rescue initial RAM disk files have been created for the current kernel:

```

    ls /boot/vmlinuz-*rescue* /boot/initramfs-*rescue*

    lsinitrd /boot/initramfs-*rescue*.img | grep -qm1 "$(uname -r)/kernel/" && echo "OK" || echo "FAIL"

```

Verify the rescue boot entry refers to the existing rescue files. See the grubby output:

```

    grubby --info $(ls /boot/vmlinuz-*rescue*)

```

##### 3) Finally reboot the system.

```

    reboot

```

##### Wrapping Up

In this tutorial, we’ve shown you how to perform in-place upgrade from RHEL 7 to RHEL 8 using leapp utility.

If you have any questions or feedback, feel free to comment below.

**Ref:** [Red Hat][5]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/upgrading-from-rhel-7-to-rhel-8/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/enable-rhel-subscription-red-hat-subscription-management/
[2]: https://www.2daygeek.com/understanding-linux-etc-fstab-file/
[3]: https://www.2daygeek.com/wp-content/uploads/2023/06/Leapp_Pre_Upgrade_Output-1024x823.jpg
[4]: https://www.2daygeek.com/wp-content/uploads/2023/06/Leapp_Upgrade_Output-1024x801.jpg
[5]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/upgrading_from_rhel_7_to_rhel_8/index
