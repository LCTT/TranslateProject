4 个提高你在 Thunderbird 上隐私的加载项
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/tb-privacy-addons-816x345.jpg)

Thunderbird 是由 [Mozilla][1] 开发的流行的免费电子邮件客户端。与 Firefox 类似，Thunderbird 提供了大量加载项来用于额外功能和自定义。本文重点介绍四个加载项，以改善你的隐私。

### Enigmail

使用 GPG（GNU Privacy Guard）加密电子邮件是保持其内容私密性的最佳方式。如果你不熟悉 GPG，请[查看我们在这里的入门介绍][2]。

[Enigmail][3] 是使用 OpenPGP 和 Thunderbird 的首选加载项。实际上，Enigmail 与 Thunderbird 集成良好，可让你加密、解密、数字签名和验证电子邮件。

### Paranoia

[Paranoia][4] 可让你查看有关收到的电子邮件的重要信息。用一个表情符号显示电子邮件在到达收件箱之前经过的服务器之间的加密状态。

黄色、快乐的表情告诉你所有连接都已加密。蓝色、悲伤的表情意味着有一个连接未加密。最后，红色的、害怕的表情表示在多个连接上该消息未加密。

还有更多有关这些连接的详细信息，你可以用来检查哪台服务器用于投递邮件。

### Sensitivity Header

[Sensitivity Header][5] 是一个简单的加载项，可让你选择外发电子邮件的隐私级别。使用选项菜单，你可以选择敏感度：正常、个人、隐私和机密。

添加此标头不会为电子邮件添加额外的安全性。但是，某些电子邮件客户端或邮件传输/用户代理（MTA/MUA）可以使用此标头根据敏感度以不同方式处理邮件。

请注意，开发人员将此加载项标记为实验性的。

### TorBirdy

如果你真的担心自己的隐私，[TorBirdy][6] 就是给你设计的加载项。它将 Thunderbird 配置为使用 [Tor][7] 网络。

据其[文档][8]所述，TorBirdy 为以前没有使用 Tor 的电子邮件帐户提供了少量隐私保护。

> 请记住，跟之前使用 Tor 访问的电子邮件帐户相比，之前没有使用 Tor 访问的电子邮件帐户提供**更少**的隐私/匿名/更弱的假名。但是，TorBirdy 仍然对现有帐户或实名电子邮件地址有用。例如，如果你正在寻求隐匿位置 —— 你经常旅行并且不想通过发送电子邮件来披露你的所有位置 —— TorBirdy 非常有效！

请注意，要使用此加载项，必须在系统上安装 Tor。

照片由 [Braydon Anderson][9] 在 [Unsplash][10] 上发布。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-addons-privacy-thunderbird/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://www.mozilla.org/en-US/
[2]:https://fedoramagazine.org/gnupg-a-fedora-primer/
[3]:https://addons.mozilla.org/en-US/thunderbird/addon/enigmail/
[4]:https://addons.mozilla.org/en-US/thunderbird/addon/paranoia/?src=cb-dl-users
[5]:https://addons.mozilla.org/en-US/thunderbird/addon/sensitivity-header/?src=cb-dl-users
[6]:https://addons.mozilla.org/en-US/thunderbird/addon/torbirdy/?src=cb-dl-users
[7]:https://www.torproject.org/
[8]:https://trac.torproject.org/projects/tor/wiki/torbirdy
[9]:https://unsplash.com/photos/wOHH-NUTvVc?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[10]:https://unsplash.com/search/photos/privacy?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
