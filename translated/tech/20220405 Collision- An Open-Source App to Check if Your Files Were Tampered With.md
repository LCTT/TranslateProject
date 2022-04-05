[#]: subject: "Collision: An Open-Source App to Check if Your Files Were Tampered With"
[#]: via: "https://itsfoss.com/collision/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Collision: 一个验证你的文件是否被篡改的开源App
======

_**B**__**摘要:** 一个让你查看你的文件 hash 值确定它不是恶意文件并且确实来自真实来源的图形界面程序._


有人给你发送了一个文件，你怎样来证实它是给你的原件？你怎样来确定它没有被篡改过？


同时, 你怎么证实这个文件是来自一个原始的真实来源。

这就是加密 hash 的重要作用所在。如果用来验证一个文件，hash 的功能(比如 SHA-1 )就是一个校验值。这能够帮助你确认文件是否已经被修改。


如果你比较好奇，你可以参考我们的 [在 Linux 中验证校验值的手册][1] 。 

对每个信息 / 文件来说，他们有一个唯一的 hash 值(或者叫 checksum )。所以，即使文件有一点点的改动，整个 hash 值就会发生变化。

它主要用于加密中，每个文件 / 信息被作为 hash 值安全的存储。假设一个攻击者掌握了有 hash 值的数据库(代替真实信息), 他们不能够把它搞明白。同时，加密可以使存储更加安全。

虽然讨论 hash 超出了这篇文章的范围，但是了解它在验证文件完整性上是很有意义的。

### Collision:  迅速的验证文件并发现恶意文件

![][2]

没有图形界面，你将不得不用终端去生成 hash 值来比对 / 验证。

Collision 使它变的非常容易，不需要打开终端或者生成文件的校验值。如果你不了解的话，我们的 [在 Linux 中验证校验值的手册][1] 可以帮助到你。 

当使用 Collision 时, 你只需要添加你要生成 hash 值或者验证所需的文件即可。你只需点击几下便能够保护自己免受恶意或篡改文件的攻击。

我在截图中显示了个文本文件，你的文件在发送给其他人之前，你可以验证文件的类型或为你的文件生成一个 hash 值。你可以通过发给收件人分享你生成的 hash 值，让他们验证你的文件。


![][3]

这是一款简单的开源 app ，只需要让你做两件事情：

  * 生成 Hash 值 (SHA-1, MD5, SHA-256, SHA-516)
  * 通过直接使用文件或者校验值验证一个项目



### Collision App 是怎么工作的

给你举个例子，我通过添加一个字母来修改源文本文件，然后尝试验证它。

下面是它的过程：

首先，你需要打开你要比对的源文件或者有校验值的源文件。

打开源文件生成 hash 值，然后去验证部分访问修改后的文件。


![][4]

你会注意到，它们俩个不是相同的:

![][5]

如果你在检查校验值，首先，你要打开你要验证的文件(这儿是我们已经修改后的文件)。

![][6]

然后，输入文件的原始真实校验值。当然我们已经知道我们测试的是修改后的文件，结果是我们所期望的，即，**验证文件完整性失败**.

![][7]

### 在 Linux 安装 Collision

Collisions 是一个主要的 GNOME 定制的程序，但是它也适用于其他发行版上。

你可以使用 [Flatpak 可用软件包][8] 来安装它，或者当浏览 GitHub 网页时，从源码中编译它。如果你是 Linux 新手，你可以参考我们的 [Flatpak 指南][9]来得到帮助。

如果你喜欢使用终端来安装，键入以下命令来安装：

```

    flatpak install flathub dev.geopjr.Collision

```

要开始,你也可以访问它的官方网站。 

[Collision][10]

--------------------------------------------------------------------------------

via: https://itsfoss.com/collision/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/checksum-tools-guide-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collission-verify-true.png?resize=800%2C617&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-hash-values.png?resize=800%2C617&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-file-open.png?resize=800%2C328&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-file-check.png?resize=800%2C620&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-file-verify.png?resize=800%2C373&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/04/collision-input-checksum.png?resize=800%2C626&ssl=1
[8]: https://flathub.org/apps/details/dev.geopjr.Collision
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://collision.geopjr.dev/
