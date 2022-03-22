[#]: subject: "What is port forwarding?"
[#]: via: "https://opensource.com/article/21/9/what-port-forwarding"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

什么是端口转发？
======
本文介绍了几种端口转发最常见的使用场景。
![Multi-colored and directional network computer cables][1]

端口转发就是把网络流量从一个网络监听者（称为一个“端口”）发送到另一个上，无论这两个端口是否属于同一台电脑。在这里，端口不是某个物理实体，而是一个监听网络活动的软件程序。

当流量被定向发往到某个特定的端口，它会先到达一个路由器或是防火墙，亦或是其他的网络程序。它最终收到的响应可能会根据它想要通讯的端口来定义。比如，当你使用端口转发时，你可以捕获到发往 8080 端口的流量，然后把它转发到 80 端口。对于接收信号的原端口来说，这个新的目标端口可能和它在同一台设备上，也可能是在另一台设备上。我们在很多情况下都会用到端口转发，实现的方式也有很多。本文将介绍其中最常见的几种使用场景。

### 使用路由器来进行端口转发

如果你在把服务器架设在家里，那么你通常是不需要转发端口的。你的家庭路由器（通常是你从<ruby>网络服务提供商<rt>Internet Service Provider, ISP</rt></ruby>获得的 WiFi 设备）有一个内置的防火墙，它的作用是阻止外面的世界访问到你的家庭网络。通过使用端口转发，你可以允许某个指定端口的流量穿过路由器的防火墙，并发送到局域网中的某个指定的 IP 地址。

比如说，你架设了一个 [Minetest 服务][2]，并想要邀请你的朋友们来试试。为了让他们能够“穿过”你的路由器，从而到达这个 Minetest 服务，你必须把路由器上的某个端口转发到托管 Minetest 服务的电脑上。Minetest 服务默认运行在 30000 端口。你可以把路由器的 30000 端口转发到你的电脑的 30000 端口上，或者你也可以随便转发到一个更简单的端口上，这样玩家们会更容易记住它。我发现，当使用 30000 端口的时候，人们时常会少数几个 0（特别是没有逗号分隔符的帮助时），所以我一般使用路由器的 1234 端口，然后把它转发到我内部的 30000 端口。

每个制造商的路由器接口都不一样，但是不管你用的是什么牌子的路由器，方法都是相同的。首先，你需要登录到你的路由器。
通常，路由器的 IP 地址和登录信息都会打印在路由器上，或者在是它的文档里。我有一个型号为 TP-Link GX90 的路由器，我在浏览器里访问 10.0.1.1 就可以登录它，但你的路由器可能是 192.168.0.1 或者其他的地址。

我的 GX90 路由器把端口转发功能称为“<ruby>虚拟服务器<rt>virtual servers</rt></ruby>”，它是路由器的“NAT 转发”标签下的一个功能选项。NAT 的意思是 _网络地址转换_。在其他路由器中，这个功能可能直接就叫做“端口转发”，或者叫“防火墙”、“服务”等。找到正确的功能选项可能需要花费一些时间，因此，你可能需要花点时间研究下你的路由器文档。

当你找到了路由器的端口转发设置，添加一个新规则，命名一个外部端口（在我的例子中是 1234）和一个内部端口（30000）。把外部端口转发到内部端口上，而内部端口绑定在你想要大家访问的电脑的 IP 地址上。如果你需要一些查询本机 IP 地址的帮助，你可以阅读 Archit Modi 写的 _[在 Linux 上如何查询本地 IP 地址][3]_。

![A sample port forwarding rule][4]

一个简单端口转发规则
（图片提供者是 Seth Kenlon，遵循[署名-相同方式共享 4.0 国际][5]协议）

在这个例子中，访问家庭网络的 1234 端口的流量，都会被转发到了我的家庭服务器的 30000 端口上，后者的 IP 地址是 10.0.1.2。

在继续之前，先保存这个规则。

接下来，你需要知道你的家庭网络的公网 IP 地址是多少。你可以从 [ifconfig.me][6] 或者 [icanhazip.com][7] 上获得这个地址。你可以在浏览器中打开这两个网站的其中一个，也可以使用 [curl][8] 命令来获取到这个 IP。


```
$ curl ifconfig.me
93.184.216.34
```

现在，你的朋友们就可以在 Minetest 客户端里输入 `169.169.23.49:1234`，加入你的 Minetest 服务器啦。

### 使用防火墙来进行端口转发

系统管理员有时候需要转发访问服务器的流量。比如说，你可能想要接收来自 80 端口的流量，但是用户的服务却运行在 8065 端口。如果不进行端口转发的话，你的用户就不得不在输入浏览器的 URL 末尾，加上一个指定的端口号，例如 `example.com:8065`。大多数用回都不习惯于考虑端口的问题，所以你需要把访问网络通用的 80 端口的请求拦截下来，然后转发到你的网络应用的具体端口，这会给用户带来巨大的方便。

你可以在服务器上使用 [firewall-cmd][9] 来转发流量，它是访问 `firewalld` 后台进程的<ruby>前端<rt>front-end</rt></ruby>命令。

首先，设置好你想要转发的端口和协议：


```
$ sudo firewall-cmd \
\--add-forward-port \
port=80:proto=tcp:toport=8065
```

为使修改永久生效，你需要加上 `--runtime-to-permanent` 选项：


```
`$ sudo firewall-cmd --runtime-to-permanent`
```

### 网络转发

在网络传输中，除了端口转发外，还有其他种类的<ruby>转发<rt>forwarding</rt></ruby>形式，例如 IP 转发和代理等。当你熟悉了网络信息在路由时是怎么被处理的之后，你可以试试不同的转发形式（然后使用 `tcpdump` 或类似的工具）来看看哪一种最好、最符合你的需求。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/what-port-forwarding

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connections_wires_sysadmin_cable.png?itok=d5WqHmnJ (Multi-colored and directional network computer cables)
[2]: https://opensource.com/alternatives/minecraft#minetest
[3]: https://opensource.com/article/18/5/how-find-ip-address-linux
[4]: https://opensource.com/sites/default/files/uploads/router-port-forward.jpg (A sample port forwarding rule)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: http://ifconfig.me
[7]: http://icanhazip.com
[8]: https://opensource.com/article/20/5/curl-cheat-sheet
[9]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
