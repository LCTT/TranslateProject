How to Install Docker CE on Your Desktop
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/containers-volumes_0.jpg?itok=gv0_MXiZ)

[In the previous article,][1] we learned some of the basic terminologies of the container world. That background information will come in handy when we run commands and use some of those terms in follow-up articles, including this one. This article will cover the installation of Docker on desktop Linux, macOS, and Windows, and it is intended for beginners who want to get started with Docker containers. The only prerequisite is that you are comfortable with command-line interface.

### Why do I need Docker CE on my local machine?

As a new user, you many wonder why you need containers on your local systems. Aren’t they meant to run in cloud and servers as microservices? While containers have been part of the Linux world for a very long time, it was Docker that made them really consumable with its tools and technologies.

The greatest thing about Docker containers is that you can use your local machine for development and testing. The container images that you create on your local system can then run “anywhere.” There is no conflict between developers and operators about apps running fine on development systems but not in production.

The point is that in order to create containerized applications, you must be able to run and create containers on your local systems.

You can use any of the three platforms -- desktop Linux, Windows, or macOS as the development platform for containers. Once Docker is successfully running on these systems, you will be using the same commands across platforms so it really doesn’t matter which OS you are running underneath.

That’s the beauty of Docker.

### Let’s get started

There are two editions of Docker. Docker Enterprise Edition (EE) and Docker Community Edition (CE). We will be using the Docker Community Edition, which is a free of cost version of Docker intended for developers and enthusiasts who want to get started with Docker.

There are two channels of Docker CE: stable and edge. As the name implies, the stable version gives you well-tested quarterly updates, whereas the edge version offers new updates every month. After further testing, these edge features are added to the stable release. I recommend the stable version for new users.
Docker CE is supported on macOS, Windows 10, Ubuntu 14.04, 16.04, 17.04 and 17.10; Debian 7.7,8,9 and 10; Fedora 25, 26, 27; and centOS. While you can download Docker CE binaries and install on your Desktop Linux systems, I recommend adding repositories so you continue to receive patches and updates.

### Install Docker CE on Desktop Linux

You don’t need a full blown desktop Linux to run Docker, you can install it on a bare minimal Linux server as well, that you can run in a VM. In this tutorial, I am running it on Fedora 27 and Ubuntu 17.04 running on my main systems.

### Ubuntu Installation

First things first. Run a system update so your Ubuntu packages are fully updated:
```
$ sudo apt-get update

```

Now run system upgrade:
```
$ sudo apt-get dist-upgrade

```

Then install Docker PGP keys:
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

Update the repository info again:
$ sudo apt-get update

```

Now install Docker CE:
```
$ sudo apt-get install docker-ce

```

Once it's installed, Docker CE runs automatically on Ubuntu based systems. Let’s check if it’s running:
```
$ sudo systemctl status docker

```

You should get the following output:
```
docker.service - Docker Application Container Engine
 Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
 Active: active (running) since Thu 2017-12-28 15:06:35 EST; 19min ago
 Docs: https://docs.docker.com
Main PID: 30539 (dockerd)

```

Since Docker is installed on your system, you can now use Docker CLI (Command Line Interface) to run Docker commands. Living up to the tradition, let’s run the ‘Hello World’ command:
```
$ sudo docker run hello-world

```

![YMChR_7xglpYBT91rtXnqQc6R1Hx9qMX_iO99vL8][2]
Congrats! You have Docker running on your Ubuntu system.

### Installing Docker CE on Fedora

Things are a bit different on Fedora 27. On Fedora, you first need to install def-plugins-core packages that will allow you to manage your DNF packages from CLI.
```
$ sudo dnf -y install dnf-plugins-core

```

Now install the Docker repo on your system:
```
$ sudo dnf config-manager \
 --add-repo \
 https://download.docker.com/linux/fedora/docker-ce.repo
It’s time to install Docker CE:

$ sudo dnf install docker-ce

```

Unlike Ubuntu, Docker doesn’t start automatically on Fedora. So let’s start it:
```
$ sudo systemctl start docker

```

You will have to start Docker manually after each reboot, so let’s configure it to start automatically after reboots. $ systemctl enable docker Well, it’s time to run the Hello World command:
```
$ sudo docker run hello-world

```

Congrats, Docker is running on your Fedora 27 system.

### Cutting your roots

You may have noticed that you have to use sudo to run Docker commands. That’s because of Docker daemon’s binding with the UNIX socket, instead of a TCP port and that socket is owned by the root user. So, you need sudo privileges to run the docker command. You can add system user to the docker group so it won’t require sudo:
```
$ sudo groupadd docker

```

In most cases, the docker user group is automatically created when you install Docker CE, so all you need to do is add your user to that group:
```
$ sudo usermod -aG docker $USER

```

To test if the group has been added successfully, run the groups command against the name of the user:
```
$ groups swapnil

```

(Here, Swapnil is the user.)

This is the output on my system:
```
$ swapnil : swapnil adm cdrom sudo dip plugdev lpadmin sambashare docker

```

You can see that the user also belongs to the docker group. Log out of your system, so that group changes take effect. Once you log back in, try the Hello World command without sudo:
```
$ docker run hello-world

```

You can check system wide info about the installed version of Docker and more by running this command:
```
$ docker info

```

### Install Docker CE on macOS and Windows

You can easily install Docker CE (and EE) on macOS and Windows. Download the official Docker for Mac and install it the way you install applications on macOS, by simply dragging them into the Applications directory. Once the file is copied, open Docker from spotlight to start the installation process. Once installed, Docker will start automatically and you can see it in the top bar of macOS.

![IEX23j65zYlF8mZ1c-T_vFw_i1B1T1hibw_AuhEA][3]

macOS is UNIX, so you can simply open the terminal app and start using Docker commands natively. Test the hello world app:
```
$ docker run hello-world

```

Congrats, you have Docker running on your macOS.

### Docker on Windows 10

You need the latest version of Windows 10 Pro or Server in order to run/install Docker on it. If you are not fully updated, Windows won’t install Docker. I got an error on my Windows 10 system and had to run system updates. My version was still behind, and I hit [this][4] bug. So, if you fail to install Docker on Windows, just know you are not alone. Keep an eye on that bug to find a solution.

Once you install Docker on Windows, you can either use bash shell via WSL or use PowerShell to run docker commands. Let’s test the “Hello World” command in PowerShell:
```
PS C:\Users\swapnil> docker run hello-world

```

Congrats, you have Docker running on Windows.

In the next article, we will talk about pulling images from DockerHub and running containers on our systems. We will also talk about pushing our own containers to Docker Hub.


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/how-install-docker-ce-your-desktop

作者：[SWAPNIL BHARTIYA][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/intro-to-linux/2017/12/container-basics-terms-you-need-know
[2]:https://lh5.googleusercontent.com/YMChR_7xglpYBT91rtXnqQc6R1Hx9qMX_iO99vL8Z8C0-BlynDcL5B5pG-zzH0fKU0Qvnzd89v0KDEbZiO0gTfGNGfDtO-FkTt0bmzIQ-TKbNmv18S9RXdkSeXqgKDFRewnaHPj2
[3]:https://lh3.googleusercontent.com/IEX23j65zYlF8mZ1c-T_vFw_i1B1T1hibw_AuhEAfwv9oFpMfcAqkgEk7K5o58iDAAfGozSpIvY_qEsTOHRlSbesMKwTnG9rRkWba1KPSmnuH1LyoccDGNO3Clbz8du0gSByZxNj
[4]:https://github.com/docker/for-win/issues/1263
