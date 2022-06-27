[#]: subject: "The Final Version Of 7-Zip 22.00 Is Now Available"
[#]: via: "https://www.opensourceforu.com/2022/06/the-final-version-of-7-zip-22-00-is-now-available/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14764-1.html"

7-Zip 的最终版本 22.00 现已推出
======

![](https://img.linux.net.cn/data/attachment/album/202206/27/110310hwrmxuwyqlor1olp.jpg)

7-Zip 是用于 Windows、Mac 和 Linux 的知名开源文件归档器。它的最新版本 22.00 现已推出。它是 2022 年的第一个稳定版本。上一个版本是 21.07，于 2021 年 12 月发布。7-Zip 的用户可以从官方网站获取该应用的最新版本，下载适用于 Windows 64 位、32 位和 ARM 版本。该应用仍然与过时的 Windows 版本兼容，例如 XP 和 Vista。它还支持所有官方支持的 Windows 版本，包括服务器版本。适用于 Linux 的 7-Zip 22.00 已经可以下载，但 Mac OS 版本还不可用。

7-Zip 22.00 包含一些增强了应用功能的新特性。这个归档器现在支持提取<ruby>苹果文件系统<rt>Apple File System</rt></ruby>（APFS）镜像。几年前，苹果公司在 Mac OS 10.13 和 iOS 中引入了苹果文件系统。该文件系统在设计时就考虑到了闪存（Flash）和固态硬盘（SSD）存储。

7-Zip 22.00 包括了对其 TAR 存档支持的多项增强。使用选项 `-ttar -mm=pax` 或 `-ttar -mm=posix`，7-Zip 现在可以创建符合 POSIX 标准的 tar 格式的 TAR 档案。此外，使用选项 `ttar -mm=pax -mtp=3 -mtc -mta`，7-Zip 可以在 tar/pax 存档中存储高精度的文件时间戳。

最后，Linux 用户可以在 TAR 归档文件中使用以下两个新选项：

* `snoi`：将所有者/组 ID 保存在存档中，或将所有者/组 ID 从存档复制到提取的文件中。
* `snon`：在存档中保留所有者/组的名称。

适用于 Windows 的 7-Zip 22.00 添加了对 `-snz` 选项的支持，该选项用于传播区识别符（LCTT 译注：区标识符是微软在 2013 年为 IE 设计的安全功能，它会标记那些用户自网络上所下载的文件，并在用户准备打开时跳出警告）。

要提取文件，请使用标识符流。出于安全目的，Windows 使用了该流，它可用于确定文件是在本地创建的还是从互联网下载的。

在“<ruby>添加到存档<rt>add to archive</rt></ruby>”配置对话框中，7-Zip 22.00 包含一个新的选项窗口。它包括用于更改时间戳精度、更改其他与时间相关的配置选项，以及防止更改源文件的最后访问时间等选项。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/the-final-version-of-7-zip-22-00-is-now-available/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/7-zip-2200-500x312-1.jpg
