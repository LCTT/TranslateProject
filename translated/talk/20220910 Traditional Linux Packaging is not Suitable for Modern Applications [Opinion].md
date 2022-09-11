[#]: subject: "Traditional Linux Packaging is not Suitable for Modern Applications [Opinion]"
[#]: via: "https://news.itsfoss.com/traditional-packaging-modern-applications/"
[#]: author: "Community https://news.itsfoss.com/author/team/"
[#]: collector: "lkxed"
[#]: translator: "99541536"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

传统的Linux安装包格式不适合现代应用 [观点] 
======
开源贡献者 Hari Rana 表达了他对传统 Linux 安装包格式不再适合现代应用的看法。

![传统的Linux安装包格式不适合现代应用 [观点]][1]

图片来源：来自 [Unsplash][2] 的 [Kelli McClintock][3]

我多次遇到用户抱怨LTS和稳定版的应用安装包有问题，但又声称开发版从来没有发生过这种事情。然而，以我在安装包技术方面的经验和知识，我不能不强调，这是不对的。

发行模式不是问题的根源所在，根本的问题是传统的安装包格式不适合现代的图形应用，不管是什么发行版。那么像 Nix 和 Flatpak 这样的格式是如何解决这些基本问题的？有趣的是，大多数服务器确实利用了容器化（即 Docker），因为它提高了可重复性并增强了可维护性。我们可以从中得到启发，采用一个适用于 Linux 桌面的类似标准。

### 免责声明

1. “传统打包”是指使用包管理器发布的图形应用程序，而不使用容器，如 apt、dnf、pacman 等。
2. “发行模式”是指发行过程，如长期支持版（LTS）、稳定版和开发版等。
3. “类似的应用程序”是指两个在技术上真正相似的应用程序，如 [Visual Studio Code][4] 和 [Code - OSS][5]。
4. 在这些例子中，我将使用 Arch Linux 作为参考。然而，这些行为与那些大量采用传统安装包格式的发行版是一致的。
5. Nix不使用容器，它也不是一种容器格式。但为了简单起见，我暂时把它称为一种容器格式。

### 根本问题

![][6]

图片来源：来自 [Unsplash][7] 的 [Jackson Simmer][8]

大多数（或许不是全部）大量采用传统安装包格式的发行版都有这个共同的问题：它们都没有利用容器或其他方便的方法来区分依赖关系。用通俗的话说，容器是一个盒子，我们可以把东西放在里面，在不影响主系统（主机）的情况下单独使用它们。

容器通常不会影响“盒子”外的任何东西。并且它们是可移植的，因为它们可以安装在其他发行版上，同时提供一致的体验。利用容器的包管理器会将每个软件包安装在不同的容器中，这提供了一个额外的安全层。这给了开发者更多的控制权和灵活性，他们可以决定在软件包内捆绑什么。

传统的打包方式产生了一些问题，比如依赖性和包的冲突，这些问题通常需要解决，而不同的发行版有不同的解决办法。

#### 依赖性和软件包的冲突

如果我们试图安装 [Visual Studio Code][9]（[visual-studio-code-bin][10]），而 [Code - OSS][11]（[code][12]） 已经安装在 Arch Linux 上，我们会遇到这个问题：

```
$ paru -S visual-studio-code-bin
[...]
:: Conflicts found:
    visual-studio-code-bin: code  
:: Conflicting packages will have to be confirmed manually
Aur (1)                     Old Version  New Version  Make Only
aur/visual-studio-code-bin               1.70.1-1     No
```

这就是所谓的软件包冲突，即两个或多个软件包不能共存。在这种情况下，我们不能同时安装 Visual Studio Code 和 Code - OSS。

当两个应用程序或软件包提供相同的文件，具有相同的名称，并被放置在同一目录下，那么它们实际上是不能共存的，因为这些文件会发生冲突。在这个例子中，Visual Studio Code 和 Code - OSS 都提供了一个`code'文件，它们都被放在`/usr/bin`中。Visual Studio Code 提供的`code`文件用于启动 Visual Studio Code，而 Code - OSS 的`code`文件则用于启动 Code - OSS。
虽然这个例子只展示了 Visual Studio Code 和 Code - OSS，但这种情况经常发生在不同的应用程序、库和其他软件中。

#### 无法选择依赖项

![][13]

图片来源：来自 [Unsplash][14] 的 [Priscilla Du Preez][15]

传统安装包格式的最大问题之一是，打包者不能选择依赖项。

例如，如果一个应用程序最近更新，需要依赖版本1的程序A，但该格式安装包的打包程序只提供版本0.9的程序A，那么对于升级该应用程序来说就不太理想，因为打包程序无法满足要求。这意味着打包者将不得不暂缓打包，直到打包程序发布新的依赖项，或者采用变通的方法。

同样，如果一个应用程序需要依赖0.8.1版本的程序A，但该格式安装包的打包程序却只提供了0.9版本的程序A，那么这个应用程序就会表现失常，甚至完全不能运行。

##### 带补丁的库和编译配置

为了扩展，一些应用程序需要带补丁的库或额外的编译配置才能正常运行。例如，OBS Studio 需要一个[打了补丁的 FFmpeg][16] 来与 OBS Studio 更好地整合。

在传统的打包方式下，一次只能安装一个依赖项的变体。如果发行版提供的是未打过补丁的 FFmpeg，那么就没有办法安装打过补丁的 FFmpeg，除非打包者能解决这个问题。如果安装了打过补丁的 FFmpeg，但另一个程序高度依赖未打过补丁的 FFmpeg、打过其他补丁的 FFmpeg、内置或删除了其他功能的 FFmpeg，那么其他程序就会出现bug。

现代应用程序本质上是脆弱的。依赖关系树中的一个小错误或不一致，就会导致应用程序的bug，使用户体验恶化，甚至会让人觉得是应用程序的问题，而不是软件包本身的问题，这就会妨碍应用程序的声誉。

#### 变通方法

让我们看看目前开发者用来打包应用程序的变通方法。

1. 第一种解决方法是在不同的目录中安装依赖库。例如，Electron 是一个巨大的框架，开发者用它来构建应用程序，然后将它们捆绑起来。然而，基于 Electron 的应用程序是不同的，因为它们是建立在不同版本的 Electron 之上的。Discord 捆绑了 Electron 13，而 Element 捆绑了 Electron 19。对于 Arch Linux 上的 Electron 打包，某些目录需要安装在`/opt/APPLICATION_NAME`中，所以这些 Electron 版本[不会相互冲突][17]。
2. 第二种解决方法是篡改应用程序。例如，给应用程序打上补丁，使其在没有某些依赖库或功能的情况下编译，这可以使应用程序成功编译，但不能保证该应用程序能够启动或按预期工作。
4. 第三种解决方法是在编译应用程序时禁用许多编译选项，这也可能禁用一些功能。例如，在 Arch Linux 上，OBS Studio 在编译时禁用了许多基本功能，这[导致了不合格的体验][18]。

这些解决方法因人而异，有些会限制应用程序的功能，有些会引入稳定性问题等等。

#### 不一致的体验

![西班牙兰萨罗特岛（加那利群岛）的蒂曼法亚火山国家公园的火山口景观][19]

图片来源：来自 [Unsplash][20] 的 [alevision.co][21]

虽然这些技术限制在整个传统安装包格式中是一致的，但用户体验往往不是这样。由于安装包的发布方式，发行模式与传统安装包格式相结合会影响用户体验。
一些发行版，如 Arch Linux，接近于开发版，因此有最新版本的软件包。然而 Debian 和 Ubuntu LTS 是 LTS 长期支持版，所以它们的很多软件包都落后几个版本。同时，Fedora Linux 和 Ubuntu 稳定版处于 Debian / Ubuntu LTS 和 Arch Linux 之间。

一些安装包格式喜欢尽可能少地给软件包打补丁，以保持它们最接近原版；而另一些格式打补丁是为了增加更多的功能，使用旧库或进行其他类型的更改，以改善用户体验。一些格式喜欢使软件更加轻量化；而另一些格式更喜欢尽可能地添加更多内置功能。这个名单还在继续。

正如我们所看到的，一个应用程序在不同的发行版中的构建方式非常不同。此外，不同的发行版的依赖关系也是不同的。传统包装的许多技术限制需要根据发行模式和包装政策采取不同的解决方法。这些微小的变化往往给用户带来不完整的、不合格的体验和错误的印象。一些应用程序可能在某些发行版上运行得更好，但在其他发行版上运行得很差，而其他一些应用程序在其他发行版上运行得更好。即使一个应用程序在每个发行版上的构建方式不同，但其名称和品牌却保持原样，给用户留下错误的印象。

### 解决方案

![][22]

图片来源：来自 [Unsplash][23] 的 [Riccardo Annandale][24]

如上所述，解决这些问题的方法是使用容器。

容器被设计用来分离系统的几个方面。通过使用容器，打包者可以挑选依赖项而不受主机库的限制。因此，打包者可以发布最新的、功能完整的软件包，同时保持发行的稳定性。

这一点非常重要，因为这些容器格式可以将应用程序和发行版发挥出最大的作用，而不会对系统造成破坏性的影响。

#### Nix和Flatpak

[Nix][25] 是一个跨平台的包管理器，可以在类Unix操作系统中运行，如Linux发行版、BSD和macOS。Nix有几个[途径][26]（分支）供用户使用。

另一方面，[Flatpak][27] 是一个用于Linux桌面的通用软件包格式，它也利用容器，但另外还有沙盒来隔离它们。它旨在共未来的普通人使用，并被设计为与软件商店（如GNOME Software 和 KDE Discover）集成。换句话说，Flatpak 更像是安装包格式的一个扩展，而不是一个替代品，因为它的设计初衷不是为了取代系统包管理器。

如果使用 NixOS 等发行版，Nix 也可以作为一种扩展或单独使用。

#### 类似的应用

Nix和Flatpak解决了传统安装包格式的许多基本问题。由于应用程序的分离，这些格式可以安装类似的应用程序，如 Visual Studio Code 和 Code - OSS，而不会冲突。

#### 多个版本

Nix 和 Flatpak 可以安装同一个应用程序的多个版本。使用 Nix，我可以从`nixpkgs-stable`（LTS）安装应用程序，同时也可以从`nixpkgs-unstable`（开发版）安装同一个应用程序。

同样地，使用 Flatpak，我可以同时从`stable`和`beta`分支安装应用程序。我可以从更多的途径和分支继续安装同一个应用程序，而不会遇到冲突。

#### 挑剔的依赖项

![采摘樱桃][28]

图片来源：来自 [Unsplash][29] 的 [Ish de loyola][30]

此外，打包者可以将应用程序与不同变体的库捆绑在一起，从而有机会启用更多的构建选项，并使用打过补丁或特定版本的库，从而为用户提供完整的体验。

这意味着打包者可以将打了补丁的 FFmpeg 与 OBS Studio 捆绑在一起，只为使用 OBS Studio。如果我在主机上安装了 vanilla FFmpeg，那么 OBS Studio 的补丁 FFmpeg 就不会与主机的 FFmpeg 发生干扰或冲突。

#### 各个发行版的环境都是一致的

如上所述，各发行版使用不同的补丁、构建选项和环境构建应用程序。这导致了应用程序的碎片化，每个应用程序的构建方式和工作方式往往不尽相同。由于 Nix 和 Flatpak 是为跨发行版运行而设计的，它们在每个发行版中为应用程序提供一致的环境，前提是发行版提供了 Nix 或 Flatpak 的支持版本。

#### 缺点

就像所有事物一样，Nix 和 Flatpak 不是完美的。由于容器最近被推送到了 Linux 桌面上，它们可能为许多应用程序提供不寻常的环境。

Flatpak 不仅包含了应用程序，还对它们进行沙盒处理。Flatpak 的开发者已经实施了一个短期的变通方案，“在沙盒上打洞”，即所谓的静态权限。他们正在开发适当的长期解决方案，称为[XDG 门户][31]，以解决有关沙盒的许多问题，并使其像 Android 的安全模型一样。

唯一的短期问题是，工具包、框架和应用程序必须采用这些标准。GTK 和 Qt 是一些集成了其中一些门户的工具包，但它们也需要时间来集成其他的门户。同时，许多其他的工具箱还没有真正集成任何门户。
工具包、框架和应用程序采用这些新标准是一个时间问题，因为在 XDG 门户之前没有任何适当的标准。应用程序可以直接访问文件系统和 API，所以静态权限保持这种 "标准"。

### 结论

传统包装的根本问题是它没有利用容器。许多图形化的应用程序本质上是复杂的，需要非常具体的依赖关系才能按预期运行。许多发行版通过使用变通的方法在不同的环境中构建同一个应用程序，例如给应用程序打补丁或禁用构建选项。这导致了一个应用程序的不同变体、不一致的行为和不合格的用户体验。

当然，发行版的维护者不可能在10天内现实地重写他们的包管理器并使用容器。这些重写会破坏许多脚本、功能等，而且还需要很长时间才能投入生产。

我个人的建议是使用和推广 Flatpak，因为它只是为了扩展现有的发行版，而不是取代它。包装商将不必担心包装应用程序和诉诸变通的问题，因为 Flatpak 已经在处理这些问题了。

作者：Hari Rana 并[最初发表于本博客][32]。

Hari 是 Fedora 杂志的 Fedora 编辑委员会的成员。他也是 Fedoea 质量保证（QA）的一员。Hari 希望通过推广各种技术和帮助需要帮助的人，为 Linux 桌面的采用作出贡献。

**本文所表达的观点和意见是作者本人的，不一定代表 It's FOSS。**

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/traditional-packaging-modern-applications/

作者：[Community][a]
选题：[lkxed][b]
译者：[gpchn](https://github.com/gpchn)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/team/
[b]: https://github.com/lkxed
[1]: https://images.unsplash.com/photo-1573376670774-4427757f7963?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDY2fHxwYWNrYWdpbmd8ZW58MHx8fHwxNjYyNzgzMzY1&ixlib=rb-1.2.1&q=80&w=1200
[2]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[3]: https://unsplash.com/es/@kelli_mcclintock?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[4]: https://code.visualstudio.com/
[5]: https://github.com/microsoft/vscode
[6]: https://images.unsplash.com/photo-1612933510543-5b442296703b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDEwfHxwcm9ibGVtfGVufDB8fHx8MTY2Mjc4MzEwNg&ixlib=rb-1.2.1&q=80&w=2000
[7]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[8]: https://unsplash.com/@simmerdownjpg?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[9]: https://code.visualstudio.com/
[10]: https://aur.archlinux.org/packages/visual-studio-code-bin
[11]: https://github.com/microsoft/vscode
[12]: https://archlinux.org/packages/community/x86_64/code/
[13]: https://images.unsplash.com/photo-1601001816339-74036796370c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDl8fGNoZXJyeSUyMHBpY2t8ZW58MHx8fHwxNjYyNzgzNDA4&ixlib=rb-1.2.1&q=80&w=2000
[15]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[14]: https://unsplash.com/@priscilladupreez?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[16]: https://github.com/obsproject/obs-studio/blob/fe889ec28ebd2f323b5933b7b11c5a9207539c59/CI/flatpak/com.obsproject.Studio.json#L259-L261
[17]: https://wiki.archlinux.org/index.php?title=Electron_package_guidelines&oldid=661963#Directory_structure
[18]: https://www.youtube.com/watch?v=FPjEdrik-eQ
[19]: https://images.unsplash.com/photo-1595399822864-94ec54889cc7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDl8fGJ1bXB5JTIwcm9hZHxlbnwwfHx8fDE2NjI3ODQ3MTI&ixlib=rb-1.2.1&q=80&w=2000
[20]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[21]: https://unsplash.com/@alevisionco?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[22]: https://images.unsplash.com/photo-1474631245212-32dc3c8310c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDR8fHNvbHV0aW9ufGVufDB8fHx8MTY2Mjc4MzI5NA&ixlib=rb-1.2.1&q=80&w=2000
[23]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[24]: https://unsplash.com/@pavement_special?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[25]: https://github.com/NixOS/Nix
[26]: https://nixos.wiki/wiki/Nix_channels
[27]: https://flatpak.org/
[28]: https://images.unsplash.com/photo-1626829622490-43c7d7c80ac8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDF8fGNoZXJyeSUyMHBpY2t8ZW58MHx8fHwxNjYyNzgzNDA4&ixlib=rb-1.2.1&q=80&w=2000
[29]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[30]: https://unsplash.com/@ishphotos_?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[31]: https://github.com/flatpak/xdg-desktop-portal
[32]: https://theevilskeleton.gitlab.io/2022/08/29/traditional-packaging-is-not-suitable-for-modern-applications.html
