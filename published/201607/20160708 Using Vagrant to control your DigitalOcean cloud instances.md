使用 Vagrant 控制你的 DigitalOcean 云主机
=========================================================

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/fedora-vagrant-do-945x400.jpg)

[Vagrant][1]  是一个使用虚拟机创建和支持虚拟开发环境的应用。Fedora 官方已经在本地系统上通过库 `libvirt` [支持 Vagrant][2]。[DigitalOcean][3] 是一个提供一键部署 Fedora 云服务实例到全 SSD 服务器的云计算服务提供商。在[最近的 Raleigh 举办的 FAD 大会][4]中，Fedora 云计算队伍为 Vagrant 打包了一个新的插件，它能够帮助 Fedora 用户通过使用本地的 Vagrantfile 文件来管理 DigitalOcean 上的云服务实例。

### 如何使用这个插件

第一步在命令行下是安装软件。

```
$ sudo dnf install -y vagrant-digitalocean
```

安装 结束之后，下一步是创建本地的 Vagrantfile 文件。下面是一个例子。

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

### Vagrant DigitalOcean 插件的注意事项

一定要记住的几个关于 SSH 的关键命名规范 : 如果你已经在 DigitalOcean 上传了秘钥，请确保 `provider.ssh_key_name`  和已经在服务器中的名字吻合。 `provider.image` 具体的文档可以在[DigitalOcean documentation][5]找到。在控制面板上的 `App & API` 部分可以创建 AUTH 令牌。

你可以使用下面的命令启动一个实例。

```
$ vagrant up --provider=digital_ocean
```

这个命令会在 DigitalOcean 的启动一个服务器实例。然后你就可以使用 `vagrant ssh` 命令来 `ssh` 登录进入这个实例。可以执行 `vagrant destroy` 来删除这个实例。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-vagrant-digitalocean-cloud/

作者：[Kushal Das][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[Ezio](https://github.com/oska874)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://kushal.id.fedoraproject.org/
[1]: https://www.vagrantup.com/
[2]: https://fedoramagazine.org/running-vagrant-fedora-22/
[3]: https://www.digitalocean.com/
[4]: https://communityblog.fedoraproject.org/fedora-cloud-fad-2016/
[5]: https://developers.digitalocean.com/documentation/v2/#create-a-new-droplet
