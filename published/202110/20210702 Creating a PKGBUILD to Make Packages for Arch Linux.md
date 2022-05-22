[#]: subject: (Creating a PKGBUILD to Make Packages for Arch Linux)
[#]: via: (https://itsfoss.com/create-pkgbuild/)
[#]: author: (Hunter Wittenborn https://itsfoss.com/author/hunter/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13843-1.html)

Arch Linux 软件包制作入门
======

![](https://img.linux.net.cn/data/attachment/album/202110/02/130702ybexb5tsvkx1xbs1.jpg)

`PKGBUILD` 文件是为 Arch Linux 及其衍生版（如 Manjaro）构建和创建软件包的方式。

如果你曾经使用过 [AUR][1]（即 Arch Linux 的用户维护的 `PKGBUILD` 存储库），你甚至可能也遇到过它们。

但是，到底是如何从 `PKGBUILD` 到可安装软件包的呢？这两者之间到底发生了什么，如何把自己的软件制作成软件包呢？你将在这篇文章中了解这些。

### PKGBUILD 基础知识

对于那些熟悉 Bash 或其他 shell 的人来说，你可能知道，`PKGBUILD` 就是一个带有一些变量的 shell 脚本。

`PKGBUILD` 文件由变量和函数组成，所有这些都是用来定义软件包本身，以及如何构建它。

为了从 `PKGBUILD` 中创建一个软件包，需要使用 `makepkg` 命令行工具。在获得 `PKGBUILD` 文件后，你只需在包含 `PKGBUILD` 的目录中运行 `makepkg'，就可以得到一个可安装的软件包了。

![][2]

在本教程中，你将会看到我刚刚制作的软件包，它在运行时打印出 “Hello World!”。

![][3]

### 准备

为了继续学习本教程，你需要创建几个文件。

首先，你需要创建一个名为 `PKGBUILD` 的文件，它将作为构建你的软件包的“配方”。

你需要做的另一个文件是一个叫 `hello-world.sh` 的文件。我稍后会解释它的用途。

你也可以用一个命令来创建这两个文件：

```
touch PKGBUILD hello-world.sh
```

你可以用 `ls` 命令检查这些文件是否被创建。

![][4]

然后你就可以开始了！

### 设置你的 PKGBUILD 文件

我不会让你复制粘贴整个文件，而是和你一起键入每一行，这样你就能更好地理解每一行的目的。如果你不喜欢这种学习方式，我强烈推荐 [Arch 维基][5] 中为 Arch Linux 创建软件包的文章。

这篇文章也没有介绍 `PKGBUILD` 中可以设置的每一个选项，只是介绍了一些常用的选项，以便你能尽快上手。

说完了这些，打开你的文本编辑器，让我们直接进入正题吧。

#### pkgname

首先是 `pkgname` 变量。这是安装时定义软件包名称的东西，也是 [Arch Linux 的软件包管理器 pacman][6] 跟踪软件包的方式。

这个变量（以及其他一些变量）的格式是 `variable=value`，变量名在左边，变量的值在右边，用等号隔开。

要设置包的名称，请在 `PKGBUILD` 中输入以下内容：

```
pkgname="hello-world"
```

  * 要设置一个不同的软件包名称，用你的软件包的名称替换 `hello-world`。
  * 这并不设置用于运行程序的命令，这将在下面的 `package()` 部分中处理。

#### pkgver

正如变量名称本身所述，它设置了你的软件包的版本（即 `1.0.0`）。这在用户更新他们的系统时很有用，因为设置更高的版本会提示用户升级。

要设置版本号，请在 `PKGBUILD` 中输入以下内容（在前一行之后）：

```
pkgver="1.0.0"
```

#### pkgrel

这与 `pkgver` 变量有关，通常不需要知道。不过和 `pkgver` 变量一样，如果它被换到一个更高的数字，就将通知用户进行升级。

它适用于任何需要保持 `pkgver` 不变的情况下，例如 `PKGBUILD` 本身发生了变化。如果你为一个你使用的程序创建了一个 `PKGBUILD`（并希望保持软件包的版本相同），而你需要修复 `PKGBUILD` 本身的一个错误，这将是非常有用的。

要设置这个变量，请在 `PKGBUILD` 中输入以下内容：

```
pkgver="1"
```

这个变量应该 **总是** 从 `1` 开始，然后一次一次地向上移动。当 `pkgver` 本身向上移动时，这个变量可以（也应该）重置为 `1`，因为 `pkgver` 本身会通知用户升级。

#### pkgdesc

这将设置软件包的描述，用于帮助更好地识别该软件包。

要设置它，只需将描述放在引号内：

```
pkgdesc="Hello world in your terminal!"
```

#### arch

这个变量设置软件包所兼容的 [硬件架构][7]。如果你不明白什么是架构，那也没关系，因为在大多数情况下，这个变量几乎是无用的。

无论如何，`makepkg` 仍然需要设置它，这样它就知道这个软件包与我们的系统是兼容的。

这个变量支持设置多个值，所以 `makepkg` 需要一个不同的语法，如下所示。

要设置它，请在 `PKGBUILD` 中输入以下内容：

```
arch=("x86_64")
```

如果你要设置多个值，需要用空格和引号分隔每个值，像这样。`arch=(“x86_x64" "arm")`。

#### depends

这列出了提供了我们的软件包所需功能的所有软件包。与 `arch` 一样，它也可以包含多个值，因此必须使用括号语法。

由于我们的软件包没有任何依赖关系，所以我们不需要在 `PKGBUILD` 中输入这个字段。然而，如果我们的软件包有依赖关系，我们就会使用与 `arch` 相同的语法。

#### optdepends

这里列出了那些并不是提供所需功能而是额外功能的软件包。

这与 `depends` 的语法相同。

#### conflicts

这告诉 `pacman` 哪些软件包会导致我们的软件包出现问题，或者以我们不希望的方式行事。

这里列出的任何软件包都会在我们的软件包被安装之前被卸载。

这与 `depends` 的语法相同。

#### license

这定义了你的程序所采用的 [软件许可证][8]。如果你需要帮助你选择一个许可证，[Arch 维基][9] 提供了一些信息。如果你不知道该怎么设置，将其设置为 `custom` 也可以。

这与 `arch` 和 `depends` 的语法相同：

```
license=("custom")
```

#### source

这就是 `makepkg` 如何知道要用什么文件来构建我们的软件包。它可以包含各种不同类型的源，包括本地文件和 URL。

在添加本地文件时，要输入相对于 `PKGBUILD` 文件的文件路径，比如以下目录布局：

```
PKGBUILD
file.txt
src/file.sh
```

如果你想在我们的 `PKGBUILD` 中包括 `file.sh`，你需要输入 `src/file.sh` 作为其名称。

当输入 URL 时，你只需输入完整的 URL，即 `https://mirrors.creativecommons.org/presskit/logos/cc.logo.large.png`。

你的这个软件包只需要 `hello-world.sh` 文件，由于它和 `PKGBUILD` 在同一个目录中，你只需输入它的名字作为 `source` 的值。

这个变量也使用与 `arch` 和 `depends` 相同的语法：

```
source=("hello-world.sh")
```

#### sha512sums

这是用来验证 `source` 中的文件没有被修改或下载错误。如何获得这个值的信息可以在 [Arch 维基关于 PKGBUILD 的文章][10] 中找到。

如果你宁愿不设置这个（或者你只是不需要，例如对于本地文件），你可以为 `source` 变量中的每个文件输入 `SKIP`：

```
sha512sums=("SKIP")
```

#### package()

这是最后一个，也是实际制作我们的包的最重要的部分。在处理这个问题时，知道两个变量很重要。

  * `${srcdir}`：这是 `makepkg` 放置 `source` 变量中文件的地方。在这个目录中，你可以与这些文件进行交互，并对文件进行任何其他需要的修改。
  * `${pkgdir}`：这是我们放置将被安装在系统中的文件的地方。
`${pkgdir}` 的文件夹结构是按照实际系统中的情况设置的（例如，使用 `pacman` 安装时，`${pkgdir}/usr/bin/hello-world` 会创建文件 `/usr/bin/hello-world`）。

`package()` 包含一个用于创建软件包的命令列表。

因此，如果（假设）你需要有个在 `/usr/share/motto.txt` 写着 “Linux is superior to Windows ”的文件，你会运行这样的东西：

```
package() {
  mkdir -p "${pkgdir}/usr/share"
  echo "Linux is superior to Windows" | tee "${pkgdir}/usr/share/motto.txt"
}
```

关于上述命令的一些说明：

  * `${pkgdir}` 里面最初是 **不包含** 目录的。如果你跳过了 [mkdir 命令][11]，`tee` 会输出一个错误，说这个目录不存在。
  * 在指定目录时，**总是** 在它们前面加上 `${pkgdir}` 或 `${srcdir}` 变量。如果输入 `/usr/share/motto.txt`，就会按照字面意义指向你当前运行的系统中的 `/usr/share/motto.txt`。

对于你的 `PKGBUILD`，你将把 `hello-world.sh` 文件放在目标系统的 `/usr/bin/hello-world` 中。你还将使该文件在运行时说 “Hello to you!”。

要做到这一点，请在 `PKGBUILD` 中输入以下内容：

```
package() {
  echo 'Hello to you!' > "${srcdir}/hello-world.sh"
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/hello-world.sh" "${pkgdir}/usr/bin/hello-world"
  chmod +x "${pkgdir}/usr/bin/hello-world"
}
```

然后就完成了！用 `makepkg -si` 构建和安装软件包，然后在终端运行 `hello-world`，查看其输出。

![][12]

### 总结

就这样，你已经制作了你的第一个 `PKGBUILD`！你走在了为自己甚至是为 AUR 制作实际的软件包的路上。

有什么问题，或者有什么地方不对吗？请随时在下面的评论区发表。

--------------------------------------------------------------------------------

via: https://itsfoss.com/create-pkgbuild/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/aur-arch-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/image.png?resize=748%2C689&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/image-2.png?resize=682%2C260&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/image-3.png?resize=682%2C265&ssl=1
[5]: https://wiki.archlinux.org/title/Creating_packages
[6]: https://itsfoss.com/pacman-command/
[7]: https://www.quora.com/What-is-CPU-architecture
[8]: https://en.wikipedia.org/wiki/Software_license
[9]: https://wiki.archlinux.org/title/PKGBUILD#license
[10]: https://wiki.archlinux.org/title/PKGBUILD#Integrity
[11]: https://linuxhandbook.com/mkdir-command/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/image-1.png?resize=561%2C281&ssl=1
