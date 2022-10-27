[#]: subject: "Samba as AD and Domain Controller"
[#]: via: "https://fedoramagazine.org/samba-as-ad-and-domain-controller/"
[#]: author: "Daniel Kühl https://fedoramagazine.org/author/dklima/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Samba as AD and Domain Controller
======

![Samba AD Domain Controller][1]

Photo by [Eric Schirtzinger][2] on [Unsplash][3]

Having a server with Samba providing AD and Domain Controller functionality will provide you with a very mature and professional way to have a centralized place with all users and groups information. It will free you from the burden of having to manage users and groups on each server. This solution is useful for authenticating applications such as WordPress, FTP servers, HTTP servers, you name it.

This step-by-step tutorial about setting up Samba as an AD and Domain Controller will demonstrate to you how you can achieve this solution for your network, servers, and applications.

### Pre-requisites

A fresh Fedora Linux 35 server installation.

### Definitions

**Hostname**: dc1
**Domain**: onda.org
**IP**: 10.1.1.10/24

### Considerations

  * Once the domain was chosen, you can’t change it, be wise;
  * In the _/etc/hosts_ file, the server name can’t be on _127.0.0.1_ line, it must be on its IP address line;
  * Use a fixed IP address for the server, as a result, the server’s IP won’t change;
  * Once you provision the DC server, do not provision another one, join other ones to the domain instead;
  * For the DNS server, we will choose _SAMBA_INTERNAL_, so we can have the DNS forwarding feature;
  * It is necessary to have a time synchronization service running in the server, like _chrony_ or _ntp_, so you can avoid numerous problems from not having the server and clients synchronized with the same time;



### Samba installation

Let’s install the required software to get through this guide. It will provide all the applications you will need.

```

    sudo dnf install samba samba-dc samba-client heimdal-workstation

```

![Samba installation][4]

### Configurations

For setting up Samba as an AD and Domain Controller, you will have to prepare the environment with a functional configuration before you start using it.

#### Firewall

You will need to allow some UDP and TCP ports through the firewall so that clients will be able to connect to the Domain Controller.

I will show you two methods to add them. Choose the one that suits you best.

##### First method

This is the most straightforward method, _firewalld_ comes with a service with all ports needed to open Samba DC, which is called _samba-dc_. Add it to the firewall rules:

Add the service:

```

    sudo firewall-cmd --permanent --add-service samba-dc

```

##### Second method

Alternatively, you can add the rules from the command line:

```

    sudo firewall-cmd --permanent --add-port={53/udp,53/tcp,88/udp,88/tcp,123/udp,135/tcp,137/udp,138/udp,139/tcp,389/udp,389/tcp,445/tcp,464/udp,464/tcp,636/tcp,3268/tcp,3269/tcp,49152-65535/tcp}

```

Reload _firewalld_:

```

    sudo firewall-cmd --reload

```

For more information about _firewalld_, check the following article: [Control the firewall at the command line][5]

#### SELinux

To run a Samba DC and running with SELinux in enforcing mode, it is necessary to set some samba booleans for SELinux to on. After these booleans are set, it should not be necessary to disable SELinux.

```

    sudo setsebool -P samba_create_home_dirs=on samba_domain_controller=on samba_enable_home_dirs=on samba_portmapper=on use_samba_home_dirs=on

```

Restore the default SELinux security contexts for files:

```

    sudo restorecon -Rv /

```

#### Samba

First, remove the _/etc/samba/smb.conf_ file if it exists:

```

    sudo rm /etc/samba/smb.conf

```

Samba uses its own DNS service, and for that reason, the service won’t start if _systemd-resolved_ is running, that is why it is necessary to edit its configuration to stop listening on port 53 and use Samba’s DNS.

Create the directory _/etc/systemd/resolved.conf.d/_ if it does not exist:

```

    sudo mkdir /etc/systemd/resolved.conf.d/

```

Create the file _/etc/systemd/resolved.conf.d/custom.conf_ that contains the custom config:

```

    [Resolve]
    DNSStubListener=no
    Domains=onda.org
    DNS=10.1.1.10

```

**Remember to change the _DNS_ and _Domains_ entries to be your Samba DC server.**

![][6]

Restart the _systemd-resolved_ service:

```

    sudo systemctl restart systemd-resolved

```

Finally, provision the Samba configuration. _samba-tool_ provides every step needed to make Samba an AD server.

Using the _samba-tool_, provision the Samba configuration:

```

    sudo samba-tool domain provision --server-role=dc --use-rfc2307 --dns-backend=SAMBA_INTERNAL --realm=ONDA.ORG --domain=ONDA --adminpass=sVbOQ66iCD3hHShg

```

![Samba domain provisioning][7]

The _‐‐use-rfc2307_ argument provides POSIX attributes to Active Directory, which stores Unix user and group information on LDAP ([rfc2307.txt][8]).

Make sure that you have the correct _dns forwarder_ address set in _/etc/samba/smb.conf_. Concerning this tutorial, it should be **different** from the server’s own IP address 10.1.1.10, in my case I set to 8.8.8.8, however your mileage may vary:

![Changing the dns forwarder value on /etc/samba/smb.conf file][9]

After changing the _dns forwarder value_, restart _samba_ service:

```

    sudo systemctl restart samba

```

#### Kerberos

After Samba installation, it was provided a _krb5.conf_ file that we will use:

```

    sudo cp /usr/share/samba/setup/krb5.conf /etc/krb5.conf.d/samba-dc

```

Edit _/etc/krb5.conf.d/samba-dc_ content to match your organization information:

```

    [libdefaults]
      default_realm = ONDA.ORG
      dns_lookup_realm = false
      dns_lookup_kdc = true

    [realms]
    ONDA.ORG = {
      default_domain = ONDA
    }

    [domain_realm]
      dc1.onda.org = ONDA.ORG

```

#### Starting and enabling Samba on boot time

To make sure that Samba will start on system initialization, enable and start it:

```

    sudo systemctl enable samba
    sudo systemctl start samba

```

### Testing

#### Connectivity

```

    $ smbclient -L localhost -N

```

As a result of _smbclient_ command, shows that connection **was successful.

```

    Anonymous login successful
            Sharename       Type      Comment
            ---------       ----      -------
            sysvol          Disk
            netlogon        Disk
            IPC$            IPC       IPC Service (Samba 4.15.6)
    SMB1 disabled -- no workgroup available

```

![smbclient connection test][10]

Now, test the _Administrator_ login to _netlogon_ share:

```

    $ smbclient //localhost/netlogon -UAdministrator -c 'ls'

```

```

    Password for [ONDA\Administrator]:
      .                              D        0  Sat Mar 26 05:45:13 2022
      ..                             D        0  Sat Mar 26 05:45:18 2022

                    8154588 blocks of size 1024. 7307736 blocks available

```

![smbclient Administrator connection test][11]

#### DNS test

To test if the name resolution is working, execute the following commands:

```

    $ host -t SRV _ldap._tcp.onda.org.
    _ldap._tcp.onda.org has SRV record 0 100 389 dc1.onda.org.

```

```

    $ host -t SRV _kerberos._udp.onda.org.
    _kerberos._udp.onda.org has SRV record 0 100 88 dc1.onda.org.

```

```

    $ host -t A dc1.onda.org.
    dc1.onda.org has address 10.1.1.10

```

If you get the error:

```

    -bash: host: command not found

```

Install the _bind-utils_ package:

```

    sudo dnf install bind-utils

```

#### Kerberos test

Testing Kerberos is important because it generates the required tickets to let clients authenticate with encryption. It heavily relies on correct time.

It can’t be stressed enough to have date and time set correctly, and that is why it is so important to have a time synchronization service running on both clients and servers.

```

    $ /usr/lib/heimdal/bin/kinit administrator
    $ /usr/lib/heimdal/bin/klist

```

![Kerberos ticket validation][12]

### Adding a user to the Domain

_samba-tool_ provides us an interface for executing Domain administration tasks, so we can add a user to the Domain easily.

The _samba-tool_ help is very comprehensive:

```

    $ samba-tool user add --help

```

Adding user _danielk_ to the domain:

```

    sudo samba-tool user add danielk --unix-home=/home/danielk --login-shell=/bin/bash --gecos 'Daniel K.' --given-name=Daniel --surname='Kühl' --mail-address='danielk@onda.org'

```

![Adding user to the Domain][13]

To list the users on Domain:

```

    sudo samba-tool user list

```

### Wrap up and conclusion

We started out by installing Samba and required applications in a fresh Fedora Linux 35 installation. We’ve also explained the problems that this solution solves. Thereafter, we did an initial configuration that prepares the environment to be ready to Samba to operate as an AD and Domain Controller.

Then, we proceeded to cover how to have Samba up and running alongside Fedora Linux security features, like having it working with _firewalld_ and SELinux enabled. We did some important testing to make sure everything was fine and ended by showing a bit on how to administrate users using _samba-tool_.

To summarize, if you want to establish a robust solution for centralizing authentication across your network, servers (If one wanted to, one could even join a Windows 10 client to this Samba domain [_tested with Windows 10 Professional version 20H2_]) and services, consider using this approach as part of your infrastructure.

Now that you know how to have a Samba as AD and Domain Controller solution, what would you like to see covered next? Share your thoughts in the [comments below][14].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/samba-as-ad-and-domain-controller/

作者：[Daniel Kühl][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dklima/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/samba-addc-816x346.jpg
[2]: https://unsplash.com/@eschirtz?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tree?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/wp-content/uploads/2022/03/samba-install-1.gif
[5]: https://fedoramagazine.org/control-the-firewall-at-the-command-line/
[6]: https://fedoramagazine.org/wp-content/uploads/2022/04/samba-systemd-resolved.gif
[7]: https://fedoramagazine.org/wp-content/uploads/2022/03/samba-domain-provision.gif
[8]: https://www.rfc-editor.org/rfc/rfc2307.txt
[9]: https://fedoramagazine.org/wp-content/uploads/2022/04/samba-dns-forwarder.gif
[10]: https://fedoramagazine.org/wp-content/uploads/2022/03/samba-testing1.gif
[11]: https://fedoramagazine.org/wp-content/uploads/2022/03/samba-testing2.gif
[12]: https://fedoramagazine.org/wp-content/uploads/2022/03/samba-kerberos.gif
[13]: https://fedoramagazine.org/wp-content/uploads/2022/04/samba-adding-user-1.gif
[14]: tmp.RAEqol0F4Y#comments
