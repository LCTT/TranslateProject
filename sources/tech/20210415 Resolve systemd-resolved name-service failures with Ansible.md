[#]: subject: (Resolve systemd-resolved name-service failures with Ansible)
[#]: via: (https://opensource.com/article/21/4/systemd-resolved)
[#]: author: (David Both https://opensource.com/users/dboth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Resolve systemd-resolved name-service failures with Ansible
======
Name resolution and the ever-changing networking landscape.
![People work on a computer server with devices][1]

Most people tend to take name services for granted. They are necessary to convert human-readable names, such as `www.example.com`, into IP addresses, like `93.184.216.34`. It is easier for humans to recognize and remember names than IP addresses, and name services allow us to use names, and they also convert them to IP addresses for us.

The [Domain Name System][2] (DNS) is the global distributed database that maintains the data required to perform these lookups and reverse lookups, in which the IP address is known and the domain name is needed.

I [installed Fedora 33][3] the first day it became available in October 2020. One of the major changes was a migration from the ancient Name Service Switch (NSS) resolver to [systemd-resolved][4]. Unfortunately, after everything was up and running, I couldn't connect to or even ping any of the hosts on my network by name, although using IP addresses did work.

### The problem

I run my own name server using BIND on my network server, and all has been good for over 20 years. I've configured my DHCP server to provide the IP address of my name server to every workstation connected to my network, and that (along with a couple of backup name servers) is stored in `/etc/resolv.conf`.

[Michael Catanzaro][5] describes how systemd-resolved is supposed to work, but the introduction of systemd-resolved caused various strange resolution problems on my network hosts. The symptoms varied depending upon the host's purpose. The trouble mostly presented as an inability to find IP addresses for hosts inside the network on most systems. On other systems, it failed to resolve any names at all. For example, even though nslookup sometimes returned the correct IP addresses for hosts inside and outside networks, ping would not contact the designated host, nor could I SSH to that same host. Most of the time, neither the lookup, the ping, nor SSH would work unless I used the IP address in the command.

The new resolver allegedly has four operational modes, described in this [Fedora Magazine article][6]. None of the options seems to work correctly when the network has its own name server designed to perform lookups for internal and external hosts.

In theory, systemd-resolved is supposed to fix some corner issues around the NSS resolver failing to use the correct name server when a host is connected to a VPN, which has become a common problem with so many more people working from home.

The new resolver is supposed to use the fact that `/etc/resolv.conf` is now a symlink to determine how it is supposed to work based on which resolve file it is linked to. systemd-resolved's man page includes details about this behavior. The man page says that setting `/etc/resolv.conf` as a symlink to `/run/systemd/resolve/resolv.conf` should cause the new resolver to work the same way the old one does, but that didn't work for me.

### My fix

I have seen many options on the internet for resolving this problem, but the only thing that works reliably for me is to stop and disable the new resolver. First, I deleted the existing link for `resolv.conf`, copied my preferred `resolv.conf` file to `/run/NetworkManager/resolv.conf`, and added a new link to that file in `/etc`:


```
# rm -f /etc/resolv.conf
# ln -s /run/NetworkManager/resolv.conf /etc/resolv.conf
```

These commands stop and disable the systemd-resolved service:


```
# systemctl stop systemd-resolved.service ; systemctl disable systemd-resolved.service
Removed /etc/systemd/system/multi-user.target.wants/systemd-resolved.service.
Removed /etc/systemd/system/dbus-org.freedesktop.resolve1.service.
```

There's no reboot required. The old resolver takes over, and name services work as expected.

### Make it easy with Ansible

I set up this Ansible playbook to make the necessary changes if I install a new host or an update that reverts the resolver to systemd-resolved, or if an upgrade to the next release of Fedora reverts the resolver. The `resolv.conf` file you want for your network should be located in `/root/ansible/resolver/files/`:


```
################################################################################
#                              fixResolver.yml                                 #
#------------------------------------------------------------------------------#
#                                                                              #
# This playbook configures the old nss resolver on systems that have the new   #
# systemd-resolved service installed. It copies the resolv.conf file for my    #
# network to /run/NetworkManager/resolv.conf and places a link to that file    #
# as /etc/resolv.conf. It then stops and disables systemd-resolved which       #
# activates the old nss resolver.                                              #
#                                                                              #
#------------------------------------------------------------------------------#
#                                                                              #
# Change History                                                               #
# Date        Name         Version   Description                               #
# 2020/11/07  David Both   00.00     Started new code                          #
# 2021/03/26  David Both   00.50     Tested OK on multiple hosts.              #
#                                                                              #
################################################################################
\---
\- name: Revert to old NSS resolver and disable the systemd-resolved service
  hosts: all_by_IP

################################################################################

  tasks:
    - name: Copy resolv.conf for my network
      copy:
        src: /root/ansible/resolver/files/resolv.conf
        dest: /run/NetworkManager/resolv.conf
        mode: 0644
        owner: root
        group: root

    - name: Delete existing /etc/resolv.conf file or link
      file:
        path: /etc/resolv.conf
        state: absent

    - name: Create link from /etc/resolv.conf to /run/NetworkManager/resolv.conf
      file:
        src: /run/NetworkManager/resolv.conf
        dest: /etc/resolv.conf
        state: link

    - name: Stop and disable systemd-resolved
      systemd:
        name: systemd-resolved
        state: stopped
        enabled: no
```

Whichever Ansible inventory you use must have a group that uses IP addresses instead of hostnames. This command runs the playbook and specifies the name of the inventory file I use for hosts by IP address:


```
`# ansible-playbook -i /etc/ansible/hosts_by_IP fixResolver.yml`
```

### Final thoughts

Sometimes the best answer to a tech problem is to fall back to what you know. When systemd-resolved is more robust, I'll likely give it another try, but for now I'm glad that open source infrastructure allows me to quickly identify and resolve network problems. Using Ansible to automate the process is a much appreciated bonus. The important lesson here is to do your research when troubleshooting, and to never be afraid to void your warranty.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/systemd-resolved

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://opensource.com/article/17/4/introduction-domain-name-system-dns
[3]: https://opensource.com/article/20/11/new-gnome
[4]: https://www.freedesktop.org/software/systemd/man/systemd-resolved.service.html
[5]: https://blogs.gnome.org/mcatanzaro/2020/12/17/understanding-systemd-resolved-split-dns-and-vpn-configuration/
[6]: https://fedoramagazine.org/systemd-resolved-introduction-to-split-dns/
