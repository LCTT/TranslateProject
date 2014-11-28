Canonical Launches LXD Open Source Virtualization Container
================================================================================
> Canonical is launching a new container-based virtualization hypervisor for its open source Ubuntu Linux operating system, called LXD. How will it get along with Docker?

As open source container-based virtualization explodes in popularity, perhaps it was only a matter of time before [Canonical][1] announced its own, homegrown virtualization container system to contend with [Docker][2]. That's what the company has now done with the launch of [LXD][3] for [Ubuntu Linux][4].

Canonical announced the hypervisor— which the company is pronouncing "lex-dee," the better, I suppose, to avoid confusion with the Schedule 1 drug of similar nomenclature—Nov. 4. The pitch for the tool, which is basically a server for the [LXC][5] virtualized container system built into the Linux kernel, goes like this:

> Imagine you could launch a new machine in under a second, and that you could launch hundreds of them on a single server. Hundreds! Now, imagine that you have hardware-guaranteed security to ensure that those machines can’t pry or spy on one another. Imagine you can connect them separately and securely to networks. And imagine that you can run that on a single node or a million, live migrate machines between those nodes, and talk to all of it through a clean, extensible REST API. That's what LXD sets out to deliver.

LXD will also feature tight integration with OpenStack—in fact, it's part of Canonical's [OpenStack][6] Juno for Ubuntu—as well as hardware-level security protections, according to the company, which said it is working with chip manufacturers (it hasn't indicated which ones) on the latter technology.

This is all pretty cool. If Canonical fully implements these features, LXD could go a long way toward making LXC a truly enterprise-ready containerized virtualization platform.

But to do that, Canonical needs to siphon off some of the momentum Docker is currently enjoying and reorient part of the open source container-based virtualization world toward LXD. So far, Canonical appears eager to position LXD as a technology that can complement and enhance Docker, not compete directly with it. That makes sense to a degree, since LXD and Docker are somewhat different sorts of beasts, at least for now. But Canonical has stated its ambition "to bring much of the awesome security and isolation of LXD to docker [sic] as well," an idea that may not sit well with the Docker community, especially if LXD remains closely intertwined with Ubuntu rather than being distribution-agnostic.

It doesn't help that what Canonical is doing with LXD is very similar to what it has already done with technologies including [Unity][7], the desktop interface it designed for Ubuntu. Like LXD, Unity was a way for Canonical to replace a major part of the Ubuntu software stack—specifically, the [GNOME][8] desktop environment—with a homegrown alternative, providing the company more control over Ubuntu, yet also making Ubuntu less readily compatible with many open source apps that were not designed for Ubuntu and Unity. The move engendered more than a little ill-will among the Ubuntu user base, although most of that sentiment has long since dissipated.

It's hard to imagine Canonical marginalizing Docker in the same way it has GNOME, and even harder to imagine many people feeling emotional about this in the way they did when Unity replaced GNOME. But time will tell.

--------------------------------------------------------------------------------

via: http://thevarguy.com/ubuntu/110514/canonical-launches-lxd-open-source-virtualization-container

作者：[Christopher Tozzi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://thevarguy.com/author/christopher-tozzi
[1]:http://canonical.com/
[2]:http://docker.com/
[3]:http://www.ubuntu.com/cloud/tools/lxd
[4]:http://ubuntu.com/
[5]:https://linuxcontainers.org/
[6]:http://openstack.org/
[7]:http://unity.ubuntu.com/
[8]:http://www.gnome.org/