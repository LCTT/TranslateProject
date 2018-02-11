在 Linux 字符界面中获取天气预报
======

**目标：**使用 Linux 命令行显示天气预报。

**发行版：**所有 Linux 发行版。

**要求：**能连上因特网的 Linux

**难度：**容易

**约定：**

*   `#` - 需要使用 root 权限来执行指定命令，可以直接使用 root 用户来执行也可以使用 `sudo` 命令
*   `$` - 可以使用普通用户来执行指定命令

### 简介

无需打开网页浏览器就能直接从终端获取最新的天气预报那该多方便啊，对吧？你还能把它写成脚本，或者设置定义定时任务。

`http://wttr.in` 是一个允许你搜索世界各地天气预报的网站，而且它的是以 ASCII 字符的形式来显示结果的。通过使用 `cURL` 访问 `http://wttr.in`，就能直接在终端显示查询结果了。

### 获取所在地的天气

![Local weather from wttr.in][1]

要抓取所在地的天气情况非常简单。`wttr.in` 会自动根据 IP 地址来探测你的所在地。除非你用了 VPN，否则它的精度还不错。

```
$ curl wttr.in
```

### 获取指定城市的天气

![Weather by city from wttr.in][2]

你可以通过在 `wttr.in` 后加上斜杠和城市名称的方式来获得其他城市的天气情况。不过要把名字中的空格替换成 `+`。

```
$ curl wttr.in/New+York
```

你也可以以 Unix 时区的形式来填写城市名称。

```
$ curl wttr.in/New_York
```

不要直接使用空格，否则会出现奇怪而不准确的结果。

### 获取机场天气

![Weather by airport from wttr.in][3]

若你对地区的三位机场代号很熟悉，你也可以使用机场代号来查询天气。一般来说使用机场要比使用城市更贴近你，而且更精确一些。

```
$ curl wttr.in/JFK
```

### 猜测所在地

![Weather by landmark from wttr.in][4]

通过使用 `~` 字符，你可以让 `wttr.in` 通过地标来猜测天气情况。

```
$ curl wttr.in/~Statue+Of+Liberty
```

### 域名所在地的天气

![Weather by domain name from wttr.in][5]

你想不想知道 LinuxConfig 托管地的天气？现在有一个方法可以知道！`wttr.in` 可以通过域名获取天气。是的，这个功能可能不那么实用，但这很有趣啊。

```
$ curl wttr.in/@linuxconfig.org
```

### 更改温度单位

![Change unit system in wttr.in][6]

默认情况下，`wttr.in` 会根据你的实际地址来决定显示哪种温度单位（C 还是 F）。基本上，在美国，使用的是华氏度，而其他地方显示的是摄氏度。你可以指定显示的温度单位，在 URL 后添加 `?u` 会显示华氏度，而添加 `?m` 会显示摄氏度。

```
$ curl wttr.in/New_York?m

$ curl wttr.in/Toronto?u
```

在 ZSH 上有一个很奇怪的 bug，会使得这两条语句不能正常工作，如果你需要更换单位，恐怕需要改成使用 Bash 了。

### 总结

你可以很方便地在脚本，定时任务，甚至 MOTD（LCTT 译注：Message Of The Day - 每日消息）中访问 `wttr.in`。当然，你完全没有必要这么做。当你需要查看天气预报的时候只需要访问一下这个超棒的网站就行了。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/get-your-weather-forecast-from-the-linux-cli

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
[1]:https://linuxconfig.org/images/wttr-local.jpg
[2]:https://linuxconfig.org/images/wttr-city.jpg
[3]:https://linuxconfig.org/images/wttr-airport.jpg
[4]:https://linuxconfig.org/images/wttr-landmark.jpg
[5]:https://linuxconfig.org/images/wttr-url.jpg
[6]:https://linuxconfig.org/images/wttr-units.jpg
