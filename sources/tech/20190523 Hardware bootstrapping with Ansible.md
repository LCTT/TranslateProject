[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Hardware bootstrapping with Ansible)
[#]: via: (https://opensource.com/article/19/5/hardware-bootstrapping-ansible)
[#]: author: (Mark Phillips https://opensource.com/users/markp/users/feeble/users/markp)

Hardware bootstrapping with Ansible
======

![computer servers processing data][1]

At a recent [Ansible London Meetup][2], I got chatting with somebody about automated hardware builds. _"It's all cloud now!"_ I hear you say. Ah, but for many large organisations it's not—they still have massive data centres full of hardware. Almost regularly somebody pops up on our internal mail list and asks, *"can Ansible do hardware provisioning?" *Well yes, you can provision hardware with Ansible…

### Requirements

Bootstrapping hardware is mostly about network services. Before we do any operating system (OS) installing then, we must set up some services. We will need:

  * DHCP
  * PXE
  * TFTP
  * Operating system media
  * Web server



### Setup

Besides the DHCP configuration, everything else in this article is handled by the Ansible plays included in [this repository][3].

#### DHCP server

I'm writing here on the assumption you can control your DHCP configuration. If you don't have access to your DHCP server, you'll need to ask the owner to set two options. DHCP option 67 needs to be set to **pxelinux.0** and **next-server** (which is option 66—but you may not need to know that; often a DHCP server will have a field/option for 'next server') needs to be set to the IP address of your TFTP server.

If you can own the DHCP server, I'd suggest using dnsmasq. It's small and simple. I will not cover configuring it here, but look at [the man page][4] and the **\--enable-tftp** option.

#### TFTP

The **next-server** setting for our DHCP server, above, will point to a machine serving [TFTP][5]. Here I've used a [CentOS Linux][6] virtual machine, as it only takes one package (syslinux-tftpboot) and a service to start to have TFTP up and running. We'll stick with the default path, **/var/lib/tftpboot**.

#### PXE

If you're not already familiar with PXE, you might like to take a quick look at [the Wikipedia page][7]. For this article I'll keep it short—we will serve some files over TFTP, which DHCP guides our hardware to.

You'll want **images/pxeboot/{initrd.img,vmlinuz}** from the OS distribution media for pxeboot. These need to be copied to **/var/lib/tftpboot/pxeboot**. The referenced Ansible plays **do not do this step, **so you need to copy them over yourself.

We'll also need to serve the OS installation files. There are two approaches to this: 1) install, via HTTP, from the internet or 2) install, again via HTTP, from a local server. For my testing, since I'm on a private LAN (and I guess you are too), the fastest installation method is the second. The easiest way to prepare this is to mount the DVD image and rsync the `images`, **`Packages` **and `repodata` directories to your webserver location. The referenced Ansible plays will install **httpd** but won't copy over these files, so don't forget to do that after running [the play][8]. For this article, we'll once again stick with defaults for simplicity—so files need to be copied to Apache's standard docroot, **/var/www/html**.

#### Directories

We should end up with directory structures like this:

##### PXE/TFTP


```
[root@c7 ~]# tree /var/lib/tftpboot/pxe{b*,l*cfg}
/var/lib/tftpboot/pxeboot
└── 6
├── initrd.img
└── vmlinuz
```

##### httpd


```
[root@c7 ~]# tree -d /var/www/html/
/var/www/html/
├── 6 -> centos/6
├── 7 -> centos/7
├── centos
│ ├── 6
│ │ └── os
│ │ └── x86_64
│ │ ├── images
│ │ │ └── pxeboot
│ │ ├── Packages
│ │ └── repodata
│ └── 7
│ └── os
│ └── x86_64
│ ├── images
│ │ └── pxeboot
│ ├── Packages
│ └── repodata
└── ks
```

You'll notice my web setup appears a little less simple than the words above! I've pasted my actual structure to give you some ideas. The hardware I'm using is really old, and even getting CentOS 7 to work was horrible (if you're interested, it's due to the lack of [cciss][9] drivers for the HP Smart Array controller—yes, [there is an answer][10], but it takes a lot of faffing to make work), so all examples are of CentOS 6. I also wanted a flexible setup that could install many versions. Here I've done that using symlinks—this arrangement will work just fine for RHEL too, for example. The basic structure is present though—note the images, Packages and repodata directories.

These paths relate directly to [the PXE menu][11] file we'll serve up and [the kickstart file][12] too.

#### If you don't have DHCP

If you can't manage your own DHCP server or the owners of your infrastructure can't help, there is another option. In the past, I've used [iPXE][13] to create a boot image that I've loaded as virtual media. A lot of out-of-band/lights-out-management (LOM) interfaces on modern hardware support this functionality. You can make a custom embedded PXE menu in seconds with iPXE. I won't cover that here, but if it turns out to be a problem for you, then drop me a line [on Twitter][14] and I'll look at doing a follow-up blog post if enough people request it.

### Installing hardware

We've got our structure in place now, and we can [kickstart][15] a server. Before we do, we have to add some configuration to the TFTP setup to enable a given piece of hardware to pick up the PXE boot menu.

It's here we come across a small chicken/egg problem. We need a host's MAC address to create a link to the specific piece of hardware we want to kickstart. If the hardware is already running and we can access it with Ansible, that's great—we have a way of finding out the boot interface MAC address via the setup module (see [the reinstall play][16]). If it's a new piece of tin, however, we need to get the MAC address and tell our setup what to do with it. This probably means some manual intervention—booting the server and looking at a screen or maybe getting the MAC from a manifest or such like. Whichever way you get hold of it, we can tell our play about it via the inventory.

Let's put a custom variable into our simple INI format [inventory file][17], but run a play to set up TFTP…


```
(pip)iMac:ansible-hw-bootstrap$ ansible-inventory --host hp.box
{
"ilo_ip": "192.168.1.68",
"ilo_password": "administrator"
}
(pip)iMac:ansible-hw-bootstrap$ ansible-playbook plays/install.yml

PLAY [kickstart] *******************************************************************************************************

TASK [Host inventory entry has a MAC address] **************************************************************************
failed: [ks.box] (item=hp.box) => {
"assertion": "hostvars[item]['mac'] is defined",
"changed": false,
"evaluated_to": false,
"item": "hp.box",
"msg": "Assertion failed"
}

PLAY RECAP *************************************************************************************************************
ks.box : ok=0 changed=0 unreachable=0 failed=1
```

Uh oh, play failed. It [contains a check][18] that the host we're about to install actually has a MAC address added. Let's fix that and run the play again…


```
(pip)iMac:ansible-hw-bootstrap$ ansible-inventory --host hp.box
{
"ilo_ip": "192.168.1.68",
"ilo_password": "administrator",
"mac": "00:AA:BB:CC:DD:EE"
}
(pip)iMac:ansible-hw-bootstrap$ ansible-playbook plays/install.yml

PLAY [kickstart] *******************************************************************************************************

TASK [Host inventory entry has a MAC address] **************************************************************************
ok: [ks.box] => (item=hp.box) => {
"changed": false,
"item": "hp.box",
"msg": "All assertions passed"
}

TASK [Set PXE menu to install] *****************************************************************************************
ok: [ks.box] => (item=hp.box)

TASK [Reboot target host for PXE boot] *********************************************************************************
skipping: [ks.box] => (item=hp.box)

PLAY RECAP *************************************************************************************************************
ks.box : ok=2 changed=0 unreachable=0 failed=0
```

That worked! What did it do? Looking at the pxelinux.cfg directory under our TFTP root, we can see a symlink…


```
[root@c7 pxelinux.cfg]# pwd
/var/lib/tftpboot/pxelinux.cfg
[root@c7 pxelinux.cfg]# l
total 12
drwxr-xr-x. 2 root root 65 May 13 14:23 ./
drwxr-xr-x. 4 root root 4096 May 2 22:13 ../
-r--r--r--. 1 root root 515 May 2 12:22 00README
lrwxrwxrwx. 1 root root 7 May 13 14:12 01-00-aa-bb-cc-dd-ee -> install
-rw-r--r--. 1 root root 682 May 2 22:07 install
```

The **install** file is symlinked to a file named after our MAC address. This is the key, useful piece. It will ensure our hardware with MAC address **00-aa-bb-cc-dd-ee** is served a PXE menu when it boots from its network card.

So let's boot our machine.

Usefully, Ansible has some [remote management modules][19]. We're working with an HP server here, so we can use the [hpilo_boot][20] module to save us from having to interact directly with the LOM web interface.

Let's run the reinstall play on a booted server…

The neat thing about the **hpilo_boot** module, you'll notice, is it sets the boot medium to be the network. When the installation completes, the server restarts and boots from its hard drive. The eagle-eyed amongst you will have spotted the critical problem with this—what happens if the server boots to its network card again? It will pick up the PXE menu and promptly reinstall itself. I would suggest removing the symlink as a "belt and braces" step then. I will leave that as an exercise for you, dear reader. Hint: I would make the new server do a 'phone home' on boot, to somewhere, which runs a clean-up job. Since you wouldn't need the console open, as I had here to demonstrate what's going on in the background, a 'phone home' job would also give a nice indication that the process completed. Ansible, [naturally][21]. Good luck!

If you've any thoughts or comments on this process, please let me know.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/hardware-bootstrapping-ansible

作者：[Mark Phillips][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/markp/users/feeble/users/markp
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/server_data_system_admin.png?itok=q6HCfNQ8 (computer servers processing data)
[2]: https://www.meetup.com/Ansible-London/
[3]: https://github.com/phips/ansible-hw-bootstrap
[4]: http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html
[5]: https://en.m.wikipedia.org/wiki/Trivial_File_Transfer_Protocol
[6]: https://www.centos.org
[7]: https://en.m.wikipedia.org/wiki/Preboot_Execution_Environment
[8]: https://github.com/phips/ansible-hw-bootstrap/blob/master/plays/kickstart.yml
[9]: https://linux.die.net/man/4/cciss
[10]: https://serverfault.com/questions/611182/centos-7-x64-and-hp-proliant-dl360-g5-scsi-controller-compatibility
[11]: https://github.com/phips/ansible-hw-bootstrap/blob/master/roles/kickstart/templates/pxe_install.j2#L10
[12]: https://github.com/phips/ansible-hw-bootstrap/blob/master/roles/kickstart/templates/local6.ks.j2#L3
[13]: https://ipxe.org
[14]: https://twitter.com/thismarkp
[15]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/ch-kickstart2
[16]: https://github.com/phips/ansible-hw-bootstrap/blob/master/plays/reinstall.yml
[17]: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html
[18]: https://github.com/phips/ansible-hw-bootstrap/blob/master/plays/install.yml#L9
[19]: https://docs.ansible.com/ansible/latest/modules/list_of_remote_management_modules.html
[20]: https://docs.ansible.com/ansible/latest/modules/hpilo_boot_module.html#hpilo-boot-module
[21]: https://github.com/phips/ansible-demos/tree/master/roles/phone_home
