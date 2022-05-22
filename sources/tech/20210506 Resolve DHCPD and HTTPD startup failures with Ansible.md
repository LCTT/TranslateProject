[#]: subject: (Resolve DHCPD and HTTPD startup failures with Ansible)
[#]: via: (https://opensource.com/article/21/5/ansible-server-services)
[#]: author: (David Both https://opensource.com/users/dboth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Resolve DHCPD and HTTPD startup failures with Ansible
======
Ancient remnants can create strange problems.
![Someone wearing a hardhat and carrying code ][1]

Last year, I had a problem: HTTPD (the [Apache web server][2]) would not start on a reboot or cold boot. To fix it, I added an override file, `/etc/systemd/system/httpd.service.d/override.conf`. It contained the following statements to delay HTTPD's startup until the network is properly started and online. (If you've read my previous [articles][3], you'll know that I use NetworkManager and systemd, not the old SystemV network service and start scripts).


```
# Trying to delay the startup of httpd so that the network is
# fully up and running so that httpd can bind to the correct
# IP address
#
# By David Both, 2020-04-16
[Unit]
After=network-online.target
Wants=network-online.target
```

This circumvention worked until recently when I not only needed to start HTTPD manually; I also had to start DHCPD manually. The wait for the `network-online.target` was no longer working for some reason.

### The causes and my fix

After more internet searches and some digging around my `/etc` directory, I think I discovered the true culprit: I found an ancient remnant from the SystemV and init days in the `/etc/init.d` directory. There was a copy of the old network startup file that should not have been there. I think this file is left over from when I spent some time using the old network program before I switched over to NetworkManager.

Apparently, systemd did what it is supposed to do. It generated a target file from that SystemV start script on the fly and tried to start the network using both the SystemV start script and systemd target that it created. This caused systemd to try to start HTTPD and DHCPD before the network was ready, and those services timed out and did not start.

I removed the `/etc/init.d/network` script from my server, and now it reboots without me having to start the HTTPD and DHCPD services manually. This is a much better solution because it gets to the root cause and is not simply a circumvention.

But this is still not the best solution. That file is owned by the `network-scripts` package and will be replaced if that package is updated. So, I also removed that package from my server, which ensures that this should not happen again. Can you guess how I discovered this?

After I upgraded to Fedora 34, DHCPD and HTTPD again would not start. After some additional experimentation, I found that the `override.conf` file also needed a couple of lines added. These two new lines force those two services to wait until 60 seconds have passed before starting. That seems to solve the problem again—for now.

The revised `override.conf` file now looks like the following. It not only sleeps for 60 seconds before starting the services, it specifies that it is not supposed to start until after the `network-online.target` starts. The latter part is what seems to be broken, but I figured I might as well do both things since one or the other usually seems to work.


```
# Delay the startup of any network service so that the
# network is fully up and running so that httpd can bind to the correct
# IP address.
#
# By David Both, 2020-04-28
#
################################################################################
#                                                                              #
#  Copyright (C) 2021 David Both                                               #
#  [LinuxGeek46@both.org][4]                                                        #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 2 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #
#                                                                              #
################################################################################

[Service]
ExecStartPre=/bin/sleep 60

[Unit]
After=network-online.target
Wants=network-online.target
```

### Making it easier with Ansible

This is the type of problem that lends itself to an easy solution using Ansible. So, I created a relatively simple playbook. It has two plays. The first play removes the `network-scripts` and then the `/etc/init.d/network` script because if the script is there and the package is not, the script won’t be removed. At least one of my systems had that circumstance. I run this play against all the hosts whether they are workstations or servers.

The second play runs only against the server and installs the `override.conf` files.


```
################################################################################
#                                 fix-network                                  #
#                                                                              #
# This Ansible playbook removes the network-scripts package and the            #
# /etc/rc.d/init.d/network SystemV start script. The /etc/init.d/network       #
# script which conflicts with NetworkManager and causes some network services  #
# such as DHCPD and HTTPD to fail to start.                                    #
#                                                                              #
# This playbook also installs override files for httpd and dhcpd which causes  #
# them to wait 60 seconds before starting.                                     #
#                                                                              #
# All of these things taken together seem to resolve or circumvent the issues  #
# that seem to stem from multiple causes.                                      #
#                                                                              #
# NOTE: The override file is service neutral and can be used with any service. #
#       I have found that using the systemctl edit command does not work as    #
#       it is supposed to according to the documenation.                       #
#                                                                              #
#                                                                              #
# From the network-scripts package info:                                       #
#                                                                              #
# : This package contains the legacy scripts for activating &amp; deactivating of most
# : network interfaces. It also provides a legacy version of 'network' service.
# :
# : The 'network' service is enabled by default after installation of this package,
# : and if the network-scripts are installed alongside NetworkManager, then the
# : ifup/ifdown commands from network-scripts take precedence over the ones provided
# : by NetworkManager.
# :
# : If user has both network-scripts &amp; NetworkManager installed, and wishes to
# : use ifup/ifdown from NetworkManager primarily, then they has to run command:
# :  $ update-alternatives --config ifup
# :
# : Please note that running the command above will also disable the 'network'
# : service.
#                                                                              #
#                                                                              #
#------------------------------------------------------------------------------#
#                                                                              #
# Change History                                                               #
# 2021/04/26 David Both V01.00 New code.                                       #
# 2021/04/28 David Both V01.10 Revised to also remove network-scripts package. #
#                              Also install an override file to do a 60 second #
#                              timeout before the services start.              #                                                                              #                                                                              #
################################################################################
\---
################################################################################
# Play 1: Remove the /etc/init.d/network file
################################################################################
\- name: Play 1 - Remove the network-scripts legacy package on all hosts
  hosts: all

  tasks:
    - name: Remove the network-scripts package if it exists
      dnf:
        name: network-scripts
        state: absent

    - name: Remove /etc/init.d/network file if it exists but the network-scripts package is not installed
      ansible.builtin.file:
        path: /etc/init.d/network
        state: absent

\- name: Play 2 - Install override files for the server services
  hosts: server

  tasks:

    - name: Install the override file for DHCPD
      copy:
        src: /root/ansible/BasicTools/files/override.conf
        dest: /etc/systemd/system/dhcpd.service.d
        mode: 0644
        owner: root
        group: root

    - name: Install the override file for HTTPD
      copy:
        src: /root/ansible/BasicTools/files/override.conf
        dest: /etc/systemd/system/httpd.service.d
        mode: 0644
        owner: root
        group: root
```

This Ansible play removed that bit of cruft from two other hosts on my network and one host on another network that I support. All the hosts that still had the SystemV network script and the `network-scripts` package have not been reinstalled from scratch for several years; they were all upgraded using `dnf-upgrade`. I never circumvented NetworkManager on my newer hosts, so they don't have this problem.

This playbook also installed the override files for both services. Note that the override file has no reference to the service for which it provides the configuration override. For this reason, it can be used for any service that does not start because the attempt to start them has not allowed the NetworkManager service to finish starting up.

### Final thoughts

Although this problem is related to systemd startup, I cannot blame it on systemd. This is, partly at least, a self-inflicted problem caused when I circumvented systemd. At the time, I thought I was making things easier for myself, but I have spent more time trying to locate the problem caused by my avoidance of NetworkManager than I ever saved because I had to learn it anyway. Yet in reality, this problem has multiple possible causes, all of which are addressed by the Ansible playbook.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/ansible-server-services

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag (Someone wearing a hardhat and carrying code )
[2]: https://opensource.com/article/18/2/how-configure-apache-web-server
[3]: https://opensource.com/users/dboth
[4]: mailto:LinuxGeek46@both.org
