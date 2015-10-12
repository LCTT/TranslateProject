How to Setup Red Hat Ceph Storage on CentOS 7.0
================================================================================
Ceph is an open source software platform that stores data on a single distributed computer cluster. When you are planning to build a cloud, then on top of the requirements you have to decide on how to implement your storage. Open Source CEPH is one of RED HAT mature technology based on object-store system, called RADOS, with a set of gateway APIs that present the data in block, file, and object modes. As a result of its open source nature, this portable storage platform may be installed and used in public or private clouds. The topology of a Ceph cluster is designed around replication and information distribution, which are intrinsic and provide data integrity. It is designed to be fault-tolerant, and can run on commodity hardware, but can also be run on a number of more advanced systems with the right setup.

Ceph can be installed on any Linux distribution but it requires the recent kernel and other up-to-date libraries in order to be properly executed. But, here in this tutorial we will be using CentOS-7.0 with minimal installation packages on it.

### System Resources ###

    **CEPH-STORAGE**
    OS: CentOS Linux 7 (Core)
    RAM:1 GB
    CPU:1 CPU
    DISK: 20
    Network: 45.79.136.163
    FQDN: ceph-storage.linoxide.com
    
    **CEPH-NODE**
    OS: CentOS Linux 7 (Core)
    RAM:1 GB
    CPU:1 CPU
    DISK: 20
    Network: 45.79.171.138
    FQDN: ceph-node.linoxide.com

### Pre-Installation Setup ###

There are few steps that we need to perform on each of our node before the CEPH storage setup. So first thing is to make sure that each node is configured with its networking setup with FQDN that is reachable to other nodes.

**Configure Hosts**

To setup the hosts entry on each node let's open the default hosts configuration file as shown below.

    # vi /etc/hosts

----------

    45.79.136.163 ceph-storage ceph-storage.linoxide.com
    45.79.171.138 ceph-node ceph-node.linoxide.com

**Install VMware Tools**

While working on the VMware virtual environment, its recommended that you have installed its open VM tools. You can install using below command.

    #yum install -y open-vm-tools

**Firewall Setup**

If you are working on a restrictive environment where your local firewall in enabled then make sure that the number of following ports are allowed from in your CEPH storge admin node and client nodes.

You must open ports 80, 2003, and 4505-4506 on your Admin Calamari node and port 80 to CEPH admin or Calamari node for inbound so that clients in your network can access the Calamari web user interface.

You can start and enable firewall in centos 7 with given below command.

    #systemctl start firewalld
    #systemctl enable firewalld

To allow the mentioned ports in the Admin Calamari node run the following commands.

    #firewall-cmd --zone=public --add-port=80/tcp --permanent
    #firewall-cmd --zone=public --add-port=2003/tcp --permanent
    #firewall-cmd --zone=public --add-port=4505-4506/tcp --permanent
    #firewall-cmd --reload

On the CEPH Monitor nodes you have to allow the following ports in the firewall.

    #firewall-cmd --zone=public --add-port=6789/tcp --permanent

Then allow the following list of default ports for talking to clients and monitors and for sending data to other OSDs.

    #firewall-cmd --zone=public --add-port=6800-7300/tcp --permanent

It quite fair that you should disable firewall and SELinux settings if you are working in a non-production environment , so we are going to disable the firewall and SELinux in our test environment.

    #systemctl stop firewalld
    #systemctl disable firewalld

**System Update**

Now update your system and then give it a reboot to implement the required changes.

    #yum update
    #shutdown -r 0

### Setup CEPH User ###

Now we will create a separate sudo user that will be used for installing the ceph-deploy utility on each node and allow that user to have password less access on each node because it needs to install software and configuration files without prompting for passwords on CEPH nodes.

To create new user with its separate home directory run the below command on the ceph-storage host.

    [root@ceph-storage ~]# useradd -d /home/ceph -m ceph
    [root@ceph-storage ~]# passwd ceph

Each user created on the nodes must have sudo rights, you can assign the sudo rights to the user using running the following command as shown.

    [root@ceph-storage ~]# echo "ceph ALL = (root) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ceph
    ceph ALL = (root) NOPASSWD:ALL

    [root@ceph-storage ~]# sudo chmod 0440 /etc/sudoers.d/ceph

### Setup SSH-Key ###

Now we will generate SSH keys on the admin ceph node and then copy that key to each Ceph cluster nodes.

Let's run the following command on the ceph-node to copy its ssh key on the ceph-storage.

    [root@ceph-node ~]# ssh-keygen
    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa):
    Created directory '/root/.ssh'.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /root/.ssh/id_rsa.
    Your public key has been saved in /root/.ssh/id_rsa.pub.
    The key fingerprint is:
    5b:*:*:*:*:*:*:*:*:*:c9 root@ceph-node
    The key's randomart image is:
    +--[ RSA 2048]----+

----------

    [root@ceph-node ~]# ssh-copy-id ceph@ceph-storage

![SSH key](http://blog.linoxide.com/wp-content/uploads/2015/10/k3.png)

### Configure PID Count ###

To configure the PID count value, we will make use of the following commands to check the default kernel value. By default its a small maximum number of threads that is '32768'.
So will configure this value to a higher number of threads by editing the system conf file as shown in the image.

![Change PID Value](http://blog.linoxide.com/wp-content/uploads/2015/10/3-PID-value.png)

### Setup Your Administration Node Server ###

With all the networking setup and verified, now we will install ceph-deploy using the user ceph. So, check the hosts entry by opening its file.

    #vim /etc/hosts
    ceph-storage 45.79.136.163
    ceph-node 45.79.171.138

Now to add its repository run the below command.

    #rpm -Uhv http://ceph.com/rpm-giant/el7/noarch/ceph-release-1-0.el7.noarch.rpm

![Adding EPEL](http://blog.linoxide.com/wp-content/uploads/2015/10/k1.png)

OR create a new file and update the CEPH repository parameters but do not forget to mention your current release and distribution.

    [root@ceph-storage ~]# vi /etc/yum.repos.d/ceph.repo

----------

    [ceph-noarch]
    name=Ceph noarch packages
    baseurl=http://ceph.com/rpm-{ceph-release}/{distro}/noarch
    enabled=1
    gpgcheck=1
    type=rpm-md
    gpgkey=https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc

After this update your system and install the ceph deploy package.

### Installing CEPH-Deploy Package ###

To upate the system with latest ceph repository and other packages, we will run the following command along with ceph-deploy installation command.

    #yum update -y && yum install ceph-deploy -y

Image-

### Setup the cluster ###

Create a new directory and move into it on the admin ceph-node to collect all output files and logs by using the following commands.

    #mkdir ~/ceph-cluster
    #cd ~/ceph-cluster

----------

    #ceph-deploy new storage

![setup ceph cluster](http://blog.linoxide.com/wp-content/uploads/2015/10/k4.png)

Upon successful execution of above command you can see it creating its configuration files.
Now to configure the default configuration file of CEPH, open it using any editor and place the following two lines under its global parameters that reflects your public network.

    #vim ceph.conf
    osd pool default size = 1
    public network = 45.79.0.0/16

### Installing CEPH ###

We are now going to install CEPH on each of the node associated with our CEPH cluster. To do so we make use of the following command to install CEPH on our both nodes that is ceph-storage and ceph-node as shown below.

    #ceph-deploy install ceph-node ceph-storage

![installing ceph](http://blog.linoxide.com/wp-content/uploads/2015/10/k5.png)

This will takes some time while processing all its required repositories and installing the required packages.

Once the ceph installation process is complete on both nodes we will proceed to create monitor and gather keys by running the following command on the same node.

    #ceph-deploy mon create-initial

![CEPH Initial Monitor](http://blog.linoxide.com/wp-content/uploads/2015/10/k6.png)

### Setup OSDs and OSD Daemons ###

Now we will setup disk storages, to do so first run the below command to List all of your usable disks by using the below command.

    #ceph-deploy disk list ceph-storage

In results will get the list of your disks used on your storage nodes that you will use for creating the OSD. Let's run the following command that consists of your disks names as shown below.

    #ceph-deploy disk zap storage:sda
    #ceph-deploy disk zap storage:sdb

Now to finalize the OSD setup let's run the below commands to setup the journaling disk along with data disk.

    #ceph-deploy osd prepare storage:sdb:/dev/sda
    #ceph-deploy osd activate storage:/dev/sdb1:/dev/sda1

You will have to repeat the same command on all the nodes while it will clean everything present on the disk. Afterwards to have a functioning cluster, we need to copy the different keys and configuration files from the admin ceph-node to all the associated nodes by using the following command.

    #ceph-deploy admin ceph-node ceph-storage

### Testing CEPH ###

We have almost completed the CEPH cluster setup, let's run the below command to check the status of the running ceph by using the below command on the admin ceph-node.

    #ceph status
    #ceph health
    HEALTH_OK

So, if you did not get any error message at ceph status , that means you have successfully setup your ceph storage cluster on CentOS 7.

### Conclusion ###

In this detailed article we learned about the CEPH storage clustering setup using the two virtual Machines with CentOS 7 OS installed on them that can be used as a backup or as your local storage that can be used to precess other virtual machines by creating its pools. We hope you have got this article helpful. Do share your experiences when you try this at your end.

--------------------------------------------------------------------------------

via: http://linoxide.com/storage/setup-red-hat-ceph-storage-centos-7-0/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/