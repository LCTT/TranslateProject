使用 Vagrant 测试 Ansible Playbooks
======
我使用 Ansible 来自动部署站点 ([LinuxJobs.fr][1]，[Journal du hacker][2]) 与应用 ([Feed2toot][3]，[Feed2tweet][4])。在本文中将会讲述我是如何配置以实现在本地测试 ansbile playbook 的。

![ansible](https：//carlchenet.com/wp-content/uploads/2017/12/ansible-300x300.png)

### 为何要测试 Ansible Playbooks

我需要一种简单而迅速的方法来在我的本地笔记本上测试 Ansible Playbook 的部署情况，尤其在刚开始写一个新 Playbook 的时候，因为直接部署到生产服务器上不仅特别慢而且风险还很大。

我使用 [Vagrant][6] 来将 Playbook 部署到 [VirtualBox][5] 虚拟机上而不是部署到远程服务器。这使得修改的结果很快就能看到，以实现快速迭代和修正。

责任声明：我并不是专业程序员。我只是描述一种我觉得适合我的，即简单又有效的用来测试 Ansible Playbook 的解决方案，但可能还有其他更好的方法。

###  我的流程

  1。开始写新的 Ansible Playbook
  2。启动一台新的虚拟机 (VM) 并使用 Vagrantt 将 playbook 部署到这台虚拟机中
  3。修复 playbook 或应用中的错误
  4。重新运行虚拟机中的部署
  5。如果还有问题，回到第三步。否则销毁这台虚拟机，重新创建新虚拟机然后最后测试一次全新部署
  6。若没有问题出现，则给你的 Ansible Playbook 版本加上标签，可以在生产环境上发布产品了

### 你需要哪些东西

首先，你需要 Virtualbox。若你使用的是 [Debian][7] 发行版，[这个链接 ][8] 描述了安装的方法，可以从 Debian 仓库中安装，也可以通过官网来安装。

[![][9]][5]

其次，你需要 Vagrant。为什么要 Vagrant？因为它是介于开发环境和虚拟机之间的中间件，它允许通过编程的方式重复操作，而且可以很方便地将你的发布与虚拟机连接起来。通过下面命令可以安装 Vagrant：
```
# apt install vagrant
```

[![][10]][6]

### 设置 Vagrant

Vagrant 的一切信息都存放在 Vagrantfile 文件中。这是我的内容：
```
Vagrant.require_version ">= 2.0.0"

Vagrant.configure(1) do |config|

 config.vm.box = "debian/stretch64"
 config.vm.provision "shell"，inline："apt install --yes git python3-pip"
 config.vm.provision "ansible" do |ansible|
 ansible.verbose = "v"
 ansible.playbook = "site.yml"
 ansible.vault_password_file = "vault_password_file"
 end
end

```
  1。第一行指明了需要用哪个版本的 Vagrant 来执行 Vagrantfile。
  2。文件中的第一个循环，你要定义为多少台虚拟机执行下面的操作(这里为 1)。
  3。第三行指定了用来创建虚拟机的官方 Vagrant 镜像。
  4。第四行非常重要：有一些需要的应用没有安装到虚拟机中。这里我们用 apt 安装 git 和 python3-pip。
  5。下一行指明了 Ansible 配置开始的地方
  6。第六行说明我们想要 Ansible 输出详细信息。
  7。第 7 行，我们定义了 Ansible Playbook 的入口。
  8。第八行，若你使用 Ansible Vault 加密了一些文件，在这里指定这些文件。

当 Vagrant 启动 Ansible 时，类似于执行这样的操作：
```
$  ansible-playbook --inventory-file=/home/me/ansible/test-ansible-playbook/.vagrant/provisioners/ansible/inventory -v --vault-password-file=vault_password_file site.yml
```

### 执行 Vagrant

写好 Vagrantfile 后，就可以启动虚拟机了。只需要简单地运行下面命令：
```
$ vagrant up
```

这个操作会很慢，因为它会启动虚拟机，安装 Vagrantfile 中定义的附加软件，最用应用你的 Playbook。你不要太频繁地使用这条命令。

Ok，现在你可以快速迭代了。在做出修改后，可以通过下面命令来快速测试你的部署：
```
$ vagrant provision
```

Ansible Playbook 搞定后，通常要经过多次迭代(至少我是这样的)，你应该一个全新安装的虚拟机上再测试一次，因为你在迭代的过程中可能会对虚拟机造成修改从而引发意料之外的结果。

使用下面命令进行全新测试：
```
$ vagrant destroy && vagrant up
```

这又是一个很慢的操作。你应该十分肯定 Ansible Playbook 差不多完成了的情况下才这样做。在全新虚拟机上测试部署之后，就可以发布到生产上去了。至少准备要充分不少了吧：p

### 有什么改进意见？请告诉我

本文中描述的配置对我自己来说很有用。我可以做到快速迭代(尤其在编写新的 playbook 的时候)，除了 playbook 外，对我的最新应用，尚未准备好部署到生产环境上的应用也很有帮助。直接部署到远程服务器上对我的生产服务来说不仅缓慢而且很危险。

我本也可以使用持续集成 (CI) 服务器，但这不是本文的主题。如前所述，本文的目的是在编写新的 Ansible Playbook 之初尽可能的快速迭代。

在编写 Ansible Playbook 之初就提交，推送到你的 Git 仓库然后等待 CI 测试的执行结果，这有点太过了，因为这个时期的错误总是很多，你需要一一个地去调试。我觉得 CI 在编写 Ansible Playbook 的后期会有用的多，尤其当多个人同时对它进行修改而且你有一整套代码质量规范要遵守的时候。不过，这只是我自己的观念，还有带讨论，再重申一遍，我不是个专业的程序员。

如果你有更好的测试 Ansible Playbook 的方案或者能对这里描述的方法做出一些改进，请告诉我。你可以把它写到留言框中或者通过社交网络联系我，我会很高兴的。




--------------------------------------------------------------------------------

via: https://carlchenet.com/testing-ansible-playbooks-with-vagrant/

作者：[Carl Chenet][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://carlchenet.com
[1]:https://www.linuxjobs.fr
[2]:https://www.journalduhacker.net
[3]:https://gitlab.com/chaica/feed2toot
[4]:https://gitlab.com/chaica/feed2tweet
[5]:https://www.virtualbox.org/
[6]:https://www.vagrantup.com/
[7]:https://www.debian.org
[8]:https://wiki.debian.org/VirtualBox
[9]:https://carlchenet.com/wp-content/uploads/2017/12/virtualbox-150x150.png
[10]:https://carlchenet.com/wp-content/uploads/2017/12/vagrant-300x98.png
