[#]: subject: "Wow! Torvalds Modified Fedora Linux to Run on his Apple M2 Macbook"
[#]: via: "https://news.itsfoss.com/fedora-apple-torvalds/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "littlebirdnest"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15041-1.html"

哇！Torvalds 为自己的 Apple M2 Macbook 专门修改了 Fedora Linux 
======

> Linus Torvalds 让 Fedora Linux Workstation 36 成功运行在 Apple Macbook Air M2 上。666！

![Wow! Torvalds Modified Fedora Linux to Run on his Apple M2 Macbook][1]

Linus Torvalds 喜欢写代码和修复代码。当然，这是他的技术专长。

如果你知道的话，他就是那个因为买不起 UNIX，转头就创造了 Linux 的家伙。

出于类似的原因，他还在 BitKeeper 不再免费使用后构建了 Git。

即使在今天，他仍继续着他的动手精神和“没有我解决不了的问题”的态度。

他设法在他的 Apple Macbook Air M2 上运行了 Fedora Linux 36 Workstation 版本。

**注意**：从 Asahi Linux 的 Hector Martin 那里得知，Linus Torvalds 似乎在这里使用了 [Leif 的工具包](https://github.com/leifliddy/asahi-fedora-builder)。所以，你可能想多了，他并没有从头开始做所有事情来让它发挥作用。

![GIF][3]

多亏了 ZDNet 对 Torvalds 的 [采访](https://linux.cn/article-15039-1.html)，我们才发现了这一激动人心的考验。

### Apple M2 芯片上的 Fedora Linux

Apple Macbook Air 是一款出色的笔记本电脑。但是，它不能完全按照消费者想要的方式运行 Linux。

然而，Linus Torvalds 似乎是使 Linux 运行在苹果电脑上的天才。

尽管苹果基于 ARM 的 M2 芯片没有 Fedora 移植，但他还是做到了。

请注意，这并不意味着你可以立即在 Macbook Air M2 上运行 Fedora Linux。它只适合像 Torvalds 这样的 Linux 高手才能使其工作。

他说，即使没有图形加速和在 GNOME 桌面环境中缺少某些图形效果（例如屏幕调光），这种体验也很出色。

> 我喜欢这种方式，它使显示更加迅捷。我可能也会在我的其他机器上关掉这些。

事实上，总的来说，这是一项令人兴奋的成就！

### Apple 芯片上 Linux 的现状

不仅是 Linus Torvalds，而且每个人都对 Apple M1/M2 芯片的性能印象深刻。

事实上，他利用 Macbook Air M2 发布了 **Linux 内核 5.19**。

> **[Linus Torvalds 使用 Apple MacBook 硬件发布 Linux Kernel 5.19](https://news.itsfoss.com/linux-kernel-5-19-release/)**

尽管我们很想尝试一下，但 Apple 的 M2 还没有为 Linux 做好准备。

幸运的是，像 [Asahi Linux](https://asahilinux.org/) 这样的项目一直在不断改进对 Apple 芯片的支持。他们还设法使 [Linux 在最新的 Apple M2 芯片上运行](https://asahilinux.org/2022/07/july-2022-release/)。

而且，在 Linux 创造者的努力下，我们应该很快就能在 Macbook 上看到完整的 Linux 体验。 

到目前为止，你可以使其与 Asahi Linux 一起使用，但对于大多数用户来说，它仍然无法取代它作为日常办公系统。

#### 推荐阅读 📖

有兴趣了解更多关于 Torvalds 的知识吗？我们这里有一个有趣的收藏👇

> **[Linus Torvalds：关于 Linux 创造者的 20 个事实](https://itsfoss.com/linus-torvalds-facts/)**

*💬 你如何看待在 Apple 硬件上运行的 Fedora Linux？你希望某个发行版可以在 Apple M1/M2 驱动的设备上运行吗？是哪个发行版？*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-apple-torvalds/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[littlebirdnest](https://github.com/littlebirdnest)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/torvalds-fedora-m2-macbook.png
[2]: https://github.com/leifliddy/asahi-fedora-builder
[3]: https://tenor.com/embed/5289253
[4]: https://www.zdnet.com/article/linus-torvalds-talks-rust-on-linux-his-work-schedule-and-life-with-his-m2-macbook-air/
[5]: https://news.itsfoss.com/linux-kernel-5-19-release/
[7]: https://asahilinux.org/
[8]: https://asahilinux.org/2022/07/july-2022-release/
[9]: https://itsfoss.com/linus-torvalds-facts/
