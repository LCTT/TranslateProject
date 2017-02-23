让你的 Linux 远离黑客（一）：两个安全建议
============================================================

![Keep hackers out](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/security-webinar.jpg?itok=af6QqiAm "Keep hackers out") 

> 在本系列中，我们将介绍五种将黑客拒之门外的最简单的方法。请观看免费网络研讨会以了解更多信息。 

[Creative Commons Zero] [1] Pixabay

在互联网上没有什么比美味的 Linux 机器让黑客更喜欢的了。在最近的 Linux 基金会网络研讨会中，我分享了黑客用来侵入的战术、工具和方法。

在这个系列的博文中，我们将介绍五种将黑客拒之门外的最简单的方法，并知道他们是否已经侵入。想要了解更多信息？请[观看免费的网络研讨会点播][4]。

### 简单的 Linux 安全提示 #1

**如果你没有在使用安全 shell，你应该取使用它。**

这是一个有非常非常长时间的提示了。Telnet 是不安全的。 rLogin 是不安全的。仍然有服务需要这些，但它们不应该暴露在互联网上。如果你没有 SSH ，那就关闭互联网连接。我们总是说：使用 SSH 密钥。

SSH 规则 1：不要使用密码认证。SSH 规则 2：不要使用密码认证。SSH 规则 3：不要使用密码认证。重要的事情重复三遍。

如果你有一台 Linux 机器在互联网上，不管时间长短，你总是面临暴力破解。肯定会这样的。暴力破解用的是脚本。扫描器只要看到对互联网开放的端口 22，它们就会攻击它。

你可以做的另一件事是修改 SSH 的标准端口，我们许多人都这么做。这可以防止少量的暴力攻击，但是，一般来说，不使用密码认证，你会更安全。

SSH 的第四条规则：所有密钥都要设置密码。无密码密钥根本就不是真正的密钥。我知道如果你想要自动登录或自动化一些事情，这会使得难以处理，但所有的密钥应该有密码！

我最喜欢做的就是入侵一台主机，并找到主目录与私钥。一旦我拥有了私钥，那你就玩完了。我可以闯入使用该公钥的任何地方。

如果你有口令短语，哪怕只是一个密码，它不用是你的密钥环的长密码，但是它会使我的行为更加、更加困难。

### 简单的 Linux 安全提示 #2

**安装 Fail2ban**

我说的那些暴力攻击？fail2ban 将大大有助于你。它将自动激活 iptables 规则以阻止 SSH 到你的机器的重复尝试。把它配置好，让它不会把你关在门外或者占用太多的资源。要使用它、爱它、看着它。

它有自己的日志，所以一定要查看它们，并检查它是否在实际运行。这是一件非常重要的事情。

在[本系列的第 2 部分][5]，我会给你三个更容易的安全提示，以让黑客远离你的 Linux 机器。你也可以[现在观看完整的免费网络研讨会][6]。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-1-top-two-security-tips

作者：[Mike Guthrie][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/anch
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/security-webinarjpg
[3]:http://bit.ly/2j89ISJ
[4]:http://bit.ly/2j89ISJ
[5]:https://www.linux.com/news/webinar/2017/how-keep-hackers-out-your-linux-machine-part-2-three-more-easy-security-tips
[6]:http://bit.ly/2j89ISJ
