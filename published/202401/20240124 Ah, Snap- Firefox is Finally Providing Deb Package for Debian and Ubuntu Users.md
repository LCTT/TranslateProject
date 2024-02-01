[#]: subject: "Ah, Snap! Firefox is Finally Providing Deb Package for Debian and Ubuntu Users"
[#]: via: "https://news.itsfoss.com/mozilla-firefox-deb/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1705972010"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16585-1.html"

好消息！Mozilla 终于官方提供了 Firefox Deb 包
======

![][0]

> Linux 现在有了 Mozilla Firefox 的新原生包。

我带来了一个好消息！Mozilla 为 Firefox 推出了新的 .deb 包，这是为 Ubuntu、Debian 以及其他 [基于 Debian 的发行版][1] 专门提供的。

现在，你能轻松摆脱那些启动速度让人困扰的其他包格式（比如说 Snap 包）了。跟随我一起探索下如何**在 Linux 系统中安装这个新包**！

### Firefox 的 .deb 包：有何新特性？

![][3]

这个全新的 Linux 包由 Mozilla 从头打造，为用户带来了**一个原生的 .deb 包**，类似于 Snap 或 Flatpak，直接开箱即用。

此前，所有提供的 Firefox .deb 包都是由与 Mozilla 无关的个人或组织维护的。如今，我们终于迎来了**官方版本**。

关于新版发布，Mozilla 补充说：

> 25 年来，Mozilla 一直以开发自由开源的网络浏览器而闻名。因为 Firefox 浏览器是开源的，所以我们能深入了解 Firefox 的所有细节，包括如何从中获得最大优势。

尽管 Firefox 已经在性能上下足了功夫，使用这个 .deb 包应该能让你进一步提升利用这些优化的效果。

你也许在想，**怎么更新呢？**

事实上，Mozilla 推出了**一个新的 APT 仓库**，与 Firefox 的发布流程同步。这样，只要 Firefox 有新发布，你就会收到更新，而你只需要重启 Firefox 就能应用这些更新。

很便捷，不是吗？我很喜欢他们做的这一做法，我现在正在考虑是否从我现在已安装的 Flatpak 包切换到 .deb 包，不过这只是我个人的看法。

### 如何安装 Firefox 的官方 .deb 包？

想要从 Mozilla 安装最新 .deb 版本，你可以参考下面的步骤在**你的 Ubuntu、Debian 或其他基于 Debian 的系统**上操作。

如果你已安装了 Firefox 的 Snap 版本，就可以运行下列命令将其从系统中完全移除：

> 🚧 运行这些命令会完全删除所有关于 Snap 版本的 Firefox 的数据，一定要小心操作！

```
sudo snap disable firefox
sudo snap remove --purge firefox
```

接下来，通过运行下面的命令，我们来创建一个存储 APT 仓库密钥的目录：

```
sudo install -d -m 0755 /etc/apt/keyrings
```

现在，导入 Mozilla 的 APT 仓库签名密钥：

```
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
```

接着，你需要运行以下命令：

```
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); print "\n"$0"\n"}'
```

确保在运行命令后，指纹匹配此内容：

> 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3

然后，将 Mozilla 的 APT 仓库添加到你的源列表：

```
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
```

接下来，需要优先从 Mozilla 仓库选择安装包，你可以通过以下方式设置 APT：

```
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
```

最后，运行下列命令，再在提示时输入 `Y` 来确认安装：

```
sudo apt update && sudo apt install firefox
```

![][5]

好了，你此时已经成功在 Linux 系统上安装了 Firefox 的官方 .deb 包！

这就是我之前提到的最后一步，输入 `Y` 后，安装将会继续进行，完成安装后，Firefox 就能在你的系统上看到了。

![][6]

另外，Firefox 还有**安装各种的语言包**的方式，我强烈建议你读一下 [官方文档][7]了解详情。

💬 你会选择官方的 .deb 包还是 Snap 或 Flatpak 呢？欢迎在下方留言告诉我们！

*（题图：DA/98c884d9-1981-4c94-960e-eac1afc53f75）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/mozilla-firefox-deb/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/debian-based-distros/
[2]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[3]: https://news.itsfoss.com/content/images/2024/01/Mozilla_Firefox_Deb_a.png
[4]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[5]: https://news.itsfoss.com/content/images/2024/01/Mozilla_Firefox_Deb_b.png
[6]: https://news.itsfoss.com/content/images/2024/01/Mozilla_Firefox_Deb_c-1.png
[7]: https://support.mozilla.org/en-US/kb/install-firefox-linux
[0]: https://img.linux.net.cn/data/attachment/album/202401/26/150752nwf3fimewwilyfii.jpg