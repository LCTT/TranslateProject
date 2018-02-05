Docker 化编译的软件 ┈ Tianon's Ramblings ✿
======
我最近在 [docker-library/php][1] 仓库中关闭了大量问题，最老的（并且是最长的）讨论之一是关于安装编译扩展的依赖关系，我写了一个[中篇评论][2]解释了我如何用通常的方式为我想要的软件 Docker 化的。

I'm going to copy most of that comment here and perhaps expand a little bit more in order to have a better/cleaner place to link to!
我要在这复制大部分的评论，或许扩展一点点，以便有一个更好的/更干净的链接！

我第一步是编写 `Dockerfile` 的原始版本：下载源码，运行 `./configure && make` 等，清理。然后我尝试构建我的原始版本，并希望在这过程中看到错误消息。（对真的！）

错误信息通常以 `error: could not find "xyz.h"` 或 `error: libxyz development headers not found` 的形式出现。

如果我在 Debian 中构建，我会输入 `https://packages.debian.org/file:xyz.h`（用错误信息中头文件的名称替换 “xyz.h”），或者在谷歌中搜索像 “xyz.h debian” 这样的东西，找出我需要的包的名称。

如果我在 Alpine 中构建，我将使用 <https://pkgs.alpinelinux.org/contents> 进行类似的搜索。

“libxyz development headers” 在某种程度上也是一样的，但是根据我的经验，对于这些 Google 对开发者来说效果更好，因为不同的发行版和项目会以不同的名字来调用这些开发包，所以有时候更难确切的知道哪一个是“正确”的。

当我得到包名后，我将这个包名称添加到我的 `Dockerfile` 中，清理之后，然后重复操作。最终通常会构建成功。偶尔我发现某些库不在 Debian 或 Alpine 中，或者是不够新的，由此我必须从源码构建它，但这些情况在我的经验中很少见 - 因人而异。

我还会经常查看 Debian（通过 <https://sources.debian.org>）或 Alpine（通过 <https://git.alpinelinux.org/cgit/aports/tree>）我要编译的软件包源码，特别关注 `Build-Depends`（如 [`php7.0=7.0.26-1` 的 `debian/control` 文件][3]）以及/或者 `makedepends` （如 [`php7` 的 `APKBUILD` 文件][4]）用于包名线索。

就我个人而言，我觉得这种侦探工作很有趣，也很有收获，但我意识到我可能是一个独特的生物。我偶尔使用的另一个技术是看是否有人已经 Docker 化了我想要的东西，这样我可以直接从他们的 `Dockerfile` 中知道我需要安装的东西。

对于特定的 PHP 扩展，几乎总是有人已经想出对于这个或那个模块需要的依赖，而我所要做的就是做一些轻量的工作找出它们。

不管怎样，这就是我的方法！希望这个有帮助，玩得愉快！

--------------------------------------------------------------------------------

via: https://tianon.github.io/post/2017/12/26/dockerize-compiled-software.html

作者：[Tianon Gravi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://tianon.github.io
[1]:https://github.com/docker-library/php
[2]:https://github.com/docker-library/php/issues/75#issuecomment-353673374
[3]:https://sources.debian.org/src/php7.0/7.0.26-1/debian/control/
[4]:https://git.alpinelinux.org/cgit/aports/tree/community/php7/APKBUILD?id=d0ca197f031f96d4664cafaa618aeccf94640a1e
