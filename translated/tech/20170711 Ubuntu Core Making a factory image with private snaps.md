Ubuntu Core：制作包含私有 snap 的工厂镜像
========

这篇帖子是有关 [在 Ubuntu Core 开发 ROS 原型到成品][1] 系列的补充，用来回答我收到的一个问题： “我想做一个工厂镜像，但我不想使我的 snap 公开” 当然，这个问题和回答都不只是针对于机器人技术。在这篇帖子中，我将会通过两种方法来回答这个问题。

开始之前，你需要了解一些制作 Ubuntu Core 镜像的背景知识，如果你已经看过 [在 Ubuntu Core 开发 ROS 原型到成品[3] 系列文章（具体是第 5 部分），你就已经有了需要的背景知识，如果没有看过的话，可以查看有关 [制作你的 Ubuntu Core 镜像][5] 的教程。

如果你已经了解了最新的情况，并且当我说 “模型定义” 或者 “模型断言” 时知道我在谈论什么，那就让我们开始通过不同的方法使用私有 sanps 来制作 Ubuntu Core 镜像吧。

### 方法 1： 不要上传你的 snap 到商店

这是最简单的方法了。首先看一下这个有关模型定义的例子——`amd64-model.json`：

```
{
    "type": "model",
    "series": "16",
    "model": "custom-amd64",
    "architecture": "amd64",
    "gadget": "pc",
    "kernel": "pc-kernel",
    "authority-id": "4tSgWHfAL1vm9l8mSiutBDKnnSQBv0c8",
    "brand-id": "4tSgWHfAL1vm9l8mSiutBDKnnSQBv0c8",
    "timestamp": "2017-06-23T21:03:24+00:00",
    "required-snaps": ["kyrofa-test-snap"]
}
```

让我们将它转换成模型断言：

```
$ cat amd64-model.json | snap sign -k my-key-name > amd64.model
You need a passphrase to unlock the secret key for
user: "my-key-name"
4096-bit RSA key, ID 0B79B865, created 2016-01-01
...
```

获得模型断言：`amd64.model` 后，如果你现在就把它交给 `ubuntu-image` 使用，你将会碰钉子：

```
$ sudo ubuntu-image -c stable amd64.model 
Fetching core
Fetching pc-kernel
Fetching pc
Fetching kyrofa-test-snap
error: cannot find snap "kyrofa-test-snap": snap not found
COMMAND FAILED: snap prepare-image --channel=stable amd64.model /tmp/tmp6p453gk9/unpack
```

实际上商店中并没有名为 `kyrofa-test-snap` 的 snap。这里需要重点说明的是：模型定义（以及转换后的断言）只包含了一系列的 snap 的名字。如果你在本地有个那个名字的 snap，即使它没有存在于商店中，你也可以通过 `--extra-snaps` 选项告诉 `ubuntu-image` 在断言中匹配这个名字来使用它：

```
$ sudo ubuntu-image -c stable \
         --extra-snaps /path/to/kyrofa-test-snap_0.1_amd64.snap \
         amd64.model
Fetching core
Fetching pc-kernel
Fetching pc
Copying "/path/to/kyrofa-test-snap_0.1_amd64.snap" (kyrofa-test-snap)
kyrofa-test-snap already prepared, skipping
WARNING: "kyrofa-test-snap" were installed from local snaps
disconnected from a store and cannot be refreshed subsequently!
Partition size/offset need to be a multiple of sector size (512).
The size/offset will be rounded up to the nearest sector.
```

现在，在 snap 并没有上传到商店的情况下，你已经获得一个预装了私有 snap 的 Ubuntu Core 镜像（名为 `pc.img`）。但是这样做有一个很大的问题，ubuntu-image 会提示一个警告：不通过连接商店预装 snap 意味着你没有办法在烧录了这些镜像的设备上更新它。你只能通过制作新的镜像并重新烧录到设备的方式来更新它。

### 方法 2： 使用品牌商店

当你注册了一个商店账号并访问 [dashboard.snapcraft.io][6] 时，你其实是在标准的 Ubuntu 商店中查看你的 snap。如果你是在系统中新安装的 snapd，默认会从这个商店下载。虽然你可以在 Ubuntu 商店中发布私有的 snap，但是你[不能将它们预装到镜像中][7]，因为只有你（以及你添加的合作者）才有权限去使用它。在这种情况下制作镜像的唯一方式就是公开发布你的 snap，然而这并不符合这篇帖子的目的。

对于这种用例，我们有所谓的 [品牌商店][8]。品牌商店仍然托管在 Ubuntu 商店里，但是它们是针对于某一特定公司或设备的一个定制的、专门的版本。品牌商店可以继承或者不继承标准的 Ubuntu 商店，品牌商店也可以选择开放给所有的开发者或者将其限制在一个特定的组内（保持私有正是我们想要的）。

请注意，这是一个付费功能。你需要 [申请一个品牌商店][9]。请求通过后，你将可以通过访问用户名下的 “stores you can access” 看到你的新商店。

![](https://insights.ubuntu.com/wp-content/uploads/1a62/stores_you_can_access.jpg)

在那里你可以看到多个有权使用的商店。最少的情况下也会有两个：标准的 Ubuntu 商店以及你的新的品牌商店。选择品牌商店（红框），进去后记录下你的商店 ID（蓝框）：等下你将会用到它。

![](https://insights.ubuntu.com/wp-content/uploads/b10c/Screenshot-from-2017-07-06-15-16-32.png)

在品牌商店里注册名字或者上传 snap 和标准的商店使用的方法是一样的，只是它们现在是上传到你的品牌商店而不是标准的那个。如果你将品牌商店放在 unlisted 里面，那么这些 snap 对外部用户是不可见。但是这里需要注意的是第一次上传 snap 的时候需要通过 web 界面来操作。在那之后，你可以继续像往常一样使用 Snapcraft 来操作。

那么这些是如何改变的呢？我的 “kyrofal-store” 从 Ubuntu 商店继承了 snap，并且还包含一个发布在稳定通道中的 “kyrofa-bran-test-snap” 。这个 snap 在 Ubuntu 商店里是使用不了的，如果你去搜索它，你是找不到的：

```
$ snap find kyrofa-branded
The search "kyrofa-branded" returned 0 snaps
```

但是使用我们前面记录的商店 ID，我们可以创建一个从品牌商店而不是 Ubuntu 商店下载 snap 的模型断言。我们只需要将 “store” 键添加到 JSON 文件中，就像这样：

```
{
    "type": "model",
    "series": "16",
    "model": "custom-amd64",
    "architecture": "amd64",
    "gadget": "pc",
    "kernel": "pc-kernel",
    "authority-id": "4tSgWHfAL1vm9l8mSiutBDKnnSQBv0c8",
    "brand-id": "4tSgWHfAL1vm9l8mSiutBDKnnSQBv0c8",
    "timestamp": "2017-06-23T21:03:24+00:00",
    "required-snaps": ["kyrofa-branded-test-snap"],
    "store": "ky<secret>ek"
}
```

使用方法 1 中的方式对它签名，然后我们就可以像这样很简单的制作一个预装有我们品牌商店私有 snap 的 Ubuntu Core 镜像：

```
$ sudo ubuntu-image -c stable amd64.model
Fetching core
Fetching pc-kernel
Fetching pc
Fetching kyrofa-branded-test-snap
Partition size/offset need to be a multiple of sector size (512).
The size/offset will be rounded up to the nearest sector.
```

现在，和方法 1 的最后一样，你获得了一个为工厂准备的 `pc.img`。并且使用这种方法制作的镜像中的所有 snap 都从商店下载的，这意味着它们将能像平常一样自动更新。

### 结论

到目前为止，做这个只有两种方法。当我开始写这篇帖子的时候，我想过可能还有第三种（将 snap 设置为私有然后使用它制作镜像），[但最后证明是不行的][12]。

另外，我们也收到很多内部部署或者企业商店的请求，虽然这样的产品还没有公布，但是商店团队正在从事这项工作。一旦可用，我将会写一篇有关它的文章。

希望能帮助到您！

---

关于作者

Kyle 是 Snapcraft 团队的一员，也是 Canonical 公司的常驻机器人专家，他专注于 snaps 和 snap 开发实践，以及 snaps 和 Ubuntu Core 的机器人技术实现。

---

via: https://insights.ubuntu.com/2017/07/11/ubuntu-core-making-a-factory-image-with-private-snaps/

作者：[Kyle Fazzari][a]
译者：[Snaplee](https://github.com/Snaplee)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]: https://insights.ubuntu.com/2017/04/06/from-ros-prototype-to-production-on-ubuntu-core/
[2]: https://insights.ubuntu.com/2017/04/06/from-ros-prototype-to-production-on-ubuntu-core/
[3]: https://insights.ubuntu.com/2017/04/06/from-ros-prototype-to-production-on-ubuntu-core/
[4]: https://insights.ubuntu.com/2017/04/06/from-ros-prototype-to-production-on-ubuntu-core/
[5]: https://tutorials.ubuntu.com/tutorial/create-your-own-core-image
[6]: https://dashboard.snapcraft.io/dev/snaps/
[7]: https://forum.snapcraft.io/t/unable-to-create-an-image-that-uses-private-snaps
[8]: https://docs.ubuntu.com/core/en/build-store/index?_ga=2.103787520.1269328701.1501772209-778441655.1499262639
[9]: https://docs.ubuntu.com/core/en/build-store/create
[12]: https://forum.snapcraft.io/t/unable-to-create-an-image-that-uses-private-snaps/1115
[14]: https://insights.ubuntu.com/2017/04/06/from-ros-prototype-to-production-on-ubuntu-core/
