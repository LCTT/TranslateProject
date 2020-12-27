[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Set up an Ansible lab in 20 minutes)
[#]: via: (https://opensource.com/article/20/12/ansible-lab)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

Set up an Ansible lab in 20 minutes
======
Build an environment to support learning and experimenting with new
software.
![Science lab with beakers][1]

Being able to build and tear down a public cloud environment is very useful, but most of us don’t have easy access to a public cloud. The next best thing would be to have a lab on your local machine, but even running on a local machine brings performance, flexibility, and other challenges. Most of the time, the additional workloads on our local machines interfere with doing our daily job, and they certainly prevent having a readily available environment to play and experiment with new software.

My team and I encountered this challenge a few years ago when we were starting to learn [Ansible][2]. We couldn’t find an environment that we could use individually, and our frustration with the situation caused some of us to stop experimenting. We knew we needed to find a solution.

We spent a lot of time researching the options and came up with a set of tools that enable our curiosity to learn in an environment we fully control. We can spin up and tear down the lab environment on our local machines without needing access to on-premises labs or public clouds.

This article will explain how to deploy your own lab environment on your local machine in as little as 20 minutes in a fully automated way.

You can find all the code for this exercise in my [GitHub repository][3].

### Tools and software

This solution uses the following tools and software:

  * [Ansible][4] is our automation tool of choice because it’s easy to use and flexible enough to handle the lab requirements.
  * [Vagrant][5] is easy to use for building and maintaining virtual machines.
  * [VirtualBox][6] is a hosted hypervisor that works in Windows and Linux environments.
  * [Fedora v30+][7] is the operating system on my local machine.



You must have the following set up to build the environment:

  * An internet connection
  * Virtualization Technology support enabled in your BIOS (here is the [procedure][8] for my Lenovo laptop)
  * Vagrant v2.2.9
  * The latest version of Ansible
  * The latest version of VirtualBox
  * Fedora v30+ host operating system



### What’s in the lab environment?

This project aims to deploy an Ansible host with an Ansible engine and multiple Linux nodes along with some pre-loaded and pre-configured applications (httpd and MySQL). It also enables [Cockpit][9] so that you can monitor the status of the virtual machines (VMs) during testing. The reason to use a pre-deployed application is for efficiency (so you don’t have to spend time installing those components). This allows you to focus on creating roles and playbooks and testing against the environments deployed by the tools listed above.

We determined that the best scenario for our use case was a multi-machine Vagrant environment. The Vagrantfile creates three CentOS VMs to simulate two target hosts and an Ansible control machine:

  * Host1: No graphical user interface (GUI), with httpd and MySQL installed
  * Host2: No GUI, with httpd and MySQL installed
  * Ansible-host: No GUI, with Ansible engine installed



### Enable multiple hypervisors

Some hypervisors may not allow you to bring up VMs if more than one hypervisor is in use. To fix this problem, follow these steps (based on Vagrant’s [installation][10] instructions).

First, find out the name of the hypervisor:


```
$ lsmod | grep kvm
kvm_intel             204800  6
kvm                   593920  1 kvm_intel
irqbypass              16384  1 kvm
```

The one I’m interested in is `kvm_intel`, but you might want another (such as `kvm_amd`).

Run the following as root to blacklist the hypervisor:


```
`$ echo 'blacklist kvm-intel' >> /etc/modprobe.d/blacklist.conf`
```

Restart your machine and try running Vagrant again.

### The Vagrant file


```
cat Vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
# Define VMs with static private IP addresses, vcpu, memory and vagrant-box.
  boxes = [
    {
      :name =&gt; "web1.demo.com", ⇒ Host1 this is one of the target nodes
      :box =&gt; "centos/8",             ⇒ OS version
      :ram =&gt; 1024,                   ⇒ Allocated memory
      :vcpu =&gt; 1,               ⇒  Allocated CPU
      :ip =&gt; "192.168.29.2"     ⇒ Allocated IP address of the node
    },
    {
      :name =&gt; "web2.demo.com", ⇒ Host2 this is one of the target nodes
      :box =&gt; "centos/8",
      :ram =&gt; 1024,
      :vcpu =&gt; 1,
      :ip =&gt; "192.168.29.3"
    },
    {
      :name =&gt; "ansible-host", ⇒ Ansible Host with Ansible Engine
      :box =&gt; "centos/8",
      :ram =&gt; 8048,
      :vcpu =&gt; 1,
      :ip =&gt; "192.168.29.4"
    }
  ]

  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
#   Only Enable this if you are connecting to Proxy server
#      config.proxy.http    = "<http://usernam:password@x.y:80"⇒> Needed if you have a proxy
#      config.proxy.https   = "<http://usernam:password@x.y:80>"
#      config.proxy.no_proxy = "localhost,127.0.0.1"
      config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
      config.ssh.insert_key = false
      config.vm.box = opts[:box]
      config.vm.hostname = opts[:name]
      config.vm.provider :virtualbox do |v| ⇒  Defines the vagrant provider
        v.memory = opts[:ram]
        v.cpus = opts[:vcpu]
      end
      config.vm.network :private_network, ip: opts[:ip]
      config.vm.provision :file do |file|
         file.source     = './keys/vagrant' ⇒ vagrant keys to allow access to the nodes
         file.destination    = '/tmp/vagrant' ⇒ the location to copy the vagrant key
      end
      config.vm.provision :shell, path: "bootstrap-node.sh" ⇒ script that copy hosts entry
      config.vm.provision :ansible do |ansible| ⇒ declaration to run ansible playbook
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml" ⇒ the playbook used to configure the hosts
      end
        end
  end
end
```

These are the important files that you need to pay attention to:

  * `inventory-test.yaml`: The inventory file to connect to the nodes
  * `playbook.yaml`: The playbook file that Vagrant provisioner calls to configure the nodes
  * `Vagrantfile`: The file that Vagrant uses to deploy the environment
  * `vagrant keys`: The Vagrant keys for connecting to the nodes in your lab environment



You can adjust these files based on your needs. Ansible’s flexibility gives you the power to declaratively change your environment as you require.

### Deploy your lab environment

First, clone the code from the [GitHub repo][11]:


```
$ git clone <https://github.com/mikecali/ansible-labs-101.git>
Cloning into 'ansible-labs-101'...
remote: Enumerating objects: 15, done.
remote: Counting objects: 100% (15/15), done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 15 (delta 2), reused 10 (delta 0), pack-reused 0
Unpacking objects: 100% (15/15), 6.82 KiB | 634.00 KiB/s, done.
```

Next, change your directory to `vagrant-session-2`, and view its contents:


```
$ ls
Bootstrap-node.sh   inventory   keys   playbook.yml   README.md Vagrantfile
```

You now have all the artifacts and configuration files you need for your lab environment. To deploy your environment, run:


```
`$ vagrant up`
```

With a decent internet connection, it takes only about 20 minutes to get a running environment:


```
$ vagrant up
Bringing machine 'web1.demo.com' up with 'virtualbox' provider...
Bringing machine 'web2.demo.com' up with 'virtualbox' provider...
Bringing machine 'ansible-host' up with 'virtualbox' provider...
==&gt; web1.demo.com: Importing base box 'centos/8'...
==&gt; web1.demo.com: Matching MAC address for NAT networking...
==&gt; web1.demo.com: Checking if box 'centos/8' version '1905.1' is up to date...
==&gt; web1.demo.com: Setting the name of the VM: ansible-labs_web1democom_1606434176593_70913
==&gt; web1.demo.com: Clearing any previously set network interfaces...
==&gt; web1.demo.com: Preparing network interfaces based on configuration...
    web1.demo.com: Adapter 1: nat
    web1.demo.com: Adapter 2: hostonly
==&gt; web1.demo.com: Forwarding ports...
    web1.demo.com: 22 (guest) =&gt; 2222 (host) (adapter 1)
==&gt; web1.demo.com: Running 'pre-boot' VM customizations...
==&gt; web1.demo.com: Booting VM...
==&gt; web1.demo.com: Waiting for machine to boot. This may take a few minutes...
    web1.demo.com: SSH address: 127.0.0.1:2222
    web1.demo.com: SSH username: vagrant
    web1.demo.com: SSH auth method: private key
[...]
```

Once the playbook execution completes, you will see output like this:


```
PLAY RECAP *********************************
Ansible-host     : ok=20 changed=11 unreachable=0 failed=0 skipped=0 rescued=0 ignored=3

Real 18m14.288s
User 2m26.978s
Sys 0m26.849s
```

Verify that all VMs are running:


```
$ vagrant status
Current machine states:

Web1.demo.com    running (virtualbox)
Web2.demo.com    running (virtualbox)
ansible-host     running (virtualbox)
[...]
```

You can investigate further by logging into one of the VMs. Access the ansible-host:


```
&gt; vagrant ssh ansible-host
Activate the web console with: systemctl enable --now cockpit.socket

Last login: Thu Nov 26 12:21:23 2020 from 10.0.2.2
[vagrant@ansible-host ~] uptime
16:46:42 up 1:24, 1 user, load average: 0.00, 0.01, 0.04
```

Finally, you can use the Ansible module to ping the other nodes you created:


```
[vagrant@ansible-host]$ ansible -i inventory-test.yaml \
webservers -m ping -u vagrant
192.168.29.2 | SUCCESS =&gt; {
  "Ansible-facts": {
      "Discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "Changed": false;
    "Ping": "pong"
}
[...]
```

### Clean up

Clean up your environment by running:


```
`$ vagrant destroy [vagrant machine name]`
```

Your output will look like this:

![Output from cleaning up environment][12]

(Michael Calizo, [CC BY-SA 4.0][13])

### Get creative to learn

Learning software like Ansible on your own time in your own lab is a good habit, but it can be difficult because of constraints that are out of your control.

Sometimes, you need to get creative and find another way. There are many options in the open source community you can choose from; one of the main reasons we picked these tools is because they are commonly used and familiar to many people.

Also, please note that these playbooks are not as optimized as I want. Please feel free to improve them and share your work in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/ansible-lab

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://opensource.com/resources/what-ansible
[3]: https://github.com/mikecali/ansible-labs-101
[4]: https://www.ansible.com/
[5]: https://www.vagrantup.com/
[6]: https://www.virtualbox.org/
[7]: https://getfedora.org/
[8]: https://support.lenovo.com/pt/en/solutions/ht500006
[9]: https://opensource.com/article/20/11/cockpit-server-management
[10]: https://www.vagrantup.com/docs/installation
[11]: https://github.com/mikecali/ansible-labs-101.git
[12]: https://opensource.com/sites/default/files/uploads/cleanup.png (Output from cleaning up environment)
[13]: https://creativecommons.org/licenses/by-sa/4.0/
