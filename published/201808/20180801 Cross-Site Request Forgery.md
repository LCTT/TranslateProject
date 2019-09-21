CSRF（跨站请求伪造）简介
======
![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/understanding-csrf-cross-site-forgery_orig.jpg)

设计 Web 程序时，安全性是一个主要问题。我不是在谈论 DDoS 保护、使用强密码或两步验证。我说的是对网络程序的最大威胁。它被称为**CSRF**, 是 **Cross Site Resource Forgery** （跨站请求伪造）的缩写。

### 什么是 CSRF？

 [![csrf what is cross site forgery](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/csrf-what-is-cross-site-forgery_orig.jpg)][1] 

首先，**CSRF** 是 Cross Site Resource Forgery 的缩写。它通常发音为 “sea-surf”，也经常被称为 XSRF。CSRF 是一种攻击类型，在受害者不知情的情况下，在受害者登录的 Web 程序上执行各种操作。这些行为可以是任何事情，从简单地点赞或评论社交媒体帖子到向人们发送垃圾消息，甚至从受害者的银行账户转移资金。

### CSRF 如何工作？

**CSRF** 攻击尝试利用所有浏览器上的一个简单的常见漏洞。每次我们对网站进行身份验证或登录时，会话 cookie 都会存储在浏览器中。因此，每当我们向网站提出请求时，这些 cookie 就会自动发送到服务器，服务器通过匹配与服务器记录一起发送的 cookie 来识别我们。这样就知道是我们了。

 [![cookies set by website chrome](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/cookies-set-by-website-chrome_orig.jpg)][2] 

这意味着我将在知情或不知情的情况下发出请求。由于 cookie 也被发送并且它们将匹配服务器上的记录，服务器认为我在发出该请求。
​
CSRF 攻击通常以链接的形式出现。我们可以在其他网站上点击它们或通过电子邮件接收它们。单击这些链接时，会向服务器发出不需要的请求。正如我之前所说，服务器认为我们发出了请求并对其进行了身份验证。

#### 一个真实世界的例子

为了把事情看得更深入，想象一下你已登录银行的网站。并在 **yourbank.com/transfer** 上填写表格。你将接收者的帐号填写为 1234，填入金额 5,000 并单击提交按钮。现在，我们将有一个 **yourbank.com/transfer/send?to=1234&amount=5000** 的请求。因此服务器将根据请求进行操作并转账。现在想象一下你在另一个网站上，然后点击一个链接，用黑客的帐号作为参数打开上面的 URL。这笔钱现在会转账给黑客，服务器认为你做了交易。即使你没有。

 [![csrf hacking bank account](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/csrf-hacking-bank-account_orig.jpg)][3] 

#### CSRF 防护

CSRF 防护非常容易实现。它通常将一个称为  CSRF 令牌的令牌发送到网页。每次发出新请求时，都会发送并验证此令牌。因此，向服务器发出的恶意请求将通过 cookie 身份验证，但 CSRF 验证会失败。大多数 Web 框架为防止 CSRF 攻击提供了开箱即用的支持，而 CSRF 攻击现在并不像以前那样常见。

### 总结

CSRF 攻击在 10 年前是一件大事，但如今我们看不到太多。过去，Youtube、纽约时报和 Netflix 等知名网站都容易受到 CSRF 的攻击。然而，CSRF 攻击的普遍性和发生率最近有减少。尽管如此，CSRF 攻击仍然是一种威胁，重要的是，你要保护自己的网站或程序免受攻击。


--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/understanding-csrf-cross-site-request-forgery

作者：[linuxandubuntu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/csrf-what-is-cross-site-forgery_orig.jpg
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/cookies-set-by-website-chrome_orig.jpg
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/csrf-hacking-bank-account_orig.jpg
