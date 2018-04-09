Getting started with Vagrant
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_scale_performance.jpg?itok=R7jyMeQf)
If you're like me, you probably have a "sandbox" somewhere, a place where you hack on whatever projects you're working on. Over time, the sandbox will get crufty and cluttered with bits and pieces of ideas, toolchain elements, code modules you aren't using, and other stuff you don't need. When you finish something, this can complicate your deployment, because you may be unsure of the actual dependencies of your project—you've had some tool in your sandbox for so long that you forget it must be installed. You need a clean environment, with all your dependencies in one place, to make things easier later.

Or maybe you're in DevOps, and the developers you serve hand you code with muddy dependencies, and it makes testing that much harder. You need a way to have a clean box to pull in the code and run it through its paces. You want these environments to be disposable and repeatable.

Enter [Vagrant][1]. Created by HashiCorp under the [MIT License][2], Vagrant acts as a wrapper and frontend for VirtualBox, Microsoft Hyper-V, or Docker containers, and it is extensible with plugins for [a great many other providers][3]. You can configure Vagrant to provide repeatably clean environments with needed infrastructure already installed. The configuration script is portable, so if your repository and Vagrant configuration script are on cloud-based storage, you can spin up and work on multiple machines with just a few limitations. Let's take a look.

### Installation

For this installation, I'm working on my Linux Mint desktop, version 18.3 Cinnamon 64-bit. Installation is very similar on most other Debian-derived systems, and there are similar installers for RPM-based systems on most distributions. Vagrant's [installation page][4] provides downloads for Debian, Windows, CentOS, MacOS, and Arch Linux, but I found it in my package manager, so I'll install that.

The easiest install uses VirtualBox for the virtualization provider, so I'll need to install that, as well.
```
sudo apt-get install virtualbox vagrant

```

The installer will pick up the dependencies—mostly Ruby stuff—and install them.

### Setting up a project

Before setting up your project, you'll need to know a bit about the environment where you want to run it. You can find a whole bunch of preconfigured boxes for many virtualization providers at the [Vagrant Boxes repository][5]. Many will be pre-configured with some core infrastructure you might need, like PHP, MySQL, and Apache, but for this test, I'm going to install a bare Debian 8 64-bit "Jessie" box and manually install a few things, just so you can see how.
```
mkdir ~/myproject

cd ~/myproject

vagrant init debian/contrib-jessie64

vagrant up

```

The last command will fetch or update the VirtualBox image from the library, as needed, then pull the starter, and you'll have a running box on your system! The next time you start the box, it won't take as long, unless the image has been updated in the repository.

To access the box, just enter `vagrant ssh`. You'll be dropped into a fully functional SSH session on the virtual machine. You'll be user `vagrant`, but you're a member of the `sudo` group, so you can change to root and do whatever you want from here.

You'll see a directory named `/vagrant` on the box. Be careful with this directory, as it'll be synced with the `~/myproject` folder on the host machine. Touch a file in `/vagrant` on the virtual machine, and it's immediately copied out to the host, and vice versa. Be aware that some boxes do not have the VirtualBox guest additions installed, so the copy works only one-way and only at boot time! There are some command-line tools for manual syncing, which might be a really useful feature in a testing environment. I tend to stick to boxes that have the additions in place, so this directory syncing just works without me having to think about it.

The benefits of this scheme become quickly apparent: If you have a code-editing toolchain on the host and don't want it on the virtual machine for any reason, that's not a problem—edit on the host, and the VM sees the change at once. Make a quick change on the VM, and it's synced to the "official" copy on the host, as well.

Let's shut the box down so we can provision some things we'll need on this box: `vagrant halt`.

### Installing additional software on the VM, consistently

For this example, I'm going to work on a project using [Apache][6], [PostgreSQL][7], and the [Dancer][8] web framework for Perl. I'll modify the Vagrant configuration script so that the things I need are already installed. Just to make things easy to keep it updated later, I'll create a script at the top of `~/myproject/Vagrantfile`:
```
$provision_script = <<SCRIPT

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get -y install \

  apache2 \

  postgresql-client-9.4 \

  postgresql-9.4 \

  libdbd-pg-perl \

  libapache2-mod-fastcgi \

  libdata-validate-email-perl  \

  libexception-class-perl \

  libexception-class-trycatch-perl \

  libtemplate-perl \

  libtemplate-plugin-json-escape-perl \

  libdbix-class-perl \

  libyaml-tiny-perl \

  libcrypt-saltedhash-perl \

  libdancer2-perl \

  libtemplate-plugin-gravatar-perl  \

  libtext-csv-perl \

  libstring-tokenizer-perl \

  cpanminus

cpanm -f -n \

  Dancer2::Session::Cookie \

  Dancer2::Plugin::DBIC \

  Dancer2::Plugin::Auth::Extensible::Provider::DBIC \

  Dancer2::Plugin::Locale \

  Dancer2::Plugin::Growler

sudo a2enmod rewrite fastcgi

sudo apache2ctl restart

SCRIPT

```

Down near the end of the Vagrantfile, you'll find a line for the `config.vm.provision` variable. You could do that inline here, as you see in the example, merely by uncommenting these lines:
```
  # config.vm.provision "shell", inline: <<-SHELL

  #   sudo apt-get update

  #   sudo apt-get install -y apache2

  # SHELL

```

But instead, replace those four lines to use the provisioning script you defined as a variable at the top of the file:
```
config.vm.provision "shell", inline: $provision_script

```

`forwarded_port` and uncomment it. You can change the port from 8080 to something else, if you want, as well. I normally use port 5000, and accessing `http://localhost:5000` in my browser gets me to the Apache server on the virtual machine.

You'll probably also want to set the forwarded port to access Apache on the VM from your host machine. Look for the line containingand uncomment it. You can change the port from 8080 to something else, if you want, as well. I normally use port 5000, and accessingin my browser gets me to the Apache server on the virtual machine.

Here's a setup tip: if your repository is on cloud storage, in order to use Vagrant on multiple machines, you'll probably want to set the `VAGRANT_HOME` environment variable on different machines to different things. With the way VirtualBox works, you'll want to store state information separately for these systems. Make sure the directories being used for this are ignored by your version control—I add `.vagrant.d*` to my `.gitignore` file for the repository. I do let the Vagrantfile be part of the repository, though!

### All done!

I enter `vagrant up`, and I'm ready to start writing code. Once you've done this once or twice, you'll probably come up with some Vagrantfile boilerplates you'll recycle a lot (like the one I just used), and that's one of the strengths of Vagrant. You get to the actual coding work quicker and spend less time on infrastructure!

There's a lot more you can do with Vagrant. Provisioning tools exist for many toolchains, so no matter what environment you need to replicate, it's quick and easy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/getting-started-vagrant

作者：[Ruth Holloway][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/druthb
[1]:https://vagrantup.com
[2]:https://opensource.org/licenses/MIT
[3]:https://github.com/hashicorp/vagrant/wiki/Available-Vagrant-Plugins#providers
[4]:https://www.vagrantup.com/downloads.html
[5]:https://app.vagrantup.com/boxes/search
[6]:https://httpd.apache.org/
[7]:https://postgresql.org
[8]:https://perldancer.org
