[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install OpenLDAP on Ubuntu Server 18.04)
[#]: via: (https://www.linux.com/blog/2019/3/how-install-openldap-ubuntu-server-1804)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)

How to Install OpenLDAP on Ubuntu Server 18.04
======

![OpenLDAP][1]

In part one of this short tutorial series, Jack Wallen explains how to install OpenLDAP.

[Creative Commons Zero][2]

The Lightweight Directory Access Protocol (LDAP) allows for the querying and modification of an X.500-based directory service. In other words, LDAP is used over a Local Area Network (LAN) to manage and access a distributed directory service. LDAPs primary purpose is to provide a set of records in a hierarchical structure. What can you do with those records? The best use-case is for user validation/authentication against desktops. If both server and client are set up properly, you can have all your Linux desktops authenticating against your LDAP server. This makes for a great single point of entry so that you can better manage (and control) user accounts.

The most popular iteration of LDAP for Linux is [OpenLDAP][3]. OpenLDAP is a free, open-source implementation of the Lightweight Directory Access Protocol, and makes it incredibly easy to get your LDAP server up and running.

In this three-part series, I’ll be walking you through the steps of:

  1. Installing OpenLDAP server.

  2. Installing the web-based LDAP Account Manager.

  3. Configuring Linux desktops, such that they can communicate with your LDAP server.




In the end, all of your Linux desktop machines (that have been configured properly) will be able to authenticate against a centralized location, which means you (as the administrator) have much more control over the management of users on your network.

In this first piece, I’ll be demonstrating the installation and configuration of OpenLDAP on Ubuntu Server 18.04. All you will need to make this work is a running instance of Ubuntu Server 18.04 and a user account with sudo privileges.
Let’s get to work.

### Update/Upgrade

The first thing you’ll want to do is update and upgrade your server. Do note, if the kernel gets updated, the server will need to be rebooted (unless you have Live Patch, or a similar service running). Because of this, run the update/upgrade at a time when the server can be rebooted.
To update and upgrade Ubuntu, log into your server and run the following commands:

```
sudo apt-get update

sudo apt-get upgrade -y
```

When the upgrade completes, reboot the server (if necessary), and get ready to install and configure OpenLDAP.

### Installing OpenLDAP

Since we’ll be using OpenLDAP as our LDAP server software, it can be installed from the standard repository. To install the necessary pieces, log into your Ubuntu Server and issue the following command:

### sudo apt-get instal slapd ldap-utils -y

During the installation, you’ll be first asked to create an administrator password for the LDAP directory. Type and verify that password (Figure 1).

![password][4]

Figure 1: Creating an administrator password for LDAP.

[Used with permission][5]

Configuring LDAP

With the installation of the components complete, it’s time to configure LDAP. Fortunately, there’s a handy tool we can use to make this happen. From the terminal window, issue the command:

```
sudo dpkg-reconfigure slapd
```

In the first window, hit Enter to select No and continue on. In the second window of the configuration tool (Figure 2), you must type the DNS domain name for your server. This will serve as the base DN (the point from where a server will search for users) for your LDAP directory. In my example, I’ve used example.com (you’ll want to change this to fit your needs).

![domain name][6]

Figure 2: Configuring the domain name for LDAP.

[Used with permission][5]

In the next window, type your Organizational name (ie the name of your company or department). You will then be prompted to (once again) create an administrator password (you can use the same one as you did during the installation). Once you’ve taken care of that, you’ll be asked the following questions:

  * Database backend to use - select **MDB**.

  * Do you want the database to be removed with slapd is purged? - Select **No.**

  * Move old database? - Select **Yes.**




OpenLDAP is now ready for data.

### Adding Initial Data

Now that OpenLDAP is installed and running, it’s time to populate the directory with a bit of initial data. In the second piece of this series, we’ll be installing a web-based GUI that makes it much easier to handle this task, but it’s always good to know how to add data the manual way.

One of the best ways to add data to the LDAP directory is via text file, which can then be imported in with the __ldapadd__ command. Create a new file with the command:

```
nano ldap_data.ldif
```

In that file, paste the following contents:

```
dn: ou=People,dc=example,dc=com

objectClass: organizationalUnit

ou: People


dn: ou=Groups,dc=EXAMPLE,dc=COM

objectClass: organizationalUnit

ou: Groups


dn: cn=DEPARTMENT,ou=Groups,dc=EXAMPLE,dc=COM

objectClass: posixGroup

cn: SUBGROUP

gidNumber: 5000


dn: uid=USER,ou=People,dc=EXAMPLE,dc=COM

objectClass: inetOrgPerson

objectClass: posixAccount

objectClass: shadowAccount

uid: USER

sn: LASTNAME

givenName: FIRSTNAME

cn: FULLNAME

displayName: DISPLAYNAME

uidNumber: 10000

gidNumber: 5000

userPassword: PASSWORD

gecos: FULLNAME

loginShell: /bin/bash

homeDirectory: USERDIRECTORY
```

In the above file, every entry in all caps needs to be modified to fit your company needs. Once you’ve modified the above file, save and close it with the [Ctrl]+[x] key combination.

To add the data from the file to the LDAP directory, issue the command:

```
ldapadd -x -D cn=admin,dc=EXAMPLE,dc=COM -W -f ldap_data.ldif
```

Remember to alter the dc entries (EXAMPLE and COM) in the above command to match your domain name. After running the command, you will be prompted for the LDAP admin password. When you successfully authentication to the LDAP server, the data will be added. You can then ensure the data is there, by running a search like so:

```
ldapsearch -x -LLL -b dc=EXAMPLE,dc=COM 'uid=USER' cn gidNumber
```

Where EXAMPLE and COM is your domain name and USER is the user to search for. The command should report the entry you searched for (Figure 3).

![search][7]

Figure 3: Our search was successful.

[Used with permission][5]

Now that you have your first entry into your LDAP directory, you can edit the above file to create even more. Or, you can wait until the next entry into the series (installing LDAP Account Manager) and take care of the process with the web-based GUI. Either way, you’re one step closer to having LDAP authentication on your network.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2019/3/how-install-openldap-ubuntu-server-1804

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ldap.png?itok=r9viT8n6 (OpenLDAP)
[2]: /LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://www.openldap.org/
[4]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ldap_1.jpg?itok=vbWScztB (password)
[5]: /LICENSES/CATEGORY/USED-PERMISSION
[6]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ldap_2.jpg?itok=10CSCm6Z (domain name)
[7]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ldap_3.jpg?itok=df2Y65Dv (search)
