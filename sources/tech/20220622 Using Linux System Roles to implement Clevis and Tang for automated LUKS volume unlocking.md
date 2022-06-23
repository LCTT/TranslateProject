[#]: subject: "Using Linux System Roles to implement Clevis and Tang for automated LUKS volume unlocking"
[#]: via: "https://fedoramagazine.org/using-linux-system-roles-to-implement-clevis-and-tang-for-automated-luks-volume-unlocking/"
[#]: author: "Brian Smith https://fedoramagazine.org/author/briansmith/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using Linux System Roles to implement Clevis and Tang for automated LUKS volume unlocking
======

![][1]

Photo by [Mikhail Fesenko][2] on [Unsplash][3]

One of the key aspects of system security is encrypting storage at rest. Without encrypted storage, any time a storage device leaves your presence it can be at risk. The most obvious scenario where this can happen is if a storage device (either just the storage device or the entire system, server, or laptop) is lost or stolen.

However, there are other scenarios that are a concern as well: perhaps you have a storage device fail, and it is replaced under warranty — many times the vendor will ask you to return the original device. If the device was encrypted, it is much less of a concern to return it back to the hardware vendor.

Another concern is anytime your storage device is out of sight there is a risk that the data is copied or cloned off of the device without you even being aware. Again, if the device is encrypted, this is much less of a concern.

Fedora (and other Linux distributions) include the Linux Unified Key Setup (LUKS) functionality to support disk encryption. LUKS is easy to use, and is even integrated as an option in the Fedora Anaconda installer.

However there is one challenge that frequently prevents people from implementing LUKS on a large scale, especially for the root filesystem: every single time you reboot the host you generally have to manually access the console and type in the LUKS passphrase so the system can boot up.

If you are running Fedora on a single laptop, this might not be a problem, after all, you probably are sitting in front of your laptop any time you reboot it. However, if you have a large number of Fedora instances, this quickly becomes impractical to deal with.

![][4]

You might be managing Fedora systems that are at remote locations, and you might not even have good or reliable ways to access a console on them. In this case, rebooting the hosts could result in them not coming up until you or someone else travels to their location to type in the LUKS passphrase.

This article will cover how to implement a solution to enable automated LUKS volume unlocking (and the process to implement these features will be done using automation as well!)

### Overview of Clevis and Tang

Clevis and Tang are an innovative solution that can help with the challenge of having systems with encrypted storage boot up without manual user intervention on every boot. At a high level, Clevis, which is installed on the client systems, can enable LUKS volumes to be unlocked without user intervention as long as the client system has network access to a configurable number of Tang servers.

The basic premise is that the Tang server(s) are on an internal/private or otherwise secured network, and if the storage devices are lost, stolen, or otherwise removed from the environment, that they would no longer have network access to the Tang server(s), and thus no longer automatically unlock automatically at boot.

Tang is stateless and doesn’t require authentication or even TLS, which means it is very lightweight and easy to configure, and can run from a container. In this article, I’m only setting up a single Tang server, however it is also possible to have multiple Tang servers in an environment, and to configure the number Tang servers the Clevis clients must connect to in order to unlock the encrypted volume. For example, you could have three Tang servers, and require the Clevis clients to be able to connect to at least two of the three Tang servers.

For more information on how Tang and Clevis work, refer to the GitHub pages: [Clevis][5] and [Tang][6], or for an overview of the inner workings of Tang and Clevis, refer to the [Securing Automated Decryption New Cryptography and Techniques][7] FOSDEM talk.

### Overview of Linux System Roles

Linux System Roles is a set of Ansible Roles/Collections that can help automate the configuration and management of many aspects of Fedora, CentOS Stream, RHEL, and RHEL derivatives. Linux System Roles is packaged in Fedora as an RPM (*linux-system-roles*) and is also available on Ansible Galaxy (as both roles and as a collection). For more information on Linux System Roles, and to see a list of included roles, refer to the [Linux System Roles project page][8].

Included in the list of Linux System Roles are the *nbde_client*, *nbde_server*, and *firewall* roles that will be used in this article. The *nbde_client* and *nbde_server* roles are focused on automating the implementation of Clevis and Tang, respectively. The “nbde” in the role names stands for network bound disk encryption, which is another term to refer to using Clevis and Tang for automated unlocking of LUKS encrypted volumes. The *firewall* role can automate the implementation of firewall settings, and will be used to open a port in the firewall on the Tang server.

### Demo environment overview

In my environment, I have a Raspberry Pi, running Fedora 36 that I will install Linux System Roles on and use as my Ansible control node. In addition, I’ll use this same Raspberry Pi as my Tang server. This device is configured with the *pi.example.com* hostname.

In addition, I have four other systems in my environment: two Fedora 36 systems, and two CentOS Stream 9 systems, named *fedora-server1.example.com*, *fedora-server2.example.com*, *c9s-server1.example.com*, and *c9s-server2.example.com*. Each of these four systems has a LUKS encrypted root filesystem and currently the LUKS passphrase must be manually typed in each time the systems boot up.

I’ll use the *nbde_server* and *firewall* roles to install and configure Tang on my*pi.example.com*system, and use the *nbde_client* role to install and configure Clevis on my four other systems, enabling them to automatically unlock their encrypted root filesystem if they can connect to the *pi.example.com* Tang system.

### Installing Linux System Roles and Ansible on the Raspberry Pi

I’ll start by installing the *linux-system-roles* package on the *pi.example.com* host, which will act as my Ansible control node. This will also install *ansible-core* and several other packages as dependencies. These packages do not need to be installed on the other four systems in my environment (which are referred to as managed nodes).

```
$ sudo dnf install linux-system-roles
```

SSH keys and sudo configuration need to be configured so that the control node host can connect to each of the managed nodes in the environment and escalate to root privileges.

### Defining the Ansible inventory file

Still on the *pi.example.com* host, I’ll create an Ansible inventory file to group the five systems in my environment into two Ansible inventory groups. The *nbde_servers* group will contain a list of hosts that I would like to configure as Tang servers (which in this example is only the *pi.example.com*host), and the *nbde_clients* group will contain a list of hosts that I would like to configure as Clevis clients. I’ll name this inventory file *inventory.yml* and it contains the following content:

```
all:
  children:
    nbde_servers:
      hosts:
        pi.example.com:
    nbde_clients:
      hosts:
        fedora35-server1.example.com:
        fedora35-server2.example.com:
        c9s-server1.example.com:
        c9s-server2.example.com:
```

### Creating Ansible Group variable files

Ansible variables are set to specify what configuration should be implemented by the Linux System Roles. Each role has a README.md file that contains important information on how to use each role, including a list of available role variables. The README.md files for the *nbde_server*, *nbde_client*, and *firewall* roles are available in the following locations, respectively:

* /usr/share/doc/linux-system-roles/nbde_server/README.md
* /usr/share/doc/linux-system-roles/nbde_client/README.md
* /usr/share/doc/linux-system-roles/firewall/README.md

I’ll create a *group_vars* directory with the *mkdir group_vars* command. Within this directory, I’ll create a *nbde_servers.yml* file and *nbde_clients.yml* file, which will define, respectively, the variables that should be set for systems listed in the *nbde_servers* inventory group and the *nbde_clients* inventory group.

The *nbde_servers.yml* file contains the following content, which will instruct the *firewall* role to open TCP port 80, which is the default port used by Tang:

```
firewall:
  - port: ['80/tcp']
    state: enabled
```

The *nbde_clients.yml* file contains the following content:

```
nbde_client_bindings:
  - device: /dev/vda2
    encryption_password: !vault |
          $ANSIBLE_VAULT;1.1;AES256
          62666465373138636165326639633...
    servers:
      - http://pi.example.com
```

Under *nbde_client_bindings*, *device* specifies the backing device of the encrypted root filesystem on the four managed nodes. The *encryption_password* specifies a current LUKS passphrase that is required to configure Clevis. In this example, I’ve used *ansible-vault* to encrypt the string rather than place the LUKS passphrase in clear text. And finally, under *servers*, a list of Tang servers that Clevis should bind to are specified. In this example, the Clevis clients will be configured to bind to the *pi.example.com* Tang server.

### Creating the playbook

I’ll create a simple Ansible playbook, named *nbde.yml* that will call the *firewall* and *nbde_server* roles for systems in the *nbde_servers* inventory group, and call the *nbde_client* role for systems in the *nbde_clients* group:

```
- name: Open firewall for Tang
  hosts: nbde_servers
  roles:
    - linux-system-roles.firewall

- name: Deploy NBDE Tang server
  hosts: nbde_servers
  roles:
    - linux-system-roles.nbde_server

- name: Deploy NBDE Clevis clients
  hosts: nbde_clients
  roles:
    - linux-system-roles.nbde_client
```

At this point, I have the following files and directories created:

* inventory.yml
* nbde.yml
* group_vars/nbde_clients.yml
* group_vars/nbde_servers.yml

### Running the playbook

The *nbde.yml* playbook can be run with the following command:

```
$ ansible-playbook nbde.yml -i inventory.yml --ask-vault-pass -b
```

The*-i*flag specifies which inventory file should be used, the *–ask-vault-pass* flag will prompt for the Ansible Vault password to decrypt the *encryption_password* variable, and the *-b* flag specifies that Ansible should escalate to root privileges.

![][9]

### Validating the configuration

To validate the configuration, I rebooted each of my four managed nodes that were configured as Clevis clients of the Raspberry Pi Tang server. Each of the four managed nodes boots up and briefly pauses on the LUKS passphrase prompt:

![][10]

However, after the brief delay, each of the four systems continued booting up without requiring me to enter the LUKS passphrase.

### Conclusion

If you would like to secure your data at rest with LUKS encryption, but need a solution that enables systems to boot up without intervention, consider implementing Clevis and Tang. Linux System Roles can help you implement Clevis and Tang, as well as a number of other aspects of your system, in an automated manner.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-linux-system-roles-to-implement-clevis-and-tang-for-automated-luks-volume-unlocking/

作者：[Brian Smith][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/briansmith/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/06/Automatic-LUKS-volume-unlocking-816x345.jpg
[2]: https://unsplash.com/@proggga?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/system-administrator?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/wp-content/uploads/2022/06/several-1024x576.png
[5]: https://github.com/latchset/clevis
[6]: https://github.com/latchset/tang
[7]: https://www.youtube.com/watch?v=2uLKvB8Z5D0
[8]: https://linux-system-roles.github.io/
[9]: https://fedoramagazine.org/wp-content/uploads/2022/06/results.png
[10]: https://fedoramagazine.org/wp-content/uploads/2022/06/prompt.png
