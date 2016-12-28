# LXD 2.0: LXD and OpenStack [11/12]

This is the eleventh blog post in [this series about LXD 2.0][1].

 ![LXD logo](https://linuxcontainers.org/static/img/containers.png) 

Introduction
============================================================

First of all, sorry for the delay. It took quite a long time before I finally managed to get all of this going. My first attempts were using devstack which ran into a number of issues that had to be resolved. Yet even after all that, I still wasn’t be able to get networking going properly.

I finally gave up on devstack and tried “conjure-up” to deploy a full Ubuntu OpenStack using Juju in a pretty user friendly way. And it finally worked!

So below is how to run a full OpenStack, using LXD containers instead of VMs and running all of this inside a LXD container (nesting!).

# Requirements

This post assumes you’ve got a working LXD setup, providing containers with network access and that you have a pretty beefy CPU, around 50GB of space for the container to use and at least 16GB of RAM.

Remember, we’re running a full OpenStack here, this thing isn’t exactly light!

# Setting up the container

OpenStack is made of a lof of different components, doing a lot of different things. Some require some additional privileges so to make our live easier, we’ll use a privileged container.

We’ll configure that container to support nesting, pre-load all the required kernel modules and allow it access to /dev/mem (as is apparently needed).

Please note that this means that most of the security benefit of LXD containers are effectively disabled for that container. However the containers that will be spawned by OpenStack itself will be unprivileged and use all the normal LXD security features.

```
lxc launch ubuntu:16.04 openstack -c security.privileged=true -c security.nesting=true -c "linux.kernel_modules=iptable_nat, ip6table_nat, ebtables, openvswitch"
lxc config device add openstack mem unix-char path=/dev/mem
```

There is a small bug in LXD where it would attempt to load kernel modules that have already been loaded on the host. This has been fixed in LXD 2.5 and will be fixed in LXD 2.0.6 but until then, this can be worked around with:

```
lxc exec openstack -- ln -s /bin/true /usr/local/bin/modprobe
```

Then we need to add a couple of PPAs and install conjure-up, the deployment tool we’ll use to get OpenStack going.

```
lxc exec openstack -- apt-add-repository ppa:conjure-up/next -y
lxc exec openstack -- apt-add-repository ppa:juju/stable -y
lxc exec openstack -- apt update
lxc exec openstack -- apt dist-upgrade -y
lxc exec openstack -- apt install conjure-up -y
```

And the last setup step is to configure LXD networking inside the container.
Answer with the default for all questions, except for:

*   Use the “dir” storage backend (“zfs” doesn’t work in a nested container)
*   Do NOT configure IPv6 networking (conjure-up/juju don’t play well with it)

```
lxc exec openstack -- lxd init
```

And that’s it for the container configuration itself, now we can deploy OpenStack!

# Deploying OpenStack with conjure-up

As mentioned earlier, we’ll be using conjure-up to deploy OpenStack.
This is a nice, user friendly, tool that interfaces with Juju to deploy complex services.

Start it with:

```
lxc exec openstack -- sudo -u ubuntu -i conjure-up
```

*   Select “OpenStack with NovaLXD”
*   Then select “localhost” as the deployment target (uses LXD)
*   And hit “Deploy all remaining applications”

This will now deploy OpenStack. The whole process can take well over an hour depending on what kind of machine you’re running this on. You’ll see all services getting a container allocated, then getting deployed and finally interconnected.

 ![Conjure-Up deploying OpenStack](https://www.stgraber.org/wp-content/uploads/2016/10/conjure-up.png) 

Once the deployment is done, a few post-install steps will appear. This will import some initial images, setup SSH authentication, configure networking and finally giving you the IP address of the dashboard.

# Access the dashboard and spawn a container

The dashboard runs inside a container, so you can’t just hit it from your web browser.
The easiest way around this is to setup a NAT rule with:

```
lxc exec openstack -- iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to <IP>
```

Where “<ip>” is the dashboard IP address conjure-up gave you at the end of the installation.

You can now grab the IP address of the “openstack” container (from “lxc info openstack”) and point your web browser to: http://<container ip>/horizon

This can take a few minutes to load the first time around. Once the login screen is loaded, enter the default login and password (admin/openstack) and you’ll be greeted by the OpenStack dashboard!

 ![oslxd-dashboard](https://www.stgraber.org/wp-content/uploads/2016/10/oslxd-dashboard.png) 

You can now head to the “Project” tab on the left and the “Instances” page. To start a new instance using nova-lxd, click on “Launch instance”, select what image you want, network, … and your instance will get spawned.

Once it’s running, you can assign it a floating IP which will let you reach your instance from within your “openstack” container.

# Conclusion

OpenStack is a pretty complex piece of software, it’s also not something you really want to run at home or on a single server. But it’s certainly interesting to be able to do it anyway, keeping everything contained to a single container on your machine.

Conjure-Up is a great tool to deploy such complex software, using Juju behind the scene to drive the deployment, using LXD containers for every individual service and finally for the instances themselves.

It’s also one of the very few cases where multiple level of container nesting actually makes sense!

--------------------------------------------------------------------------
作者简介：I’m Stéphane Graber. I’m probably mostly known as the LXC and LXD project leader, currently working as a technical lead for LXD at Canonical Ltd. from my home in Montreal, Quebec, Canada.

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/10/26/lxd-2-0-lxd-and-openstack-1112/

作者：[Stéphane Graber ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.stgraber.org/author/stgraber/
[1]:https://www.stgraber.org/2016/03/11/lxd-2-0-blog-post-series-012/
