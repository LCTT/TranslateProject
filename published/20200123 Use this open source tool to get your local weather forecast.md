[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11879-1.html)
[#]: subject: (Use this open source tool to get your local weather forecast)
[#]: via: (https://opensource.com/article/20/1/open-source-weather-forecast)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用这个开源工具获取本地天气预报
======

> 在我们的 20 个使用开源提升生产力的系列的第十三篇文章中使用 wego 来了解出门前你是否要需要外套、雨伞或者防晒霜。

![](https://img.linux.net.cn/data/attachment/album/202002/11/140842a8qwomfeg9mwegg8.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 wego 了解天气

过去十年我对我的职业最满意的地方之一是大多数时候是远程工作。尽管现实情况是我很多时候是在家里办公，但我可以在世界上任何地方工作。缺点是，离家时我会根据天气做出一些决定。在我居住的地方，“晴朗”可以表示从“酷热”、“低于零度”到“一小时内会小雨”。能够了解实际情况和快速预测非常有用。

![Wego][2]

[Wego][3] 是用 Go 编写的程序，可以获取并显示你的当地天气。如果你愿意，它甚至可以用闪亮的 ASCII 艺术效果进行渲染。

要安装 `wego`，你需要确保在系统上安装了[Go][4]。之后，你可以使用 `go get` 命令获取最新版本。你可能还想将 `~/go/bin` 目录添加到路径中：

```
go get -u github.com/schachmat/wego
export PATH=~/go/bin:$PATH
wego
```

首次运行时，`wego` 会报告缺失 API 密钥。现在你需要决定一个后端。默认后端是 [Forecast.io][5]，它是 [Dark Sky][6]的一部分。`wego` 还支持 [OpenWeatherMap][7] 和 [WorldWeatherOnline][8]。我更喜欢 OpenWeatherMap，因此我将在此向你展示如何设置。

你需要在 OpenWeatherMap 中[注册 API 密钥][9]。注册是免费的，尽管免费的 API 密钥限制了一天可以查询的数量，但这对于普通用户来说应该没问题。得到 API 密钥后，将它放到 `~/.wegorc` 文件中。现在可以填写你的位置、语言以及使用公制、英制（英国/美国）还是国际单位制（SI）。OpenWeatherMap 可通过名称、邮政编码、坐标和 ID 确定位置，这是我喜欢它的原因之一。

```
# wego configuration for OEM
aat-coords=false
aat-monochrome=false
backend=openweathermap
days=3
forecast-lang=en
frontend=ascii-art-table
jsn-no-indent=false
location=Pittsboro
owm-api-key=XXXXXXXXXXXXXXXXXXXXX
owm-debug=false
owm-lang=en
units=imperial
```

现在，在命令行运行 `wego` 将显示接下来三天的当地天气。

`wego` 还可以输出 JSON 以便程序使用，还可显示 emoji。你可以使用 `-f` 参数或在 `.wegorc` 文件中指定前端。

![Wego at login][10]

如果你想在每次打开 shell 或登录主机时查看天气，只需将 wego 添加到 `~/.bashrc`（我这里是 `~/.zshrc`）即可。

[wttr.in][11] 项目是 wego 上的基于 Web 的封装。它提供了一些其他显示选项，并且可以在同名网站上看到。关于 wttr.in 的一件很酷的事情是，你可以使用 `curl` 获取一行天气信息。我有一个名为 `get_wttr` 的 shell 函数，用于获取当前简化的预报信息。

```
get_wttr() {
  curl -s "wttr.in/Pittsboro?format=3"    
}
```

![weather tool for productivity][12]

现在，在我离开家之前，我就可以通过命令行快速简单地获取我是否需要外套、雨伞或者防晒霜了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-weather-forecast

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-cloud.png?itok=vz0PIDDS (Sky with clouds and grass)
[2]: https://opensource.com/sites/default/files/uploads/productivity_13-1.png (Wego)
[3]: https://github.com/schachmat/wego
[4]: https://golang.org/doc/install
[5]: https://forecast.io
[6]: https://darksky.net
[7]: https://openweathermap.org/
[8]: https://www.worldweatheronline.com/
[9]: https://openweathermap.org/api
[10]: https://opensource.com/sites/default/files/uploads/productivity_13-2.png (Wego at login)
[11]: https://github.com/chubin/wttr.in
[12]: https://opensource.com/sites/default/files/uploads/day13-image3.png (weather tool for productivity)
