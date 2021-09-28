[#]: subject: "Use Vagrant to test your scripts on different operating systems"
[#]: via: "https://opensource.com/article/21/9/test-vagrant"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13829-1.html"

使用 Vagrant 在不同的操作系统上测试你的脚本
======

> Vagrant 可以帮助你在你的电脑上运行其他操作系统，这意味着你可以构建、测试、疯狂折腾而不毁坏你的系统。

![](https://img.linux.net.cn/data/attachment/album/202109/28/115827gv75kkrhnnhvkhcf.jpg)

我使用 Vagrant 已经很长时间了。我使用几种 DevOps 工具，把它们全安装在一个系统上会搞得很乱。Vagrant 可以让你在不破坏系统的情况下随意折腾，因为你根本不需要在生产系统上做实验。

如果你熟悉 [VirtualBox][2] 或 [GNOME Boxes][3]，那么学习 Vagrant 很容易。Vagrant 有一个简单而干净的界面用于管理虚拟机。一个名为 `Vagrantfile` 的配置文件，允许你定制你的虚拟机（称为 “Vagrant <ruby>盒子<rt>box</rt></ruby>”）。一个简单的命令行界面让你启动、停止、暂停或销毁你的“盒子”。

考虑一下这个简单的例子。

假设你想写 Ansible 或 shell 脚本，在一个新的服务器上安装 Nginx。你不能在你自己的系统上这样做，因为你运行的可能不是你想测试的操作系统，或者没有所有的依赖项。启动新的云服务器进行测试可能会很费时和昂贵。这就是 Vagrant 派上用处的地方。你可以用它来启动一个虚拟机，用你的脚本来<ruby>配备<rt>provision</rt></ruby>它，并证明一切按预期工作。然后，你可以删除这个“盒子”，重新配备它，并重新运行你的脚本来验证它。你可以多次重复这个过程，直到你确信你的脚本在所有条件下都能工作。你可以将你的 Vagrantfile 提交给 Git，以确保你的团队正在测试完全相同的环境（因为他们将使用完全相同的测试机）。不会再有“但它在我的机器上运行良好！”这事了。

### 开始使用

首先，[在你的系统上安装 Vagrant][4]，然后创建一个新的文件夹进行实验。在这个新文件夹中，创建一个名为 `Vagrantfile` 的新文件，内容如下：

```
Vagrant.configure("2") do |config|

 config.vm.box = "ubuntu/hirsute64"

end
```

你也可以运行 `vagrant init ubuntu/hirsute64`，它将为你生成一个新的 Vagrant 文件。现在运行 `vagrant up`。这个命令将从 Vagrant 仓库中下载 `ubuntu/hirsuite64` 镜像。

```
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'ubuntu/hirsute64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'ubuntu/hirsute64' version '20210820.0.0' is up to date...
==> default: Setting the name of the VM: a_default_1630204214778_76885
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
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
==> default: Machine booted and ready!
```

此时，如果你打开你的 Vagrant 后端（如 VirtualBox 或 virt-manager），你会看到你的“盒子”已经有了。接下来，运行 `vagrant ssh` 登录到“盒子”。如果你能看到 Vagrant 的提示符，那么你就进入了！

```
~ vagrant ssh
Welcome to Ubuntu 21.04 (GNU/Linux 5.11.0-31-generic x86_64)

* Documentation: <https://help.ubuntu.com>
* Management:   <https://landscape.canonical.com>
* Support:    <https://ubuntu.com/advantage>

 System information as of Sun Aug 29 02:33:51 UTC 2021

 System load: 0.01       Processes:        110
 Usage of /:  4.1% of 38.71GB  Users logged in:     0
 Memory usage: 17%        IPv4 address for enp0s3: 10.0.2.15
 Swap usage:  0%        IPv4 address for enp0s8: 192.168.1.20

0 updates can be applied immediately.

vagrant@ubuntu-hirsute:~$
```

Vagrant 使用“基础盒子”来建立你的本地机器。在我们的例子中，Vagrant 从 [Hashicorp 的 Vagrant 目录][5]下载 `ubuntu/hirsuite64` 镜像，并插入 VirtualBox 来创建实际的“盒子”。

### 共享文件夹

Vagrant 将你的当前文件夹映射到 Vagrant “盒子”中的 `/vagrant`。这允许你在你的系统和“盒子”里保持文件同步。这很适合测试 Nginx 网站，通过将你的文件根目录指向 `/vagrant`。你可以使用 IDE 进行修改，“盒子”里的 Nginx 会提供这些修改。

### Vagrant 命令

有几个 Vagrant 命令，你可以用它们来控制你的“盒子”。

其中一些重要的命令是：

  * `vagrant up`：启动一个“盒子”。
  * `vagrant status`：显示当前“盒子”的状态。
  * `vagrant suspend`：暂停当前的“盒子”。
  * `vagrant resume`：恢复当前的“盒子”。
  * `vagrant halt`：关闭当前的“盒子”。
  * `vagrant destroy`：销毁当前的“盒子”。通过运行此命令，你将失去存储在“盒子”上的任何数据。
  * `vagrant snapshot`：对当前的“盒子”进行快照。

### 试试 Vagrant

Vagrant 是一个使用 DevOps 原则进行虚拟机管理的工具，久经时间考验。配置你的测试机，与你的团队分享配置，并在一个可预测和可重复的环境中测试你的项目。如果你正在开发软件，那么通过使用 Vagrant 进行测试，你将为你的用户提供良好的服务。如果你不开发软件，但你喜欢尝试新版本的操作系统，那么没有比这更简单的方法了。今天就试试 Vagrant 吧！

这篇文章最初发表在 [作者的个人博客][6] 上，经许可后被改编。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/test-vagrant

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/21/6/try-linux-virtualbox
[3]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[4]: https://www.vagrantup.com/docs/installation
[5]: https://app.vagrantup.com/boxes/search
[6]: https://notes.ayushsharma.in/2021/08/introduction-to-vagrant
