在 Ubuntu 中用 UFW 配置防火墙
============================================================

UFW，即简单防火墙（uncomplicated firewall），是一个 Arch Linux、Debian 或 Ubuntu 中管理防火墙规则的前端。 UFW 通过命令行使用（尽管它有可用的 GUI），它的目的是使防火墙配置简单（即不复杂（uncomplicated））。

![How to Configure a Firewall with UFW](https://www.linode.com/docs/assets/ufw_tg.png "How to Configure a Firewall with UFW") 

### 开始之前

1、 熟悉我们的[入门][1]指南，并完成设置服务器主机名和时区的步骤。

2、 本指南将尽可能使用 `sudo`。 在完成[保护你的服务器][2]指南的章节，创建一个标准用户帐户，强化 SSH 访问和移除不必要的网络服务。 **但不要**跟着创建防火墙部分 - 本指南是介绍使用 UFW 的，它对于 iptables 而言是另外一种控制防火墙的方法。

3、 更新系统

**Arch Linux**
```
sudo pacman -Syu
```
**Debian / Ubuntu**
```
sudo apt-get update && sudo apt-get upgrade
```
### 安装 UFW

UFW 默认包含在 Ubuntu 中，但在 Arch 和 Debian 中需要安装。 Debian 将自动启用 UFW 的 systemd 单元，并使其在重新启动时启动，但 Arch 不会。 这与告诉 UFW 启用防火墙规则不同，因为使用 systemd 或者 upstart 启用 UFW 仅仅是告知 init 系统打开 UFW 守护程序。

默认情况下，UFW 的规则集为空，因此即使守护程序正在运行，也不会强制执行任何防火墙规则。 强制执行防火墙规则集的部分[在下面][3]。

#### Arch Linux

1、  安装 UFW：

```
sudo pacman -S ufw
```

2、 启动并启用 UFW 的 systemd 单元：

```
sudo systemctl start ufw
sudo systemctl enable ufw
```

#### Debian / Ubuntu

1、  安装 UFW

```
sudo apt-get install ufw
```

### 使用 UFW 管理防火墙规则

#### 设置默认规则

大多数系统只需要打开少量的端口接受传入连接，并且关闭所有剩余的端口。 从一个简单的规则基础开始，`ufw default`命令可以用于设置对传入和传出连接的默认响应动作。 要拒绝所有传入并允许所有传出连接，那么运行：

```
sudo ufw default allow outgoing
sudo ufw default deny incoming
```

`ufw default` 也允许使用 `reject` 参数。

> 警告：

> 除非明确设置允许规则，否则配置默认 `deny` 或 `reject` 规则会锁定你的服务器。确保在应用默认 `deny` 或 `reject` 规则之前，已按照下面的部分配置了 SSH 和其他关键服务的允许规则。

#### 添加规则

可以有两种方式添加规则：用**端口号**或者**服务名**表示。

要允许 SSH 的 22 端口的传入和传出连接，你可以运行：

```
sudo ufw allow ssh
```

你也可以运行：

```
sudo ufw allow 22
```
 
相似的，要在特定端口（比如 111）上 `deny` 流量，你需要运行：

```
sudo ufw deny 111
```
 
为了更好地调整你的规则，你也可以允许基于 TCP 或者 UDP 的包。下面例子会允许 80 端口的 TCP 包：

```
sudo ufw allow 80/tcp
sudo ufw allow http/tcp
```
 
这个会允许 1725 端口上的 UDP 包：

```
sudo ufw allow 1725/udp
```
 
#### 高级规则

除了基于端口的允许或阻止，UFW 还允许您按照 IP 地址、子网和 IP 地址/子网/端口的组合来允许/阻止。

允许从一个 IP 地址连接：

```
sudo ufw allow from 123.45.67.89
```
 
允许特定子网的连接：

```
sudo ufw allow from 123.45.67.89/24
```
 
允许特定 IP/ 端口的组合：

```
sudo ufw allow from 123.45.67.89 to any port 22 proto tcp
```

`proto tcp` 可以删除或者根据你的需求改成 `proto udp`，所有例子的 `allow` 都可以根据需要变成 `deny`。

#### 删除规则

要删除一条规则，在规则的前面加上 `delete`。如果你希望不再允许 HTTP 流量，你可以运行：

```
sudo ufw delete allow 80
```
 
删除规则同样可以使用服务名。

### 编辑 UFW 的配置文件

虽然可以通过命令行添加简单的规则，但仍有可能需要添加或删除更高级或特定的规则。 在运行通过终端输入的规则之前，UFW 将运行一个文件 `before.rules`，它允许回环接口、ping 和 DHCP 等服务。要添加或改变这些规则，编辑 `/etc/ufw/before.rules` 这个文件。 同一目录中的 `before6.rules` 文件用于 IPv6 。

还存在一个 `after.rule` 和 `after6.rule` 文件，用于添加在 UFW 运行你通过命令行输入的规则之后需要添加的任何规则。

还有一个配置文件位于 `/etc/default/ufw`。 从此处可以禁用或启用 IPv6，可以设置默认规则，并可以设置 UFW 以管理内置防火墙链。

### UFW 状态

你可以在任何时候使用命令：`sudo ufw status` 查看 UFW 的状态。这会显示所有规则列表，以及 UFW 是否处于激活状态：

```
Status: active

To                         Action      From
--                         ------      ----
22                         ALLOW       Anywhere
80/tcp                     ALLOW       Anywhere
443                        ALLOW       Anywhere
22 (v6)                    ALLOW       Anywhere (v6)
80/tcp (v6)                ALLOW       Anywhere (v6)
443 (v6)                   ALLOW       Anywhere (v6)
```
 
### 启用防火墙

随着你选择规则完成，你初始运行 `ufw status` 可能会输出 `Status: inactive`。 启用 UFW 并强制执行防火墙规则：

```
sudo ufw enable
```
 
相似地，禁用 UFW 规则：

```
sudo ufw disable
```

> UFW 会继续运行，并且在下次启动时会再次启动。

### 日志记录

你可以用下面的命令启动日志记录：

```
sudo ufw logging on
```

可以通过运行 `sudo ufw logging low|medium|high` 设计日志级别，可以选择 `low`、 `medium` 或者 `high`。默认级别是 `low`。

常规日志类似于下面这样，位于 `/var/logs/ufw`：

```
Sep 16 15:08:14 <hostname> kernel: [UFW BLOCK] IN=eth0 OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:00:00 SRC=123.45.67.89 DST=987.65.43.21 LEN=40 TOS=0x00 PREC=0x00 TTL=249 ID=8475 PROTO=TCP SPT=48247 DPT=22 WINDOW=1024 RES=0x00 SYN URGP=0
```
 
前面的值列出了你的服务器的日期、时间、主机名。剩下的重要信息包括：

* **[UFW BLOCK]**：这是记录事件的描述开始的位置。在此例中，它表示阻止了连接。
* **IN**：如果它包含一个值，那么代表该事件是传入事件
* **OUT**：如果它包含一个值，那么代表事件是传出事件
* **MAC**：目的地和源 MAC 地址的组合
* **SRC**：包源的 IP
* **DST**：包目的地的 IP
* **LEN**：数据包长度
* **TTL**：数据包 TTL，或称为 time to live。 在找到目的地之前，它将在路由器之间跳跃，直到它过期。
* **PROTO**：数据包的协议
* **SPT**：包的源端口
* **DPT**：包的目标端口
* **WINDOW**：发送方可以接收的数据包的大小
* **SYN URGP**：指示是否需要三次握手。 `0` 表示不需要。

--------------------------------------------------------------------------------

via: https://www.linode.com/docs/security/firewalls/configure-firewall-with-ufw

作者：[Linode][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linode.com/docs/security/firewalls/configure-firewall-with-ufw
[1]:https://www.linode.com/docs/getting-started
[2]:https://www.linode.com/docs/security/securing-your-server
[3]:http://localhost:4567/docs/security/firewalls/configure-firewall-with-ufw#enable-the-firewall
