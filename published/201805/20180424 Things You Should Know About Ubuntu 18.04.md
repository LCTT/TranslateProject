你应该知道关于 Ubuntu 18.04 的一些事
======

[Ubuntu 18.04 版本][1] 已经到来。我可以在各种 Facebook 群组和论坛中看到许多来自 Ubuntu 用户的提问。我还在 Facebook 和 Instagram 上组织了 Q&A 会议，以了解 Ubuntu 用户对 Ubuntu 18.04 的想法。

我试图在这里回答关于 Ubuntu 18.04 的常见问题。如果您有任何疑问，我希望这能帮助您解决疑问。如果您仍有问题，请随时在下面的评论区提问。

### Ubuntu 18.04 中有什么值得期待

![Ubuntu 18.04 Frequently Asked Questions][2]

解释一下，这里的一些问答会受到我个人的影响。如果您是一位经验丰富或了解 Ubuntu 的用户，其中一些问题可能对您而言很简单。如果是这样的话，就请忽略这些问题。

#### 我能够在 Ubuntu 18.04 中安装 Unity 吗？

当然能够哦！

Canonical 公司知道有些人喜欢 Unity。这就是为什么它已经在 Universe 软件库（LCTT译者注：社区维护的软件库）中提供了 Unity 7。但这是一个社区维护版，官方并不直接参与开发。

不过我建议是使用默认的 GNOME，除非您真的无法容忍它，再在 [Ubuntu 18.04 上安装 Unity][3]。

#### GNOME 是什么版本？

在这次发行的 Ubuntu 18.04 版本中，GNOME 版本号是 3.28。

#### 我能够安装原装的 GNOME 吗？

当然没问题！

因为存在一些 GNOME 用户可能不喜欢 Ubuntu 18.04 中的 Unity 风格。在 Ubuntu 中的 main（LCTT译者注：官方支持的软件库）和 universe 软件库有安装包可安装，能使您在 [Ubuntu 18.04 中安装原装的 GNOME][4]。

#### GNOME 中的内存泄漏已修复了吗？

已经修复了。[GNOME 3.28 中臭名昭着的内存泄漏][5] 已经被修复了，并且 [Ubuntu 官方已经在测试这个修复程序][6]。

澄清一点，内存泄漏不是由 Ubuntu 系统引起的。它影响了所有使用 GNOME 3.28 的 Linux 发行版。GNOME 3.28.1 发布了一个新的补丁修复内存泄漏问题。

#### Ubuntu 18.04 将会被支持多久？

这是一个长期支持（LTS）版本，与任何 LTS 版本一样，官方会支持五年。这意味着 Ubuntu 18.04 将在 2023 年 4 月之前能获得安全和维护更新。这对于除 Ubuntu Studio 之外的所有基于 Ubuntu 的 Linux 发行版也一样。

#### Ubuntu 18.04 什么时候发布的？

Ubuntu 18.04 LTS 在 4 月 26 日发布。 所有基于 Ubuntu 的 Linux 发行版，如 Kubuntu、Lubuntu、Xubuntu、Budgie、MATE 等都会在同一天发布其 18.04 版本。

不过 [Ubuntu Studio 不会有 18.04 的 LTS 版本][7]。

#### 是否能从 16.04/17.10 升级到 Ubuntu 18.04？我可以从使用 Unity 的 Ubuntu 16.04 升级到使用 GNOME 的 Ubuntu 18.04 吗？

绝对没问题。当 Ubuntu 18.04 LTS 发布后，您可以很容易的升级到最新版。

如果您使用的是 Ubuntu 17.10，请确保在“软件和更新”->“更新”中，将“有新版本时通知我”设置为“适用任何新版本”。

![Get notified for a new version in Ubuntu][8]

如果您使用的是 Ubuntu 16.04，请确保在“软件和更新”->“更新”中，将“有新版本时通知我”设置为“适用长期支持版本”。

![Ubuntu 18.04 upgrade from Ubuntu 16.04][9]

然后您应该能获得有关新版本更新的系统通知。之后，升级到 Ubuntu 18.04 只需要点击几下鼠标而已。

即使 Ubuntu 16.04 使用的是 Unity，但您仍然可以 [升级到使用 GNOME 的 Ubuntu 18.04][10]。

#### 升级到 Ubuntu 18.04 意味着什么？我会丢失数据吗？

如果您使用的是 Ubuntu 17.10 或 Ubuntu 16.04，系统会提示您可升级到 Ubuntu 18.04。如果您从互联网上下载 1.5 Gb 的数据不成问题，则只需点击几下鼠标，即可在 30 分钟内升级到 Ubuntu 18.04。

您不需要通过 U 盘来重装系统。升级过程完成后，您将可以使用新的 Ubuntu 版本。

通常，您的数据和文档等在升级过程中是安全的。但是，对重要文档进行备份始终是一个好的习惯。

#### 我什么时候能升级到 Ubuntu 18.04？

如果您使用的是 Ubuntu 17.10 并且正确设置（设置方法在之前提到的问题中），那么在 Ubuntu 18.04 发布的几天内应该会通知您升级到 Ubuntu 18.04。为避免 Ubuntu 服务器在发布时的负载量过大，因此不是每个人都会在同一天收到升级提示。

对于 Ubuntu 16.04 用户，可能需要几周时间才能正式收到 Ubuntu 18.04 升级提示。通常，这将在第一次发布 Ubuntu 18.04.1 之后提示。该版本修复了 18.04 中发现的新 bug。

#### 如果我升级到 Ubuntu 18.04，我可以降级到 17.10/16.04？

抱歉，并不行。尽管升级到新版本很容易，但没有降级的选项。如果您想回到 Ubuntu 16.04，只能重新安装。

#### 我能使用 Ubuntu 18.04 在 32 位系统上吗？

可以，但最好不要这样做。

如果您已经在使用 32 位版本的 Ubuntu 16.04 或 17.10，您依旧可以升级到 Ubuntu 18.04。 但是，您找到不到 32 位的 Ubuntu 18.04 ISO 镜像。换句话说，您无法安装 32 位版本的 Ubuntu 18.04。

有一个好消息是，Ubuntu MATE、Lubuntu 等其他官方版本仍然具有其新版本的 32 位 ISO 镜像。

无论如何，如果您使用一个 32 位系统，那么很可能您的计算机硬件性能过低。在这样的电脑上使用轻量级 [Ubuntu MATE][11] 或 [Lubuntu][12] 系统会更好。

#### 我可以在哪下载 Ubuntu 18.04？

18.04 已经发布了，您可以从其网站获得 Ubuntu 18.04 的 ISO 镜像。您既可以直接官网下载，也能用种子下载。其他官方版本将在其官方网站上提供下载。

#### 我应该重新安装 Ubuntu 18.04 还是从 16.04/17.10 升级上来？

如果您有重新安装的机会，建议备份您的数据并重新安装 Ubuntu 18.04。

从现有版本升级到 18.04 是一个方便的选择。不过，就我个人而言，它仍然保留了旧版本的依赖包。重新安装还是比较干净。

#### 对于重新安装来说，我应该安装 Ubuntu 16.04 还是 Ubuntu 18.04？

如果您要在计算机上安装 Ubuntu，请尽量使用 Ubuntu 18.04 而不是 16.04。

他们都是长期支持版本，并被支持很长一段时间。Ubuntu 16.04 会获得维护和安全更新服务直到 2021 年，而 18.04 则会到 2023 年。

不过，我建议您使用 Ubuntu 18.04。任何 LTS 版本都会在 [一段时间内获得硬件更新支持][13]（我认为是两年半的时间内）。之后，它只获得维护更新。如果您有更新的硬件，您将在 18.04 获得更好的支持。

此外，许多应用程序开发人员将很快开始关注 Ubuntu 18.04。新创建的 PPA 可能仅在几个月内支持 18.04。所以使用 18.04 比 16.04 更好。

#### 安装打印机-扫描仪驱动程序比使用 CLI 安装会更容易吗？

在打印机方面，我不是专家，所以我的观点是基于我在这方面有限的知识。大多数新打印机都支持 [IPP协议][14]，因此它们应该在 Ubuntu 18.04 中能够获到很好的支持。 然而对较旧的打印机我则无法保证。

#### Ubuntu 18.04 是否对 Realtek 和其他 WiFi 适配器有更好的支持？

抱歉，没有关于这部分的具体信息。

#### Ubuntu 18.04 的系统要求？

对于默认的 GNOME 版本，最好您应该有 [4 GB 的内存以便正常使用][15]。使用过去 8 年中发布的处理器也可以运行。但任何比这性能更差的硬件建议使用 [轻量级 Linux 发行版][16]，例如 [Lubuntu][12]。

#### 有关 Ubuntu 18.04 的其问题？

如果还有其他疑问，请随时在下方评论区留言。如果您认为应将其他信息添加到列表中，请告诉我。

（LCTT 译注：本文原文写于 Ubuntu 18.04 LTS 发布之前，译文翻译于发布之后，因此对部分内容做了修改。）

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-18-04-faq/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://linux.cn/article-9583-1.html
[2]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/ubuntu-18-04-faq-800x450.png
[3]:https://itsfoss.com/use-unity-ubuntu-17-10/
[4]:https://itsfoss.com/vanilla-gnome-ubuntu/
[5]:https://feaneron.com/2018/04/20/the-infamous-gnome-shell-memory-leak/
[6]:https://community.ubuntu.com/t/help-test-memory-leak-fixes-in-18-04-lts/5251
[7]:https://www.omgubuntu.co.uk/2018/04/ubuntu-studio-plans-to-reboot
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/03/upgrade-ubuntu-2.jpeg
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/ubuntu-18-04-upgrade-settings-800x379.png
[10]:https://itsfoss.com/upgrade-ubuntu-version/
[11]:https://ubuntu-mate.org/
[12]:https://lubuntu.net/
[13]:https://www.ubuntu.com/info/release-end-of-life
[14]:https://www.pwg.org/ipp/everywhere.html
[15]:https://help.ubuntu.com/community/Installation/SystemRequirements
[16]:https://itsfoss.com/lightweight-linux-beginners/
