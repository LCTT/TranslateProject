小技巧：检查你本地及公共 IP 地址
===================

**你本地的 IP 地址：** **192.168.1.100**

上面是分配给你计算机上的内部硬件或虚拟网卡的本地/私有 IP 地址。根据你的 LAN 配置，上述 IP 地址可能是静态或动态的。

**如果你找不到上述任何地址，请在 Linux 上执行 `ifconfig` 或 `ip` 命令手动检查内部 IP 地址：**

```
# ifconfig | grep -w inet | awk '{ print $2}'
或者
# ip a s | grep -w inet | awk '{ print $2}'
```

**你公共的 IP 地址是：** **123.115.72.251**

上述地址是你的 Internet 服务提供商（ISP）为你分配的公共/外部 IP 地址。根据你与 ISP 的计划，它可能是动态的，这意味着它会在每次重启路由器后改变，它也可能是静态的，这意味着它将永远不会改变。

**如果你找不到上述任何地址，请在 Linux上 执行 `wget` 或 `curl` 命令手动检查你的公共IP地址：**

```
# echo $(wget -qO - https://api.ipify.org)
或者
# echo $(curl -s https://api.ipify.org)
```

--------------------------------------------------------------------------------

via: https://linuxconfig.org/check-your-local-and-public-ip-address

作者：[Lubos Rendek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/check-your-local-and-public-ip-address
