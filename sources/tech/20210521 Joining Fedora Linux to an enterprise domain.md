[#]: subject: (Joining Fedora Linux to an enterprise domain)
[#]: via: (https://fedoramagazine.org/join-fedora-linux-enterprise-domain/)
[#]: author: (ogutierrez https://fedoramagazine.org/author/ogutierrez/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Joining Fedora Linux to an enterprise domain
======

![][1]

Photo by [Gene Gallin][2] on [Unsplash][3]

When you think about corporate networks, the most widely used Linux-based operating system that comes to mind is Red Hat Enterprise Linux (RHEL), used mostly on servers, but also as workstations. Fedora Linux is also a very good choice for a workstation, and comes packed with lots of features to work in the corporate environment and makes management an easy task.

When you work with many machines in your network you need a way to manage users and machines in a centralized way. That’s why [FreeIPA][4] and [Active Directory][5] are the technologies of choice for this task. They allow a sysadmin to manage a huge amount of machines using a directory of all the entities in their network.

### Fedora and Active Directory

Active Directory is very common in corporate environments. Fedora and RHEL integrate well with services such as FreeIPA or Active Directory by using the System Security Services Daemon (SSSD). SSSD is a system service to access remote directories and authentication mechanisms. A machine using this software is able to authenticate with remote credentials and access other services available in that directory network.

To join a domain network, you need the domain administrator’s permission to add the machine. Maybe by setting special permissions on your domain credentials or doing the pre-configuration of that machine on your behalf. Fedora Linux has an option to configure a machine during installation called _Enterprise Login_. If your machine network is automatically configured for the enterprise domain network, then you can login with your domain credentials directly.

![][6]

In the case your configuration is not automated—or you have Fedora Linux already installed—you can join an Active Directory domain with a few configuration steps:

  1. Set up the DNS for this machine. To connect to a directory service, you need first to be able to resolve the directory domain name. If your network sets up the correct DNS using DHCP, you can skip this step.
  2. Change your machine name to reflect it will be part of the new domain. Edit the file _/etc/hostname_ and change the machine name to “machinename.my_domain”
  3. Join the domain by executing this command: _sudo realm join my_domain -v_ (replace “my_domain” with the name of your domain)



After running this command, the system will ask for the credentials of a user allowed to join new machines in that domain. If there are no errors in the process, the machine will become part of the domain.

![][7]

Now that this machine is part of your domain you can:

  * Login with a domain username into the machine
  * Get kerberos tickets to access different services in the domain network
  * Access other services, depending on how the domain is configured



### Manage Fedora Linux with Fleet Commander

Now the machine is part of your domain, you can manage it with the domain administrator tools for Active Directory. Since your machine is not running Windows, you are limited to authentication and access to network and directory services. You cannot set up things like desktop-related configuration on this machine.

Luckily, Fedora has a tool called [Fleet Commander][8].

#### Create configuration

Fleet Commander is a management tool that allows you to set up desktop configuration profiles for all Fedora Linux machines across your network.

This means, you can set up any configuration for GNOME desktop, Firefox, Chrome, LibreOffice, and other supported software in an easy way, and then make that configuration to be applied on login to the selected users/groups/machines in a granular way.

![][9]

To use this tool, install the fleet-commander-admin package

```
sudo dnf install fleet-commander-admin
```

Next, visit [http://localhost:9090][10] in your browser to log in. On the menu to the left, click on _Fleet Commander_.

Fleet Commander has a tool to set up the configuration profiles intuitively using a “live session” mechanism. It runs a VM that serves as a template of your base machines. You to manually make the configuration changes you want. Then you review all the configuration changes, select the ones you want to add to the profile, and deploy it.

#### Manage clients

In each of your Fedora Linux or RHEL machines, you will need to install the Fleet Commander client service. This services activates when a user logs in. It searches the domain for the profiles that apply to current user/machine, and applies the configuration for the session.

To install the fleet-commander-client:

```
sudo dnf install fleet-commander-client
```

The software will detect if the machine is part of a domain automatically. When a user logs in, it will set up the session with the profiles that apply to the user.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/join-fedora-linux-enterprise-domain/

作者：[ogutierrez][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ogutierrez/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/05/enterprise-816x345.jpg
[2]: https://unsplash.com/@genefoto?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/fleet?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://www.freeipa.org/page/Main_Page
[5]: https://en.wikipedia.org/wiki/Active_Directory
[6]: https://lh5.googleusercontent.com/aIRYn2TDgaaUrErzBV_KPVgpm94OrVgySlwqlI3VsotslWKN5UnLQ0VYjESSFB12aZWf_UnbmOOwa_rcxvRoI-MB6gFaw8p-RgBP9Lswnb2YV3iIlQ8YeXgpwJC_-B5tPrFTfUe_
[7]: https://lh6.googleusercontent.com/DVvr7cHuZxvgqhAHk9v7jAYSER7VSP1G7CJ1xHx1kT5ZS-v1yt3rKMmwk9JhsLnYGfwAjOPPpSC2BGTpZtAdKrnx7XLUWgOZBhFFwB6SL7vR_q_2N1c_OGYp7YmNLRk7oRW8IEVB
[8]: https://fleet-commander.org/
[9]: https://lh6.googleusercontent.com/ATeNp5niX37MW7ARiMVSkqe9Vr5Fv4IN6eUW5xf1UPO0AMO1DxXLypw0CbqTNOfzLJYDM18ggc7Mrh3LZK8Foh80K1WjSW9LHQD081BbJg0owQJj_ZQdICLr0tGILmBRco-xbq92
[10]: http://localhost:9090/
