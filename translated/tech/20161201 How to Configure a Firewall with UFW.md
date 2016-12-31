如何用UFW配置防火墙
============================================================

UFW或者称之为_uncomplicated firewall_，是一个Arch Linux、Debian或Ubuntu中管理防火墙规则的前端。 UFW通过命令行使用（尽管它有可用的GUI），它的目的是使防火墙配置简单（或不复杂）。

 ![How to Configure a Firewall with UFW](https://www.linode.com/docs/assets/ufw_tg.png "How to Configure a Firewall with UFW") 

### 开始之前

1. 熟悉我们的[入门][1]指南，并完成设置Linode主机名和时区的步骤。

2. 本指南将尽可能使用`sudo`。 完成[保护你的服务器][2]指南的部分创建一个标准用户帐户，加强SSH访问和删除不必要的网络服务。 **不要**遵循创建防火墙部分 - 本指南是介绍使用UFW的，它对于iptables而言是一个单独的控制防火墙的方法。

3. 升级系统

    **Arch Linux**

    ```
    sudo pacman -Syu
    ```


    **Debian / Ubuntu**

    ```
    sudo apt-get update && sudo apt-get upgrade
    ```


### 安装 UFW

UFW默认包含在Ubuntu中，但必须安装在Arch和Debian中。 Debian将自动启用UFW的systemd单元，并使其在重新启动时启动，但Arch不会。 _这与告诉UFW启用防火墙规则不同_，因为使用systemd或者upstart启用UFW仅告知init系统打开UFW守护程序。

默认情况下，UFW的规则集为空，因此即使守护程序正在运行，也不会强制执行任何防火墙规则。 强制执行防火墙规则集的部分[在下面][3]。

### Arch Linux

1.  安装 UFW:

    ```
    sudo pacman -S ufw
    ```
 

2.  启动并启用UFW的systemd单元:

    ```
    sudo systemctl start ufw
    sudo systemctl enable ufw
    ```

### Debian / Ubuntu

1.  安装 UFW

    ```
    sudo apt-get install ufw
    ```
 

### 使用UFW管理防火墙规则

### 设置默认规则

大多数系统只需要少量的端口打开传入连接，并且所有剩余的端口都关闭。 要一个简单的规则基础开始，`ufw default`命令可以用于设置对传入和传出连接的默认响应。 要拒绝所有传入并允许所有传出连接，那么运行：

```
sudo ufw default allow outgoing
sudo ufw default deny incoming
```
 

`ufw default`也允许使用`reject`参数。

> 除非明确允许规则，否则配置默认deny或reject规则会锁定你的Linode。确保在应用默认deny或reject规则之前，已按照下面的部分配置了SSH和其他关键服务的允许规则。

### 添加规则

可以有两种方式添加规则：用**端口号**或者**服务名**表示。

要允许SSH的22端口的传入和传出连接，你可以运行：

```
sudo ufw allow ssh
```

你也可以运行：

```
sudo ufw allow 22
```
 
相似的，要在特定端口（比如111）上**deny**流量，你需要运行：

```
sudo ufw deny 111
```
 
为了更好地调整你的规则，你也可以允许基于TCP或者UDP的包。下面例子会允许80端口的TCP包：


```
sudo ufw allow 80/tcp
sudo ufw allow http/tcp
```
 
这个会允许1725端口上的UDP包：


```
sudo ufw allow 1725/udp
```
 

### 高级规则

除了基于端口的允许或阻止，UFW还允许您通过IP地址、子网和IP地址/子网/端口组合来允许/阻止。

允许从IP地址连接：

```
sudo ufw allow from 123.45.67.89
```
 

允许特定子网的连接：

```
sudo ufw allow from 123.45.67.89/24
```
 
允许特定IP/端口组合：

```
sudo ufw allow from 123.45.67.89 to any port 22 proto tcp
```


`proto tcp`可以删除或者根据你的需求变成`proto udp`，所有例子的`allow`都可以根据需要变成`deny`。

### 删除规则

要删除一条规则，在规则的前面加上`delete`。如果你希望不在允许HTTP流量，你可以运行：


```
sudo ufw delete allow 80
```
 
删除规则同样允许基于服务名。

### 编辑UFW的配置文件

虽然可以通过命令行添加简单的规则，但仍有可能需要添加或删除更高级或特定的规则。 在通过终端运行规则输入之前，UFW将运行一个文件`before.rules`，它允许回环、ping和DHCP。要添加或改变这些规则，编辑`/etc/ufw/before.rules`这个文件。 `before6.rules`文件也位于IPv6的同一目录中。

还存在一个`after.rule`和`after6.rule`文件，用于添加在UFW运行添加命令行规则后需要添加的任何规则。

额外的配置文件位于`/etc/default/ufw`。 从此处可以禁用或启用IPv6，可以设置默认规则，并可以设置UFW以管理内置防火墙链。

### UFW状态

你可以在任何时候使用命令：`sudo ufw status`查看UFW的状态。这会显示所有规则列表，以及UFW是否是激活状态：

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

随着你选择规则完成，你初始运行`ufw status`可能会输出`Status: inactive`。 启用UFW并强制执行防火墙规则：

```
sudo ufw enable
```
 
相似地，禁用UFW规则：

```
sudo ufw disable
```

> 这让UFW继续运行并且在下次启动时再次启动。

### 日志记录

你可以用下面的命令启动日志记录：

```
sudo ufw logging on
```

可以通过运行`sudo ufw logging low|medium|high`设计日志级别，可以选择`low`、 `medium` 或者 `high`。默认级别是`low`。

常规日志类似于下面这样，位于`/var/logs/ufw`：

```
Sep 16 15:08:14 <hostname> kernel: [UFW BLOCK] IN=eth0 OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:00:00 SRC=123.45.67.89 DST=987.65.43.21 LEN=40 TOS=0x00 PREC=0x00 TTL=249 ID=8475 PROTO=TCP SPT=48247 DPT=22 WINDOW=1024 RES=0x00 SYN URGP=0
```
 

初始的值有你的Linode的日期、时间、主机名。额外的信息包括：

* ** [UFW BLOCK]：**此位置是记录事件的描述所在的位置。在这种例子中，它阻止了连接。

* ** IN：**如果这包含一个值，那么事件传入的

* ** OUT：**如果这包含一个值，那么事件是传出的

* ** MAC：**目的地和源MAC地址的组合

* ** SRC：**包源的IP

* ** DST：**包目的地的IP

* ** LEN：**数据包长度

* ** TTL：**数据包TTL，或称为_time to live_。 如果没有找到目的地，它将在路由器之间跳跃，直到它过期。

* ** PROTO：**数据包的协议

* ** SPT：**包的源端口

* ** DPT：**包的目标端口

* ** WINDOW：**发送方可以接收的数据包的大小

* ** SYN URGP：**指示是否需要三次握手。 `0`表示不是。

--------------------------------------------------------------------------------

via: https://www.linode.com/docs/security/firewalls/configure-firewall-with-ufw

作者：[Linode ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linode.com/docs/security/firewalls/configure-firewall-with-ufw
[1]:https://www.linode.com/docs/getting-started
[2]:https://www.linode.com/docs/security/securing-your-server
[3]:http://localhost:4567/docs/security/firewalls/configure-firewall-with-ufw#enable-the-firewall
