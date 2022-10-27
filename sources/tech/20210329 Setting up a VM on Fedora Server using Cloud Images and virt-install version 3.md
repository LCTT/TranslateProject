[#]: subject: (Setting up a VM on Fedora Server using Cloud Images and virt-install version 3)
[#]: via: (https://fedoramagazine.org/setting-up-a-vm-on-fedora-server-using-cloud-images-and-virt-install-version-3/)
[#]: author: (pboy https://fedoramagazine.org/author/pboy/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Setting up a VM on Fedora Server using Cloud Images and virt-install version 3
======

![][1]

Photo by [Max Kukurudziak][2] on [Unsplash][3]

Many servers use one or more virtual machines (VMs), e.g. to isolate a public service in the best possible way and to protect the host server from compromise. This article explores the possibilities of deploying [Fedora Cloud Base][4] images as a VM in an autonomous Fedora 33 Server Edition using version 3 of _virt-install_. This capability was introduced with Fedora 33 and the new _‐-cloud-init_ option.

### Why use Cloud Images?

The standard virtualization tool for Fedora Server is _libvirt_. For a long time the only way to create a virtual Fedora Server instance was to create a _libvirt_ VM and run the standard Anaconda installation. Several tools exist to make this procedure as comfortable and fail-safe as possible, e.g. a [Cockpit module][5]. The process is pretty straight forward and every Fedora system administrator is used to it.

With the advent of cloud systems came cloud images. These are pre-built ready-to-run virtual servers. Fedora provides specialized images for various cloud systems as well as Fedora Cloud Base image, a generic optimized VM. The image image is copied to the server and used by a virtual machine as an operational file system.

These images save the system administrator the time-consuming process of many individual passes through Anaconda. An installation merely requires the invocation of _virt-install_ with suitable parameters. It is a CLI tool, thus easily scriptable and reproducible. In a worst case emergency, a replacement VM can be set up quickly.

Fedora Cloud Base images are integrated into the Fedora QA Process. This prevents subtle inconsistencies that may lead to not-so-subtle problems during operation. For any system administrator concerned about security and reliability, this is an incredibly valuable advantage over _libvirt_ compatible VM images from third party vendors. Cloud images speed up the deployment process as well.

#### Implementation considerations

As usual, there is nothing for free. Cloud images use _cloud-init_ for an automatic initial configuration, which is otherwise done as part of Anaconda. The cloud system usually provides the necessary information. In the absence of cloud, the system administrator must provide a replacement.

Basically, there are two implementation options.

First, with relatively little additional effort, you can install [Vagrant and the Vagrant libvirt plugin][6]. If the server is also used for development work, Vagrant may already be in use and the additional effort is minimal. This option is then the optimal choice.

Second, you can use _virt-install_ directly. Until now you had to create a cloud-init nocloud datasource iso in [several additional steps][7]. v_irt-install_ version 3, included since Fedora 33, elements these additional steps. The newly introduced _‐-cloud-init_ option initially configures a VM from a cloud image without additional software and without detours. _Virt-install_ takes on taming the rather complex cloud-init nocloud procedures.

There are two ways to make use of _virt-install_:

  * quick and (not really) dirty: minimal Cloud-init configuration
This requires a little more post-installation effort and is suitable if you set up only a few VMs.


  * elaborate cloud-init based configuration using simple configuration files
This requires more pre-installation work and is more effective if you have to set up multiple VMs.



#### Be certain you know what you are getting

There is no light without shadow. Cloud Base image (currently) do not provide an alternatively built but otherwise identical build of Fedora Server Edition. There are some subtle differences. For example:

  * Fedora Server Edition uses xfs as its file system, Cloud Base Image still uses the older ext4.
  * Fedora Server Edition now persists the network configuration completely and stringently in NetworkManager, Fedora Cloud Base image still uses the old ifcfg plugin.
  * Other differences are conceptual. For example, Fedora Cloud image does not install a firewall by default.
  * The use concept for the persistent storage is also different due to technical differences.



Overall, however, the functionality is so far identical and the advantages so noticeable that it is worthwhile and makes sense to use Fedora Cloud Base.

### A **t**ypical **u**se **c**ase

Consider a use case that often applies to small and medium-sized organizations. The hardware is located in an off-premise housing center. Fedora Server is required with the most rigorous isolation possible from public access, e.g. ssh and key based authentication only. Any risk of compromise has to be minimized. Public services are offered in a VM to provide as much isolation as possible. The VM operates as a pure front end with minimal exposure of services. For example, only an Apache web server is installed. All data processing resides on an application server in a separate VM (or a container), e.g. JBoss rsp. Wildfly. The application server accesses a database that may run directly on the host hardware for performance reasons but without any public access.

Regarding the infrastructure, at least some VMs as well as the host ssh or vpn process need access to the public network. They have to share the physical interface. At the same time, VMs and host need another internal network that enables protected communication. The application VM only connects to the internal network. And we need an internal DNS for the services to find each other.

### **System Requirements**

You need a Fedora 33 Server Edition with _libvirt_ virtualization properly installed and working. The _libvirt_ network “default” with virbr0 provides the internal protected network and is active. Some external network device, usually a router, provides DHCP service for the external network. Every lab or production environment should meet these requirements.

For internal name resolution to work, you have to decide upon an internal domain name and extend the _libvirt_ network configuration. In this example the external name will be _example.com_, and the internal domain name will be _example.lan_. The Fedora server thus receives the name _host.example.com_ externally and internally _host.example.lan_ or just _host_ for short. The names of the VMs are _**app**_ and _**web**_, respectively. The two examples that follow will create these VMs.

#### Network preparations for the examples

Modify the configuration of the internal network similar to the example below (N.B. adjust your domain name accordingly! Leave mac address and UUID untouched!):

```
# virsh net-edit default
<network>
  <name>default</name>
  <uuid>aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee</uuid>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:xx:yy:zz'/>
  <forward mode='nat'/>
  <mtu size='8000'/>
  <domain name='example.lan'/>
  <dns forwardPlainNames='no'>
    <forwarder domain='example.lan' />
    <host ip='192.168.122.1'>
      <hostname>host</hostname>
      <hostname>host.example.lan</hostname>
    </host>
  </dns>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.200'/>
    </dhcp>
  </ip>
</network>

# virsh net-destroy default
# virsh net-start default
```

Do NOT add an external forwarder via _&lt;forwarder addr=’xxx.yyy.zz.uu’/&gt;_ tag. It will break the VMs split-dns capability.

Due to a bug in the interaction of _systemd-resolved_ and _libvirt_, the name resolution for the internal network does not work on the host at the moment without additional measures. The VM’s are not affected. Hence, the host cannot resolve the names of the VMs, but conversely, the VMs can resolve to each other and to the host. The latter is sufficient here.

With everything set up correctly the following interfaces are active on the host:

```
# ip a
 1: lo: <LOOPBACK,UP,LOWER_UP> mtu ...
     inet 127.0.0.1/8 scope host ...
     inet6 ::1/128 scope host ...
 2: enpNsM: <BROADCAST,MULTICAST, ...
     inet xxx.yyy.zzz.uuu/24 brd xxx. ...
     inet6 200x:xx:yyy:...
     inet6 fe80::xxx:yyy:...
 3: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu ...
     inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
     ...
 4: virbr0-nic: <BROADCAST,MULTICAST> mtu 8...
```

### Creating a Fedora Server **v**irtual **m**achine **u**sing Fedora Cloud Base Image

#### Preparations

First download a Fedora 33 Cloud Base Image file and store it in the directory _/var/lib/libvirt/boot_. By convention, this is the location from which images are installed.

```
# sudo wget https://download.fedoraproject.org/pub/fedora/linux/releases/33/Cloud/x86_64/images/Fedora-Cloud-Base-33-1.2.x86_64.qcow2  -O /var/lib/libvirt/boot/Fedora-Cloud-Base-33-1.2.x86_64.qcow2
# sudo wget https://getfedora.org/static/checksums/Fedora-Cloud-33-1.2-x86_64-CHECKSUM -O   /var/lib/libvirt/boot/Fedora-Cloud-33-1.2-x86_64-CHECKSUM
# sudo cd /var/lib/libvirt/boot
# sudo sha256sum --ignore-missing -c *-CHECKSUM
```

The *CHECKSUM file contains the values for all cloud images. The check should result in one _OK_.

For external connectivity of the VMs, the easiest way is to use MacVTap in the VM configuration. You don’t need to set up a virtual bridge nor touch the critical configuration of the physical Ethernet interface of an off-premise server. Enable forwarding for both IPv4 and IPv6 (dual stack). _Libvirt_ takes care for IPv4. Nevertheless, it is advantageous to configure forwarding independent of _libvirt_.

Check the forwarding configuration:

```
# cat /proc/sys/net/ipv4/ip_forward
# cat /proc/sys/net/ipv6/conf/default/forwarding
```

In both cases, an output value of 1 is required. If necessary, activate forwarding temporarily until next reboot:

**[…]# echo 1 &gt; /proc/sys/net/ipv4/ip_forward
[…]# echo 1 &gt; /proc/sys/net/ipv6/conf/all/forwarding**

For a permanent setup create the following file:

```
# vim /etc/sysctl.d/50-enable-forwarding.conf
# local customizations
#
# enable forwarding for dual stack
net.ipv4.ip_forwarding=1
net.ipv6.conf.all.forwarding=1
```

With these preparations completed, the following two examples, creating the VMs _**app**_ and _**web**_, should work flawlessly.

#### Example 1: Quick &amp; (not really) dirty: Minimal cloud-init configuration

Installation for the _**app**_ VM begins by creating a copy of the download image as a (fully installed) virtual disk in the directory _/var/lib/libvirt/images_. This is, by convention, the virtual disk pool. The _virt-install_ program performs the installation. The parameters on _virt-install_ pass all the required information. There is no need for further intervention or preparation The parameters first specify the usual, general properties such as memory, CPU and the (non-graphical) console for the server. The parameter _‐-graphics none_, enforces a redirect to the terminal window. After booting you get a VM terminal prompt and immediate access from the host. Parameter _‐-import_ causes skipping the install task and booting from the first virtual disk specified by the _‐-disk_ parameter. The VM “app” is will connect to the internal virtual network thus only one network is specified by the _‐-network_ parameter.

The only new parameter is _‐-cloud-init_ without any further subparameters. This causes the generation and display of a root password, enabling a one-time login. cloud-init is executes with sensible default settings. Finally, it is deactivated and not executed during subsequent boot processes.

The VM terminal appears when installation is complete. Note that the first root login password is displayed early in the process and is used for the initial login. This password is single use and must be replace during the first login.

```
# sudo cp  /var/lib/libvirt/boot/Fedora-Cloud-Base-33-1.2.x86_64.qcow2 \
      /var/lib/libvirt/images/app.qcow2
# sudo virt-install  --name app
    --memory 3074  --cpu host --vcpus 3 --graphics none\
    --os-type linux --os-variant fedora33  --import  \
    --disk /var/lib/libvirt/images/app.qcow2,format=qcow2,bus=virtio \
    --network bridge=virbr0,model=virtio  \
    --cloud-init
 WARNING  Defaulting to --cloud-init root-password-generate=yes,disable=yes
 Installation startet …
 Password for first root login is: OtMQshytI0E8xZGD
 Installation will continue in 10 seconds (press Enter to skip)…Running text console command: …
 Connected to Domain: app
 Escape character is ^] (Ctrl + ])
 [    0.000000] Linux version 5.8.15-301.fc33.x86_64 (mockbuild@bkernel01.iad2.fedoraproject …
 …
 …
 [   29.271451] cloud-init[721]: Cloud-init v. 19.4 finished … Datasource DataSourceNoCloud …
 [FAILED] Failed to start Execute cloud user/final scripts.
 See 'systemctl status cloud-final.service' for details.
 [  OK  ] Reached target Cloud-init target.
 Fedora 33 (Cloud Edition)
 Kernel 5.8.15-301.fc33.x86_64 on an x86_64 (ttyS0)
 localhost login:
```

The error message is unsightly, but does not affect operation. (This might be the reason for cloud-init service remaining enabled.) You may disable it manually or remove it at all.

On the host you may check the network status:

```
# less /var/lib/libvirt/dnsmasq/virbr0.status
[
  {
    "ip-address": "192.168.122.109",
    "mac-address": "52:54:00:57:35:3d",
    "client-id": "01:52:54:00:57:35:3d",
    "expiry-time": 1615665342
  }
]
```

The output shows the VM got an internal IP, but no hostname because one has not yet been set. That is the first post-installation tasks to perform.

##### Post-Installation Tasks

The initially displayed password enables _root_ login and forces the setting of a new one.

Of particular interest is the network connection. Verify using these commands:

```
# ping host
# ping host.example.lan
# ping host.example.com
# ping guardian.co.ik
```

Everything is working fine out of the box. Internal and external network access is working.

The only remaining task is to set hostname

```
# hostnamectl set-hostname app.example.lan
```

After rebooting, using this command on the host again, _**less**_ _**/var/lib/libvirt/dnsmasq/virbr0.status**_ will now list a hostname. This verifies that name resolution is working.

To complete the final application software installations, perform a system update and install a Tomcat application server for the functional demo.

```
# dnf -y update && dnf -y install tomcat && systemctl enable tomcat --now && reboot
```

When installation and reboot complete, exit and close the console using _**&lt;ctrl&gt;+]**_.

The VM is automatically deactivated and not executed during subsequent boot processes. To override this, on the host, enable autostart of the **app** VM

```
# sudo virsh autostart app
```

#### Example 2: An easy way to an elaborate configuration

The **web** front end VM is more complex and there are several issues to deal with. There is a public facing interface that requires the installation of a firewall. It is unique to the cloud-init process that the internal interface is not configured persistently. Instead, it is set up anew each time the system is booted. This makes it impossible to assign a firewall zone to this interface. The public interface also provides ssh access. So for root a key file is needed to secure the login.

The virt-install cloud-init process is provisioned by two subparameters, meta-data and user-data. Each references a configuration file. These files were previously buried in a special iso image, now simulated by _virt-install_. You are free to chose where to store these files. It is best, however, to be systematic and choosing a subdirectory in the boot directory is a good choice. This example will use _/var/lib/libvirt/boot/cloud-init_.

The file referenced by the meta-data parameter contains information about the runtime environment. The name is _web-meta-data_ in this example. Here it contains just the mandatory parameter _instance-id_. The must be unique in a cloud environment, but can be chosen arbitrarily here just as in a nocloud environment.

```
# sudo mkdir /var/lib/libvirt/boot/cloud-init
# sudo vim /var/lib/libvirt/boot/cloud-init/web-meta-data
instance-id: web-app
```

The file referenced by the user-data parameter holds the main configuration work. This example uses the name _web-user-data_ . The first line must contain some kind of shebang, which cloud-init uses to determine the format of the following data. The formatting itself is _yaml_. The _web-user-data_ file defines several steps:

  1. setting the hostname
  2. set up the user root with the public RSA key copied into the file as well as the fallback account “hostmin” (or alike). The latter is enabled to log in by password and assigned to the group wheel
  3. set up a first-time password for both users for initial login which must be changed on first login
  4. install required additional packages , e.g. the firewall, fail2ban, postfix (needed by fail2ban) and the webserver
  5. some packages need additional configuration files
  6. the VM needs an update of all packages
  7. several configuration commands are required
    1. assign zone trusted to the interface eth1 (2nd position in the dbus path, so the order of the network parameters when calling _libvirt_ is crucial!) and rename it according to naming convention. The modification also persists to a configuration file (still in /etc/sysconfig/network-scripts/ )
    2. start the firewall and add the web services
    3. finally disable cloud-init



Once the configuration files are completed it eliminates what would be a time consuming process if done manually. This efficiency makes the use of cloud images attractive. The definition of _web-user-data_ follows:

```
# vim /var/lib/libvirt/boot/cloud-init/web-user-data
# cloud-config
# (1) setting hostname
preserve_hostname: False
hostname: web
fqdn: web.example.com

# (2) set up root and fallback account including rsa key copied into this file
users:
    - name: root
      ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQA…jSMt9rC4uKDPR8whgw==
    - name: hostmin
      groups: users,wheel
      ssh_pwauth: True
      ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAIAQDix...Mt9rC4uKDPR8whgw==

# (3) set up a first-time password for both accounts
chpasswd:
  list: |
    root:myPassword
    hostmin:topSecret
  expire: True

# (4) install additional required packages
packages:
  - firewalld
  - postfix
  - fail2ban
  - vim
  - httpd
  - mod_ssl
  - letsencrypt

# (5) some packages need additional configuration files
write_files:
  - path: /etc/fail2ban/jail.local
    content: |
      # /etc/fail2ban/jail.local
      # Jail configuration local customization

      # Adjust the default configuration's default values
      [DEFAULT]
      ##ignoreip = /24  /32
      bantime  = 6600
      backend = auto
      # The main configuration file defines all services but
      # deactivates them by default. Activate those needed
      [sshd]
      enabled = true
      # detect password authentication failures
      [apache-auth]
      enabled = true
      # detect spammer robots crawling email addresses
      [apache-badbots]
      enabled = true
      # detect Apache overflow attempts
      [apache-overflows]
      enabled = true
  - path: /etc/httpd/conf.d/vhost_default.conf
    content: |
      <VirtualHost *:80>
          ServerAdmin     root@localhost
          DirectoryIndex  index.jsp
          DocumentRoot    /var/www/html
          <Directory "/var/www.html">
              Options Indexes FollowSymLinks
              AllowOverride   none
              # Allow open access:
              Require all granted
          </Directory>
          ProxyPass    /   http://app:8080/
      </VirtualHost>

# (6) perform a package upgrade
package_upgrade: true

# (7) several configuration commands are executed on first boot
runcmd:
  # (a.) assign a zone to internal interface as well as some other adaptations.
  # results in the writing of a configuration file
  # IMPORTANT: internal interface have to be specified SECOND after external
  - nmcli con mod path 2 con-name eth1  connection.zone trusted
  - nmcli con mod path 2 con-name 'System eth1' ipv6.method disabled
  - nmcli con up  path 2
  # (b.) activate and configure firewall and additional services
  - systemctl enable firewalld  --now
  - firewall-cmd  --permanent –add-service=http
  - firewall-cmd  --permanent –add-service=https
  - firewall-cmd  --reload
  - systemctl  enable  fail2ban  --now
  # compensate for a SELinux port handling issue
  - setsebool httpd_can_network_connect 1 -P
  - systemctl  enable  httpd –-now
  # (c.) finally disable cloud-init
  - systemctl  disable  cloud-init
  - reboot
# done
```

A detailed overview of the user-data configuration options is provided in the examples section of the [cloud-init project documentation][8].

After completing the configuration files, initiate the virt-install process. Adjust the values of CPU, memory, external network interface etc. as required.

```
# sudo virt-install   --name web \
     --memory 3072  --cpu host --vcpus 3  --graphics none \
     --os-type linux --os-variant fedora33  --import \
     --disk /var/lib/libvirt/images/web.qcow2,format=qcow2,bus=virtio, size=20  \
     --network type=direct,source=enp1s0,source_mode=bridge,model=virtio \
     --network bridge=virbr0,model=virtio \
     --cloud-init meta-data=/var/lib/libvirt/boot/cloud-init/web-meta-data,user-data=/var/lib/libvirt/boot/cloud-init/web-user-data
```

If the network environment issues IP addresses based on MAC addresses via DHCP, add the MAC address to the the first network configuration:

```
--network type=direct,source=enp1s0,source_mode=bridge,mac=52:54:00:93:97:46,model=virtio
```

Remember, that the first 3 pairs in the MAC address must be the sequence ’52:54:00′ for KVM virtual machines.

Back on the host enable autostart of the VM:

```
# virsh autostart web
```

Everything is complet. Direct your desktop browser to your <http://example.com> domain and enjoy a look at the tomcat webapps screen (after ignoring the warning about an insecure connection).

##### Configuring a static address

According to the specifications a static network connection is configured in meta-data. A configuration would look like this:

```
# vim /var/lib/libdir/boot/cloud-init/web-meta-data
instance-id: web-app
network-interfaces: |
  iface eth0 inet static
  address 192.168.1.10
  netmask 255.255.255.0
  gateway 192.168.1.254
```

_Cloud-init_ will create a configuration file accordingly. But there are 2 issues

  * The configuration file is created after a default initialization of the interface via dhcp and the interface is not reinitialized.
  * The generated configuration file includes the setting _onboot=no_ so after a reboot there is no connection either.



There are several hints that this is a bug that has existed for a long time so manual intervention is required.

It is probably easier and more efficient to do without the networks specification in meta-data and make an adjustment manually on the basis of the default initialization in user-data. Perform the following before the configuration of the internal network:

```
# nmcli con mod path 1 ipv4.method static ipv4.addresses '192.168.158.240/24' ipv4.gateway '192.168.158.1' ipv4.dns '192.168.158.1'
# nmcli con mod path 1 ipv6.method static ipv6.addresses '2003:ca:7f06:2c00:5054:ff:fed6:5b27/64' ipv6.gateway 'fe80::1' ipv6.dns '003:ca:7f06:2c00::add:9999'
# nmcli con up path 1
```

Doing this, the connection is immediately reset to the new specification and the configuration file is adjusted immediately. Remember to adjust the configuration values as needed.

Alternatively, the 3 statements can be made part of the user-data file and adapted or commented in or out as required. The corresponding part of the file would look like

```
...
 # (7.) several configuration commands are executed on first  boot
 runcmd:
  # If needed, convert interface eth0 as static
  # comment in and modify as required
  #- nmcli con mod path 1 ipv4.method static ipv4.addresses '<IPv4>/24' ipv4.gateway '<IPv4>' ipv4.dns 'IPv4
  #- nmcli con mod path 1 ipv6.method static ipv6.addresses '<IPv6>/64' ipv6.gateway '<IPv6>' ipv6.dns '<IPv6>'
  #- nmcli con up path 1
  # (a) assign a zone to internal interface as well as some other adaptations.
  # results in the writing of a configuration file
  # IMPORTANT: internal interface have to be specified SECOND after external
  - nmcli con mod path 2 con-name eth1  connection.zone trusted
  - ...
```

Again, adjust the &lt;IPv4&gt;, &lt;IPv6&gt;, etc. configuration values as needed!

Configuring the cloud-init process by virt-install version 3 is highly efficient and flexible. You may create a dedicated set of files for each VM or you may keep one set of generic files and adjust them by commenting in and out as required. A combination of both can be use. You can quickly and easily change settings to test suitability for your purposes.

In summary, while the use of Fedora Cloud Base Images comes with some inconveniences and suffers from shortcomings in documentation, Fedora Cloud Base images and virt-install version 3 is a great combination for quickly and efficiently creating virtual machines for Fedora Server.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/setting-up-a-vm-on-fedora-server-using-cloud-images-and-virt-install-version-3/

作者：[pboy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/cloud_base_via_virt-install-816x345.jpg
[2]: https://unsplash.com/@maxkuk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/cloud-computing?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://alt.fedoraproject.org/cloud/
[5]: https://fedoramagazine.org/create-virtual-machines-with-cockpit-in-fedora/
[6]: https://fedoramagazine.org/vagrant-qemukvm-fedora-devops-sysadmin/
[7]: https://blog.christophersmart.com/2016/06/17/booting-fedora-24-cloud-image-with-kvm/
[8]: https://cloudinit.readthedocs.io/en/latest/topics/examples.html
