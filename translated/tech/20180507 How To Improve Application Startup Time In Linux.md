如何改善应用程序在 Linux 中的启动时间
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/Preload-720x340.png)
大多数 Linux 发行版在默认配置下已经足够快了。但是，我们仍然可以借助一些额外的应用程序和方法让它们启动更快一点。其中一个可用的这种应用程序就是 **Preload**。它监视用户使用频率比较高的应用程序，并将它们添加到内存中，这样就比一般的方式加载更快一点。因为，正如你所知道的，内存的读取速度远远快于硬盘。Preload 以守护进程的方式在后台中运行，并记录用户使用较为频繁的程序的文件使用相关的统计数据。然后，它将这些二进制文件及它们的依赖项加载进内存，以改善应用程序的加载时间。简而言之，一旦安装了 preload，你使用较为频繁的应用程序将可能加载的更快。

在这篇详细的教程中，我们将去了解如何安装和使用 Preload，以改善应用程序在 Linux 中的启动时间。

### 在 Linux 中使用 Preload 改善应用程序启动时间

Preload 可以在 [**AUR**][1]  上找到。因此，你可以使用 AUR 助理程序在任何基于 Arch 的系统上去安装它，比如，Antergos、Manjaro Linux。

使用 [**Pacaur**][2]:
```
$ pacaur -S preload

```

使用 [**Packer**][3]:
```
$ packer -S preload

```

使用 [**Trizen**][4]:
```
$ trizen -S preload

```

使用 [**Yay**][5]:
```
$ yay -S preload

```

使用 [**Yaourt**][6]:
```
$ yaourt -S preload

```

在 Debian、Ubuntu、Linux Mint 上，Preload 可以在默认仓库中找到。因此，你可以像下面一样，使用 APT 包管理器去安装它。
```
$ sudo apt-get install preload

```

Preload 安装完成后，重新启动你的系统。从现在开始，Preload 将监视频繁使用的应用程序，并将它们的二进制文件和库添加到内存中，以使它的启动速度更快。比如，如果你经常使用 Firefox、Chrome 以及 LibreOffice，Preload 将添加这些二进制文件和库到内存中，因此，这些应用程序将启动的更快。而且更好的是，它不需要做任何配置。它是开箱即用的。但是，如果你想去对它进行微调，你可以通过编辑缺省的配置文件 **/etc/preload.conf** 来实现。

### Preload 并不一定适合每个人！

以下是 Preload 的一些缺点，它并不是对每个人都有帮助，在这个 [**跟贴**][7] 中有讨论到。

  1. 我使用的是一个有 8GB 内存的现代系统。因此，我的系统总体上来说很快。我每天只打开狂吃内存的应用程序（比如，Firefox、Chrome、VirtualBox、Gimp、等等）一到两次，并且它们始终处于打开状态，因此，它们的二进制文件和库被预读到内存中，并始终整天在内存中。我一般很少去关闭和打开这些应用程序，因此，内存使用纯属浪费。
  2. 如果你使用的是带有 SSD 的现代系统，Preload 是绝对没用的。因为 SSD 的访问时间比起一般的硬盘来要快的多，因此，使用 Preload 是没有意义的。
  3. Preload 显著影响启动时间。因为大多数的应用程序都预读到内存中，长此以往，将让你的系统启动和运行的更快。



你只有在每天都在大量的重新加载应用程序时，才能看到真正的差别。因此，Preload 最适合开发人员和测试人员，他们每天都打开和关闭应用程序好多次。

关于 Preload  更多的信息和它是如何工作的，请阅读它的作者写的完整版的 [**Preload 论文**][8]。

教程到此为止，希望能帮到你。后面还有更精彩的内容，请继续关注！

再见！



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-improve-application-startup-time-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/preload/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[5]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:https://askubuntu.com/questions/110335/drawbacks-of-using-preload-why-isnt-it-included-by-default
[8]:https://cs.uwaterloo.ca/~brecht/courses/702/Possible-Readings/prefetching-to-memory/preload-thesis.pdf
