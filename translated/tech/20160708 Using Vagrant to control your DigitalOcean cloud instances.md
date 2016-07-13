使用 Vagrant 控制你的 DigitalOcean 云主机
=========================================================

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/fedora-vagrant-do-945x400.jpg)

[Vagrant][1]  是一个创建和管理支持虚拟机开发环境的应用。Fedora 已经[官方支持 Vagrant][2]。[DigitalOcean][3]是一个提供一键部署的云计算服务提供商(主要是 Fedora 的服务实例)。在[最近的 Raleigh 举办的云计算 FAD][4]中，Fedora 云计算队伍已经打包了一个 Vagrant 的新的插件。它能够帮助用户通过使用本地的 Vagrantfile 来管理 DigitalOcean 实例。

### 如何使用 Vagrant DigitalOcean 插件

第一步是安装 vagrant DigitalOcean 的插件软件包。

```
$ sudo dnf install -y vagrant-digitalocean
```

安装 结束之后，下一个任务是创建本地的 Vagrantfile 文件。下面是一个例子。

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

### Vagrant DigitalOcean 插件

一定要记住几个 SSH 命令规范:如果你已经在 DigitalOcean 上传了秘钥，请确保 provider.ssh_key_name 和已经在服务器中的名字吻合。provider.image 具体的文档可以在[DigitalOcean documentation][5]找到。认证 Token 可以在控制管理器的 Apps & API 区域找到。

你可以通过以下命令来实例化一台主机。

```
$ vagrant up --provider=digital_ocean
```

这个命令会启动一台 DigitalOcean 的服务器实例。你可以使用 vagrant ssh 命令来 ssh 登陆进入这个实例。执行 vagrant destroy 来废弃这个实例。




--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-vagrant-digitalocean-cloud/

作者：[Kushal Das][a]
译者：[译者ID](https://github.com/MikeCoder)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://kushal.id.fedoraproject.org/
[1]: https://www.vagrantup.com/
[2]: https://fedoramagazine.org/running-vagrant-fedora-22/
[3]: https://www.digitalocean.com/
[4]: https://communityblog.fedoraproject.org/fedora-cloud-fad-2016/
[5]: https://developers.digitalocean.com/documentation/v2/#create-a-new-droplet
