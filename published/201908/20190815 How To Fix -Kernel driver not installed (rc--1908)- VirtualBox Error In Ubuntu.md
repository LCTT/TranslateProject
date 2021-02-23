[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11283-1.html)
[#]: subject: (How To Fix “Kernel driver not installed (rc=-1908)” VirtualBox Error In Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-fix-kernel-driver-not-installed-rc-1908-virtualbox-error-in-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

如何在 Ubuntu 中修复 VirtualBox 的 “Kernel driver not installed (rc=-1908)” 错误
======

我使用 Oracle VirtualBox 来测试各种 Linux 和 Unix 发行版。到目前为止，我已经在 VirtualBox 中测试了上百个虚拟机。今天，我在我的 Ubuntu 18.04 桌面上启动了 Ubuntu 18.04 服务器版虚拟机，我收到了以下错误。

```
Kernel driver not installed (rc=-1908)

The VirtualBox Linux kernel driver (vboxdrv) is either not loaded or there is a permission problem with /dev/vboxdrv. Please reinstall virtualbox-dkms package and load the kernel module by executing

'modprobe vboxdrv'

as root.

where: suplibOsInit what: 3 VERR_VM_DRIVER_NOT_INSTALLED (-1908) - The support driver is not installed. On linux, open returned ENOENT.
```

![][2]

*Ubuntu 中的 “Kernel driver not installed (rc=-1908)” 错误*

我点击了 OK 关闭消息框，然后在后台看到了另一条消息。

```
Failed to open a session for the virtual machine Ubuntu 18.04 LTS Server.

The virtual machine 'Ubuntu 18.04 LTS Server' has terminated unexpectedly during startup with exit code 1 (0x1).

Result Code:
NS_ERROR_FAILURE (0x80004005)
Component:
MachineWrap
Interface:
IMachine {85cd948e-a71f-4289-281e-0ca7ad48cd89}
```

![][3]

*启动期间虚拟机意外终止，退出代码为 1（0x1）*

我不知道该先做什么。我运行以下命令来检查是否有用。

```
$ sudo modprobe vboxdrv
```

我收到了这个错误：

```
modprobe: FATAL: Module vboxdrv not found in directory /lib/modules/5.0.0-23-generic
```

仔细阅读这两个错误消息后，我意识到我应该更新 Virtualbox 程序。

如果你在 Ubuntu 及其衍生版（如 Linux Mint）中遇到此错误，你只需使用以下命令重新安装或更新 `virtualbox-dkms` 包：

```
$ sudo apt install virtualbox-dkms
```

或者，最好更新整个系统：

```
$ sudo apt upgrade
```

错误消失了，我可以正常在 VirtualBox 中启动虚拟机了。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-fix-kernel-driver-not-installed-rc-1908-virtualbox-error-in-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2019/08/Kernel-driver-not-installed-virtualbox-ubuntu.png
[3]: https://www.ostechnix.com/wp-content/uploads/2019/08/The-virtual-machine-has-terminated-unexpectedly-during-startup-with-exit-code-1-0x1.png
[4]: https://www.ostechnix.com/solve-result-code-ns_error_failure-0x80004005-virtualbox-error-arch-linux/
