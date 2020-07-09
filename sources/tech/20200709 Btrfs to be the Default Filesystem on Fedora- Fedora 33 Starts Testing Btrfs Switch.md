[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Btrfs to be the Default Filesystem on Fedora? Fedora 33 Starts Testing Btrfs Switch)
[#]: via: (https://itsfoss.com/btrfs-default-fedora/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Btrfs to be the Default Filesystem on Fedora? Fedora 33 Starts Testing Btrfs Switch
======

While we’re months away from Fedora’s next stable release ([Fedora 33][1]), there are a few changes worth keeping tabs on.

Among all the other [accepted system-wide changes for Fedora 33][1], the proposal of having Btrfs as the default filesystem for desktop variants is the most interesting one.

Here’s what Fedora mentions for the proposal:

> For laptop and workstation installs of Fedora, we want to provide file system features to users in a transparent fashion. We want to add new features, while reducing the amount of expertise needed to deal with situations like running out of disk space. Btrfs is well adapted to this role by design philosophy, let’s make it the default.

It’s worth noting that this isn’t an accepted system-wide change as of now and is subject to tests made on the [Test Day][2] (**8th July 2020**).

So, why is Fedora proposing this change? Is it going to be useful in any way? Is it a bad move? How is it going to affect Fedora distributions? Let’s talk a few things about it here.

![][3]

### What Fedora Editions will it Affect?

As per the proposal, all the desktop editions of Fedora 33, spins, and labs will be subject to this change, if the tests are successful.

So, you should expect the [workstation editions][4] to get Btrfs as the default file system on Fedora 33.

### Potential Benefits of Implementing This Change

To improve Fedora for laptops and workstation use-cases, Btrfs file system offers some benefits.

Even though this change hasn’t been accepted for Fedora 33 yet – let me point out the advantages of having Btrfs as the default file system:

  * Improves the lifespan of storage hardware
  * Providing an easy solution to resolve when a user runs out of free space on the root or home directory.
  * Less-prone to data corruption and easy to recover
  * Gives better file system re-size ability
  * Ensure desktop responsiveness under heavy memory pressure by enforcing I/O limit
  * Makes complex storage setups easy to manage



If you’re curious, you might want to dive in deeper to know about [Btrfs][5] and its benefits in general.

Not to forget, Btrf was already a supported option — it just wasn’t the default file system.

But, overall, it feels like the introducing of Btrfs as the default file system on Fedora 33 could be a useful change, if implemented properly.

### Will Red Hat Enterprise Linux Implement This?

It’s quite obvious that Fedora is considered as the cutting-edge version of [Red Hat Enterprise Linux][6].

So, if Fedora rejects the change, Red Hat won’t implement it. On the other hand, if you’d want RHEL to use Btrfs, Fedora should be the first to approve the change.

To give you more clarity on this, Fedora has mentioned it in detail:

> Red Hat supports Fedora well, in many ways. But Fedora already works closely with, and depends on, upstreams. And this will be one of them. That’s an important consideration for this proposal. The community has a stake in ensuring it is supported. Red Hat will never support Btrfs if Fedora rejects it. Fedora necessarily needs to be first, and make the persuasive case that it solves more problems than alternatives. Feature owners believe it does, hands down.

Also, it’s worth noting that if you’re someone who does not want btrfs in Fedora, you should be looking at [OpenSUSE][7] and [SUSE Linux Enterprise][8] instead.

### Wrapping Up

Even though it looks like the change should not affect any upgrades or compatibility, you can find more information on the changes with Btrfs by default in [Fedora Project’s wiki page][9].

What do you think about this change targeted for Fedora 33 release? Do you want btrfs file system as the default?

Feel free to let me know your thooughts in the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/btrfs-default-fedora/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://fedoraproject.org/wiki/Releases/33/ChangeSet
[2]: https://fedoraproject.org/wiki/Test_Day:2020-07-08_Btrfs_default?rd=Test_Day:F33_btrfs_by_default_2020-07-08
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/07/btrfs-default-fedora.png?ssl=1
[4]: https://getfedora.org/en/workstation/
[5]: https://en.wikipedia.org/wiki/Btrfs
[6]: https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[7]: https://www.opensuse.org
[8]: https://www.suse.com
[9]: https://fedoraproject.org/wiki/Changes/BtrfsByDefault
