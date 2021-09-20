[#]: subject: "Use Vagrant to test your scripts on different operating systems"
[#]: via: "https://opensource.com/article/21/9/test-vagrant"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use Vagrant to test your scripts on different operating systems
======
Vagrant helps you run other operating systems on your computer—meaning
you can build things, test things, and do wacky stuff without blowing up
your own system.
![Business woman on laptop sitting in front of window][1]

I've been happy using Vagrant for quite a while now. I work with several DevOps tools, and installing them all on one system can get complicated. Vagrant lets you do cool things without breaking your system because you don't have to experiment on your production system at all.

If you're familiar with [VirtualBox][2] or [GNOME Boxes][3], then learning Vagrant is easy. Vagrant is a simple and clean interface for working with virtual machines. A single config file, called `Vagrantfile`, allows you to customize your virtual machines (called _Vagrant boxes_). A simple command-line interface lets you start, stop, suspend, or destroy your boxes.

Consider this simple example.

Let's say you want to write Ansible or shell scripts to install Nginx on a new server. You can't do it on your own system because you might not be running the operating system you want to test, or you may not have all of the dependencies for what you want to do. Launching new cloud servers for testing can be time-consuming and expensive. This is where Vagrant comes in. You can use it to bring up a virtual machine, provision it using your scripts, and prove that everything works as expected. You can then delete the box, re-provision it, and re-run your scripts to verify it. You can repeat this process as many times as you want until you're confident your scripts work under all conditions. And you can commit your Vagrantfile to Git to ensure your team is testing the exact same environment (because they'll be using the exact same test box). No more "…but it works fine on my machine!"

### Getting started

First, [install Vagrant on your system][4] and then create a new folder to experiment in. In this new folder, create a new file named `Vagrantfile` with these contents:


```
Vagrant.configure("2") do |config|
 
  config.vm.box = "ubuntu/hirsute64"
 
end
```

You can also run `vagrant init ubuntu/hirsute64`, and it will generate a new Vagrantfile for you. Now run `vagrant up`. This command will download the `ubuntu/hirsuite64` image from the Vagrant registry.


```
Bringing machine 'default' up with 'virtualbox' provider...
==&gt; default: Importing base box 'ubuntu/hirsute64'...
==&gt; default: Matching MAC address for NAT networking...
==&gt; default: Checking if box 'ubuntu/hirsute64' version '20210820.0.0' is up to date...
==&gt; default: Setting the name of the VM: a_default_1630204214778_76885
==&gt; default: Clearing any previously set network interfaces...
==&gt; default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
==&gt; default: Forwarding ports...
    default: 22 (guest) =&gt; 2222 (host) (adapter 1)
==&gt; default: Running 'pre-boot' VM customizations...
==&gt; default: Booting VM...
==&gt; default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Remote connection disconnect. Retrying...
    default: Warning: Connection reset. Retrying...
    default:
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==&gt; default: Machine booted and ready!
```

At this point, if you open your Vagrant backend (such as VirtualBox or virt-manager), you'll see your box there. Next, run `vagrant ssh` to log in to the box. If you can see the Vagrant prompt, then you’re in!


```
~ vagrant ssh
Welcome to Ubuntu 21.04 (GNU/Linux 5.11.0-31-generic x86_64)

 * Documentation:  <https://help.ubuntu.com>
 * Management:     <https://landscape.canonical.com>
 * Support:        <https://ubuntu.com/advantage>

  System information as of Sun Aug 29 02:33:51 UTC 2021

  System load:  0.01              Processes:               110
  Usage of /:   4.1% of 38.71GB   Users logged in:         0
  Memory usage: 17%               IPv4 address for enp0s3: 10.0.2.15
  Swap usage:   0%                IPv4 address for enp0s8: 192.168.1.20

0 updates can be applied immediately.

vagrant@ubuntu-hirsute:~$
```

Vagrant uses "base boxes" to bring up your local machines. In our case, Vagrant downloads the `ubuntu/hirsuite64` image from [Hashicorp’s Vagrant catalogue][5] and plugs into VirtualBox to create the actual box.

### Shared folders

Vagrant maps your current folder as `/vagrant` within the Vagrant box. This allows you to keep your files in sync on your system and within the box. This is great for testing a Nginx website by pointing your document root to `/vagrant`. You can use an IDE to make changes and Nginx within the box will serve them.

### Vagrant commands

There are several Vagrant commands which you can use to control your box.

Some of the important ones are:

  * `vagrant up`: Bring a box online.
  * `vagrant status`: Show current box status.
  * `vagrant suspend`: Pause the current box.
  * `vagrant resume`: Resume the current box.
  * `vagrant halt`: Shutdown the current box.
  * `vagrant destroy`: Destroy the current box. By running this command, you will lose any data stored on the box.
  * `vagrant snapshot`: Take a snapshot of the current box.



### Try Vagrant

Vagrant is a time-tested tool for virtual machine management using DevOps principles. Configure your test machines, share the configs with your team, and test your projects in a predictable and reproducible environment. If you're developing software, then you'll do your users a great service by using Vagrant for testing. If you're not developing software but you love to try out new versions of an OS, then there's no easier way. Try Vagrant today!

* * *

_This article was originally published on the [author's personal blog][6] and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/test-vagrant

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/21/6/try-linux-virtualbox
[3]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[4]: https://www.vagrantup.com/docs/installation
[5]: https://app.vagrantup.com/boxes/search
[6]: https://notes.ayushsharma.in/2021/08/introduction-to-vagrant
