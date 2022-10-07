[#]: subject: "How to Install Cockpit Web Console on Ubuntu 22.04"
[#]: via: "https://www.linuxtechi.com/how-to-install-cockpit-on-ubuntu/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Cockpit Web Console on Ubuntu 22.04
======
In this guide, we examine how to install Cockpit on Ubuntu 22.04 LTS (Jammy Jellyfish) step-by-step.

Cockpit is a free and opensource web-based graphical server management tool that allows administrators and Linux users to easily manage and configure their Linux servers/PCs from a browser. It targets new Linux users or those who want an easy way to manage their servers on a graphical interface without the hassle of working on the command-line.

Cockpit is easy to install and simple to use. At a glance, it allows you to perform the following tasks.

* Keep tabs of system metrics and performance
* Create and manage users
* Browse and search system logs
* Inspect and interact with systemd-based services
* Access the terminal and run commands
* Inspect system’s hardware
* Create and manage virtual machines
* Upgrade software packages to their latest versions
* Configure Firewall & and many more.

### 1) Update Local Package Index

To start off, log into your server and refresh the local package index as follows.

```
$ sudo apt update
```

### 2) Install Cockpit Web Console

The Cockpit web console packages are provided by the official Ubuntu repositories. You can verify this by running the following command.

```
$ apt search cockpit
```

So, install Cockpit using the APT package manager as shown.

```
$ sudo apt install cockpit -y
```

The command installs the Cockpit web console alongside other additional packages, libraries, and dependencies.

![Apt-Command-Install-Cockpit-Ubuntu-22-04][1]

Once installed, you can verify if cockpit is installed by running the following command:

```
$ apt -qq list cockpit
OR
$ dpkg -l cockpit
```

From the output below, we can see that Cockpit version 264-1 has been installed.

![Check-Cockpit-WebConsole-Version-Ubuntu][2]

In case, you planning to manage kvm virtual machines with cockpit then install following package

```
$ sudo apt install cockpit-machines -y
```

### 3) Install Cockpit Support for Podman

By default, Cockpit does not provide support for podman. If you wish to administer and manage podman containers using Cockpit, install the cockpit-podman package which provides support for podman.

```
$ sudo apt install cockpit-podman y
```

![Install-Cockpit-Podman-Support-Ubuntu-22-04][3]

### 4) Start Cockpit Web Console Service

Unlike other services or daemons, Cockpit does not start automatically once installed. Therefore, start the Cockpit systemd service as shown.

```
$ sudo systemctl start cockpit
```

Next, verify that the Cockpit service is running as follows.

```
$ sudo systemctl status cockpit
```

The output confirms that the Cockpit service is up and running.

![Cockpit-Service-Status-Ubuntu-22-04][4]

Cockpit listens on TCP port 9090. You can verify this is the case by running the following ss command.

```
$ ss -tunlpe | grep cockpit
```

![Socket-Connection-Cockpit-Ubuntu-22-04][5]

If the firewall is enabled on your Ubuntu 22.04 system, then allow 9090/tcp port so it’s web console can be accessed from outside

```
$ sudo ufw allow 9090/tcp
$ sudo ufw reload
```

![Allow-cockpit-console-port-ubuntu-22-04][6]

### 5) Access Cockpit Web Console

Cockpit is now fully installed and the only thing remaining is to access it and use it to manage your server.

To access Cockpit Web console, browse the following address.

https://server-ip:9090

You will get a warning that the website you are accessing is not private and that you could fall victim to hackers. Do not fret, as this happens since the server is encrypted by a self-signed SSL certificate which is not recognized by CA.

To get around this issue, simply click ‘Advanced’

![Cockpit-WebConsole-URL-Ubuntu-22-04][7]

Then click on ‘Proceed to server-ip’ link.

![Accept-Certificate-Cockpit-WebConsole][8]

Thereafter, the following login page will appear. Be sure to provide your username and password and click ‘Log In’.

![Cockpit-Login-Page-Ubuntu-22-04][9]

This ushers you to the Cockpit dashboard. The ‘Overview’ page provides your system’s metrics at a glance. You will see details on CPU and memory usage, health status, and system information.

To perform the administrative task, click on ‘Turn on administrative access’, it will prompt you to enter your user’s password.

The left sidebar provides various options that you can view.

![Cockpit-Dashboard-Ubuntu-22-04][10]

For example, you can click on ‘Networking’ to view information about bandwidth statistics, network interfaces as well as network logs.

![View-Network-Statistics-from-Cockpit-WebConsole][11]

You can also click ‘Services’ to get information about all the system services.

![System-Services-Status-Cockpit-WebConsole-Ubuntu-22-04][12]

To view and install software updates, click on ‘Software Updates’

![Software-Updates-Cockpit-WebConsole-Ubuntu-22-04][13]

In my case all the software updates are already installed, that’s why I am getting the status as ‘System is up to date’

##### Conclusion

And that’s it. In this guide, we have successfully installed Cockpit on Ubuntu 22.04. All the best as you enjoy managing your system.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-install-cockpit-on-ubuntu/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Apt-Command-Install-Cockpit-Ubuntu-22-04.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Check-Cockpit-WebConsole-Version-Ubuntu.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Install-Cockpit-Podman-Support-Ubuntu-22-04.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Cockpit-Service-Status-Ubuntu-22-04.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Socket-Connection-Cockpit-Ubuntu-22-04.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Allow-cockpit-console-port-ubuntu-22-04.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Cockpit-WebConsole-URL-Ubuntu-22-04.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Accept-Certificate-Cockpit-WebConsole.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Cockpit-Login-Page-Ubuntu-22-04.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Cockpit-Dashboard-Ubuntu-22-04.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/09/View-Network-Statistics-from-Cockpit-WebConsole.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/09/System-Services-Status-Cockpit-WebConsole-Ubuntu-22-04.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/09/Software-Updates-Cockpit-WebConsole-Ubuntu-22-04.png
