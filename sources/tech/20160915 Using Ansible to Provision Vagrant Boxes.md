Using Ansible to Provision Vagrant Boxes
====

![](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-plus-ansible.jpg?w=1352&ssl=1)

Ansible is a great tool for system administrators who want to automate system administration tasks. From configuration management to provisioning and managing containers for application deployments, Ansible [makes it easy][1]. The lightweight module based architecture is ideal for system administration. One advantage is that when the node is not being managed by Ansible, no resources are used.

This article covers how to use Ansible to provision Vagrant boxes. A [Vagrant box][2] in simple terms is a virtual machine prepackaged with tools required to run the development environment. You can use these boxes to distribute the development environment used by other team members for project work. Using Ansible, you can automate provisioning the Vagrant boxes with your development packages.

This tutorial uses Fedora 24 as the host system and [CentOS][3] 7 as the Vagrant box.

### Setting up prerequisites

To configure Vagrant boxes using Ansible, you’ll need a few things setup. This tutorial requires you to install Ansible and Vagrant on the host machine. On your host machine, execute the following command to install the tools:

```
sudo dnf install ansible vagrant vagrant-libvirt
```

The above command installs both Ansible and Vagrant on your host system, along with Vagrant’s libvirt provider. Vagrant doesn’t provide functionality to host your virtual machine guests (VMs). Rather, it depends on third party providers such as libvirt, VirtualBox, VMWare, etc. to host the VMs. This provider works directly with libvirt and KVM on your Fedora system.

Next, make sure your user is in the wheel group. This special group allows you to run system administration commands. If you created your user as an administrator, such as during installation, you’ll have this group membership. Run the following command:

```
id | grep wheel
```

If you see output, your user is in the group, and you can move on to the next section. If not, run the following command. You’ll need to provide the password for the root account. Substitute your user name for the text <username>:

```
su -c 'usermod -a -G wheel <username>'
```

Then you will need to logout, and log back in, to inherit the group membership properly.

Now it’s time to create your first Vagrant box, which you’ll then configure using Ansible.

### Setting up the Vagrant box

Before you use Ansible to provision a box, you must create the box. To start, create a new directory which will store files related to the Vagrant box. To create this directory and make it the current working directory, issue the following command:

```
mkdir -p ~/lampbox && cd ~/lampbox
```

Before you create the box, you should understand the goal. This box is a simple example that runs CentOS 7 as its base system, along with the Apache web server, MariaDB (the popular open source database server from the original developers of MySQL) and PHP.

To initialize the Vagrant box, use the vagrant init command:

```
vagrant init centos/7
```

This command initializes the Vagrant box and creates a file named Vagrantfile, with some pre-configured variables. Open this file so you can modify it. The following line lists the base box used by this configuration.

```
config.vm.box = "centos/7"
```

Now setup port forwarding, so after you finish setup and the Vagrant box is running, you can test the server. To setup port forwarding, add the following line just before the end statement in Vagrantfile:

```
config.vm.network "forwarded_port", guest: 80, host: 8080
```

This option maps port 80 of the Vagrant Box to port 8080 of the host machine.

The next step is to set Ansible as our provisioning provider for the Vagrant Box. Add the following lines before the end statement in your Vagrantfile to set Ansible as the provisioning provider:

```
config.vm.provision :ansible do |ansible|
  ansible.playbook = "lamp.yml"
end
```

(You must add all three lines before the final end statement.) Notice the statement ansible.playbook = “lamp.yml”. This statement defines the name of the playbook used to provision the box.

### Creating the Ansible playbook

In Ansible, playbooks describe a policy to be enforced on your remote nodes. Put another way, playbooks manage configurations and deployments on remote nodes. Technically speaking, a playbook is a YAML file in which you write tasks to perform on remote nodes. In this tutorial, you’ll create a playbook named lamp.yml to provision the box.

To make the playbook, create a file named lamp.yml in the same directory where your Vagrantfile is located and add the following lines to it:

```
---
- hosts: all
  become: yes
  become_user: root
  tasks:
  - name: Install Apache
    yum: name=httpd state=latest
  - name: Install MariaDB
    yum: name=mariadb-server state=latest
  - name: Install PHP5
    yum: name=php state=latest
  - name: Start the Apache server
    service: name=httpd state=started
  - name: Install firewalld
    yum: name=firewalld state=latest
  - name: Start firewalld
    service: name=firewalld state=started
  - name: Open firewall
    command: firewall-cmd --add-service=http --permanent
```

An explanation of each line of lamp.yml follows.

- hosts: all specifies the playbook should run over every host defined in the Ansible configuration. Since no hosts are configured hosts yet, the playbook will run on localhost.
- sudo: true states the tasks should be performed with root privileges.
- tasks: specifies the tasks to perform when the playbook runs. Under the tasks section:
- - name: … provides a descriptive name to the task
- - yum: … specifies the task should be executed by the yum module. The options name and state are key=value pairs for use by the yum module.

When this playbook executes, it installs the latest versions of the Apache (httpd) web server, MariaDB, and PHP. Then it installs and starts firewalld, and opens a port for the Apache server. You’re now done writing the playbook for the box. Now it’s time to provision it.

### Provisioning the box

A few final steps remain before using the Vagrant Box provisioned using Ansible. To run this provisioning, execute the following command:

```
vagrant up --provider libvirt
```

The above command starts the Vagrant box, downloads the base box image to the host system if not already present, and then runs the playbook lamp.yml to provision.

If everything works fine, the output looks somewhat similar to this example:

![](https://i1.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-ansible-playbook-run.png?w=574&ssl=1)

This output shows that the box has been provisioned. Now check whether the server is accessible. To confirm, open your web browser on the host machine and point it to the address http://localhost:8080. Remember, port 8080 of the local host is forwarded to port 80 of the Vagrant box. You should be greeted with the Apache welcome page like the one shown below:

![](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/08/vagrant-ansible-apache-up.png?w=1004&ssl=1)

To make changes to your Vagrant box, first edit the Ansible playbook lamp.yml. You can find plentiful documentation on Ansible at [its official website][4]. Then run the following command to re-provision the box:

```
vagrant provision
```

### Conclusion

You’ve now seen how to use Ansible to provision Vagrant boxes. This was a basic example, but you can use these tools for many other use cases. For example, you can deploy complete applications along with up-to-date version of required tools. Be creative as you use Ansible to provision your remote nodes or containers.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-ansible-provision-vagrant-boxes/

作者：[Saurabh Badhwar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://h4xr.id.fedoraproject.org/
[1]: https://ansible.com/
[2]: https://www.vagrantup.com/
[3]: https://centos.org/
[4]: http://docs.ansible.com/ansible/index.html
