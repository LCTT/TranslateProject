[#]: subject: "A Native Linux GPU Driver for Apple Silicon is Almost Ready!"
[#]: via: "https://news.itsfoss.com/linux-gpu-driver-apple/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "KevinZonda"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15114-1.html"

一个适用于苹果芯片的原生 Linux GPU 驱动程序几乎就绪！
======

> 苹果 M1 上的原生 Linux GPU 驱动？它就快来了！

![一个适用于苹果芯片的原生 Linux GPU 驱动程序几乎就绪！][1]

让 Linux 在 <ruby>苹果芯片<rt>Apple Silicon</rt></ruby> 设备上工作是我们很多人的愿望!

感谢 [Asahi Linux 项目][2]，它现在对测试者来说已经成为现实。当然，它还没有准备好进入最佳时期，但如果你是一个资深 Linux 用户，你现在就可以在苹果 M1/M2 设备上尝试 Linux。

现在，Linux 开发者 **Asahi Lina** 的一个令人兴奋的进展引起了我们所有人的注意。

**我们可能会比预期更早地拥有一个用 Rust 编写的原生 GPU 驱动程序。**

### 所以，这意味着什么？

几个月前，Asahi Lina 加入了 Asahi Linux 项目，并开始 [开发一个驱动程序原型][3] 以在 Linux 上运行图形应用程序。

现在，通过更多的调整和一些来自 Asahi Lina 对 M1 GPU 硬件接口的逆向工程的惊人的贡献，她已经成功地在苹果 M1 芯片上运行了 GNOME、KDE 应用程序，做到了在 Firefox 上播放 YouTube 等事情！

以下是她 [推特][4] 的内容：

> GNOME 运行了！！Firefox 浏览器可以运行！你可以看 YouTube，玩 Neverball，运行 KDE 应用程序，以及更多！! 没有崩溃！！！
>
> 在苹果 M1 的原生 Linux GPU 驱动上！!

需要注意的是，这还没有在苹果 M2 上测试过。

这里还有个视频，你可以看到它运行的情况：

![它工作了！GNOME、Firefox、KDE 应用和所有东西！！！！][5]

她还解释说：

> 我使用了一个糟糕的黑科技来解决一个稳定性问题，这影响了性能，但它证明了这是唯一剩下的主要问题！一旦我把它修复好了，我们就会有完整的性能和稳定性！然后就只剩下 Mesa 驱动程序的修复了！！！

当然，这还只是处于早期的开发，我们甚至没有在 Linux 内核中拥有 Rust 实现。所以，当 Rust 开始进入主线版本时，也就是 Linux 内核 6.1 或更新版本时，你可能会看到它越来越接近现实。

尽管如此，这对 Asahi Linux 来说是一个不可思议的里程碑。随着一些发展，用户一定急于在苹果芯片设备上尝试 Linux。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-gpu-driver-apple/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[KevinZonda](https://github.com/KevinZonda)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/10/native-apple-linux-gpu.png
[2]: https://news.itsfoss.com/asahi-linux-announcement/
[3]: https://asahilinux.org/2022/07/july-2022-release/
[4]: https://twitter.com/LinaAsahi/status/1575343067892051968
[5]: https://youtu.be/k0cnMUroMlQ
