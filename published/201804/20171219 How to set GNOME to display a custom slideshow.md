如何设置 GNOME 显示自定义幻灯片
======

> 使用一个简单的 XML，你就可以设置 GNOME 能够在桌面上显示一个幻灯片。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_blue.png?itok=IfckxN48)

在 GNOME 中，一个非常酷、但却鲜为人知的特性是它能够将幻灯片显示为墙纸。你可以从 [GNOME 控制中心][1]的 “背景设置” 面板中选择墙纸幻灯片。在预览的右下角显示一个小时钟标志，可以将幻灯片的墙纸与静态墙纸区别开来。 

一些发行版带有预装的幻灯片壁纸。 例如，Ubuntu 包含了库存的 GNOME 定时壁纸幻灯片，以及 Ubuntu 壁纸大赛胜出的墙纸。

如果你想创建自己的自定义幻灯片用作壁纸怎么办？虽然 GNOME 没有为此提供一个用户界面，但是在你的主目录中使用一些简单的 XML 文件来创建一个是非常容易的。 幸运的是，GNOME 控制中心的背景选择支持一些常见的目录路径，这样就可以轻松创建幻灯片，而不必编辑你的发行版所提供的任何内容。

### 开始

使用你最喜欢的文本编辑器在 `$HOME/.local/share/gnome-background-properties/` 创建一个 XML 文件。 虽然文件名不重要，但目录名称很重要（你可能需要创建该目录）。 举个例子，我创建了带有以下内容的 `/home/ken/.local/share/gnome-background-properties/osdc-wallpapers.xml`：

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
 <wallpaper deleted="false">
   <name>Opensource.com Wallpapers</name>
   <filename>/home/ken/Pictures/Wallpapers/osdc/osdc.xml</filename>
   <options>zoom</options>
 </wallpaper>
</wallpapers>
```

每一个你需要包含在 GNOME 控制中心的 “背景面板”中的每个幻灯片或静态壁纸，你都要在上面的 XML 文件需要为其增加一个 `<wallpaper>` 节点。

在这个例子中，我的 `osdc.xml` 文件看起来是这样的：


```
<?xml version="1.0" ?>
<background>
  <static>
    <!-- Duration in seconds to display the background -->
    <duration>30.0</duration>
    <file>/home/ken/Pictures/Wallpapers/osdc/osdc_2.png</file>
  </static>
  <transition>
    <!-- Duration of the transition in seconds, default is 2 seconds -->
    <duration>0.5</duration>
    <from>/home/ken/Pictures/Wallpapers/osdc/osdc_2.png</from>
    <to>/home/ken/Pictures/Wallpapers/osdc/osdc_1.png</to>
  </transition>
  <static>
    <duration>30.0</duration>
    <file>/home/ken/Pictures/Wallpapers/osdc/osdc_1.png</file>
  </static>
  <transition>
    <duration>0.5</duration>
    <from>/home/ken/Pictures/Wallpapers/osdc/osdc_1.png</from>
    <to>/home/ken/Pictures/Wallpapers/osdc/osdc_2.png</to>
  </transition>
</background>
```

上面的 XML 中有几个重要的部分。 XML 中的 `<background>` 节点是你的外部节点。 每个背景都支持多个 `<static>` 和 `<transition>` 节点。

`<static>` 节点定义用 `<file>` 节点要显示的图像以及用 `<duration>` 显示它的持续时间。

`<transition>` 节点定义 `<duration>`（变换时长），`<from>` 和 `<to>` 定义了起止的图像。

### 全天更换壁纸

另一个很酷的 GNOME 功能是基于时间的幻灯片。 你可以定义幻灯片的开始时间，GNOME 将根据它计算时间。 这对于根据一天中的时间设置不同的壁纸很有用。 例如，你可以将开始时间设置为 06:00，并在 12:00 之前显示一张墙纸，然后在下午和 18:00 再次更改。

这是通过在 XML 中定义 `<starttime>` 来完成的，如下所示：

```
<starttime>
    <!-- A start time in the past is fine -->
    <year>2017</year>
    <month>11</month>
    <day>21</day>
    <hour>6</hour>
    <minute>00</minute>
    <second>00</second>
</starttime>
```

上述 XML 文件定义于 2017 年 11 月 21 日 06:00 开始动画，时长为 21,600.00，相当于六个小时。 这段时间将显示你的早晨壁纸直到 12:00，12:00 时它会更改为你的下一张壁纸。 你可以继续以这种方式每隔一段时间更换一次壁纸，但确保所有持续时间的总计为 86,400 秒（等于 24 小时）。

GNOME 将计算开始时间和当前时间之间的增量，并显示当前时间的正确墙纸。 例如，如果你在 16:00 选择新壁纸，则GNOME 将在 06:00 开始时间之后显示 36,000 秒的适当壁纸。

有关完整示例，请参阅大多数发行版中由 gnome-backgrounds 包提供的 adwaita-timed 幻灯片。 它通常位于 `/usr/share/backgrounds/gnome/adwaita-timed.xml` 中。


### 了解更多信息

希望这可以鼓励你深入了解创建自己的幻灯片壁纸。 如果你想下载本文中引用的文件的完整版本，那么你可以在 [GitHub][2] 上找到它们。

如果你对用于生成 XML 文件的实用程序脚本感兴趣，你可以在互联网上搜索 `gnome-backearth-generator`。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/create-your-own-wallpaper-slideshow-gnome

作者：[Ken Vandine][a]
译者：[Auk7F7](https://github.com/Auk7F7)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kenvandine
[1]:http://manpages.ubuntu.com/manpages/xenial/man1/gnome-control-center.1.html
[2]:https://github.com/kenvandine/misc/tree/master/articles/osdc/gnome/slide-show-backgrounds/osdc

