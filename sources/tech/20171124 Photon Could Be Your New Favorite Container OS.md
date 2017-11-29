KeyLD Translating

Photon Could Be Your New Favorite Container OS
============================================================


![Photon OS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon-linux.jpg?itok=jUFHPR_c "Photon OS")
Jack Wallen says Photon OS is an outstanding platform, geared specifically for containers.[Creative Commons Zero][5]Pixabay

Containers are all the rage, and with good reason. [As discussed previously][13], containers allow you to quickly and easily deploy new services and applications onto your network, without requiring too much in the way of added system resources. Containers are more cost-effective than using dedicated hardware or virtual machines, and they’re easier to update and reuse.

Best of all, containers love Linux (and vice versa). Without much trouble or time, you can get a Linux server up and running with [Docker][14] and deploying containers. But, which Linux distribution is best suited for the deployment of your containers? There are a _lot_  of options. You could go with a standard Ubuntu Server platform (which makes installing Docker and deploying containers incredibly easy), or you could opt for a lighter weight distribution — one geared specifically for the purpose of deploying containers.

One such distribution is [Photon][15]. This particular platform was created in 2005 by [VMware][16]; it includes the Docker daemon and works with container frameworks, such as Mesos and Kubernetes. Photon is optimized to work with [VMware vSphere][17], but it can be used on bare metal, [Microsoft Azure][18], [Google Compute Engine][19], [Amazon Elastic Compute Cloud][20], or [VirtualBox][21].

Photon manages to stay slim by only installing what is absolutely necessary to run the Docker daemon. In the end, the distribution comes in around 300 MB. This is just enough Linux make it all work. The key features to Photon are:

*   Kernel tuned for performance.

*   Kernel is hardened according to the [Kernel Self-Protection Project][6] (KSPP).

*   All installed packages are built with hardened security flags.

*   Operating system boots with validated trust.

*   Photon management daemon manages firewall, network, packages, and users on remote Photon OS machines.

*   Support for persistent volumes.

*   [Project Lightwave][7] integration.

*   Timely security patches and updates.

Photon can be used via [ISO][22], [OVA][23], [Amazon Machine Image][24], [Google Compute Engine image][25], and [Azure VHD][26]. I’ll show you how to install Photon on VirtualBox, using an ISO image. The installation takes about five minutes and, in the end, you’ll have a virtual machine, ready to deploy containers.

### Creating the virtual machine

Before you deploy that first container, you have to create the virtual machine and install Photon. To do this, open up VirtualBox and click the New button. Walk through the Create Virtual Machine wizard (giving Photon the necessary resources, based on the usage you predict the container server will need). Once you’ve created the virtual machine, you need to first make a change to the settings. Select the newly created virtual machine (in the left pane of the VirtualBox main window) and then click Settings. In the resulting window, click on Network (from the left navigation).

In the Networking window (Figure 1), you need to change the Attached to drop-down to Bridged Adapter. This will ensure your Photon server is reachable from your network. Once you’ve made that change, click OK.

### [photon_0.jpg][8]

![change settings](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon_0.jpg?itok=Q0yhOhsZ "change settings")
Figure 1: Changing the VirtualBox network settings for Photon.[Used with permission][1]

Select your Photon virtual machine from the left navigation and then click Start. You will be prompted to locate and attach the IOS image. Once you’ve done that, Photon will boot up and prompt you to hit Enter to begin the installation. The installation is ncurses based (there is no GUI), but it’s incredibly simple.

In the next screen (Figure 2), you will be asked if you want to do a Minimal, Full, or OSTree Server. I opted to go the Full route. Select whichever option you require and hit enter.

### [photon_1.jpg][9]

![installation type](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon_1.jpg?itok=OdnMVpaA "installation type")
Figure 2: Selecting your installation type.[Used with permission][2]

In the next window, select the disk that will house Photon. Since we’re installing this as a virtual machine, there will be only one disk listed (Figure 3). Tab down to Auto and hit Enter on your keyboard. The installation will then require you to type (and verify) an administrator password. Once you’ve done that, the installation will begin and finish in less than five minutes.

### [photon_2.jpg][10]

![Photon ](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon_2.jpg?itok=QL1Rs-PH "Photon")
Figure 3: Selecting your hard disk for the Photon installation.[Used with permission][3]

Once the installation completes, reboot the virtual machine and log in with the username root and the password you created during installation. You are ready to start working.

Before you begin using Docker on Photon, you’ll want to upgrade the platform. Photon uses the _yum_ package manager, so login as root and issue the command  _yum update_ .If there are any updates available, you’ll be asked to okay the process (Figure 4).

### [photon_3.jpg][11]

![Updating](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon_3.jpg?itok=vjqrspE2 "Updating")
Figure 4: Updating Photon.[Used with permission][4]

Usage

As I mentioned, Photon comes with everything you need to deploy containers or even create a Kubernetes cluster. However, out of the box, there are a few things you’ll need to do. The first thing is to enable the Docker daemon to run at start. To do this, issue the commands:

```
systemctl start docker

systemctl enable docker
```

Now we need to create a standard user, so we’re not running the docker command as root. To do this, issue the following commands:

```
useradd -m USERNAME

passwd USERNAME
```

Where USERNAME is the name of the user to add.

Next we need to add the new user to the  _docker_ group with the command:

```
usermod -a -G docker USERNAME
```

Where USERNAME is the name of the user just created.

Log out as the root user and log back in as the newly created user. You can now work with the  _docker _ command without having to make use of  _sudo_  or switching to the root user. Pull down an image from Docker Hub and start deploying containers.

### An outstanding container platform

Photon is, without a doubt, an outstanding platform, geared specifically for containers. Do note that Photon is an open source project, so there is no paid support to be had. If you find yourself having trouble with Photon, hop on over to the [Issues tab in the Photon Project’s Github page][27], where you can read and post about issues. And if you’re interested in forking Photon, you’ll find the source code on the project’s [official Github page][28].

Give Photon a try and see if it doesn’t make deploying Docker containers and/or Kubernetes clusters significantly easier.

 _Learn more about Linux through the free ["Introduction to Linux" ][29]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/photon-could-be-your-new-favorite-container-os

作者：[JACK WALLEN ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/creative-commons-zero
[6]:https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project
[7]:http://vmware.github.io/lightwave/
[8]:https://www.linux.com/files/images/photon0jpg
[9]:https://www.linux.com/files/images/photon1jpg
[10]:https://www.linux.com/files/images/photon2jpg
[11]:https://www.linux.com/files/images/photon3jpg
[12]:https://www.linux.com/files/images/photon-linuxjpg
[13]:https://www.linux.com/learn/intro-to-linux/2017/11/how-install-and-use-docker-linux
[14]:https://www.docker.com/
[15]:https://vmware.github.io/photon/
[16]:https://www.vmware.com/
[17]:https://www.vmware.com/products/vsphere.html
[18]:https://azure.microsoft.com/
[19]:https://cloud.google.com/compute/
[20]:https://aws.amazon.com/ec2/
[21]:https://www.virtualbox.org/
[22]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[23]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[24]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[25]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[26]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[27]:https://github.com/vmware/photon/issues
[28]:https://github.com/vmware/photon
[29]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
