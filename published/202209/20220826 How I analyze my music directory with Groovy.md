[#]: subject: "How I analyze my music directory with Groovy"
[#]: via: "https://opensource.com/article/22/8/groovy-script-java-music"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15004-1.html"

我如何使用 Groovy 分析我的音乐目录
======

![](https://img.linux.net.cn/data/attachment/album/202209/06/091157xsta20az0az0ws0k.jpg)

> 为了简化 Java 的繁琐，我制作了一个 Groovy 工具来分析我的音乐目录。

最近，我一直在研究 Groovy 是如何简化略微繁琐的 Java 的。在这篇文章中，我开始了一个简短的系列，通过创建一个分析我的音乐目录的工具来演示 Groovy 脚本。

在本文中，我将演示 `groovy.File` 类如何扩展和精简 `java.File` 并简化其使用。这为查看音乐文件夹的内容提供了一个框架，以确保预期的内容（例如，`cover.jpg` 文件）就位。我使用 [JAudiotagger 库][2] 来分析音乐文件的标签。

### 安装 Java 和 Groovy

Groovy 基于 Java，需要安装 Java。 Java 和 Groovy 的最新和稳定的版本可能都在你的 Linux 发行版的仓库中。 Groovy 也可以直接从 [Apache Foundation 网站][3] 安装。对于 Linux 用户来说，一个不错的选择是 [SDKMan][4]，它可用于获取 Java、Groovy 和许多其他相关工具的多个版本。对于本文，我使用以下 SDK 版本：

* Java：版本 11.0.12-open 的 OpenJDK 11
* Groovy：版本 3.0.8

### 音乐元数据

最近，我重整了我的音乐消费方式。我决定使用优秀的开源 [Cantata][5] 音乐播放器，它是开源 [MPD 音乐播放器][6] 的一个前端。我所有的电脑的音乐都存储在 `/var/lib/mpd/music` 目录下。在该音乐目录下有艺术家子目录，在每个艺术家子目录下有专辑子目录，包含音乐文件、`cover.jpg`，偶尔还有 PDF 格式的内页说明。

我绝大部分的音乐文件都是 FLAC 格式的，有一些是 MP3 格式，可能还有一小部分是 OGG 格式。我选择 JAudiotagger 库的一个原因是它可以透明地处理不同的标签格式。当然，JAudiotagger 是开源的！

那么查看音频标签有什么意义呢？以我的经验，音频标签的管理极差。（提到音频标签，）我的脑海中浮现出“粗心”这个词。这是标签本身真正存在的问题，也可能是出于我自己的学究倾向。无论如何，这是一个可以通过使用 Groovy 和 JAudiotagger 解决的重要问题。不过，它不仅适用于音乐收藏。许多其他现实世界的问题也适用，如需要下沉到文件系统中的目录树来处理在那里找到的内容。

### 使用 Groovy 脚本

这是此任务所需的基本代码。我在脚本中加入了注释，这些注释反映了我通常留给自己的（相对简写的）“注释提醒”：

```
// 定义音乐库目录
def musicLibraryDirName = '/var/lib/mpd/music'
// 输出 CSV 文件标题行
println "artistDir|albumDir|contentFile"
// 迭代音乐库目录中的每个目录
// 这一层应该是艺术家目录
new File(musicLibraryDirName).eachDir { artistDir ->
    // 迭代艺术家目录中的每个目录
    // 这一层应该是专辑目录
    artistDir.eachDir { albumDir ->
        // 迭代专辑目录中的每个目录
        // 这里应该是内容
        // 或相关内容（如 `cover.jpg`，PDF 格式的内页说明）
        albumDir.eachFile { contentFile ->
            println "$artistDir.name|$albumDir.name|$contentFile.name"
        }
    }
}
```

如上所述，我使用 `groovy.File` 在目录树中移动。具体来说：

第 7 行创建一个新的 `groovy.File` 对象并在其上调用 `groovy.File.eachDir()`，第 7 行的 `{` 和第 18 行的结尾的 `}` 之间的代码是传给 `eachDir()` 的 `groovy.Colsue` 参数。

这意味着 `eachDir()` 为目录中找到的每个子目录执行该代码。这类似于 Java *lambda*（也称为“匿名函数”）。 Groovy 闭包不会像 lambda 那样限制对调用环境的访问（在最新版本的 Groovy 中，如果你愿意，也可以使用 Java lambda）。如上所述，音乐库目录中的子目录应该是艺术家目录（例如，“Iron Butterfly” 或 “Giacomo Puccini”），因此 `artistDir` 是 `eachDir()` 传递给闭包的参数。

第 10 行对每个 `artistDir` 调用 `eachDir()`，第 10 行的 `{` 和第 17 行的 `}` 之间的代码形成另一个处理 `albumDir` 的闭包。

第 14 行，在每个 `albumDir` 上调用 `eachFile()`，第 14 行的 `{` 和第 16 行的 `}` 之间的代码形成了处理专辑内容的第三级闭包。

在本文的范围内，我对每个文件唯一需要做的就是开始构建信息表，我将其创建为一个以竖线分隔的 CSV 文件，它可以导入 [LibreOffice][7] 或 [OfficeOnly][8] 或任何其他电子表格。现在，代码输出前三列：艺术家目录名、专辑目录名和内容文件名（同样，第 2 行输出 CSV 标题行）。

在我的 Linux 笔记本电脑上运行它会产生以下输出：

```
$ groovy TagAnalyzer.groovy | head
artistDir|albumDir|contentFile
Habib Koite & Bamada|Afriki|02 - Ntesse.flac
Habib Koite & Bamada|Afriki|08 - NTeri.flac
Habib Koite & Bamada|Afriki|01 - Namania.flac
Habib Koite & Bamada|Afriki|07 - Barra.flac
Habib Koite & Bamada|Afriki|playlist.m3u
Habib Koite & Bamada|Afriki|04 - Fimani.flac
Habib Koite & Bamada|Afriki|10 - Massake.flac
Habib Koite & Bamada|Afriki|11 - Titati.flac
Habib Koite & Bamada|Afriki|03 – Africa.flac
[...]
Richard Crandell|Spring Steel|04-Japanese Lullaby [Richard Crandell].flac
Richard Crandell|Spring Steel|Spring Steel.pdf
Richard Crandell|Spring Steel|03-Zen Dagger [Richard Crandell].flac
Richard Crandell|Spring Steel|cover.jpg
$
```

在性能方面：

```
$ time groovy TagAnalyzer.groovy | wc -l
9870

real        0m1.482s
user        0m4.392s
sys        0m0.230s
$
```

又好又快。它在一秒半内处理近 10,000 个文件！对我来说足够快。可观的性能、紧凑且可读的代码，还有什么不喜欢的？

在我的下一篇文章中，我会打开 JAudiotagger 并查看每个文件中的标签。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/groovy-script-java-music

作者：[Chris Hermansen][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/programming-code-keyboard-laptop-music-headphones.png
[2]: http://www.jthink.net/jaudiotagger/examples_read.jsp
[3]: https://groovy.apache.org/download.html
[4]: https://opensource.com/article/22/3/manage-java-versions-sdkman
[5]: https://opensource.com/article/17/8/cantata-music-linux
[6]: https://www.musicpd.org/
[7]: https://opensource.com/tags/libreoffice
[8]: https://opensource.com/article/20/7/nextcloud
