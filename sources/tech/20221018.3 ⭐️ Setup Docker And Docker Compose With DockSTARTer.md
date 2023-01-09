[#]: subject: "Setup Docker And Docker Compose With DockSTARTer"
[#]: via: "https://ostechnix.com/setup-docker-and-docker-compose-with-dockstarter/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Setup Docker And Docker Compose With DockSTARTer
======

This guide explains **what is DockSTARTer**, how to **install DockSTARTer in Linux** and how to **setup Docker and Docker compose using DockSTARTer** to run containerized applications in Linux.

### What is DockSTARTer?

**DockSTARTer** is a TUI-based utility to easily install Docker and Docker compose in Linux and Unix systems. The main goal of DockSTARTer is to make it quick and easy to get up and running with Docker.

DockSTARTer has both TUI and CLI interfaces. So you can use either of these interfaces to quickly deploy multiple containerized apps in a single docker environment.

Please note that DockSTARTer is not a ready-made set of apps that run out of the box. You still need to choose what to run and how to run.

It also doesn't configure apps and storage for you. You may need to configure the settings of the apps and the storage manually by yourself.

As of writing this, we can run more than 100 docker apps using DockSTARter. Some of the popular apps are Adguard, Bitwarden, CloudFlare DDNS, Duplicacy, Emby, File Browser, Glances, Heimdall, InfluxDB, Jellyfin, Kiwix-serve, Lidarr, Minecraft Server, Nextcloud, openLDAP, Speedtest, Pihole, qBittorent, Rsnapshot, Syncthing, Time Machine, Uptimne Kuma, Vsftpd, Wireguard, youtubedl and a lot more.

DockSTARTer is free and opensource shell script. The source code of DockSTARTer is hosted in GitHub.

### Install DockSTARTer in Linux

DockSTARter can be installed in popular Linux operating systems.

To install DockSTARTer in Arch Linux and its variants such as EndeavourOS, and Manjaro Linux, run the following commands:

```
$ sudo pacman -S curl docker git
```

```
$ bash -c "$(curl -fsSL https://get.dockstarter.com)"
```

```
$ sudo reboot
```

To install DockSTARTer in Debian, Ubuntu, Linux Mint, Pop OS, run:

```
$ sudo apt install curl git
```

```
$ bash -c "$(curl -fsSL https://get.dockstarter.com)"
```

```
$ sudo reboot
```

To install DockSTARTer in Fedora, RHEL, CentOS, AlmaLinux and Rocky Linux, run:

```
$ sudo dnf install curl git
```

```
$ bash -c "$(curl -fsSL https://get.dockstarter.com)"
```

```
$ sudo reboot
```

### Use DockSTARTer to setup Docker and Docker Compose

DockSTARTer allows you to install and configure various apps in Docker.

To run DockSTARTer for the first time, enter the following command:

```
$ ds
```

Choose "Configuration" from the main menu and press ENTER:

And then select "Full setup".

Choose which apps you would like to install. By default, Watchtower app is selected. Use UP and DOWN arrow keys to navigate to app list and press SPACEBAR to select or deselect apps.

Now,  DockSTARTer will display the default settings of the selected apps. If you would like to keep these settings for the apps, choose "Yes" and hit ENTER. Or choose "No" and change the settings as you want.

If you like to keep the default settings for VPN, choose "Yes" or choose "No" to change the settings as you please.

Now you will see the global settings for DockSTARTer. Review the global settings such as docker config directory, docker storage directory, docker hostname and time zone etc. If you're OK with the default settings, simply choose "Yes" and hit ENTER. If you want to change these settings, select "No". I want to change the storage directory, hostname and time zone, so I choose "No".

If you chose "No" in the previous wizard, you will be prompted to set docker config directory. There will be 2 choices given. You can either choose to keep the currently selected directory or enter a new one by selecting "Enter New" option. I am going to keep the currently selected directory.

Choose "yes" to set appropriate permissions on the docker configuration directory.

In this step, you need to set a directory for Docker storage. By default, DockSTARTer will create a directory called "storage" in your $HOME directory. If you want to keep the default storage directory, choose "Keep Current". Or choose "Enter New".

Enter the path to your Docker storage directory and hit ENTER. If the directory doesn't exist, DockSTARTer will attempt to create it.

Set the hostname for your Docker system. DockSTARTer recommends system detected values. Here, I am going to choose "Use System" option's setting for my Docker hostname.

Set the user's group ID (PGID). If you're unsure, simply go with the **"Use System"** option.

Set your user account ID (PUID). If you're unsure, simply go with the **"Use System"** option.

Set your system timezone. The system detected values, so just choose "Use System" option and hit ENTER.

Next, you will prompted if you would you like to run compose. Choose "Yes" to do so.

This will pull the Docker images that you choose to install in one the previous steps.

Finally, you will an output something like below after the Docker compose installed all selected apps.

```
[...] 2022-10-18 14:24:30 [WARN  ]   /home/ostechnix/.docker/compose/.env not found. Copying example template. 2022-10-18 14:24:30 [WARN  ]   Please verify that ~ is not used in /home/ostechnix/.docker/compose/.env file. 2022-10-18 14:24:30 [NOTICE]   Preparing app menu. Please be patient, this can take a while. 2022-10-18 14:36:51 [NOTICE]   /home/ostechnix/.docker/compose/.env does not contain any disabled apps. 2022-10-18 14:36:51 [NOTICE]   Creating environment variables for enabled apps. Please be patient, this can take a while. 2022-10-18 15:55:29 [NOTICE]   Creating environment variables for enabled apps. Please be patient, this can take a while. 2022-10-18 15:55:29 [NOTICE]   Adding compose configurations for enabled apps. Please be patient, this can take a while. [+] Running 4/4  ⠿ watchtower Pulled                                                                                                                         6.1s    ⠿ 1045b2f97fda Pull complete                                                                                                              1.0s    ⠿ 35a104a262d3 Pull complete                                                                                                              1.2s    ⠿ 1a0671483169 Pull complete                                                                                                              3.1s [+] Running 2/2  ⠿ Network compose_default  Created                                                                                                          0.0s  ⠿ Container watchtower     Started
```

That's it. You can view the list of running Docker containers using command:

```
$ docker ps
```

**Sample output:**

```
CONTAINER ID   IMAGE                           COMMAND         CREATED         STATUS         PORTS      NAMES 9d3c34dc918f   ghcr.io/containrrr/watchtower   "/watchtower"   5 minutes ago   Up 5 minutes   8080/tcp   watchtower
```

### Install new Apps

To install the other apps, just restart DockSTARTer again using the following command:

```
$ ds
```

Select "Configuration" and then "Select Apps".

You will see the list of available apps in the next screen. Just select the app you want to run and follow the on-screen instructions.

### Remove Apps

Removing apps is same as adding new apps.

First, make sure the container app is stopped.

```
$ sudo docker stop <container-id>
```

Start DockeSTARTer, go to **Configuration -> Select Apps** and **uncheck** the apps that you want to remove and choose OK to remove the apps.

### Update DockSTARTer

To update DockSTARTer, simply start it using **"`ds`"** command from the Terminal and then choose "Update DockSTARTer" option.

You can also do it from the commandline by running:

```
$ sudo ds -u
```

### Prune Docker system

To remove all unused containers, networks, volumes, images and build cache, start DockSTARTer and then choose **"Prune Docker System"** option.

You can prune your Docker system from commandline by running the following command as well.

```
$ sudo ds -p
```

**Sample output:**

```
Deleted Containers: 9d3c34dc918fafa62d0e35283be4cbee46280a30dcd59b1aaa8b5fff1e4a085d  Deleted Networks: compose_default  Deleted Images: untagged: ghcr.io/containrrr/watchtower:latest untagged: ghcr.io/containrrr/watchtower@sha256:bbf9794a691b59ed2ed3089fec53844f14ada249ee5e372ff0e595b73f4e9ab3 deleted: sha256:333de6ea525af9137e1f14a5c1bfaa2e730adca97ab97f74d738dfa99967f14f deleted: sha256:f493af3d0a518d307b430e267571c926557c85222217a8707c52d1cf30e3577e deleted: sha256:62651dc7e144aa8c238c2c2997fc499cd813468fbdc491b478332476f99af159 deleted: sha256:83fe5af458237288fe7143a57f8485b78691032c8c8c30647f8a12b093d29343  Total reclaimed space: 16.92MB
```

### Change variables

You can adjust variables for running Docker containers at any time.

Start DockSTARTer by running **"`ds`"** command and choose "Configuration", and then choose the following settings:

- "Set App Variables" option for adjusting variables for all enabled apps,
- "Set VPN Variables" option for adjusting VPN specific variables,
- "Set Global Variables" option for adjusting global variables.

### Conclusion

DockSTARTer has made the process of running Docker apps much easier! DockSTARTer also has CLI interface, but you can quickly deploy Docker containers without memorizing any commands via the its Text-based interface.

**Resource:**

- **[DockSTARTer Website][1]**

--------------------------------------------------------------------------------

via: https://ostechnix.com/setup-docker-and-docker-compose-with-dockstarter/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://dockstarter.com/
