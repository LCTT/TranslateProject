How to Manage Software RAID’s in Linux with ‘Mdadm’ Tool – Part 9
================================================================================
Regardless of your previous experience with RAID arrays, and whether you followed all of the tutorials in [this RAID series][1] or not, managing software RAIDs in Linux is not a very complicated task once you have become acquainted with `mdadm --manage` command.

![Manage Raid Devices with Mdadm in Linux](http://www.tecmint.com/wp-content/uploads/2015/10/Manage-Raid-with-Mdadm-Tool-in-Linux.jpg)

Manage Raid Devices with Mdadm in Linux – Part 9

In this tutorial we will review the functionality provided by this tool so that you can have it handy when you need it.

#### RAID Testing Scenario ####

As in the last article of this series, we will use for simplicity a RAID 1 (mirror) array which consists of two 8 GB disks (/dev/sdb and /dev/sdc) and an initial spare device (/dev/sdd) to illustrate, but the commands and concepts listed herein apply to other types of setups as well. That said, feel free to go ahead and add this page to your browser’s bookmarks, and let’s get started.

### Understanding mdadm Options and Usage ###

Fortunately, mdadm provides a `built-in --help` flag that provides explanations and documentation for each of the main options.

Thus, let’s start by typing:

    # mdadm --manage --help

to see what are the tasks that `mdadm --manage` will allow us to perform and how:

![Manage RAID with mdadm Tool](http://www.tecmint.com/wp-content/uploads/2015/10/mdadm-Usage-in-Linux.png)

Manage RAID with mdadm Tool

As we can see in the above image, managing a RAID array involves performing the following tasks at one time or another:

- (Re)Adding a device to the array.
- Mark a device as faulty.
- Removing a faulty device from the array.
- Replacing the faulty device with a spare one.
- Start an array that’s partially built.
- Stop an array.
- Mark an array as ro (read-only) or rw (read-write).

### Managing RAID Devices with mdadm Tool ###

Note that if you omit the `--manage` option, mdadm assumes management mode anyway. Keep this fact in mind to avoid running into trouble further down the road.

The highlighted text in the previous image shows the basic syntax to manage RAIDs:

    # mdadm --manage RAID options devices

Let’s illustrate with a few examples.

#### ​Example 1: Add a device to the RAID array ####

You will typically add a new device when replacing a faulty one, or when you have a spare part that you want to have handy in case of a failure:

    # mdadm --manage /dev/md0 --add /dev/sdd1

![Add Device to Raid Array](http://www.tecmint.com/wp-content/uploads/2015/10/Add-Device-to-Raid-Array.png)

Add Device to Raid Array

#### ​Example 2: Marking a RAID device as faulty and removing it from the array ####

This is a mandatory step before logically removing the device from the array, and later physically pulling it out from the machine – in that order (if you miss one of these steps you may end up causing actual damage to the device):

    # mdadm --manage /dev/md0 --fail /dev/sdb1

Note how the spare device added in the previous example is used to automatically replace the failed disk. Not only that, but the [recovery and rebuilding of raid data][2] start immediately as well:

![Recover and Rebuild Raid Data](http://www.tecmint.com/wp-content/uploads/2015/10/Recover-and-Rebuild-Raid-Data.png)

Recover and Rebuild Raid Data

Once the device has been indicated as failed manually, it can be safely removed from the array:

    # mdadm --manage /dev/md0 --remove /dev/sdb1

#### ​Example 3: Re-adding a device that was part of the array which had been removed previously ####

Up to this point, we have a working RAID 1 array that consists of 2 active devices: /dev/sdc1 and /dev/sdd1. If we attempt to re-add /dev/sdb1 to /dev/md0 right now:

    # mdadm --manage /dev/md0 --re-add /dev/sdb1

we will run into an error:

mdadm: --re-add for /dev/sdb1 to /dev/md0 is not possible
because the array is already made up of the maximum possible number of drives. So we have 2 choices: a) add /dev/sdb1 as a spare, as shown in Example #1, or b) remove /dev/sdd1 from the array and then re-add /dev/sdb1.

We choose option b), and will start by stopping the array to later reassemble it:

    # mdadm --stop /dev/md0
    # mdadm --assemble /dev/md0 /dev/sdb1 /dev/sdc1

If the above command does not successfully add /dev/sdb1 back to the array, use the command from Example #1 to do it.

Although mdadm will initially detect the newly added device as a spare, it will start rebuilding the data and when it’s done doing so, it should recognize the device to be an active part of the RAID:

![Raid Rebuild Status](http://www.tecmint.com/wp-content/uploads/2015/10/Raid-Rebuild-Status.png)

Raid Rebuild Status

#### Example 4: Replace a Raid device with a specific disk ####

Replacing a disk in the array with a spare one is as easy as:

    # mdadm --manage /dev/md0 --replace /dev/sdb1 --with /dev/sdd1

![Replace Raid Device](http://www.tecmint.com/wp-content/uploads/2015/10/Replace-Raid-device.png)

Replace Raid Device

This results in the device following the `--with` switch being added to the RAID while the disk indicated through `--replace` being marked as faulty:

![Check Raid Rebuild Status](http://www.tecmint.com/wp-content/uploads/2015/10/Check-Raid-Rebuild-Status.png)

Check Raid Rebuild Status

#### ​Example 5: Marking an Raid array as ro or rw ####

After creating the array, you must have created a filesystem on top of it and mounted it on a directory in order to use it. What you probably didn’t know then is that you can mark the RAID as ro, thus allowing only read operations to be performed on it, or rw, in order to write to the device as well.

To mark the device as ro, it needs to be unmounted first:

    # umount /mnt/raid1
    # mdadm --manage /dev/md0 --readonly
    # mount /mnt/raid1
    # touch /mnt/raid1/test1

![Set Permissions on Raid Array](http://www.tecmint.com/wp-content/uploads/2015/10/Set-Permissions-on-Raid-Array.png)

Set Permissions on Raid Array

To configure the array to allow write operations as well, use the `--readwrite` option. Note that you will need to unmount the device and stop it before setting the rw flag:

    # umount /mnt/raid1
    # mdadm --manage /dev/md0 --stop
    # mdadm --assemble /dev/md0 /dev/sdc1 /dev/sdd1
    # mdadm --manage /dev/md0 --readwrite
    # touch /mnt/raid1/test2

![Allow Read Write Permission on Raid](http://www.tecmint.com/wp-content/uploads/2015/10/Allow-Write-Permission-on-Raid.png)

Allow Read Write Permission on Raid

### Summary ###

Throughout this series we have explained how to set up a variety of software RAID arrays that are used in enterprise environments. If you followed through the articles and the examples provided in these articles you are prepared to leverage the power of software RAIDs in Linux.

Should you happen to have questions or suggestions, feel free to contact us using the form below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-software-raid-devices-in-linux-with-mdadm/

作者：[GABRIEL CÁNEPA][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/understanding-raid-setup-in-linux/
[2]:http://www.tecmint.com/recover-data-and-rebuild-failed-software-raid/