[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Set up OpenStack on a Raspberry Pi cluster)
[#]: via: (https://opensource.com/article/20/12/openstack-raspberry-pi)
[#]: author: (AJ Canlas https://opensource.com/users/ajscanlas)

Set up OpenStack on a Raspberry Pi cluster
======
Since Arm processors are "first-class citizens" in OpenStack, and
Raspberry Pis are built on Arm, why not combine them?
![Raspberries with pi symbol overlay][1]

In the year since the Raspberry Pi 4 was released, I've seen many tutorials (like [this][2] and [this][3]) and [articles][4] on how well the 4GB model works with container platforms such as Kubernetes (K8s), Lightweight Kubernetes (K3s), and Docker Swarm. As I was doing research, I read that Arm processors are "first-class citizens" in OpenStack. Since Raspberry Pi is built on Arm, I decided to test this theory by installing OpenStack on a Raspberry Pi cluster.

### Prerequisites

There are a few things I need to consider for this project:

  1. Whether to use Ubuntu 64-bit or CentOS 64-bit for Raspberry Pi to boot headless; [Raspberry Pi OS][5] will not suffice, even as a Debian derivative, because there are no OpenStack packages for it.
  2. I need the latest version of OpenStack that will run in my distribution because I don't think the latest versions have an AArch64 image.
  3. I doubt that there is any documentation for automating a ground-up installation, so I will use a step-by-step process.



Materials used:

  1. Four Raspberry Pi 4Bs, 4GB model (8GB recommended)
  2. Four 32GB MicroSD cards
  3. Four Raspberry Pi cases with fans and heatsinks (very important)
  4. Four Raspberry Official Power supply



### Configure the base operating system

I used the CentOS AArch64 image; as I suspected, there is not a CentOS 8 image available for Raspberry Pi, so I used CentOS 7 AArch64 with this [prebuilt image][6]. It didn't work when I tried installing it with `dd`, but it worked like a charm when I used balenaEtcher.

![balenaEtcher][7]

(Aaron John Canlas, [CC BY-SA 4.0][8])

After burning the images on the SD cards, I plugged the Raspberry Pis into my router to check their IP addresses so I could remotely access them using SSH. I configured their WiFi and hostnames using `nmtui` to access them without any cables attached (except for their power source, of course). The default user is `root`, and the default password is `centos`.

![SSH console in CentOS 7 AArch64][9]

(Aaron John Canlas, [CC BY-SA 4.0][8])

I updated the operating system:


```
`[root@rpi4b4-0 ~]# yum update -y`
```

I repeated this process on all my Raspberry Pis then rebooted them.

### Install OpenStack

The latest OpenStack releases (Ussuri and Victoria) require CentOS 8, so I used Train, as it's the most recent version that uses CentOS 7.

![Confirming OpenStack Train's availability][10]

(Aaron John Canlas, [CC BY-SA 4.0][8])

I used the OpenStack Foundation's installation steps, but I encountered some issues with it. To make it easier for others to install OpenStack on CentOS 7, I compiled the following links and tips.

#### Prerequisites

  1. Network Time Protocol (NTP)
    1. [Controller node installation][11]
    2. [Compute node installation][12]
    3. [Verify operation][13]
  2. OpenStack packages: [Run the Train version of the installation][14] (this link includes all versions)
  3. SQL database: [Controller node installation][15]
  4. Message queue: [Controller node installation][16]
  5. Memcached: [Controller node installation][17]
  6. Etcd: [Controller node installation][17]



#### OpenStack services

  1. Identity service (Keystone)
    1. [Controller node installation][18]

    2. [Verify operation][19]

![Keystone verification][20]

(Aaron John Canlas, [CC BY-SA 4.0][8])

  2. Imaging service (Glance)
    1. [Controller node installation][21]

    2. [Verify operation][22]
TIP: Instead of downloading the CirrOS image mentioned in the documents, make sure to use the [AArch64 CirrOS image][23] for Raspberry Pis.

![Glance verification][24]

(Aaron John Canlas, [CC BY-SA 4.0][8])

  3. Placement service (Placement)
    1. [Controller node installation][25]

    2. [Verify operation][26]

![Placement verification][27]

(Aaron John Canlas, [CC BY-SA 4.0][8])

  4. Compute service (Nova)
    1. [Controller node installation][28]

    2. [Compute node installation][29]

    3. [Verify operation][30]
TIP: In the last part of the verify operation, `nova-status upgrade check` fails due to a packaging error. To fix it, edit the following file in the controller: [code]

[root@rpi4b4-0 ~]# vim /etc/httpd/conf.d/00-placement-api.conf
(…)
&lt;Directory /usr/bin&gt;
   &lt;IfVersion &gt;= 2.4&gt;
      Require all granted
   &lt;/IfVersion&gt;
   &lt;IfVersion &lt; 2.4&gt;
      Order allow,deny
      Allow from all
   &lt;/IfVersion&gt;
&lt;/Directory&gt;

```
If you run `nova-status upgrade check` now, it will work.

![Nova verification][31]

(Aaron John Canlas, [CC BY-SA 4.0][8])



  5. Networking service (Neutron)
    1. [Controller node installation][32]

    2. [Controller for Option 2: Self-service network installation][33]
To enable the `br_netfiler` module: [code]

[root@rpi4b4-0 ~]# modprobe br_netfilter
[root@rpi4b4-0 ~]# echo "br_netfilter" &gt; /etc/modules-load.d/br_netfilter.conf
[root@rpi4b4-0 ~]# lsmod|grep br_netfilter
```

    3. [Compute node installation][34]

    4. [Compute for Option 2: Self-service network installation][35]
To enable the `br_netfiler` module: [code]

[root@rpi4b4-X ~]# modprobe br_netfilter
[root@rpi4b4-X ~]# echo "br_netfilter" &gt; /etc/modules-load.d/br_netfilter.conf
[root@rpi4b4-X ~]# lsmod|grep br_netfilter

```
    5. [Verify operation][36]

    6. [Verify operation for Option 2: Self-service network installation][37]

![Neutron verification][38]

(Aaron John Canlas, [CC BY-SA 4.0][8])

  6. Dashboarding service (Horizon)
    1. [Controller node installation][39]
TIP: Upon restarting the httpd service, you will get a 404 error. To resolve it, add this line to the end of the `/etc/openstack-dashboard/local_settings`: [code]`WEBROOT = '/dashboard'`[/code] Then restart httpd as usual: [code]`[root@rpi4b4-X ~]# systemctl restart httpd.service`
```

    2. [Verify operation][40]

![Horizon verification][41]

(Aaron John Canlas, [CC BY-SA 4.0][8])




### How well does it work?

This was a fun and successful experiment. In terms of performance, it's quite slow considering that my controller only has four cores and 4GB RAM, but it's useful for managing multiple computers in one dashboard. My next step will be to try this with a [TripleO][42] deployment and a [Ceph][43] storage cluster to enable live migration. I might try using the Raspberry Pi's Ethernet if I have a larger cluster and workload in mind; for now, [Grafana][44] is working fine for internet monitoring.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/openstack-raspberry-pi

作者：[AJ Canlas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ajscanlas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2 (Raspberries with pi symbol overlay)
[2]: https://opensource.com/article/20/6/kubernetes-raspberry-pi
[3]: https://opensource.com/article/20/3/kubernetes-raspberry-pi-k3s
[4]: https://opensource.com/article/20/8/kubernetes-raspberry-pi
[5]: https://www.raspberrypi.org/software/
[6]: http://mirror.centos.org/altarch/
[7]: https://opensource.com/sites/default/files/uploads/balenaetcher.png (balenaEtcher)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/ssh_console.png (SSH console in CentOS 7 AArch64)
[10]: https://opensource.com/sites/default/files/uploads/openstack_train.png (Confirming OpenStack Train's availability)
[11]: https://docs.openstack.org/install-guide/environment-ntp-controller.html
[12]: https://docs.openstack.org/install-guide/environment-ntp-other.html
[13]: https://docs.openstack.org/install-guide/environment-ntp-verify.html
[14]: https://docs.openstack.org/install-guide/environment-packages-rdo.html
[15]: https://docs.openstack.org/install-guide/environment-sql-database-rdo.html#install-and-configure-components
[16]: https://docs.openstack.org/install-guide/environment-messaging-rdo.html
[17]: https://docs.openstack.org/install-guide/environment-memcached-rdo.html
[18]: https://docs.openstack.org/keystone/train/install/keystone-install-rdo.html
[19]: https://docs.openstack.org/keystone/train/install/keystone-verify-rdo.html
[20]: https://opensource.com/sites/default/files/uploads/keystone_verification.png (Keystone verification)
[21]: https://docs.openstack.org/glance/train/install/install-rdo.html
[22]: https://docs.openstack.org/glance/train/install/verify.html
[23]: http://download.cirros-cloud.net/0.4.0/cirros-0.4.0-aarch64-disk.img
[24]: https://opensource.com/sites/default/files/uploads/glance_verification.png (Glance verification)
[25]: https://docs.openstack.org/placement/train/install/install-rdo.html
[26]: https://docs.openstack.org/placement/train/install/verify.html
[27]: https://opensource.com/sites/default/files/uploads/placement_verification.png (Placement verification)
[28]: https://docs.openstack.org/nova/train/install/controller-install-rdo.html
[29]: https://docs.openstack.org/nova/train/install/compute-install-rdo.html
[30]: https://docs.openstack.org/nova/train/install/verify.html
[31]: https://opensource.com/sites/default/files/uploads/nova_verification.png (Nova verification)
[32]: https://docs.openstack.org/neutron/train/install/controller-install-rdo.html
[33]: https://docs.openstack.org/neutron/train/install/controller-install-option2-rdo.html
[34]: https://docs.openstack.org/neutron/train/install/compute-install-rdo.html
[35]: https://docs.openstack.org/neutron/train/install/compute-install-option2-rdo.html
[36]: https://docs.openstack.org/neutron/train/install/verify.html
[37]: https://docs.openstack.org/neutron/train/install/verify-option2.html
[38]: https://opensource.com/sites/default/files/uploads/neutron_verification.png (Neutron verification)
[39]: https://docs.openstack.org/horizon/train/install/install-rdo.html
[40]: https://docs.openstack.org/horizon/train/install/verify-rdo.html
[41]: https://opensource.com/sites/default/files/uploads/horizon_verification.png (Horizon verification)
[42]: https://docs.openstack.org/tripleo-docs/latest/index.html
[43]: https://en.wikipedia.org/wiki/Ceph_(software)
[44]: https://grafana.com/
