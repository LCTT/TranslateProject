[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Deploy Ceph in a Raspberry Pi cluster)
[#]: via: (https://opensource.com/article/21/1/ceph-raspberry-pi)
[#]: author: (AJ Canlas https://opensource.com/users/ajscanlas)

Deploy Ceph in a Raspberry Pi cluster
======
Install Ceph storage using ceph-ansible and deploy it in a Raspberry Pi
cluster.
![Vector, generic Raspberry Pi board][1]

[Ceph][2] is an open source software storage platform that provides object, block, and filesystem storage in a unified storage cluster. I first used Ceph when I [integrat][3][ed it with OpenStack][3]. At first, I was confused about why I should use Ceph since storage devices are widely available. But after using it for more than three years, the platform's stability and integrity have proven its value again and again.

This article will show you how to install Ceph using [ceph-ansible][4] (an officially supported Ansible playbook for Ceph) and deploy it in a Raspberry Pi cluster.

**Materials:**

  1. Four Raspberry Pi 4B 4GB models
  2. Four 32GB microSD cards (boot OS)
  3. Four Raspberry Pi cases with fans and heatsinks (very important)
  4. Four Raspberry Pi chargers
  5. Six 32GB USB flash drives (for the Ceph OSD nodes)



**Architecture:**

![Project architecture][5]

(Aaron John Canlas, [CC BY-SA 4.0][6])

Regarding the configuration:

  * Both the front-end and back-end networks are in the same subnet
  * The [Ceph Monitor][7] software uses a Raspberry Pi 4B with 4GB RAM
  * The [Ceph OSD][8] nodes use the same Raspberry Pi model but with two USB flash drives for the OSD disks



### Deploy Ceph using ceph-ansible

Using Ceph's Ansible repository makes the deployment smooth and simple.

#### 1\. Copy ssh keys to all servers

I have a common user called `cephadmin` on all servers (each Raspberry Pi is a server in this context). The `cephadmin` user is configured with passwordless `sudo` to make things easier.

After generating a key using `ssh-keygen`, deploy all keys using `ssh-copy-id`.

I use a Bash for-loop because I'm using consistent and incremental hostnames:


```
$ for i in {0..3}; \
  do ssh-copy-id cephadmin@rpi4b4-$i; \
done
```

You need to accept and enter your password on each one, but you can automate this with `expect`.

#### 2\. Clone ceph-ansible and install requirements

Install Git to clone the repository:


```
`$ sudo yum install git -y`
```

Clone the ceph-ansible repository:


```
$ git clone <https://github.com/ceph/ceph-ansible.git>
$ cd ceph-ansible/
```

I'm using an AArch64 build of CentOS 7, so I must install some required packages before continuing.

First, Python pip:


```
`$ sudo yum install python3-pip -y`
```

Then the packages ceph-ansible needs:


```
`$ sudo yum install python3-devel libffi-devel openssl-devel -y`
```

Finally, the requirements `ceph-ansible` needs:


```
`$ pip3 install -r requirements.txt --user`
```

I received this error:


```
You are linking against OpenSSL 1.0.2, which is no longer supported by the OpenSSL project.
To use this version of cryptography you need to upgrade to a newer version of OpenSSL. For
this version only you can also set the environment variable
CRYPTOGRAPHY_ALLOW_OPENSSL_102 to allow OpenSSL 1.0.2.
```

This may be related to the architecture, because I can't replicate the error in a CentOS 7 virtual machine.

For deployment, export `CRYPTOGRAPHY_ALLOW_OPENSSL_102` to `True` so that Ansible can run:


```
`$ export CRYPTOGRAPHY_ALLOW_OPENSSL_102=True`
```

#### 3\. Configure ceph-ansible for deployment

Now you're ready to deploy Ceph using ceph-ansible.

Copy `site.yml.sample` to `site.yml`:


```
`$ mv site.yml.sample site.yml`
```

Create `all.yml` in the `group_vars` directory:


```
$ cat &lt;&lt; EOF &gt;&gt; group_vars/all.yml
ceph_origin: repository
ceph_repository: community
ceph_repository_type: cdn
ceph_stable_release: nautilus
monitor_interface: wlan0
public_network: "192.168.100.0/24"
cluster_network: "192.168.100.0/24"
dashboard_enabled: false
configure_firewall: false
EOF
```

Create `osds.yml` in the `group_vars` directory:


```
$ cat &lt;&lt; EOF &gt;&gt; group_vars/all.yml
osd_scenario: collocated
devices:
 - /dev/sda
\- /dev/sdb
EOF
```

Create an inventory file:


```
$ cat &lt;&lt; EOF &gt;&gt; inventory
[mons]
rpi4b4-0

[osds]
rpi4b4-1
rpi4b4-2
rpi4b4-3
EOF
```

As of this writing, there is a bug in the ceph-ansible repository (according to this [bug ticket][9]). You can mitigate the bug by editing line 85 and 86 of the roles:


```
    - (wait_for_all_osds_up.stdout | from_json)["osdmap"]["num_osds"] | int &gt; 0
    - (wait_for_all_osds_up.stdout | from_json)["osdmap"]["num_osds"] == (wait_for_all_osds_up.stdout | from_json)["osdmap"]["num_up_osds"]
```

#### 4\. Deploy Ceph

Run the Ansible playbook with your inventory file:


```
`$ ansible-playbook -i inventory site.yml`
```

After 15–20 minutes, you should see this result:

![Ceph deployment][10]

(Aaron John Canlas, [CC BY-SA 4.0][6])

### Next steps

Previously, I [manually deployed][11] an OpenStack cluster in another Raspberry Pi cluster. I hope to integrate it with this one. I'm also looking into deploying with [TripleO][12].

The possibilities for Raspberry Pi, Ansible, and OpenStack are endless. Get started with your own experiment, and let me know how it goes in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/ceph-raspberry-pi

作者：[AJ Canlas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ajscanlas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_board_vector_red.png?itok=yaqYjYqI (Vector, generic Raspberry Pi board)
[2]: https://ceph.io/
[3]: https://opensource.com/business/15/1/introduction-ceph-storage-openstack
[4]: https://docs.ceph.com/projects/ceph-ansible/en/latest/index.html#
[5]: https://opensource.com/sites/default/files/uploads/architecture_0_0.png (Project architecture)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://docs.ceph.com/en/latest/glossary/#term-Ceph-Monitor
[8]: https://docs.ceph.com/en/latest/glossary/#term-OSD
[9]: https://tracker.ceph.com/issues/43430
[10]: https://opensource.com/sites/default/files/uploads/ceph.png (Ceph deployment)
[11]: https://opensource.com/article/20/12/openstack-raspberry-pi
[12]: https://wiki.openstack.org/wiki/TripleO
