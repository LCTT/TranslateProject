Translating by ictlyh
How To Run Docker Client Inside Windows OS
================================================================================
Hi everyone, today we'll learn about Docker in Windows Operating System and about the installation of Docker Windows Client in it. Docker Engine uses Linux Specific Kernel features so it cannot use Windows Kernel to run so, the Docker Engine creates a small Virtual Machine running Linux and utilizes its resources and Kernel. The Windows Docker Client uses the virtualized Docker Engine to build, run and manage Docker Containers out of the box. There is an application developed by the Boot2Docker Team called Boot2Docker which creates the virtual machine running a small Linux based on [Tiny Core Linux][1] made specifically to run [Docker][2] containers on Windows. It runs completely from RAM, weighs ~27MB and boots in ~5s (YMMV). So, until the Docker Engine for Windows is developed, we can only run Linux containers in our Windows Machine.

Here is some easy and simple steps which will allow us to install the Docker Client and run containers on top of it.

### 1. Downloading Boot2Docker ###

Now, before we start the installation, we'll need the executable file for Boot2Docker. The latest version of Boot2Docker can be downloaded from [its Github][3]. Here, in this tutorial, we'll download version v1.6.1 from the site. Here, we'll download the file named [docker-install.exe][4] from that page using our favorite Web Browser or Download Manager.

![](http://blog.linoxide.com/wp-content/uploads/2015/05/downloading-boot2docker-installer.png)

### 2. Installing Boot2Docker ###

Now, we'll simply run the installer  which will install Windows Docker Client, Git for Windows (MSYS-git), VirtualBox, The Boot2Docker Linux ISO, and the Boot2Docker management tool which are essential for the total functioning of Docker Engine out of the box.

![](http://blog.linoxide.com/wp-content/uploads/2015/05/boot2docker-installer.png)

### 3. Running Boot2Docker ###

![](http://blog.linoxide.com/wp-content/uploads/2015/05/boot2docker-start-icon-e1431322598697.png)

After installing the necessary stuffs, we'll run Boot2Docker by simply running the Boot2Docker Start shortcut from the Desktop. This will ask you to enter an SSH key paraphrase that we'll require in future for authentication. It will start a unix shell already configured to manage Docker running inside the virtual machine.

![](http://blog.linoxide.com/wp-content/uploads/2015/05/starting-boot2docker.png)

Now to check whether it is correctly configured or not, simply run docker version as shown below.

    docker version

![](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-version.png)

### 4. Running Docker ###

As **Boot2Docker Start** automatically starts a shell with environment variables correctly set so we can simply start using Docker right away. **Please note that, if we are Boot2Docker as remote Docker Daemon , then do not type the sudo before the docker commands.**

Now, Let's try the **hello-world** example image which will download the hello-world image, executes it and gives an output  "Hello from Docker" message.

    $ docker run hello-world

![](http://blog.linoxide.com/wp-content/uploads/2015/05/running-hello-world.png)

### 5. Running Docker using Command Prompt (CMD) ###

Now, if you are wanting to get started with Docker using Command Prompt, you can simply launch the command prompt (CMD.exe). As Boot2Docker requires ssh.exe to be in the PATH, therefore we need to include bin folder of the Git installation to the %PATH% environment variable by running the following command in the command prompt.

    set PATH=%PATH%;"c:\Program Files (x86)\Git\bin"

![](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-in-cmd.png)

After running the above command, we can run the **boot2docker start** command in the command prompt to start the Boot2Docker VM.

    boot2docker start

![](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-cmd-variables.png)

**Note**: If you get an error saying machine does not exist then run **boot2docker init** command in it.

Then copy the instructions for cmd.exe shown in the console to set the environment variables to the console window and we are ready to run docker containers as usual.

### 6. Running Docker using PowerShell ###

In order to run Docker on PowerShell, we simply need to launch a PowerShell window then add ssh.exe to our PATH variable.

    $Env:Path = "${Env:Path};c:\Program Files (x86)\Git\bin"

After running the above command, we'll need to run

    boot2docker start

![](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-in-powershell.png)

This will print PowerShell commands to set the environment variables to connect Docker running inside VM. We'll simply run those commands in the PowerShell and we are ready to run docker containers as usual.

### 7.  Logging with PUTTY ###

Boot2Docker generates and uses the public or private key pair inside %USERPROFILE%\.ssh directory so to login, we'll need use the private key from this same directory. That private key needs to be converted into the PuTTY 's format. We can use puttygen.exe to do that.

We need to open puttygen.exe and load ("File"->"Load" menu) the private key from %USERPROFILE%\.ssh\id_boot2docker then click on "Save Private Key". Then use the saved file to login with PuTTY using docker@127.0.0.1:2022 .

### 8. Boot2Docker Options ###

The Boot2Docker management tool provides several commands as shown below.

    $ boot2docker

    Usage: boot2docker.exe [<options>] {help|init|up|ssh|save|down|poweroff|reset|restart|config|status|info|ip|shellinit|delete|download|upgrade|version} [<args>]

### Conclusion ###

Using Docker with Docker Windows Client is fun. The Boot2Docker management tool is an awesome application developed which enables every Docker containers to run smoothly as running in Linux host. If you are more curious, the username for the boot2docker default user is docker and the password is tcuser. The latest version of boot2docker sets up a host only network adapter which provides access to the container's ports. Typically, it is 192.168.59.103, but it could get changed by Virtualbox's DHCP implementation. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/run-docker-client-inside-windows-os/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://tinycorelinux.net/
[2]:https://www.docker.io/
[3]:https://github.com/boot2docker/windows-installer/releases/latest
[4]:https://github.com/boot2docker/windows-installer/releases/download/v1.6.1/docker-install.exe