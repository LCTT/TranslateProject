Ring ：一个专注隐私，开源的 Skype 替代品
============================================================

![](https://mintguide.org/uploads/posts/2017-06/thumbs/1498158697_screenshot-at-2017-06-22-12-08-39.png)

**如果你对 Linux 上的 Skype 进度不满意，或者对即将[换代的、旧的（但是优秀的）Qt Skype 客户端][3]感到不快，这有一个 GNU 替代品叫 Ring。**

GNU Ring 是一个跨平台、关注隐私的交流程序，它很快得到了 FOSS 以及安全圈的注意。

就像一个 **Skype 的开源替代品**，不用背负微软 VoIP 客户端的那些东西，Ring 不仅能够做大多数 Skype 能够做的，还能以安全、让人放心的私密方式做到：

*   语音电话
*   电话会议
*   视频电话
*   即时通信

所有这些功能也可以跨设备运行。你同伴使用的是使用 Windows 版 Ring 或者 Android 版 Ring 都不重要。只要他们在 Ring 上，你就能联系他们！

Ring 通过分布式对等网络工作。这意味着它不用依赖于一个大型集中式服务器以存储你所有详细信息、通话记录和帐户信息。相反，该服务使用分布式哈希表建立通信。

[Ring 网站][9]使用端到端加密的认证（sic）、使用 X.509 证书管理身份、并且基于 RSA/AES/DTLS/SRTP 技术。

### 下载 Linux 版 Ring

你可以从项目网站或者按照下面的安装指导在 Ubuntu 上添加 Ring 的官方仓库来[下载 Linux 版 Ring][11]。这里有两个版本的客户端：KDE 版本和 GNOME 版本。

如果你运行的 Ubuntu 带有 Unity 或者 GNOME Shell，就选择 GNOME 版本。

如果你对安装感到疑惑，项目网站上有一个一个[手把手的教程][12]。

官方网站上还有直接的 Windows、macOS 和 Android 版链接。

#### 在 Ubuntu 上设置 Ring

当你安装完 Linux 版客户端后，你就能够使用了：在开始打电话前，你只需注册一个 Ring ID。

Ring 的注册不同于 Skype、Telegram 和 WhatsApp 那样。你**不必**绑定一个手机号或者邮箱。

取而代之的是 Ring 会要求你输入一个用户名（你可以任意输入），接着会分配你一个冗长的身份号码。你需要给其他 Ring 用户发送这个身份号码，那么他们可以给你打电话。

要**在 Ring 中打第一通电话**，你需要主程序的搜索栏输入联系人的 Ring ID，接着点击电话按钮拨打电话。

其他事情应该相对直接。你可以在其他设备上安装 Ring 并用你的帐户验证，这样你就不会错过任何一个电话（如果你在 Android 设备上安装，你可以扫描二维码来快速设置）。

Ring 的细节以及配置存储你家目录下的配置文件夹内的 `dring.yml` 中。

### Ring 怎么样？

这篇文章“垃圾”的部分是告诉你 Ring 怎么样：我不知道因为我不认识任何使用 Ring 的人。因此我没有机会真正使用它。

我尝试 Google 来查找 Ring 的评测，但是这是一个噩梦，因为程序的名字太普遍了（虽然我现在非常了解 Ring 视频门铃）。

_**如果你已经使用 Ring 或者你能够劝说至少一个你认识的人使用，那么记得回来分享一下关于连接质量和性能。**_

--------------------------------------------------------------------------------

via: https://mintguide.org/internet/795-ring-is-a-privacy-focused-open-source-skype-alternative.html

作者：[fabiomorales9999][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://mintguide.org/user/fabiomorales9999/
[1]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cDovL3d3dy5vbWd1YnVudHUuY28udWsvMjAxNy8wNi9za3lwZS00LTMtbGludXgtc3RvcC13b3JraW5nLWp1bHktMjAxNw%3D%3D
[2]:https://mintguide.org/
[3]:https://linux.cn/article-7606-1.html
[4]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cHM6Ly9yaW5nLmN4
[5]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cHM6Ly9yaW5nLmN4L2VuL2Rvd25sb2FkL2dudS1saW51eA%3D%3D
[6]:https://mintguide.org/engine/dude/index/leech_out.php?a%3AaHR0cHM6Ly9yaW5nLmN4L2VuL3R1dG9yaWFscy9nbnUtbGludXgjUmluZ0lE
[7]:https://mintguide.org/tools/537-crossover-run-any-windows-programs-on-linux-mint.html
[8]:https://mintguide.org/tools/537-crossover-run-any-windows-programs-on-linux-mint.html
[9]:https://ring.cx/
[10]:https://mintguide.org/
[11]:https://ring.cx/en/download/gnu-linux
[12]:https://ring.cx/en/tutorials/gnu-linux#RingID
[13]:https://mintguide.org/uploads/posts/2017-06/1498158697_screenshot-at-2017-06-22-12-08-39.png
[14]:https://mintguide.org/internet/
