[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12912-1.html)
[#]: subject: (Getting started with Fedora CoreOS)
[#]: via: (https://fedoramagazine.org/getting-started-with-fedora-coreos/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

Fedora CoreOS 入门
======

![Fedora CoreOS入门][1]

现在被称为 DevOps 时代，操作系统的关注度似乎比工具要低一些。然而，这并不意味着操作系统没有创新。（编辑注：基于 Linux 内核的众多发行版所提供的多样化产品就是一个很好的例子）。[Fedora CoreOS][4] 就对这个 DevOps 时代的操作系统应该是什么样有着独特的理念。

### Fedora CoreOS 的理念

Fedora CoreOS（FCOS）是由 CoreOS Container Linux 和 Fedora Atomic Host 合并而来。它是一个专注于运行容器化应用程序的精简的独体操作系统。安全性是首要重点，FCOS 提供了自动更新，并带有 SELinux 强化。

为了使自动更新能够很好地工作，它们需要非常健壮，目标是运行 FCOS 的服务器在更新后不会崩溃。这是通过使用不同的发布流（stable、testing 和 next）来实现的。每个流每 2 周发布一次，更新内容会从一个流推广到另一个流（next -> testing -> stable）。这样落地在 stable 流中的更新就有机会经过长时间的测试。
 
### 入门

对于这个例子，让我们使用 stable 流和一个 QEMU 基础镜像，我们可以作为一个虚拟机运行。你可以使用 [coreos-installer][5] 来下载该镜像。
 
在你的（Workstation）终端上，更新镜像的链接后，运行以下命令（编辑注：在 Silverblue 上，基于容器的 coreos 工具是最简单的方法，可以尝试一下。说明可以在 <https://docs.fedoraproject.org/en-US/fedora-coreos/tutorial-setup/> 中找到，特别是 “Setup with Podman or Docker” 一节。）：

```
$ sudo dnf install coreos-installer
$ coreos-installer download --image-url https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/32.20200907.3.0/x86_64/fedora-coreos-32.20200907.3.0-qemu.x86_64.qcow2.xz
$ xz -d fedora-coreos-32.20200907.3.0-qemu.x86_64.qcow2.xz
$ ls
fedora-coreos-32.20200907.3.0-qemu.x86_64.qcow2
```

#### 创建一个配置

要定制一个 FCOS 系统，你需要提供一个配置文件，[Ignition][6] 将使用这个文件来配置系统。你可以用这个文件来配置诸如创建用户、添加受信任的 SSH 密钥、启用 systemd 服务等等。

以下配置创建了一个 `core` 用户，并在 `authorized_keys` 文件中添加了一个 SSH 密钥。它还创建了一个 systemd 服务，使用 [podman][7] 来运行一个简单的 “hello world” 容器：

```
version: "1.0.0"
variant: fcos
passwd:
  users:
    - name: core
      ssh_authorized_keys:
        - ssh-ed25519 my_public_ssh_key_hash fcos_key
systemd:
  units:
    -
      contents: |
          [Unit]
          Description=Run a hello world web service
          After=network-online.target
          Wants=network-online.target
          [Service]
          ExecStart=/bin/podman run --pull=always   --name=hello --net=host -p 8080:8080 quay.io/cverna/hello
          ExecStop=/bin/podman rm -f hello
          [Install]
          WantedBy=multi-user.target
      enabled: true
      name: hello.service
```

在配置中加入你的 SSH 密钥后，将其保存为 `config.yaml`。接下来使用 Fedora CoreOS Config Transpiler（`fcct`）工具将这个 YAML 配置转换成有效的 Ignition 配置（JSON 格式）。

直接从 Fedora 的资源库中安装 `fcct`，或者从 [GitHub][8] 中获取二进制文件：

```
$ sudo dnf install fcct
$ fcct -output config.ign config.yaml
```

#### 安装并运行 Fedora CoreOS

要运行镜像，你可以使用 libvirt 堆栈。要在 Fedora 系统上使用 `dnf` 软件包管理器安装它：

```
$ sudo dnf install @virtualization
```

现在让我们创建并运行一个 Fedora CoreOS 虚拟机：

```
$ chcon --verbose unconfined_u:object_r:svirt_home_t:s0 config.ign
$ virt-install --name=fcos \
--vcpus=2 \
--ram=2048 \
--import \
--network=bridge=virbr0 \
--graphics=none \
--qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=${PWD}/config.ign" \
--disk=size=20,backing_store=${PWD}/fedora-coreos-32.20200907.3.0-qemu.x86_64.qcow2
```

安装成功后，会显示一些信息并提供登录提示符：

```
Fedora CoreOS 32.20200907.3.0
Kernel 5.8.10-200.fc32.x86_64 on an x86_64 (ttyS0)
SSH host key: SHA256:BJYN7AQZrwKZ7ZF8fWSI9YRhI++KMyeJeDVOE6rQ27U (ED25519)
SSH host key: SHA256:W3wfZp7EGkLuM3z4cy1ZJSMFLntYyW1kqAqKkxyuZrE (ECDSA)
SSH host key: SHA256:gb7/4Qo5aYhEjgoDZbrm8t1D0msgGYsQ0xhW5BAuZz0 (RSA)
ens2: 192.168.122.237 fe80::5054:ff:fef7:1a73
Ignition: user provided config was applied
Ignition: wrote ssh authorized keys file for user: core
```

Ignition 配置文件没有为 `core` 用户提供任何密码，因此无法通过控制台直接登录。（不过，也可以通过 Ignition 配置为用户配置密码。）

使用 `Ctrl + ]` 组合键退出虚拟机的控制台。然后检查 `hello.service` 是否在运行：

```
$ curl http://192.168.122.237:8080
Hello from Fedora CoreOS!
```

使用预先配置的 SSH 密钥，你还可以访问虚拟机并检查其上运行的服务：

```
$ ssh core@192.168.122.237
$ systemctl status hello
● hello.service - Run a hello world web service
Loaded: loaded (/etc/systemd/system/hello.service; enabled; vendor preset: enabled)
Active: active (running) since Wed 2020-10-28 10:10:26 UTC; 42s ago
```

#### zincati、rpm-ostree 和自动更新

zincati 服务使用自动更新驱动 rpm-ostreed。

检查虚拟机上当前运行的 Fedora CoreOS 版本，并检查 zincati 是否找到了更新：

```
$ ssh core@192.168.122.237
$ rpm-ostree status
State: idle
Deployments:
● ostree://fedora:fedora/x86_64/coreos/stable
Version: 32.20200907.3.0 (2020-09-23T08:16:31Z)
Commit: b53de8b03134c5e6b683b5ea471888e9e1b193781794f01b9ed5865b57f35d57
GPGSignature: Valid signature by 97A1AE57C3A2372CCA3A4ABA6C13026D12C944D0
$ systemctl status zincati
● zincati.service - Zincati Update Agent
Loaded: loaded (/usr/lib/systemd/system/zincati.service; enabled; vendor preset: enabled)
Active: active (running) since Wed 2020-10-28 13:36:23 UTC; 7s ago
…
Oct 28 13:36:24 cosa-devsh zincati[1013]: [INFO ] initialization complete, auto-updates logic enabled
Oct 28 13:36:25 cosa-devsh zincati[1013]: [INFO ] target release '32.20201004.3.0' selected, proceeding to stage it

... zincati reboot ...
```

重启后，我们再远程登录一次，检查新版的 Fedora CoreOS：

```
$ ssh core@192.168.122.237
$ rpm-ostree status
State: idle
Deployments:
● ostree://fedora:fedora/x86_64/coreos/stable
Version: 32.20201004.3.0 (2020-10-19T17:12:33Z)
Commit: 64bb377ae7e6949c26cfe819f3f0bd517596d461e437f2f6e9f1f3c24376fd30
GPGSignature: Valid signature by 97A1AE57C3A2372CCA3A4ABA6C13026D12C944D0
ostree://fedora:fedora/x86_64/coreos/stable
Version: 32.20200907.3.0 (2020-09-23T08:16:31Z)
Commit: b53de8b03134c5e6b683b5ea471888e9e1b193781794f01b9ed5865b57f35d57
GPGSignature: Valid signature by 97A1AE57C3A2372CCA3A4ABA6C13026D12C944D0
```

`rpm-ostree status` 现在显示了两个版本的 Fedora CoreOS，一个是 QEMU 镜像中的版本，一个是更新后的最新版本。有了这两个版本，就可以使用 `rpm-ostree rollback` 命令回滚到之前的版本。

最后，你可以确保 hello 服务仍在运行并提供内容：

```
$ curl http://192.168.122.237:8080
Hello from Fedora CoreOS!
```

更多信息参见：[Fedora CoreOS 更新][9]。

#### 删除虚拟机

要进行事后清理，使用以下命令删除虚拟机和相关存储：

```
$ virsh destroy fcos
$ virsh undefine --remove-all-storage fcos
```

### 结论

Fedora CoreOS 为在容器中运行应用程序提供了一个坚实而安全的操作系统。它在推荐主机使用声明式配置文件进行配置的 DevOps 环境中表现出色。自动更新和回滚到以前版本的操作系统的能力，可以在服务的运行过程中带来安心的感觉。

通过关注项目[文档][10]中的教程，了解更多关于 Fedora CoreOS 的信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-fedora-coreos/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/fcos-gettingstarted-1-816x345.jpg
[2]: https://unsplash.com/@pawel_czerwinski?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/core?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://getfedora.org/coreos/
[5]: https://github.com/coreos/coreos-installer/releases
[6]: https://github.com/coreos/ignition
[7]: https://podman.io/
[8]: https://github.com/coreos/fcct/releases
[9]: https://docs.fedoraproject.org/en-US/fedora-coreos/auto-updates/
[10]: https://docs.fedoraproject.org/en-US/fedora-coreos/tutorials/
