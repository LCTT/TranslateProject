使用 snapcraft 将 snap 包发布到商店
==================

![snaps](https://insights.ubuntu.com/wp-content/uploads/9be3/Snaps.jpg)

Ubuntu Core 已经正式发布（LCTT 译注：指 2016 年 11 月发布的 Ubuntu Snappy Core 16 ），也许是时候让你的 snap 包进入商店了！

### 交付和商店的概念

首先回顾一下我们是怎么通过商店管理 snap 包的吧。

每次你上传 snap 包，商店都会为其分配一个修订版本号，并且商店中针对特定 snap 包 的版本号都是唯一的。

但是第一次上传 snap 包的时候，我们首先要为其注册一个还没有被使用的名字，这很容易。

商店中所有的修订版本都可以释放到多个通道中，这些通道只是概念上定义的，以便给用户一个稳定或风险等级的参照，这些通道有:

*   稳定（stable）
*   候选（candidate）
*   测试（beta）
*   边缘（edge）

理想情况下，如果我们设置了 CI/CD 过程，那么每天或在每次更新源码时都会将其推送到边缘通道。在此过程中有两件事需要考虑。

首先在开始的时候，你最好制作一个不受限制的 snap 包，因为在这种新范例下，snap 包的大部分功能都能不受限制地工作。考虑到这一点，你的项目开始时 `confinement` 将被设置为 `devmode`（LCTT 译注：这是 `snapcraft.yaml` 中的一个键及其可选值）。这使得你在开发的早期阶段，仍然可以让你的 snap 包进入商店。一旦所有的东西都得到了 snap 包运行的安全模型的充分支持，那么就可以将 `confinement` 修改为 `strict`。

好了，假设你在限制方面已经做好了，并且也开始了一个对应边缘通道的 CI/CD 过程，但是如果你也想确保在某些情况下，早期版本 master 分支新的迭代永远也不会进入稳定或候选通道，那么我们可以使用 `gadge` 设置。如果 snap 包的 `gadge` 设置为 `devel` （LCTT注：这是 `snapcraft.yaml` 中的一个键及其可选值），商店将会永远禁止你将 snap 包释放到稳定和候选通道。

在这个过程中，我们有时可能想要发布一个修订版本到测试通道，以便让有些用户更愿意去跟踪它（一个好的发布管理流程应该比一个随机的日常构建更有用）。这个阶段结束后，如果希望人们仍然能保持更新，我们可以选择关闭测试通道，从一个特定的时间点开始我们只计划发布到候选和稳定通道，通过关闭测试通道我们将使该通道跟随稳定列表中的下一个开放通道，在这里是候选通道。而如果候选通道跟随的是稳定通道后，那么最终得到是稳定通道了。

### 进入 Snapcraft

那么所有这些给定的概念是如何在 snapcraft 中配合使用的？首先我们需要登录:

```
$ snapcraft login
Enter your Ubuntu One SSO credentials.
Email: sxxxxx.sxxxxxx@canonical.com
Password: **************
Second-factor auth: 123456
```

在登录之后，我们就可以开始注册 snap 了。例如，我们想要注册一个虚构的 snap 包 awesome-database：

```
$ snapcraft register awesome-database
We always want to ensure that users get the software they expect
for a particular name.

If needed, we will rename snaps to ensure that a particular name
reflects the software most widely expected by our community.

For example, most people would expect ‘thunderbird’ to be published by
Mozilla. They would also expect to be able to get other snaps of
Thunderbird as 'thunderbird-sergiusens'.

Would you say that MOST users will expect 'a' to come from
you, and be the software you intend to publish there? [y/N]: y

You are now the publisher for 'awesome-database'
```

假设我们已经构建了 snap 包，接下来我们要做的就是把它上传到商店。我们可以在同一个命令中使用快捷方式和 `--release` 选项：

```
$ snapcraft push awesome-databse_0.1_amd64.snap --release edge
Uploading awesome-database_0.1_amd64.snap [=================] 100%
Processing....
Revision 1 of 'awesome-database' created.

Channel    Version    Revision
stable     -          -
candidate  -          -
beta       -          -
edge       0.1        1

The edge channel is now open. 
```

如果我们试图将其发布到稳定通道，商店将会阻止我们：

```
$ snapcraft release awesome-database 1 stable
Revision 1 (devmode) cannot target a stable channel (stable, grade: devel) 
```

这样我们不会搞砸，也不会让我们的忠实用户使用它。现在，我们将最终推出一个值得发布到稳定通道的修订版本：

```
$ snapcraft push awesome-databse_0.1_amd64.snap
Uploading awesome-database_0.1_amd64.snap [=================] 100%
Processing....
Revision 10 of 'awesome-database' created. 
```

注意，<ruby>版本号<rt>version</rt></ruby>（LCTT 译注：这里指的是 snap 包名中 `0.1` 这个版本号）只是一个友好的标识符，真正重要的是商店为我们生成的<ruby>修订版本号<rt>Revision</rt></ruby>（LCTT 译注：这里生成的修订版本号为 `10`）。现在让我们把它释放到稳定通道：

```
$ snapcraft release awesome-database 10 stable
Channel    Version    Revision
stable     0.1        10
candidate  ^          ^
beta       ^          ^
edge       0.1        10

The 'stable' channel is now open. 
```

在这个针对我们正在使用架构最终的通道映射视图中，可以看到边缘通道将会被固定在修订版本 10 上，并且测试和候选通道将会跟随现在修订版本为 10 的稳定通道。由于某些原因，我们决定将专注于稳定性并让我们的 CI/CD 推送到测试通道。这意味着我们的边缘通道将会略微过时，为了避免这种情况，我们可以关闭这个通道：

```
 $ snapcraft close awesome-database edge
Arch    Channel    Version    Revision
amd64   stable     0.1        10
        candidate  ^          ^
        beta       ^          ^
        edge       ^          ^

The edge channel is now closed. 
```

在当前状态下，所有通道都跟随着稳定通道，因此订阅了候选、测试和边缘通道的人也将跟踪稳定通道的改动。比如就算修订版本 11 只发布到稳定通道，其他通道的人们也能看到它。

这个清单还提供了完整的体系结构视图，在本例中，我们只使用了 amd64。

### 获得更多的信息

有时过了一段时间，我们想知道商店中的某个 snap 包的历史记录和现在的状态是什么样的，这里有两个命令，一个是直截了当输出当前的状态，它会给我们一个熟悉的结果:

```
 $ snapcraft status awesome-database
Arch    Channel    Version    Revision
amd64   stable     0.1        10
        candidate  ^          ^
        beta       ^          ^
        edge       ^          ^ 
```

我们也可以通过下面的命令获得完整的历史记录：

```
 $ snapcraft history awesome-database
Rev.    Uploaded              Arch       Version    Channels
3       2016-09-30T12:46:21Z  amd64      0.1        stable*
...
...
...
2       2016-09-30T12:38:20Z  amd64      0.1        -
1       2016-09-30T12:33:55Z  amd64      0.1        - 
```

### 结束语

希望这篇文章能让你对商店能做的事情有一个大概的了解，并让更多的人开始使用它！

--------------------------------

via: https://insights.ubuntu.com/2016/11/15/making-your-snaps-available-to-the-store-using-snapcraft/

*译者简介：*

> snapcraft.io 的钉子户，对 Ubuntu Core、Snaps 和 Snapcraft 有着浓厚的兴趣，并致力于将这些还在快速发展的新技术通过翻译或原创的方式介绍到中文世界。有兴趣的小伙伴也可以关注译者个人的公众号： `Snapcraft`，近期会在上面连载几篇有关 Core snap 发布策略、交付流程和验证流程的文章，欢迎围观 :）


作者：[Sergio Schvezov][a]
译者：[Snapcrafter](https://github.com/Snapcrafter)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/sergio-schvezov/
[1]:https://insights.ubuntu.com/author/sergio-schvezov/
[2]:http://snapcraft.io/docs/build-snaps/publish
