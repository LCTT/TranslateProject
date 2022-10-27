[#]: subject: "A Beginners Manual To Docker Desktop For Linux"
[#]: via: "https://ostechnix.com/docker-desktop-for-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A Beginners Manual To Docker Desktop For Linux
======
How to use Docker Desktop to create and manage containers in Linux

This comprehensive guide explains **what is Docker Desktop** and how to **install Docker Desktop in Linux** and how to **use Docker Desktop to create and manage containers** in Linux.

### Introduction

The use of virtualization technologies is rapidly increasing every year. There are two main types of virtualization technologies. They are **Container-based** virtualization and **Hypervisor-based** virtualization.

Of these two types, Container-based virtualization is able to provide a more lightweight and efficient virtual environment.

**[Docker][1]** is a most popular Container-based, OS-level virtualization platform that allows you to build, ship, and run any app, anywhere.

Before Docker came along, the development process consists of various tools and it was bit difficult to manage and maintain. Thanks to Docker, the development task is a breeze now.

Initially the Docker was available as a command-line program only. It is now also available as GUI version called **"Docker Desktop"**(i.e. Docker GUI).

### What Is Docker Desktop?

Docker Desktop is a graphical program used to create, run and manage Docker containers. Using Docker Desktop, we can setup a complete Docker development environment easily and quickly, with couple mouse clicks.

Docker Desktop GUI provides a few important advantages. Docker Desktop for Linux runs a virtual machine. You might wonder why is that. Here are a few reasons.

Docker Desktop for Linux runs a VM to provide **consistent experience** across different OSs. Since it runs a VM, it is possible to **use new Kernel features**.

Another advantage is **enhanced security**. Some users may intentionally push malicious images in public repositories and trick the users to pull such images. Since Docker Desktop runs a VM, the malware is restricted to the VM and also the malware has no way to access the host.

Docker Desktop VM uses `virtiofs`, a shared filesystem that allows the containers to access a shared directory in the host system. The developers of Docker Desktop claims that near **native file system performance** can be achieved with virtiofs when you allocate right resources to the VM.

Docker Desktop consist of the following components:

* Docker Engine,
* Docker CLI Client,
* Docker Compose,
* Latest version of [Kubernetes][2],
* Credential helper to keep Docker login credentials safe.

Docker Desktop is a cross-platform application that works under Linux, macOS and Windows.

### Docker Desktop Features

The following are the important key features of Docker Desktop.

* Setup complete Docker development environment,
* Containerize and share any app on any cloud platforms, in different languages and frameworks,
* Built-in latest Kubernetes version,
* Automatic updates,
* Toggle between Linux and Windows dev environments to build apps on Windows platforms,
* Fast performance,
* Supports volume mounting for persistent data storage and sharing code,
* Cross-platform.

### Docker Desktop Requirements

To install and configure Docker Desktop, your Linux system must meet the following minimum requirements.

1. 64 bit Linux.
2. The Kernel version should be 3.10 or above.
3. An user account with `sudo` privileges.
4. VT (virtualization technology) support enabled on your system BIOS. [Read: [How To Find If A CPU Supports Virtualization Technology (VT)][3]]
5. Your system should be connected to Internet.

#### Check Linux kernel Version And Architecture

To view the Kernel and architecture details, run the following command from the Terminal:

```
$ uname -a
```

**Sample Output:**

```
Linux ubuntu2204 5.15.0-41-generic #44-Ubuntu SMP Wed Jun 22 14:20:53 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux
```

As you see in the above output, my Ubuntu system's kernel version is **5.15.0-41-generic**and my Ubuntu system's architecture is **64 bit** (**x86_64 x86_64 x86_64 GNU/Linux**). Check the bold letters in the above result.

Well, the Kernel version is higher than the minimum requirement, and the arch is 64 bit. So, we can install and use Docker desktop without any problems.

#### Enable KVM Virtualization Support (VT-X)

If your host system supports VT-X, the kvm module will be automatically loaded.

If it is not loaded for any reason, you can manually load the KVM kernel module using the following commands:

On Intel CPU:

```
$ modprobe kvm_intel
```

On AMD CPU:

```
$ modprobe kvm_amd
```

To check if KVM modules are enabled, run:

```
$ kvm-okINFO: /dev/kvm existsKVM acceleration can be used
```

You can also do the same using `lsmod` and `grep` commands like below:

```
$ lsmod | grep kvm
kvm_intel             364544  0
kvm                  1003520  1 kvm_intel
```

Finally, we must do one last thing. We should add our user to `kvm` group in order to access the `/dev/kvm` device. To do so, run:

```
$ sudo usermod -aG kvm $USER
```

Reboot your system to take effect the changes.

Let us check the current ownership of /dev/kvm using command:

```
$ ls -al /dev/kvm 
crw-rw----+ 1 root kvm 10, 232 Jul 14 13:31 /dev/kvm
```

That's it. We've done all prerequisites for Docker desktop installation. Let us go ahead and install Docker Desktop in Ubuntu Linux.

### Install Docker Desktop In Linux

Docker Desktop is currently packaged for DEB and RPM-based systems. Here, we will see how to install Docker Desktop in Debian 11, Fedora 36 and Ubuntu 22.04 LTS desktop editions.

#### 1. Install Docker Desktop In Debian 11

First of all, update your Debian system.

##### 1.1. Update Debian

Open your Terminal window and run the following commands:

```
$ sudo apt update
```

```
$ sudo apt full-upgrade
```

##### 1.2. Add Docker Repository

Install the necessary certificates to allow apt package manager to use a repository over HTTPS.

To do so, run:

```
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release
```

Next, add Docker's official GPG key by running the following commands:

```
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

Add the Docker official repository:

```
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Update Debian sources list using command:

```
$ sudo apt update
```

##### 1.3. Install Docker Desktop For Linux

Download latest Docker Desktop DEB package from the official **[release][4]** page.

```
$ wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.10.1-amd64.deb
```

And then install Docker Desktop on Debian using command:

```
$ sudo apt install ./docker-desktop-4.10.1-amd64.deb
```

##### 1.4. Start Docker Desktop Service

Run the following commands to allow Docker Desktop service to start automatically at every system reboot.

```
$ systemctl --user enable docker-desktop
```

```
$ systemctl --user start docker-desktop
```

The first command will enable the docker-desktop service to start automatically on system reboot. The second command will start the service if it is not started already.

##### 1.5. Check Docker Version

Docker Desktop bundle installs both Docker Engine and Compose. Let us check its version docker engine version.

To check docker version, run:

```
$ docker --version
Docker version 20.10.17, build 100c701
```

To display the detailed output, run:

```
$ docker version
```

**Sample output:**

```
Client: Docker Engine - Community
 Cloud integration: v1.0.24
 Version:           20.10.17
 API version:       1.41
 Go version:        go1.17.11
 Git commit:        100c701
 Built:             Mon Jun  6 23:02:46 2022
 OS/Arch:           linux/amd64
 Context:           desktop-linux
 Experimental:      true

Server: Docker Desktop 4.10.1 (82475)
 Engine:
  Version:          20.10.17
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.17.11
  Git commit:       a89b842
  Built:            Mon Jun  6 23:01:23 2022
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.6
  GitCommit:        10c12954828e7c7c9b6e0ea9b0c02b01407d3ae1
 runc:
  Version:          1.1.2
  GitCommit:        v1.1.2-0-ga916309
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

Check Docker compose version:

```
$ docker compose version
Docker Compose version v2.6.1
```

![Check Docker Engine And Docker Compose Version][5]

Please note that you will get the details of Docker Desktop only after starting it.

#### 2. Install Docker Desktop In Fedora 36

Make sure you are running an up-to-date Fedora 36 version.

##### 2.1. Update Fedora

To update Fedora, open your Terminal window and run the following command:

```
$ sudo dnf --refresh update
```

##### 2.2. Add Docker Repository

Install the `dnf-plugins-core` package (which provides the commands to manage your DNF repositories) and set up the repository.

```
$ sudo dnf -y install dnf-plugins-core
```

```
$ sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
```

##### 2.3. Install Docker Desktop For Linux

Download the latest Docker Desktop RPM package from the official **[release][6]** page.

```
$ wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.10.1-x86_64.rpm
```

And then install Docker Desktop on Fedora using command:

```
$ sudo dnf install ./docker-desktop-4.10.1-x86_64.rpm
```

##### 2.4. Start Docker Desktop Service

Allow Docker Desktop service to start automatically at every system reboot by running the following commands:

```
$ systemctl --user enable docker-desktop
```

```
$ systemctl --user start docker-desktop
```

The first command will enable the docker-desktop service to start automatically on system reboot. The second command will start the service if it is not started already.

##### 2.5. Check Docker Version

To check docker version, run:

```
$ docker --version
```

To display the detailed output, run:

```
$ docker version
```

Please note that you will get the details of Docker Desktop only after starting it.

Check Docker compose version:

```
$ docker compose version
```

#### 3. Install Docker Desktop In Ubuntu 22.04 LTS

The following steps are tested in Ubuntu 22.04 LTS desktop edition.

##### 3.1. Update Ubuntu

Open your Terminal, and run the following commands one by one:

```
$ sudo apt update
```

```
$ sudo apt full-upgrade
```

##### 3.2. Add Docker Repository

Install the necessary certificates and to allow apt package manager to use a repository over HTTPS using command:

```
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release
```

Next, add Docker's official GPG key by running the following commands:

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

Add the Docker official repository:

```
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Update Ubuntu sources list using command:

```
$ sudo apt update
```

##### 3.3. Install Docker Desktop

Download latest Docker Desktop DEB package from the official **[release][7]** page.

```
$ wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.10.1-amd64.deb
```

Run the following command to install Docker Desktop:

```
$ sudo apt install ./docker-desktop-4.10.1-amd64.deb
```

At the end of the installation, you will receive an error message like below.

```
[...]
N: Download is performed unsandboxed as root as file '/home/ostechnix/docker-desktop-4.10.1-amd64.deb' couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
```

You can safely ignore this error and continue the subsequent steps.

##### 3.4. Start Docker Desktop Service

Run the following commands to allow Docker Desktop service to start automatically at every system reboot.

```
$ systemctl --user enable docker-desktop
```

```
$ systemctl --user start docker-desktop
```

The first command will enable the docker-desktop service to start automatically on system reboot. The second command will start the service if it is not started already.

##### 5.5. Check Docker Version

To check docker version, run:

```
$ docker --version
```

If you want to display detailed output, run:

```
$ docker version
```

Please note that you will get the details of Docker Desktop only after starting it.

Check Docker compose version:

```
$ docker compose version
```

### Getting Started With Docker Desktop

Launch Docker Desktop either from Dash or Menu.

When you launch the Docker Desktop for the first time, you will prompted to accept the Docker desktop service agreement.

![Accept Docker Desktop Service Agreement][8]

Give Docker a few seconds to start all necessary services. After a few seconds, you will be pleased with the Docker Desktop interface.

This is how Docker Desktop main dashboard looks like in my Ubuntu 22.04 LTS desktop.

![Docker Desktop Dashboard][9]

You will also see the Docker menu icon in the task bar. Just click on the Docker menu icon to display the drop-down menu.

![Docker Menu][10]

From the Docker menu, you can

* View the running state of Docker Desktop,
* Open the Docker dashboard,
* Sign-in to Docker Hub,
* Access Docker Desktop settings,
* Check for Docker Desktop updates,
* Troubleshoot Docker Desktop,
* View Docker Desktop basic information,
* Display Docker Desktop documentation,
* Display Docker Desktop quick start guide,
* Access Docker Hub,
* Pause, Restart and Quit Docker Desktop.

#### Understanding Docker Desktop Interface

Docker Desktop UI is very simple and easy to understand.

##### Top Pane

On the **top pane**, you will see the following tabs:

* Troubleshooting Docker Desktop,
* Docker Desktop Settings,
* Sign-in option to Docker hub.

![Docker Desktop Top Pane][11]

**Troubleshooting Section:**

In this section, you will have the options to,

* Restart Docker Desktop,
* Get help with Docker Desktop,
* Reset Kubernetes cluster,
* Clean/purge data,
* Reset Docker Desktop to factory defaults.

![Troubleshooting Section][12]

**Settings Section:**

The Settings section is divided into a few sub-sections.

![Docker Desktop Settings][13]

Under each section, you can adjust or set various important settings as listed below.

* General - In this section, you can enable or disable the following options by checking the respective check boxes.  * Start Docker Desktop at user log in.  * Send Docker Desktop usage statistics.  * Show weekly tips related to Docker Desktop usage.  * Open Docker Desktop Dashboard at startup.  * Enable Docker Compose v1/V2 compatibility mode.
* Resources - In this section, you can configure the following options.  * Set number of CPU cores, RAM size, SWAP size, Disk image size and Disk image location etc.  * Add shared folders. By default, /home/user directory is allowed to mount into the Docker containers.  * Configure proxy settings.  * Configure Docker network. Docker uses IPv4 for internal network connection between contianers. The default subnet for Docker containers is 192.168.65.0/24.
* Docker Engine - In this section, you can configure the Docker daemon.
* Experimental Features - Sign-up for experimental features and developer preview program.
* Kubernetes - Docker Desktop includes a standalone Kubernetes. In this section, you can enable/disable Kubernetes cluster.
* Software Updates - Configure software updates.
* Extensions - In this section, you can do the following:  * Enable/disable Docker extensions,  * Allow only extensions distributed through Docker marketplace,  * Show Docker Desktop Extensions system containers when using Docker commands.

**Sign-in Section:**

This section allows you to sign to the Docker hub. Before signing in to the Docker hub, you must initialize credential store. The details on initializing credential store are found [here][14].

##### Left Pane

On the left pane, you will see the following tabs:

* Containers - Shows the running containers.
* Images - Shows the list of Dockers images on your local disk.
* Volumes - Shows List of Docker volumes for persistent storage.
* Dev Environments - Create development environments instantly and share code with your team. It is good for team collaboration. This feature is still in beta.
* Add Extensions - Install third-party extensions to extend the functionality of Docker Desktop.

![Docker Desktop Left Pane][15]

##### Bottom Pane

The bottom pane shows the details of Docker engine status(running or stopped), version, RAM and CPU usage. And also whether you're logged into the Docker Hub.

#### Run A Sample Container

We haven't downloaded any Docker images yet. Let us download a docker image and create a container based on the downloaded image.

Open your Terminal and run the following command:

```
$ docker run -d -p 80:80 docker/getting-started
```

This will pull the container named "getting-started" from the official docker repository.

Here,

* -d - Run container in detached mode(in the background).
* -p 80:80 - Map port 80 of the host to port 80 in container.
* getting-started - name of the docker image.

Now go back to the Docker dashboard. Under the Containers section (on left pane), you will see the new container is running.

![Run Container In Docker Desktop][16]

From here, you can stop, restart, stop, and delete container. No need to run commands in Terminal! Everything can be done via the Docker Desktop dashboard.

#### View Docker Images

You can view all Docker images that you've downloaded under the **Images** section.

![View Docker Images][17]

The three horizontal dots button shows the additional menu options to inspect, pull, push to hub and remove the Docker image. To display or view the buttons, either select the Image or hover over the Image.

![View Menu Options For Docker Images][18]

#### Create A New Docker Container

To create a new Docker Container from an existing Docker image, go to the Images section and simply hover the mouse over any listed Docker images under the Images section, and click the "Run" button.

You can fill up the optional values such as the name of the Container, the host port that you want to map to container port, the Volume and Container path, and enter the environment variables etc.

![Create New Docker Container][19]

Once the Container is created, you can access it under Containers section.

#### Delete Containers

Go to the Containers section. Hover over or select the image you want to delete and click the "Delete" button.

![Delete Docker Container][20]

#### Delete Docker Images

Make sure the images you're about to delete is not used by any running container.

Go to the Images section and select or hover over the Docker Image, and click the three horizontal dots and choose "Remove".

![Delete Docker Image][21]

### Login To Docker Hub

Docker Hub is a centralized place where you can build, share and run secure applications. Before signing in to Docker Hub, you must initialize credentials store.

Docker Desktop uses **pass** to store credentials in gpg2-encrypted files.

Generate a gpg key using command:

```
$ gpg --generate-key
```

Enter the Real name, Email id and a Passphrase to protect the gpg key. Once the key is generated, you will see an output like the following:

```
[...]
public and secret key created and signed.

pub   rsa3072 2022-07-15 [SC] [expires: 2024-07-14]
      F2TF3R7GG3961252CA9BB628824DDDD883F652786
uid                      Senthilkumar <sk@example.com>
sub   rsa3072 2022-07-15 [E] [expires: 2024-07-14]
```

Make a note of this pub key - **F2TF3R7GG3961252CA9BB628824DDDD883F652786**

Now initialize `pass` by running the following command:

```
$ pass init F2TF3R7GG3961252CA9BB628824DDDD883F652786
mkdir: created directory '/home/ostechnix/.password-store/'
Password store initialized for F2TF3R7GG3961252CA9BB628824DDDD883F652786
```

Once the pass is initialized, click the Sign in button on the Docker Desktop to login to your Docker hub account. A new browser window will open. Enter your Docker username and password and click Continue.

![Login To Docker Hub][22]

Click Open Link to allow Docker Hub site to open Docker Desktop.

![Allow Docker Hub Site To Open Docker Desktop Application][23]

That's it. You're now logged into your Docker Hub account.

![Logged-in To Docker Hub][24]

### Install Extensions

The extensions are used to extend the functionality of Docker Desktop. The extensions are nothing but some third-party tools such as Portainer, Tailscale etc.

To install an extension, click "Add Extensions" button on left pane. You will be redirected to the Extensions marketplace where you can find the list of available extensions. Simply click "Install" button next to the respective extension.

![Install Docker Extension][25]

You will be prompted to enter the passphrase of the GPG key that you generated when signing in to the Docker Hub in the previous step. Just enter it and wait a few seconds to complete the installation.

Once the extension is installed, you will see under the "Add Extensions" section.

![Portainer Extension In Docker Desktop][26]

Click "Open" to setup Portainer. By default, the local Docker environment which Portainer is running in is connected. If you want to connect to different environment(E.g. Azure or Kubernetes), choose "Add Environments" button. I go with the default local Docker environment.

![Select Local Environment][27]

That's it. Now you can start using Portainer to manage your Docker Images, containers, volumes and perform other container management operations via Portainer UI.

![Portainer GUI][28]

### Upgrade Docker Desktop

When a new Docker Desktop version is available, the Docker UI will display a notification.

To upgrade Docker Desktop to latest available version, simply download the new version and install it like below.

```
$ sudo apt-get install ./docker-desktop-<version>-<arch>.deb
```

On RPM-based systems, first remove the existing version and then download the new version and install it.

```
$ sudo dnf remove docker-desktop

$  sudo dnf install ./docker-desktop-<version>-<arch>.rpm
```

### Uninstall Docker Desktop

To remove Docker Desktop on RPM-based systems, run:

```
$ sudo dnf remove docker-desktop
```

On DEB-based systems:

```
$ sudo apt remove docker-desktop
```

```
$ sudo apt purge docker-desktop
```

Finally, remove the unwanted configuration and data files, docker-cli symlink and purge the remaining systemd service files.

```
$ rm -r $HOME/.docker/desktop
```

```
$ sudo rm /usr/local/bin/com.docker.cli
```

### Conclusion

In this Docker Desktop manual, we discussed what is Docker Desktop, its features and how to install Docker Desktop in Debian, Fedora and Ubuntu operating systems. We also looked at how to use Docker Desktop to create, run and manage Docker containers.

Even though Docker CLI is easy to use, some users, especially the newbies, might prefer Docker GUI to manage the Docker containers. If you're one of them, Docker Desktop is a perfect choice.

**Resource:**

* [Docker Desktop Official Documentation][29]

--------------------------------------------------------------------------------

via: https://ostechnix.com/docker-desktop-for-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/getting-started-with-docker/
[2]: https://ostechnix.com/introduction-to-kubernetes/
[3]: https://ostechnix.com/how-to-find-if-a-cpu-supports-virtualization-technology-vt/
[4]: https://docs.docker.com/desktop/release-notes/
[5]: https://ostechnix.com/wp-content/uploads/2022/07/Check-Docker-Engine-And-Docker-Compose-Version.png
[6]: https://docs.docker.com/desktop/release-notes/
[7]: https://docs.docker.com/desktop/release-notes/
[8]: https://ostechnix.com/wp-content/uploads/2022/07/Accept-Docker-Desktop-Service-Agreement.png
[9]: https://ostechnix.com/wp-content/uploads/2022/07/Docker-Desktop-Dashboard.png
[10]: https://ostechnix.com/wp-content/uploads/2022/07/Docker-Menu.png
[11]: https://ostechnix.com/wp-content/uploads/2022/07/Docker-Desktop-Top-Pane.png
[12]: https://ostechnix.com/wp-content/uploads/2022/07/Troubleshooting-Section.png
[13]: https://ostechnix.com/wp-content/uploads/2022/07/Docker-Desktop-Settings.png
[14]: https://docs.docker.com/desktop/linux/#credentials-management
[15]: https://ostechnix.com/wp-content/uploads/2022/07/Docker-Desktop-Left-Pane.png
[16]: https://ostechnix.com/wp-content/uploads/2022/07/Run-Container-In-Docker-Desktop.png
[17]: https://ostechnix.com/wp-content/uploads/2022/07/View-Docker-Images.png
[18]: https://ostechnix.com/wp-content/uploads/2022/07/View-Menu-Options-For-Docker-Images.png
[19]: https://ostechnix.com/wp-content/uploads/2022/07/Create-New-Docker-Container.png
[20]: https://ostechnix.com/wp-content/uploads/2022/07/Delete-Docker-Container.png
[21]: https://ostechnix.com/wp-content/uploads/2022/07/Delete-Docker-Image.png
[22]: https://ostechnix.com/wp-content/uploads/2022/07/Login-To-Docker-Hub.png
[23]: https://ostechnix.com/wp-content/uploads/2022/07/Allow-Docker-Hub-Site-To-Open-Docker-Desktop-Application.png
[24]: https://ostechnix.com/wp-content/uploads/2022/07/Logged-in-To-Docker-Hub.png
[25]: https://ostechnix.com/wp-content/uploads/2022/07/Install-Docker-Extension.png
[26]: https://ostechnix.com/wp-content/uploads/2022/07/Portainer-Extension-In-Docker-Desktop.png
[27]: https://ostechnix.com/wp-content/uploads/2022/07/Select-Local-Environment.png
[28]: https://ostechnix.com/wp-content/uploads/2022/07/Portainer-GUI.png
[29]: https://docs.docker.com/desktop/
