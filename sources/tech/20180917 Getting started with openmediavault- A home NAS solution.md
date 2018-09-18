[translating by jamelouis]
Getting started with openmediavault: A home NAS solution
======
This network-attached file server offers a solid array of features and is easy to install and configure.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-cloud.png?itok=vz0PIDDS)

With so many cloud storage options readily available, some folks might question the value of having a home NAS (network-attached storage) server. After all, with your files on the cloud, you don't have to worry about managing the maintenance, updates, and security of your own server.

But that's not entirely true, is it? You have a home network, so you've got to pay at least some attention to that network's health and security. Assuming you're already keeping on top of that, then [a home NAS][1] really isn't adding that much additional hassle. And there are all kinds of benefits to gain from that minor amount of work.

You can have a local backup of every computer in your house (you can also back up off-site). Have a media server that holds movies, music, and photos regardless of whether your internet connection flakes out. Work on large files on multiple computers in your home without waiting for them to traverse from some random computer somewhere else on the internet. Plus, you can have your NAS pull double duty with other services, like hosting local email or a household wiki. Perhaps most importantly, with a home NAS, your data is your data—under your control and always accessible.

The follow-on question is which NAS solution to choose. Sure, you could buy a pre-built solution and call it a day, but what fun is that? And practically speaking, although it's great to have an appliance that handles everything for you, it's often better to have a rig that you can fix and upgrade yourself. This is the situation I found myself in recently. I chose to install and set up [openmediavault][2].

### Why openmediavault?

There are a few open source NAS solutions out there, some arguably more popular than openmediavault. When I asked around, for instance, [FreeNAS][3] was recommended the most. So why didn't I go with that? After all, it is more widely used, includes more features, and offers more support options, [according to a comparison on the FreeNAS website][4]. That's certainly all true. But openmediavault is no slouch. It's actually based on an earlier version of FreeNAS, and while its numbers are lower in terms of downloads and features, they're more than adequate for my needs.

Another factor was a simple matter of comfort. Openmediavault's underlying operating system is [Debian][5], whereas FreeNAS sits atop [FreeBSD][6]. I'm personally not as familiar with FreeBSD, so that would make it more difficult for me to fix things if my NAS starts misbehaving. It also makes it more difficult for me to tweak things or add my own services to the machine if I want. Sure, I could learn FreeBSD and get more familiar with it, but I'm already home-building this NAS; I've found that projects tend to be more successful if you limit the number of "learning opportunities" you give yourself to complete them.

Every situation is different, of course, so do your research and decide what seems to be the best fit for you. FreeNAS looks like the right solution for a lot of people. Openmediavault was the right one for me.

### Installation and configuration

The installation process is pretty well covered in the [openmediavault documentation][7], so I won't rehash that here. If you've ever installed a Linux distribution, most of the steps should look familiar to you (though with a somewhat uglier [Ncurses][8] interface than you might see on modern distributions). I installed it using the [dedicated drive][9] instructions. However, those instructions, while good, are rather spartan. When you're done, you have a base system installed, but there's more to do before you can actually use your NAS to store any files. For instance, the dedicated drive instructions install openmediavault on a hard drive, but that's the operating system drive, not the one with the shared space that's accessible to other computers on your network. You need to walk yourself through setting that up and configuring it.

The first thing you should do is load up the administrative web interface and change the default password. This password is different from the root password you set during the installation process. It's the administrative account for the web interface, and the default username and password are `admin` and `openmediavault`, respectively—definitely something you'll want to change immediately after logging in.

#### Set up your drives

Once you've installed openmediavault, you need it to actually do stuff for you. The first logical step is to set up the drives that you're going to use for storage. I'm assuming that you've already got them physically installed, so all you have to do at this point is get openmediavault to recognize them and configure them. The first step is making sure those disks are visible. The sidebar menu has a lot of options, but it's very sensibly organized. Go to **Storage - > Disks**. Once you click that, you should see all of the drives you've installed on your server, including the one where you actually installed openmediavault. If you don't see all of your drives there, click the Scan button to see if it picks them up. Usually, it's not a problem.

You could mount these drives individually to set them up as your file share, but for a file server, you'll want some redundancy. You want to be able to treat multiple drives as a single volume and recover your data if a drive fails or add new drives when you start running out of space. That means you're going to want a [RAID][10]. The topic of what specific type of RAID configuration you want is a deep rabbit hole that deserves an article all of its own (and many have been written), but suffice it to say that you'll need more than one drive, and in the best case, all of your drives store the same amount of data.

Openmediavault supports all standard RAID levels, so you're good to go there. Configure your RAID in **Storage - > RAID Management**. Configuration is absurdly simple: Click the Create button, choose the disks you want in your RAID array, the RAID level you want to use, and a name for the array. Openmediavault handles the rest for you. There's no messing around at the command line, trying to remember which flags to use with the `mdadm` command. In my specific case, I have six 2-TB drives that I've set up as RAID 10.

With your RAID set up, you've almost got a place to store things. You just need to set up a file system. Just like your desktop computer, a hard drive doesn't do you any good until you format it. So the next place to go in openmediavault's control panel is **Storage - > File Systems**. Just like configuring your RAID, click the Create button and follow the prompts. In this case, you choose the device to format. If you have only the one RAID on your server, it should be something like `md0`. You'll also need to choose the filesystem type. If you're not sure, just use the standard ext4 type.

#### Define your shares

Sweet! You've got a place to store files. Now you just need to make it visible on your home network. Configure this from the **Services** section of the openmediavault control panel. When it comes to setting up a file share on a network, there are really two main choices: NFS or SMB/CIFS. As a rule of thumb, if all of the computers on your network are running Linux distributions, then you're probably better off using NFS. However, if your home network is a mixed environment with a combination of Linux, Windows, Mac OS, and embedded devices, then SMB/CIFS is probably the right choice.

These options aren't mutually exclusive. You could actually run both services on your server and get the best of both worlds. Or you could mix it up if you have specific devices dedicated to particular tasks. Whatever your usage scenario, configuring these services is dirt simple. Click on the service you want, enable it from its Settings, and define the shared folders you want visible on the network. In the case of SMB/CIFS shares, there are a few more settings available than with NFS, but most of the defaults are fine to start with. The cool thing is that since it's so easy to configure, it's also pretty easy to change on the fly.

#### Configure users

You're almost done. You've configured your drives in a RAID. You've formatted that RAID with a file system. And you've defined shared folders on that formatted RAID. The only thing left is saying who can access those shares and how much. This is handled from the **Access Rights Management** section. Use the **User** and **Group** sections to define the users who connect to your shared folders and the permissions they have with the files in those folders.

Once you do that, you're pretty much good to go. You'll need to access your shares from your various client machines, but that's a topic for another article.

Have fun!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/openmediavault

作者：[Jason van Gumster][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mairin
[1]: https://opensource.com/article/18/8/automate-backups-raspberry-pi
[2]: https://openmediavault.org
[3]: https://freenas.org
[4]: http://www.freenas.org/freenas-vs-openmediavault/
[5]: https://www.debian.org/
[6]: https://www.freebsd.org/
[7]: https://openmediavault.readthedocs.io/en/latest/installation/index.html
[8]: https://invisible-island.net/ncurses/
[9]: https://openmediavault.readthedocs.io/en/latest/installation/via_iso.html
[10]: https://en.wikipedia.org/wiki/RAID
