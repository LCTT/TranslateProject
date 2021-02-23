[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11022-1.html)
[#]: subject: (Personal assistant with Mycroft and Fedora)
[#]: via: (https://fedoramagazine.org/personal-assistant-with-mycroft-and-fedora/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)

在 Fedora 中使用私人助理 Mycroft
======

![][1]

> 想要找个开源的私人助理么？[Mycroft][2] 可以让你运行一个开源的服务，从而更好地控制你的数据。

### 在 Fedora 上安装 Mycroft

Mycroft 目前不存在于官方软件包集合中，但它可以轻松地从源码安装。第一步是从 Mycroft 的 GitHub 仓库下载源码。

```
$ git clone https://github.com/MycroftAI/mycroft-core.git
```

Mycroft 是一个 Python 应用，它提供了一个脚本负责在安装 Mycroft 及其依赖项之前创建虚拟环境。

```
$ cd mycroft-core
$ ./dev_setup.sh
```

安装脚本会提示用户以帮助他完成安装过程。建议运行稳定版本并获取自动更新。

当提示在本地安装 Mimic 文字转语音引擎时，请回答否。因为根据安装描述，这可能需要很长时间，并且 Mimic 有适合 Fedora 的 rpm 包，因此可以使用 `dnf` 进行安装。

```
$ sudo dnf install mimic
```

### 开始使用 Mycroft

安装完成后，可以使用以下脚本启动 Mycroft 服务。

```
$ ./start-mycroft.sh all
```

要开始使用 Mycroft，需要注册运行服务的设备。因此需要一个帐户，可以在 <https://home.mycroft.ai/> 中创建。

创建帐户后，可以在 [https://account.mycroft.ai/devices][3] 中添加新设备。添加新设备需要配对码，你的设备会在所有服务启动后告诉你。

![][4]

现在可以使用该设备了。

### 使用 Mycroft

Mycroft 提供了一组默认启用的[技能][5]，它们或者可以从[市场][5]下载。刚开始，你可以简单地向 Mycroft 问好，或天气如何。

```
Hey Mycroft, how are you ?

Hey Mycroft, what's the weather like ?
```

如果你对它是如何工作的感兴趣，`start-mycroft.sh` 脚本提供了一个命令行选项，它能让你使用命令行交互。它也会显示用于调试的有用信息。

Mycroft 总在学习新技能，并且有很多方法给 Mycroft 社区做[贡献][6]。

由 [Przemyslaw Marczynski][7] 摄影，发布于 [Unsplash][8]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/personal-assistant-with-mycroft-and-fedora/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/mycroft-816x345.jpg
[2]: https://mycroft.ai/
[3]: https://account.mycroft.ai/devices
[4]: https://fedoramagazine.org/wp-content/uploads/2019/06/Screenshot_2019-06-14-Account.png
[5]: https://market.mycroft.ai/skills
[6]: https://mycroft.ai/contribute/
[7]: https://unsplash.com/@pemmax?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/ai?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
