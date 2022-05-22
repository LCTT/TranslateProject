[#]: subject: (Set up network parental controls on a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/3/raspberry-pi-parental-control)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13216-1.html)

在树莓派上设置家庭网络的家长控制
======

> 用最少的时间和金钱投入，就能保证孩子上网安全。

![Family learning and reading together at night in a room][1]

家长们一直在寻找保护孩子们上网的方法，从防止恶意软件、横幅广告、弹出窗口、活动跟踪脚本和其他问题，到防止他们在应该做功课的时候玩游戏和看 YouTube。许多企业使用工具来规范员工的网络安全和活动，但问题是如何在家里实现这一点？

简短的答案是一台小巧、廉价的树莓派电脑，它可以让你为孩子和你在家的工作设置<ruby>家长控制<rt>parental controls</rt></ruby>。本文将引导你了解使用树莓派构建自己的启用了家长控制功能的家庭网络有多么容易。

### 安装硬件和软件

对于这个项目，你需要一个树莓派和一个家庭网络路由器。如果你在线购物网站花上 5 分钟浏览，就可以发现很多选择。[树莓派 4][2] 和 [TP-Link 路由器][3] 是初学者的好选择。

有了网络设备和树莓派后，你需要在 Linux 容器或者受支持的操作系统中安装 [Pi-hole][4]。有几种 [安装方法][5]，但一个简单的方法是在你的树莓派上执行以下命令：

```
curl -sSL https://install.pi-hole.net | bash
```

### 配置 Pi-hole 作为你的 DNS 服务器

接下来，你需要在路由器和 Pi-hole 中配置 DHCP 设置：

  1. 禁用路由器中的 DHCP 服务器设置
  2. 在 Pi-hole 中启用 DHCP 服务器

每台设备都不一样，所以我没有办法告诉你具体需要点击什么来调整设置。一般来说，你可以通过浏览器访问你家的路由器。你的路由器的地址有时会印在路由器的底部，它以 192.168 或 10 开头。

在浏览器中，打开你的路由器的地址，并用你的凭证登录。它通常是简单的 `admin` 和一个数字密码（有时这个密码也打印在路由器上）。如果你不知道登录名，请打电话给你的供应商并询问详情。

在图形界面中，寻找你的局域网内关于 DHCP 的部分，并停用 DHCP 服务器。 你的路由器界面几乎肯定会与我的不同，但这是一个我设置的例子。取消勾选 **DHCP 服务器**：

![Disable DHCP][6]

接下来，你必须在 Pi-hole 上激活 DHCP 服务器。如果你不这样做，除非你手动分配 IP 地址，否则你的设备将无法上网！

### 让你的网络适合家庭

设置完成了。现在，你的网络设备（如手机、平板电脑、笔记本电脑等）将自动找到树莓派上的 DHCP 服务器。然后，每个设备将被分配一个动态 IP 地址来访问互联网。

注意：如果你的路由器设备支持设置 DNS 服务器，你也可以在路由器中配置 DNS 客户端。客户端将把 Pi-hole 作为你的 DNS 服务器。

要设置你的孩子可以访问哪些网站和活动的规则，打开浏览器进入 Pi-hole 管理页面，`http://pi.hole/admin/`。在仪表板上，点击“Whitelist”来添加你的孩子可以访问的网页。你也可以将不允许孩子访问的网站（如游戏、成人、广告、购物等）添加到“Blocklist”。

![Pi-hole admin dashboard][8]

### 接下来是什么？

现在，你已经在树莓派上设置了家长控制，你可以让你的孩子更安全地上网，同时让他们访问经批准的娱乐选项。这也可以通过减少你的家庭串流来降低你的家庭网络使用量。更多高级使用方法，请访问 Pi-hole 的[文档][9]和[博客][10]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/raspberry-pi-parental-control

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/family_learning_kids_night_reading.png?itok=6K7sJVb1 (Family learning and reading together at night in a room)
[2]: https://www.raspberrypi.org/products/
[3]: https://www.amazon.com/s?k=tp-link+router&crid=3QRLN3XRWHFTC&sprefix=TP-Link%2Caps%2C186&ref=nb_sb_ss_ts-doa-p_3_7
[4]: https://pi-hole.net/
[5]: https://github.com/pi-hole/pi-hole/#one-step-automated-install
[6]: https://opensource.com/sites/default/files/uploads/disabledhcp.jpg (Disable DHCP)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/blocklist.png (Pi-hole admin dashboard)
[9]: https://docs.pi-hole.net/
[10]: https://pi-hole.net/blog/#page-content
