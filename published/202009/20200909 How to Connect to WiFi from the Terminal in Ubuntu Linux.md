[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12629-1.html)
[#]: subject: (How to Connect to WiFi from the Terminal in Ubuntu Linux)
[#]: via: (https://itsfoss.com/connect-wifi-terminal-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Linux 终端中连接 WiFi？
======

> 在本教程中，你将学习如何在 Ubuntu 中从终端连接到无线网络。如果你在使用 Ubuntu 服务器时，无法访问常规的[桌面环境][1]，这将对你非常有帮助。

我的家用电脑主要使用桌面 Linux。我也有多台 Linux 服务器用于托管网站以及开源软件，如 [Nextcloud][2]、[Discourse][3]、Ghost、Rocket Chat 等。

我可以使用 [Linode][4] 在云端几分钟内快速部署 Linux 服务器。但最近，我在我的树莓派上安装了 [Ubuntu 服务器][5]。这是我第一次在物理设备上安装服务器，我不得不做一些额外的事情来通过命令行将 Ubuntu 服务器连接到 WiFi。

在本教程中，我将展示在 Ubuntu Linux 中使用终端连接到 WiFi 的步骤。你应该：

  * 不要害怕使用终端编辑文件。
  * 知道 wifi 接入点名称 （SSID） 和密码。

### 在 Ubuntu 中从终端连接到 WiFi

![][6]

当你使用 Ubuntu 桌面时，连接到 WiFi 是很容易的，因为你有图形用户界面，可以很容易地做到这一点。但当你使用 Ubuntu 服务器时就不一样了，因为你只能使用命令行。

Ubuntu 使用 [Netplan][7] 工具来轻松配置网络。在 Netplan 中，你可以创建一个包含网络接口描述的 YAML 文件，然后在 `netplan` 命令行工具的帮助下，生成所有需要的配置。

让我们看看如何使用 Netplan 从终端连接到无线网络。

#### 步骤 1：确定你的无线网络接口名称

有几种方法可以识别你的网络接口名称。你可以使用 `ip` 命令、过时的 `ipconfig` 命令或查看这个文件：

```
ls /sys/class/net
```

这应该会展示所有可用的网络接口（以太网、WiFi 和环回）。无线网络接口名称以 `w` 开头，通常命名类似 `wlanX`、`wlpxyz`。

```
[email protected]:~$ ls /sys/class/net
eth0 lo wlan0
```

记下这个接口名。你将在下一步使用它。

#### 步骤 2：编辑 Netplan 配置文件中的 wifi 接口详细信息

Netplan 配置文件在 `/etc/netplan` 目录下。如果你查看这个目录的内容，你应该看到类似 `01-network-manager-all.yml` 或 `50-cloud-init.yaml` 等文件。

如果是 Ubuntu 服务器，你应该有 `50-cloud-init.yaml` 文件。如果是桌面计算机，应该是 `01-network-manager-all.yml` 文件。

Linux 桌面计算机的 Network Manager 允许你选择一个无线网络。你可以在它的配置中硬编码写入 WiFi 接入点。这可以在自动掉线的情况下（比如挂起）时帮助到你。

不管是哪个文件，都可以打开编辑。我希望你对 Nano 编辑器有一点[熟悉][8]，因为 Ubuntu 预装了它。

```
sudo nano /etc/netplan/50-cloud-init.yaml
```

YAML 文件对空格、缩进和对齐方式非常敏感。不要使用制表符，在看到缩进的地方使用 4 个空格（或 2 个，以 YAML 文件中已经使用的为准）代替。

基本上，你需要添加以下几行，引号中是接入点名称（SSID） 和密码（通常）：

```
wifis:
    wlan0:
        dhcp4: true
        optional: true
        access-points:
            "SSID_name":
                password: "WiFi_password"
```

再说一次，保持我所展示的对齐方式，否则 YAML 文件不能被解析，它会抛出一个错误。

你的完整配置文件可能是这样的：

```
# This file is generated from information provided by the datasource. Changes
# to it will not persist across an instance reboot. To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
    version: 2
    wifis:
        wlan0:
            dhcp4: true
            optional: true
            access-points:
                "SSID_name":
                    password: "WiFi_password"
```

我觉得很奇怪，尽管有消息说更改不会在实例重启后保留，但它仍然可以工作。

不管怎样，用这个命令生成配置：

```
sudo netplan generate
```

现在应用它：

```
sudo netplan apply
```

如果你幸运的话，你应该连上网络。尝试 `ping` 一个网站或运行 `apt` 更新命令。

然而，事情可能不会那么顺利，你可能会看到一些错误。如果是这种情况，请尝试一些额外的步骤。

#### 可能的故障排除

当你使用 `netplan apply` 命令时，你有可能在输出中看到类似这样的错误。

```
Failed to start netplan-wpa-wlan0.service: Unit netplan-wpa-wlan0.service not found.
Traceback (most recent call last):
  File "/usr/sbin/netplan", line 23, in <module>
    netplan.main()
  File "/usr/share/netplan/netplan/cli/core.py", line 50, in main
    self.run_command()
  File "/usr/share/netplan/netplan/cli/utils.py", line 179, in run_command
    self.func()
  File "/usr/share/netplan/netplan/cli/commands/apply.py", line 46, in run
    self.run_command()
  File "/usr/share/netplan/netplan/cli/utils.py", line 179, in run_command
    self.func()
  File "/usr/share/netplan/netplan/cli/commands/apply.py", line 173, in command_apply
    utils.systemctl_networkd('start', sync=sync, extra_services=netplan_wpa)
  File "/usr/share/netplan/netplan/cli/utils.py", line 86, in systemctl_networkd
    subprocess.check_call(command)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['systemctl', 'start', '--no-block', 'systemd-networkd.service', 'netplan-wpa-wlan0.service']' returned non-zero exit status 5.
```

可能是 `wpa_supplicant` 服务没有运行。运行这个命令：

```
sudo systemctl start wpa_supplicant
```

再次运行 `netplan apply`。如果它能解决这个问题，那就太好了。否则，使用下面的命令[关闭 Ubuntu 系统][9]：

```
shutdown now
```

重新启动 Ubuntu 系统，登录并再次生成和运行 `netplan apply`：

```
sudo netplan generate
sudo netplan apply
```

现在可能会显示警告（而不是错误）。这是警告而不是错误。我检查了[正在运行的 systemd 服务][10]，发现 `netplan-wpa-wlan0.service` 已经在运行了。可能是因为它已经在运行了，而且 `netplan apply` 更新了配置文件（即使没有任何改变），所以显示了警告。

```
Warning: The unit file, source configuration file or drop-ins of netplan-wpa-wlan0.service changed on disk. Run 'systemctl daemon-reload' to reload units.
```

这并不重要，你可以通过运行 `apt update` 来检查网络是否已经正常工作。

我希望你能够在本教程的帮助下，在 Ubuntu 中使用命令行连接到 WiFi。如果你仍然遇到困难，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/connect-wifi-terminal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-desktop-environment/
[2]: https://itsfoss.com/nextcloud/
[3]: https://www.discourse.org/
[4]: https://itsfoss.com/recommends/linode/
[5]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/connect-to-wifi-from-terminal-ubuntu.png?resize=800%2C450&ssl=1
[7]: https://netplan.io/
[8]: https://itsfoss.com/nano-editor-guide/
[9]: https://itsfoss.com/schedule-shutdown-ubuntu/
[10]: https://linuxhandbook.com/systemd-list-services/
