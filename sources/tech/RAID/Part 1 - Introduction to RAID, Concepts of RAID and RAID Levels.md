Introduction to RAID, Concepts of RAID and RAID Levels – Part 1
================================================================================
RAID is a Redundant Array of Inexpensive disks, but nowadays it is called Redundant Array of Independent drives. Earlier it is used to be very costly to buy even a smaller size of disk, but nowadays we can buy a large size of disk with the same amount like before. Raid is just a collection of disks in a pool to become a logical volume.

![RAID in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/RAID.jpg)

Understanding RAID Setups in Linux

Raid contains groups or sets or Arrays. A combine of drivers make a group of disks to form a RAID Array or RAID set. It can be a minimum of 2 number of disk connected to a raid controller and make a logical volume or more drives can be in a group. Only one Raid level can be applied in a group of disks. Raid are used when we need excellent performance. According to our selected raid level, performance will differ. Saving our data by fault tolerance & high availability.

This series will be titled Preparation for the setting up RAID ‘s through Parts 1-9 and covers the following topics.

- Part 1: Introduction to RAID, Concepts of RAID and RAID Levels
- Part 2: How to setup RAID0 (Stripe) in Linux
- Part 3: How to setup RAID1 (Mirror) in Linux
- Part 4: How to setup RAID5 (Striping with Distributed Parity) in Linux
- Part 5: How to setup RAID6 (Striping with Double Distributed Parity) in Linux
- Part 6: Setting Up RAID 10 or 1+0 (Nested) in Linux
- Part 7: Growing an Existing RAID Array and Removing Failed Disks in Raid
- Part 8: Recovering (Rebuilding) failed drives in RAID
- Part 9: Managing RAID in Linux

This is the Part 1 of a 9-tutorial series, here we will cover the introduction of RAID, Concepts of RAID and RAID Levels that are required for the setting up RAID in Linux.

### Software RAID and Hardware RAID ###

Software RAID have low performance, because of consuming resource from hosts. Raid software need to load for read data from software raid volumes. Before loading raid software, OS need to get boot to load the raid software. No need of Physical hardware in software raids. Zero cost investment.

Hardware RAID have high performance. They are dedicated RAID Controller which is Physically built using PCI express cards. It won’t use the host resource. They have NVRAM for cache to read and write. Stores cache while rebuild even if there is power-failure, it will store the cache using battery power backups. Very costly investments needed for a large scale.

Hardware RAID Card will look like below:

![Hardware RAID](http://www.tecmint.com/wp-content/uploads/2014/10/Hardware-RAID.jpg)

Hardware RAID

#### Featured Concepts of RAID ####

- Parity method in raid regenerate the lost content from parity saved information’s. RAID 5, RAID 6 Based on Parity.
- Stripe is sharing data randomly to multiple disk. This won’t have full data in a single disk. If we use 3 disks half of our data will be in each disks.
- Mirroring is used in RAID 1 and RAID 10. Mirroring is making a copy of same data. In RAID 1 it will save the same content to the other disk too.
- Hot spare is just a spare drive in our server which can automatically replace the failed drives. If any one of the drive failed in our array this hot spare drive will be used and rebuild automatically.
- Chunks are just a size of data which can be minimum from 4KB and more. By defining chunk size we can increase the I/O performance.

RAID’s are in various Levels. Here we will see only the RAID Levels which is used mostly in real environment.

- RAID0 = Striping
- RAID1 = Mirroring
- RAID5 = Single Disk Distributed Parity
- RAID6 = Double Disk Distributed Parity
- RAID10 = Combine of Mirror & Stripe. (Nested RAID)

RAID are managed using mdadm package in most of the Linux distributions. Let us get a Brief look into each RAID Levels.

#### RAID 0 (or) Striping ####

Striping have a excellent performance. In Raid 0 (Striping) the data will be written to disk using shared method. Half of the content will be in one disk and another half will be written to other disk.

Let us assume we have 2 Disk drives, for example, if we write data “TECMINT” to logical volume it will be saved as ‘T‘ will be saved in first disk and ‘E‘ will be saved in Second disk and ‘C‘ will be saved in First disk and again ‘M‘ will be saved in Second disk and it continues in round-robin process.

In this situation if any one of the drive fails we will loose our data, because with half of data from one of the disk can’t use to rebuilt the raid. But while comparing to Write Speed and performance RAID 0 is Excellent. We need at least minimum 2 disks to create a RAID 0 (Striping). If you need your valuable data don’t use this RAID LEVEL.

- High Performance.
- There is Zero Capacity Loss in RAID 0
- Zero Fault Tolerance.
- Write and Reading will be good performance.

#### RAID 1 (or) Mirroring ####

Mirroring have a good performance. Mirroring can make a copy of same data what we have. Assuming we have two numbers of 2TB Hard drives, total there we have 4TB, but in mirroring while the drives are behind the RAID Controller to form a Logical drive Only we can see the 2TB of logical drive.

While we save any data, it will write to both 2TB Drives. Minimum two drives are needed to create a RAID 1 or Mirror. If a disk failure occurred we can reproduce the raid set by replacing a new disk. If any one of the disk fails in RAID 1, we can get the data from other one as there was a copy of same content in the other disk. So there is zero data loss.

- Good Performance.
- Here Half of the Space will be lost in total capacity.
- Full Fault Tolerance.
- Rebuilt will be faster.
- Writing Performance will be slow.
- Reading will be good.
- Can be used for operating systems and database for small scale.

#### RAID 5 (or) Distributed Parity ####

RAID 5 is mostly used in enterprise levels. RAID 5 work by distributed parity method. Parity info will be used to rebuild the data. It rebuilds from the information left on the remaining good drives. This will protect our data from drive failure.

Assume we have 4 drives, if one drive fails and while we replace the failed drive we can rebuild the replaced drive from parity informations. Parity information’s are Stored in all 4 drives, if we have 4 numbers of 1TB hard-drive. The parity information will be stored in 256GB in each drivers and other 768GB in each drives will be defined for Users. RAID 5 can be survive from a single Drive failure, If drives fails more than 1 will cause loss of data’s.

- Excellent Performance
- Reading will be extremely very good in speed.
- Writing will be Average, slow if we won’t use a Hardware RAID Controller.
- Rebuild from Parity information from all drives.
- Full Fault Tolerance.
- 1 Disk Space will be under Parity.
- Can be used in file servers, web servers, very important backups.

#### RAID 6 Two Parity Distributed Disk ####

RAID 6 is same as RAID 5 with two parity distributed system. Mostly used in a large number of arrays. We need minimum 4 Drives, even if there 2 Drive fails we can rebuild the data while replacing new drives.

Very slower than RAID 5, because it writes data to all 4 drivers at same time. Will be average in speed while we using a Hardware RAID Controller. If we have 6 numbers of 1TB hard-drives 4 drives will be used for data and 2 drives will be used for Parity.

- Poor Performance.
- Read Performance will be good.
- Write Performance will be Poor if we not using a Hardware RAID Controller.
- Rebuild from 2 Parity Drives.
- Full Fault tolerance.
- 2 Disks space will be under Parity.
- Can be Used in Large Arrays.
- Can be use in backup purpose, video streaming, used in large scale.

#### RAID 10 (or) Mirror & Stripe ####

RAID 10 can be called as 1+0 or 0+1. This will do both works of Mirror & Striping. Mirror will be first and stripe will be the second in RAID 10. Stripe will be the first and mirror will be the second in RAID 01. RAID 10 is better comparing to 01.

Assume, we have 4 Number of drives. While I’m writing some data to my logical volume it will be saved under All 4 drives using mirror and stripe methods.

If I’m writing a data “TECMINT” in RAID 10 it will save the data as follow. First “T” will write to both disks and second “E” will write to both disk, this step will be used for all data write. It will make a copy of every data to other disk too.

Same time it will use the RAID 0 method and write data as follow “T” will write to first disk and “E” will write to second disk. Again “C” will write to first Disk and “M” to second disk.

- Good read and write performance.
- Here Half of the Space will be lost in total capacity.
- Fault Tolerance.
- Fast rebuild from copying data.
- Can be used in Database storage for high performance and availability.

### Conclusion ###

In this article we have seen what is RAID and which levels are mostly used in RAID in real environment. Hope you have learned the write-up about RAID. For RAID setup one must know about the basic Knowledge about RAID. The above content will fulfil basic understanding about RAID.

In the next upcoming articles I’m going to cover how to setup and create a RAID using Various Levels, Growing a RAID Group (Array) and Troubleshooting with failed Drives and much more.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/understanding-raid-setup-in-linux/

作者：[Babin Lonston][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/