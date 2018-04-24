Managing virtual environments with Vagrant
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_wheels.png?itok=KRvpBttl)
Vagrant is a tool that offers a simple and easy to use command-line client for managing virtual environments. I started using it because it made it easier for me to develop websites, test solutions, and learn new things.

According to [Vagrant's website][1], "Vagrant lowers development environment setup time, increases production parity, and makes the 'works on my machine' excuse a relic of the past."

There is a lot Vagrant can do, and you can learn a bit more background in Opensource.com's [Vagrant open source resources article][2].

In this getting-started guide, I'll demonstrate how to use Vagrant to:

  1. Create and configure a VirtualBox virtual machine (VM)
  2. Run post-deployment configuration shell scripts and applications



Sounds simple, and it is. Vagrant's power comes from having a consistent workflow for deploying and configuring machines regardless of platform or operating system.

We'll start by using VirtualBox as a **provider** , setting up an Ubuntu 16.04 **box** , and applying a few shell commands as the **provisioner**. I'll refer to the physical machine (e.g., a laptop or desktop) as the host machine and the Vagrant VM as the guest.

In this tutorial, we'll put together a [Vagrantfile][3] and offer periodic checkpoints to make sure our files look the same. We'll cover the following introductory and advanced topics:

Introductory topics:

  * Installing Vagrant
  * Choosing a Vagrant box
  * Understanding the Vagrantfile
  * Getting the VM running
  * Using provisioners



Advanced topics:

  * Networking
  * Syncing folders
  * Deploying multiple machines
  * Making sure everything works



It looks like a lot, but it will all fit together nicely once we are finished.

### Installing Vagrant

First, we'll navigate to [Vagrant's][4] and [VirtualBox's][5] download pages to install the latest versions of each.

We can enter the following commands to ensure the latest versions of the applications are installed and ready to use.

**Vagrant:**
```
# vagrant --version

Vagrant 2.0.3

```

**VirtualBox:**
```
# VBoxManage --version

5.2.8r121009

```

### Choosing a Vagrant box

Picking a Vagrant box is similar to picking an image for a server. At the base level, we choose which operating system (OS) we want to use. Some boxes go further and will have additional software (such as the Puppet or Chef client) already installed.

The go-to online repository for boxes is [Vagrant Cloud][6]; it offers a cornucopia of Vagrant boxes for multiple providers. In this tutorial, we'll be using Ubuntu Xenial Xerus 16.04 LTS daily build.

### Understanding the Vagrantfile

Think of the Vagrantfile as the configuration file for an environment. It describes the Vagrant environment with regard to how to build and configure the VirtualBox VMs.

We need to create an empty project directory to work from, then initialize a Vagrant environment from that directory with this command:
```
# vagrant init ubuntu/xenial64

```

This only creates the Vagrantfile; it doesn't bring up the Vagrant box.

The Vagrantfile is well-documented with a lot of guidance on how to use it. We can generate a minimized Vagrantfile with the `--minimal` flag.
```
# vagrant init --minimal ubuntu/xenial64

```

The resulting file will look like this:
```
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

end

```

We will talk more about the Vagrantfile later, but for now, let's get this box up and running.

### Getting the VM running

Let's issue the following command from our project directory:
```
# vagrant up

```

It takes a bit of time to execute `vagrant up` the first time because it downloads the box to your machine. It is much faster on subsequent runs because it reuses the same downloaded box.

Once the VM is up and running, we can `ssh` into our single machine by issuing the following command in our project directory:
```
# vagrant ssh

```

That's it! From here we should be able to log onto our VM and start working with it.

### Using provisioners

Before we move on, let's review a bit. So far, we've picked an image and gotten the server running. For the most part, the server is unconfigured and doesn't have any of the software we might want.

Provisioners provide a way to use tools such as Ansible, Puppet, Chef, and even shell scripts to configure a server after deployment.

An example of using the shell provisioner can be found in a default Vagrantfile. In this example, we'll run the commands to update apt and install Apache2 to the server.
```
   config.vm.provision "shell", inline: <<-SHELL

     apt-get update

     apt-get install -y apache2

   SHELL

```

If we want to use an Ansible playbook, the configuration section would look like this:
```
config.vm.provision "ansible" do |ansible|

    ansible.playbook = "playbook.yml"

end

```

A neat thing is we can run only the provisioning part of the Vagrantfile by issuing the `provision` subcommand. This is great for testing out scripts or configuration management plays without having to re-build the VM each time.

#### Vagrantfile checkpoint

Our minimal Vagrantfile should look like this:
```
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

   config.vm.provision "shell", inline: <<-SHELL

     apt-get update

     apt-get install -y apache2

   SHELL

end

```

After adding the provisioning section, we need to run this provisioning subcommand:
```
# vagrant provision

```

Next, we'll continue to build on our Vagrantfile, touching on some more advanced topics to build a foundation for anyone who wants to dig in further.

### Networking

In this section, we'll add an additional IP address on VirtualBox's `vboxnet0` network. This will allow us to access the machine via the `192.168.33.0/24` network.

Adding the following line to the Vagrantfile will configure the machine to have an additional IP on the `192.168.33.0/24` network. This line is also used as an example in the default Vagrantfile.
```
config.vm.network "private_network", ip: "192.168.33.10

```

#### Vagrantfile checkpoint

For those following along, here where our working Vagrantfile stands:
```
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

   config.vm.network "private_network", ip: "192.168.33.10"

   config.vm.provision "shell", inline: <<-SHELL

     apt-get update

     apt-get install -y apache2

   SHELL

end

```

Next, we need to reload our configuration to reconfigure our machine with this new interface and IP. This command will shut down the VM, reconfigure the Virtual Box VM with the new IP address, and bring the VM back up.
```
# vagrant reload

```

When it comes back up, our machine should have two IP addresses.

### Syncing folders

Synced folders are what got me into using Vagrant. They allowed me to work on my host machine, using my tools, and at the same time have the files available to the web server or application. It made my workflow much easier.

By default, the project directory on the host machine is mounted to the guest machine as `/home/vagrant`. This worked for me in the beginning, but eventually, I wanted to customize where this directory was mounted.

In our example, we are defining that the HTML directory within our project directory should be mounted as `/var/www/html` with user/group ownership of `root`.
```
config.vm.synced_folder "./"html, "/var/www/html",

  owner: "root", group: "root"

```

One thing to note: If you are using a synced folder as a web server document root, you will need to disable `sendfile`, or you might run into an issue where it looks like the files are not updating.

Updating your web server's configuration is out of scope for this article, but here are the directives you will want to update.

In Apache:
```
EnableSendFile Off

```

In Nginx:
```
sendfile off;

```

#### Vagrantfile checkpoint

After adding our synced folder configuration, our Vagrantfile will look like this:
```
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

   config.vm.network "private_network", ip: "192.168.33.10"

   config.vm.synced_folder "./html", "/var/www/html",

      owner: "root", group: "root"

   config.vm.provision "shell", inline: <<-SHELL

     apt-get update

     apt-get install -y apache2

   SHELL

end

```

We need to reload our machine to make the new configuration active.
```
# vagrant reload

```

### Deploying multiple machines

We sometimes refer to the project directory as an "environment," and one machine is not much of an environment. This last section extends our Vagrantfile to deploy two machines.

To create two machines, we need to enclose the definition of a single machine inside a `vm.define` block. The rest of the configuration is exactly the same.

Here is an example of a server definition within a `define` block.
```
Vagrant.configure("2") do |config|



config.vm.define "web" do |web|

    web.vm.box = "web"

    web.vm.box = "ubuntu/xenial64"

     web.vm.network "private_network", ip: "192.168.33.10"

     web.vm.synced_folder "./html", "/var/www/html",

        owner: "root", group: "root"

     web.vm.provision "shell", inline: <<-SHELL

       apt-get update

       apt-get install -y apache2

     SHELL

  end



end

```

Notice in the `define` block, our variable is called `"web"` and it is carried through the block to reference each configuration method. We'll use the same name to access it later.

In this next example, we'll add a second machine called `"db"` to our configuration. Where we used `"web"` in our second block before, we'll use `"db"` to reference the second machine. We'll also update our IP address on the `private_network` so we can communicate between the machines.
```
Vagrant.configure("2") do |config|



config.vm.define "web" do |web|

    web.vm.box = "web"

    web.vm.box = "ubuntu/xenial64"

     web.vm.network "private_network", ip: "192.168.33.10"

     web.vm.synced_folder "./html", "/var/www/html",

        owner: "root", group: "root"

     web.vm.provision "shell", inline: <<-SHELL

       apt-get update

       apt-get install -y apache2

     SHELL

  end



  config.vm.define "db" do |db|

      db.vm.box = "db"

      db.vm.box = "ubuntu/xenial64"

       db.vm.network "private_network", ip: "192.168.33.20"

       db.vm.synced_folder "./html", "/var/www/html",

          owner: "root", group: "root"

       db.vm.provision "shell", inline: <<-SHELL

         apt-get update

         apt-get install -y apache2

       SHELL

    end



end

```

#### Completed Vagrantfile checkpoint

In our final Vagrantfile, we'll install the MySQL server, update the IP address, and remove the configuration for the synced folder from the second machine.
```
Vagrant.configure("2") do |config|



config.vm.define "web" do |web|

    web.vm.box = "web"

    web.vm.box = "ubuntu/xenial64"

     web.vm.network "private_network", ip: "192.168.33.10"

     web.vm.synced_folder "./html", "/var/www/html",

        owner: "root", group: "root"

     web.vm.provision "shell", inline: <<-SHELL

       apt-get update

       apt-get install -y apache2

     SHELL

  end



  config.vm.define "db" do |db|

      db.vm.box = "db"

      db.vm.box = "ubuntu/xenial64"

       db.vm.network "private_network", ip: "192.168.33.20"

       db.vm.provision "shell", inline: <<-SHELL

         export DEBIAN_FRONTEND="noninteractive"

         apt-get update

         apt-get install -y mysql-server

       SHELL

    end



end

```

### Making sure everything works

Now we have a completed Vagrantfile. Let's introduce one more Vagrant command to make sure everything works.

Let's destroy our machine and build it brand new.

The following command will remove our previous Vagrant image but keep the box we downloaded earlier.
```
# vagrant destroy --force

```

Now we need to bring the environment back up.
```
# vagrant up

```

We can ssh into the machines using the `vagrant ssh` command:
```
# vagrant ssh web

```

or
```
# vagrant ssh db

```

You should have a working Vagrantfile you can expand upon and serve as a base for learning more. Vagrant is a powerful tool for testing, developing and learning new things. I encourage you to keep adding to it and exploring the options it offers.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/vagrant-guide-get-started

作者：[Alex Juarez][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mralexjuarez
[1]:https://www.vagrantup.com/intro/index.html
[2]:https://opensource.com/resources/vagrant
[3]:https://www.vagrantup.com/docs/vagrantfile/
[4]:https://www.vagrantup.com/downloads.html
[5]:https://www.virtualbox.org/wiki/Downloads
[6]:https://vagrantcloud.com/
