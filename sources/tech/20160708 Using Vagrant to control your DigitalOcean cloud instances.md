MikeCoder Translating...

Using Vagrant to control your DigitalOcean cloud instances
=========================================================

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/fedora-vagrant-do-945x400.jpg)

[Vagrant][1] is an application to create and support virtual development environments using virtual machines. Fedora has [official support for Vagrant][2] with libvirt on your local system. [DigitalOcean][3] is a cloud provider that provides a one-click deployment of a Fedora Cloud instance to an all-SSD server in under a minute. During the [recent Cloud FAD][4] in Raleigh, the Fedora Cloud team packaged a new plugin for Vagrant which enables Fedora users to keep up cloud instances in DigitalOcean using local Vagrantfiles.

### How to use this plugin

First step is to install the package in the command line.

```
$ sudo dnf install -y vagrant-digitalocean
```

After installing the plugin, the next task is to create the local Vagrantfile. An example is provided below.

```
$ mkdir digitalocean
$ cd digitalocean
$ cat Vagrantfile
Vagrant.configure('2') do |config|
    config.vm.hostname = 'dropletname.kushaldas.in'
    # Alternatively, use provider.name below to set the Droplet name. config.vm.hostname takes precedence.

    config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '/home/kdas/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-   digitalocean/raw/master/box/digital_ocean.box"

    provider.token = 'Your AUTH Token'
    provider.image = 'fedora-23-x64'
    provider.region = 'nyc2'
    provider.size = '512mb'
    provider.ssh_key_name = 'Kushal'
    end
end
```

### Notes about Vagrant DigitalOcean plugin

A few points to remember about the SSH key naming scheme: if you already have the key uploaded to DigitalOcean, make sure that the provider.ssh_key_name matches the name of the existing key in their server. The provider.image details are found at the [DigitalOcean documentation][5]. The AUTH token is created on the control panel within the Apps & API section.

You can then get the instance up with the following command.

```
$ vagrant up --provider=digital_ocean
```

This command will fire up the instance in the DigitalOcean server. You can then SSH into the box by using vagrant ssh command. Run vagrant destroy to destroy the instance.




--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-vagrant-digitalocean-cloud/

作者：[Kushal Das][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://kushal.id.fedoraproject.org/
[1]: https://www.vagrantup.com/
[2]: https://fedoramagazine.org/running-vagrant-fedora-22/
[3]: https://www.digitalocean.com/
[4]: https://communityblog.fedoraproject.org/fedora-cloud-fad-2016/
[5]: https://developers.digitalocean.com/documentation/v2/#create-a-new-droplet
