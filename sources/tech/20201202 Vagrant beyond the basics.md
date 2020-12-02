[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Vagrant beyond the basics)
[#]: via: (https://fedoramagazine.org/vagrant-beyond-basics/)
[#]: author: (Andy Mott https://fedoramagazine.org/author/amott/)

Vagrant beyond the basics
======

![][1]

Photo by [Kelli McClintock][2] on [Unsplash][3]

There are, like most things in the Unix/Linux world, many ways of doing things with Vagrant, but here are some examples of ways to grow your Vagrantfile portfolio and increase your knowledge and use.

If you have not yet installed vagrant you can follow the first part of this series.

> [Installing and running Vagrant using qemu-kvm][4]

### Some Vagrantfile basics

All Vagrantfiles start with “**Vagrant.configure(“2”) do |config|**” and finish with a corresponding “**end**”:
```

```

Vagrant.configure("2") do |config|
  ...
  ...
end
```

```

The “2” represents the version of Vagrant, and is currently either 1 or 2. Unless you need to use the older version simply stick with the latest.

The config structure is broken down into namespaces:

**config.vm** – modify the configuration of the machine(s) that Vagrant manages.

**config.ssh** – for configuring how Vagrant will access your machine over SSH.

**config.winrm** – configuring how Vagrant will access your Windows guest over WinRM.

**config.winssh** – the WinSSH communicator is built specifically for the Windows native port of OpenSSH.

**config.vagrant** – modify the behavior of Vagrant itself.

Each line in a namespace begins with the word ‘config’:

**config.vm.box = “fedora/32-cloud-base”
config.vm.network “private_network”**

There are many options here, and a read of the documentation pages is strongly recommended. They can be found at <https://www.vagrantup.com/docs/vagrantfile>

Also in this section you can configure provider-specific options. In this case the provider is libvirt, and the specific config looks like this:
```

```

config.vm.provider :libvirt do |libvirt|
  libvirt.cpus = 1
  libvirt.memory = 512
```

```

In the example above, all libvirt VMs will be created with a single CPU and 512Mb of memory unless specifically overridden.

The VM namespace is where you define all machines you want this Vagrantfile to build. Notice that this is still a part of the config section, and lines should therefore begin with ‘config’. All sections or parts of sections have an ‘end’ statement to close them off.

### Creating multiple machines at once

Depending on what you need to achieve, this can be a simple loop or multiple machine definitions. To create any number of machines in a series, with the same settings but perhaps different names and/or IP addresses, you can just provide a range as shown here:
```

```

(1..5).each do |i|
  config.vm.define "server#{i}" do |server|
    server.vm.hostname = "server#{i}.example.com"
  end
end
```

```

This will create 5 servers, named server1, server2, server3 etc.

Of note, using Ruby style “**for i in 1..3 do**” doesn’t work despite Vagrantfile syntax actually being Ruby, so use the method from the example above.

If you need servers with different hostnames, different hardware etc then you’ll need to specify them individually, or at least in groups if the situation lends itself to that. Let’s say you need to create a typical web/db/load balancer infrastructure, with 2 web servers, a single database server and a load balancer for the web traffic. Ignoring the specific software setup for this, to simply create the virtual machines ready for provisioning you could use something like this:
```

```

# Load Balancer
config.vm.define "loadbal", primary: true do |loadbal|
  loadbal.vm.hostname = "loadbal"
end

# Database
config.vm.define "db", primary: true do |db|
  db.vm.hostname = "db"
end

# Web Servers x2
(1..2).each do |i|
  config.vm.define "web#{i}" do |web|
    web.vm.hostname = "web#{i}"
  end
end
```

```

This uses a combination of multiple machine calls and a small loop to build 4 VMs with a single ‘vagrant up’ command.

### Networking

Vagrant generally creates its own network for VM access, and you use this with ‘vagrant ssh’. If you create more than one VM then you must use the VM name to identify which one you wish to connect to – **vagrant ssh** _**vmname**_.

There are a number of configuration options available which allow you to interact with your VMs in various ways.

The vagrant-libvirt plugin creates a network for the guests to use. This is automated and will always be present even if you define your own networks. The network is named “vagrant-libvirt” and can be seen either in the Virtual Networks tab of virt-manager’s connection details or by issuing a **sudo virsh net-list** command.

If you use dhcp for your guests, you can find the individual IP addresses with the virsh net-dhcp-list command: **sudo virsh net-dhcp-leases vagrant-libvirt**

#### Port Forwarding

The simplest change to default networking is port forwarding. This uses a simple format like most Vagrant config: **config.vm.network “forwarded_port”, guest: 80, host: 8080**

This listens to port 8080 on your local machine and forwards connections to port 80 on the Vagrant machine. If you need to use a UDP port, simply add **, protocol: “udp”** to the end of that line (notice that comma which should come immediately after the second port number).

Obviously for more complex configurations this might not be ideal, as you need to specify every single port you want to forward. If you then add multiple machines the complexity can really become too much.

In addition to this, anyone on your network can access these ports if they know your IP address, so that’s something you should be aware of.

#### Public Network

This creates a network card for the Vagrant VM which connects to your host network, and will therefore be visible to all machines on that network. As Vagrant is not designed to be secure, you should be aware of any vulnerabilities and take steps to protect against them.

To configure a public network, add **config.vm.network “public_network”** to your Vagrantfile. This will use DHCP to obtain a network address.

If you wish to assign a static IP address, you can add one to the end of the network declaration: **config.vm.network “public_network”, ip: “192.168.0.1”**

If you’re creating multiple guests you can put the network configuration in the vm namespace, and even allocate IPs based on iteration too:
```

```

Vagrant.configure("2") do |config|
  config.vm.box = "centos/8"
  config.vm.provider :libvirt do |libvirt|
    libvirt.qemu_use_session = false
  end

  # Servers x2
  (1..2).each do |i|
    config.vm.define "server#{i}" do |server|
      server.vm.hostname = "server#{i}"
      server.vm.network "public_network", ip: "192.168.122.20#{i}"
    end
  end
end
```

```

#### Private Network

This works very much like the Public Network option, only the network is only available to the host machine and the Vagrant guests. The syntax is almost identical too: **config.vm.network “private_network”, type: “dhcp”**

 To use a static IP address, simply add it**:**
```

```

config.vm.network "private_network", ip: "192.168.50.4"
```

```

This will create a new network in libvirt, usually named something like “vagrant-private-dhcp” – you can see this with the command **sudo virsh net-list** while the VM is running. This network is created and destroyed along with the vagrant guests.

Again, the network config can be specified for all guests, or per guest as shown in the public network example above.

### Provisioning

Once you have your VMs defined, you can obviously then do whatever you want with them, but as soon as you issue a ‘vagrant destroy’ command any changes will be lost. This is where automated provisioning comes in.

You can use several methods to provision your machines, from simple file copies to shell scripts, Ansible, Chef and Puppet. Many of the main methods can be used, but I’ll cover the simple ones here – if you need to use something else please read the documentation as it’s all covered.

#### File uploads

To copy a file to the Vagrant guest, add a line to the Vagrantfile like this:
```

```

config.vm.provision "file", source: "~/myfile", destination: "myfile"
```

```

You can copy directories too:
```

```

config.vm.provision "file", source: "~/path/to/host/folder", destination: "$HOME/remote/newfolder"
```

```

The directory structure should already exist on the Vagrant host, and will be copied in its entirety, including subdirectories and files.

Note: If you add a trailing slash to the destination path, the source path will be placed under this so make sure you only do this if you want that outcome. For example, if the above destination was **“$HOME/remote/newfolder/”,** then the result would see “$HOME/remote/newfolder/folder” created with the contents of the source placed here.

#### Shell commands

You can include individual commands, inline scripts or external scripts to perform provisioning tasks.

A single command would take this form, and any valid command line command can be used here: **config.vm.provision “shell”, inline: “sudo dnf update -y”**

An inline script is less common, and declared at the top of the Vagrantfile then called during provisioning:
```

```

$script = &amp;lt;&amp;lt;-SCRIPT
echo I am provisioning...
date &gt; /etc/vagrant_provisioned_at
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: $script
end
```

```

More common is the external shell script, which gives more flexibility and makes code more modular. Vagrant uploads the file to the guest then executes it. Simply call the script in the provisioning line:

**config.vm.provision “shell”, path: “script.sh”**

The file need not be local to the Vagrant host either:

**config.vm.provision “shell”, path: “<https://example.com/provisioner.sh”>**

#### Ansible

To use Ansible to provision your VMs you must have it installed on the Vagrant host; see <https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-rhel-centos-or-fedora>.

You specify an Ansible playbook to provision your VM in the following way:
```

```

config.vm.provision "ansible" do |ansible|
  ansible.playbook = "playbook.yml"
end
```

```

This then calls the playbook, which will run as any externally-run ansible playbook would.

If you’re building multiple VMs with your Vagrantfile then it’s likely you want different configurations for some of them, and in this case you should provision within the definition of each VM, as shown here:
```

```

# Web Servers x2
(1..2).each do |i|
  config.vm.define "web#{i}" do |web|
    web.vm.hostname = "web#{i}"
    web.vm.provision "ansible" do |ansible|
      ansible.playbook = "web.yml"
    end
  end
end
```

```

Ansible provisioners come in two formats – ansible and ansible_local. The ansible provisioner requires that Ansible is installed on the Vagrant host, and will connect remotely to your guest VMs to provision them. This means all necessary ssh authentication must be in place for it to work. The ansible_local provisioner executes playbooks directly on the guest VMs, which therefore requires Ansible be installed on each of the guests you want to provision. Vagrant will try to install Ansible on the guests in order to do this, (This can be controlled with the **install** option, but is enabled by default). On RHEL-style systems like Fedora, Ansible is installed from the EPEL repository. Simply use either ansible or ansible_local in the **config_vm_provision** command to choose the style you need.

### Synced Folders

Vagrant allows you to sync folders between your Vagrant host and your guests, allowing access to configuration files, data etc. By default, the folder containing the Vagrant file is shared and mounted under /vagrant on each guest.

To configure additional synced folders, use the **config.vm.synced.folder** command:
```

```

config.vm.synced_folder "src/", "/srv/website"
```

```

The two parameters are the source folder on the Vagrant host and the mount directory on the guest. The destination folder will be created if it does not exist, recursively if necessary.

Options for synced folders allow you to configure them better, including the option to disable them completely. Other options allow you to specify a group owner of the folder (group), the folder owner (owner), plus mount options. There are others but these are the main ones.

You can disable the default share with the following command:
```

```

config.vm.synced_folder ".", "/vagrant", disabled: true
```

```

Other options are configured as follows:
```

```

config.vm.synced_folder "src/", "/srv/website",
  owner: "apache", group: "apache"
```

```

#### NFS synced folders

When using Vagrant on a Linux host, synced folders use NFS (with the exception of the default share which uses rsync; see below) so you must have NFS installed on the Vagrant host, and the guests also need NFS support installation. To use NFS with non-Linux hosts, simply specify the folder type as ‘nfs’:
```

```

config.vm.synced_folder ".", "/vagrant", type: "nfs"
```

```

#### RSync synced folders

These are the easiest to use as they usually work without any intervention on a Linux host. This is a one-way sync from host to guest performed at startup (**vagrant up**) or after a **vagrant reload** command is issued. The default share of the Vagrant project directory is done with rsync. To configure a synced folder with rsync, specify the type as ‘rsync’:
```

```

config.vm.synced_folder ".", "/vagrant", type: "rsync"
```

```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/vagrant-beyond-basics/

作者：[Andy Mott][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/amott/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/vagrant_beyond_basics-816x345.png
[2]: https://unsplash.com/@kelli_mcclintock?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/box?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/vagrant-qemukvm-fedora-devops-sysadmin/
