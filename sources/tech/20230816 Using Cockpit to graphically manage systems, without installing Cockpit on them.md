[#]: subject: "Using Cockpit to graphically manage systems, without installing Cockpit on them!"
[#]: via: "https://fedoramagazine.org/using-cockpit-to-graphically-manage-systems-without-installing-cockpit-on-them/"
[#]: author: "Brian Smith https://fedoramagazine.org/author/briansmith/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using Cockpit to graphically manage systems, without installing Cockpit on them!
======

![][1]

Photo by [Chris Boyer][2] on [Unsplash][3]

It probably sounds too good to be true: the ability to manage remote systems using an easy to use, intuitive graphical interface – without the need to install extra software on the remote systems, enable additional services, or make any other changes on the remote systems. This functionality, however, is now available with a combination of the recently introduced Python bridge for Cockpit and the Cockpit Client Flatpak! This allows Cockpit to manage remote systems, assuming only SSH access and that Python is installed on the remote host. Read on for more information on how this works and how to get started.

If you are not familiar with Cockpit, it is described on the [project’s web site][4] as a web-based graphical interface for servers. Cockpit is intended for everyone, especially those who are:

  * **new to Linux** (including Windows admins)
  * **familiar with Linux** and want an easy, graphical way to administer servers
  * **expert admins** who mainly use other tools but want an overview on individual systems



You can easily and intuitively complete a variety of tasks from Cockpit. These including tasks such as:

  * expanding the size of a filesystem
  * creating a network bond
  * modifying the firewall
  * viewing log entries
  * viewing real time and historical performance information
  * managing Podman containers
  * managing KVM virtual machines



and many additional tasks.

### Objections to using Cockpit on systems

In the past, I’ve heard two main objections to using Cockpit on systems:

  1. I don’t want to run the Cockpit web server on my systems. Additional network services like this increase the attack surface. I don’t want to open another port in the firewall. I don’t want more HTTPS certificates in my environment to manage and maintain.
  2. I don’t want to install additional packages on my systems. I don’t even have access to install additional packages). The more packages installed, the larger my footprint is, and the more attack surface there is. For me to install additional packages in a production environment, I have to go through a change management process, etc. What a hassle!



Let’s address these one at a time. For the first concern, you have actually had several options for connecting to Cockpit over SSH, without running the Cockpit web server, for quite some time. These options include:

  * The ability to set up a bastion host, which is a host that has the Cockpit web server running on it. You can then connect to Cockpit on the bastion host using a web browser. From the Cockpit login screen on the bastion host you can use the _Connect to_ ****option to specify an alternate host to login to (refer to the _LoginTo_ cockpit.conf configuration option). Another option is to authenticate to Cockpit on the bastion host, and use the _Add new host_ option. In either case, the bastion Cockpit host will connect to these additional remote hosts over SSH (so only the bastion host in your environment needs to be running the Cockpit web server).
  * You can use the Cockpit integration available with the upstream [Foreman][5], or downstream [Red Hat Satellite][6], to connect to Cockpit on systems in your environment over SSH.
  * You can use the [Cockpit Client Flatpak][7], which will connect to systems over SSH.
  * You can use the [cockpit/ws][8] container image. This is a containerized version of the Cockpit web server that acts as a containerized bastion host



For more information on these options, refer to the [Connecting to the RHEL web console, part 1: SSH access methods][9] blog post. This blog post focuses on the downstream RHEL web console, however, the information also applies to the upstream Cockpit available in Fedora.

This brings me to the second concern, and the main focus of this article. This is the concern that I don’t want to install additional packages on the remote systems I am managing. While there are several options for using the web console without the Cockpit web server, all of these options previously had a prerequisite that the remote systems needed to have at least the _cockpit-system_ package installed. For example, previously if you tried to use the Cockpit Client Flatpak to connect to a remote system that didn’t have Cockpit installed, you’d see an error message stating that the remote system doesn’t have _cockpit-bridge_ installed.

The Cockpit team has replaced the previous Cockpit bridge (implemented using C) with a new bridge written in Python. For a technical overview of the function of the Cockpit bridge, and how the new Python bridge was implemented, refer to the recent [Monty Python’s Flying Cockpit][10] DevConf presentation by Allison Karlitskaya and Martin Pitt.

This new Python bridge overcomes the previous limitation requiring Cockpit to be installed on the remote hosts.

### Using the Cockpit Client Flatpak

With the Cockpit Client Flatpak application installed on a workstation, we can connect to remote systems over SSH and manage them using Cockpit.

#### Installation

In the following example, I’m using a Fedora 38 workstation. Install the Cockpit Client Flatpak by simply opening the GNOME Software application and searching for Cockpit. Note that you’ll need to have Flathub enabled in GNOME Software.

![][11]

#### Using the Cockpit Client

Once installed, you’ll see the following when opening the Cockpit Client:

![][12]

You can type in a hostname or IP address that you would like to connect to. To authenticate as a user other than the user you are currently using, you can use the user@hostname syntax. A list of recent hosts that you’ve connected to will appear, if this is not the first time using the Cockpit Client. In that case, you can simply click on a host name to reconnect

If you have SSH key based authentication setup, you’ll be logged in to the remote host using the key based authentication. With out SSH keys setup, you’ll be prompted to authenticate with a password. In either case, if it is your first time connecting to the host over SSH, you’ll be prompted to accept the host key fingerprint.

As a special case, you can log into your currently running local session by connecting to _localhost_ , without authentication.

Once connected, you’ll see the Cockpit Overview page:

![Cockpit overivew menu][13]

Select the _Terminal_ menu item in Cockpit to show that the remote system that I’m logged in to does not have any Cockpit packages installed:

![Cockpit Terminal view][14]

### Prerequisites for connecting to systems with Cockpit Client

There are several prerequisites for utilizing Cockpit Client to connect to a remote system. If you are familiar with managing remote hosts with Ansible, you’ll likely already be familiar with the prerequisites. They are the same:

  1. You must have connectivity to the remote system over SSH.
  2. You must have a valid user account on the remote system that you can authenticate with.
  3. If you need the ability to complete privileged operations in Cockpit, the user account on the remote system will need sudo privileges.



If you are connecting to a remote system that doesn’t have Cockpit installed, there are a couple of additional prerequisites:

  1. Python 3.6 or later must be installed on the remote host. This is not usually an issue, with some exceptions, such as Fedora CoreOS which does not include Python by default.
  2. An older version of Cockpit Client can not be used to connect to a newer operating system version. For example, if I installed Cockpit Client on my Fedora 38 workstation today and never updated it, it may not work properly to manage a Fedora 39 or Fedora 40 server in the future.



### Frequently asked questions

Here are some frequently asked questions about this functionality:

**Question:** Cockpit is extendable via additional Applications. Which Cockpit applications are available if I use the Cockpit Client to connect to a remote system that doesn’t have Cockpit installed?

**Answer** : Currently, Cockpit Client includes

  * _cockpit-machines_ (virtual machine management)
  * _cockpit-podman_ (Podman container management)
  * _cockpit-ostree_ (used to manage rpm-ostree based systems)
  * _cockpit-storaged_ (storage management)
  * _cockpit-sosreport_ (for generating diagnostic reports)
  * _cockpit-selinux_ ****(for managing SELinux)
  * _cockpit-packagekit_ (for managing software updates)
  * _cockpit-networkmanager_ ****(network management)
  * _cockpit-kdump_ (kernel dump configuration)



The Cockpit team is looking for feedback on what Cockpit applications you’d like to see included in the Cockpit Client. Post a comment below with your feedback.

**Question** : I connected to a remote system that doesn’t have Cockpit installed, but I don’t see Virtual Machines or one of the other applications listed in the menu. I thought you just said these were included in the Cockpit Client Flatpak?

**Answer** : When you login to a remote system that doesn’t have Cockpit packages installed, you’ll only see the menu options for underlying functionality available on the remote system. For example, you’ll only see Virtual Machines in the Cockpit menu if the remote host has the _libvirt-dbus_ package installed.

**Question** : Can Cockpit applications available in the Cockpit Client be used with locally installed Cockpit applications on the remote host? In other words, if I need a Cockpit application not included in the Cockpit Client, can I install just that single package on the remote host?

**Answer** : No, you cannot mix and match applications included in the Cockpit Client flatpak and those installed locally on the remote host. For a remote host that has the ****** _cockpit-bridge_ package installed, Cockpit Client will exclusively use the applications that are installed locally on the remote host. If the remote host does not have the _cockpit-bridge_ package installed, Cockpit Client will exclusively use the applications bundled in the Cockpit Client Flatpak.

**Question** : Can I use Cockpit Client to connect to the local host?

**Answer** : Yes! Simply open Cockpit Client and type in _localhost_ and you’ll be able to manage the local host. You don’t need to have any Cockpit packages installed on the local host if you use this method. You only need the Cockpit Client Flatpak.

**Question: ** What Linux distributions can I connect to using the Cockpit Client?

**Answer: ** Cockpit is compatible with a number of different Linux distributions. For more information, see the [Running Cockpi][15]t page. If connecting to a remote system that doesn’t have Cockpit installed, keep in mind the previously mentioned requirements regarding not connecting to newer OS’s from an older Cockpit Client.

**Question** : Does the Cockpit team have any future plans regarding this functionality?

**Answer: ** The Cockpit team is planning on adding the ability to connect to remote hosts without Cockpit packages installed to the [cockpit-ws container image][8]. See [COCKPIT-954][16] ticket for more info.

Have more questions not covered here? Ask them in the comments section below!

### Conclusion

The new Python bridge, and the corresponding ability to use the Cockpit Client to connect to remote systems without installing Cockpit, makes it incredibly easy to use Cockpit in almost any circumstance.

Try this out! It’s easy to do. Simply install the Cockpit Client Flatpak, and use it to connect to either your localhost or a remote system. Once you’ve tried it, let us know what you think in the comments below.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-cockpit-to-graphically-manage-systems-without-installing-cockpit-on-them/

作者：[Brian Smith][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/briansmith/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/08/cockpit_uninstalled-816x345.jpg
[2]: https://unsplash.com/@csgboyer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/photos/QW0VAJoeUEE?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://cockpit-project.org/
[5]: https://theforeman.org/plugins/foreman_remote_execution/1.7/index.html#3.6Cockpitintegration
[6]: https://access.redhat.com/documentation/en-us/red_hat_satellite/6.13/html-single/managing_hosts/index#Host_Management_and_Monitoring_Using_Cockpit_managing-hosts
[7]: https://flathub.org/apps/org.cockpit_project.CockpitClient
[8]: https://quay.io/repository/cockpit/ws
[9]: https://www.redhat.com/en/blog/connecting-rhel-web-console-part-1-ssh-access-methods
[10]: https://www.youtube.com/watch?v=ZAVUG6E0Xd4
[11]: https://fedoramagazine.org/wp-content/uploads/2023/08/1-1024x748.png
[12]: https://fedoramagazine.org/wp-content/uploads/2023/08/2-1024x570.png
[13]: https://fedoramagazine.org/wp-content/uploads/2023/08/3-1024x661.png
[14]: https://fedoramagazine.org/wp-content/uploads/2023/08/4.png
[15]: https://cockpit-project.org/running.html
[16]: https://issues.redhat.com/browse/COCKPIT-954
