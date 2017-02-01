在 Fedora 上使用 Redshift 改善睡眠
===============================================

![redshift](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/redshift-945x400.png) 

大多数电子设备发射的蓝光被认为对我们的睡眠有负面影响。作为一个尝试，我们可以在黑暗中不再使用我们的电子设备，以改善我们的睡眠。然而，由于这对我们大多数人并不是很适合，更好的方法是根据你周围环境调整屏幕的色温。实现这一点的最流行的方法之一是使用 Redshift。 Redshift 的创建者 Jon Lund Steffensen 这样描述了他的程序：

> Redshift 会根据你周围的环境调整屏幕的色温。如果你在夜间在屏幕前工作，它可以帮助你减少眼睛伤害。

Redshift 在 Fedora Workstation 上仅工作在 X11 会话中。所以如果你使用 Fedora 24，Redshift 可以工作在默认登录会话中。然而，在 Fedora 25 上，登录的默认会话是 Wayland，因此你将需要替代使用其 GNOME shell 扩展。注意，这个 GNOME Shell 扩展也适用于 X11 会话。

### Redshift 工具

#### 安装

Redshift 在 Fedora 的仓库中，因此我们使用下面的命令安装：

```
sudo dnf install redshift
```

该软件也提供了 GUI。要使用的话就安装 `redshift-gtk`。记住，这个工具只能在 X11 会话中使用：

#### 使用 Redshift 工具

用像下面的命令在命令行中运行：

```
redshift -l 23.6980:133.8807 -t 5600:3400
```

在以上命令中，`-l 23.6980:133.8807` 的意思是我们通知 Redshift 我们当前的位置是南纬 23.6980°，东经 133.8807°。 `-t 5600:3400` 表明你白天想要的色温是 5600，晚上是 3400。

色温与发射的蓝光的量成比例：较低的色温意味着较低量的蓝光。我喜欢在白天使用 5600K（6500K 是中性日光），在晚上使用 3400K（更低的色温让我觉得像盯着番茄一样），但你可以随意尝试。

如果你不指定位置，Redshift 会尝试使用 Geoclue 方法来确定你的位置坐标。如果此方法不起作用，你可以使用几个[网站][2]和在线地图来查找坐标。

![screenshot1](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/screenshot1.png) 

别忘记将 Redshift 设置为自动启动，查看 [Jon 的网站][3]来获取更多信息。

### Redshift GNOME Shell 扩展

该程序不能在运行 Wayland 显示服务器（这是 Fedora 25 中的标准）的环境中工作。幸运的是，这里有一个方便的 GNOME Shell 扩展可以做到同样的工作。要安装它，请运行以下命令：

```
sudo dnf copr enable mystro256/gnome-redshift
sudo dnf install gnome-shell-extension-redshift
```

从 COPR 仓库安装后，注销并重新登录你的 Fedora Workstation，然后在 GNOME Tweak 工具中启用它。关于更多信息，请查看 gnome-redshift 的 [copr 仓库][4]或 [github 仓库][5]。

启用扩展后，GNOME shell 右上角会出现一个小小的太阳（或月亮）图标。该扩展还提供了一个设置对话框来调整 redshift 和温度的时间。

![screenshot-from-2017-01-18-15-21-47](https://cdn.fedoramagazine.org/wp-content/uploads/2017/01/Screenshot-from-2017-01-18-15-21-47.jpg) 

### 相关软件

#### F.lux

Redshift 可以被看作是 F.lux 的开源变体。现在有一个 [linux 版本的 F.lux][6]。如果你不介意使用闭源软件，或者 Redshift 不能正常工作，你可以考虑使用它。

#### Android 版 Twilight 

Twilight 与 Redshift 相似，但是用于 Android。它可以让你在晚上在智能手机或平板上阅读更加舒服。

#### Redshift plasmoid

这是 Redshift GUI 的 KDE 版本。你可以在 [github ][7] 中找到更多信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/safe-eyes-redshift/

作者：[novel][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://novel.id.fedoraproject.org/
[1]:https://fedoramagazine.org/safe-eyes-redshift/
[2]:http://www.latlong.net/
[3]:http://jonls.dk/redshift/
[4]:https://copr.fedorainfracloud.org/coprs/mystro256/gnome-redshift/
[5]:https://github.com/benzea/gnome-shell-extension-redshift
[6]:https://justgetflux.com/linux.html
[7]:https://github.com/simgunz/redshift-plasmoid
