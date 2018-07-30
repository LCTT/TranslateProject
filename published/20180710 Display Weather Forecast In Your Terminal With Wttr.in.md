使用 Wttr.in 在你的终端中显示天气预报
======

![](https://4.bp.blogspot.com/-NcP3j1tomlo/W0SIxp79cZI/AAAAAAAAA3Q/pmF3f2eeW_czoGuGgOu_MLudAUD_sVKIQCLcBGAs/s640/wttr-in-weather-console.png)

[wttr.in][1] 是一个功能丰富的天气预报服务，它支持在命令行显示天气。它可以（根据你的 IP 地址）自动检测你的位置，也支持指定位置或搜索地理位置（如城市、山区等）等。哦，另外**你不需要安装它 —— 你只需要使用 cURL 或 Wget**（见下文）。

wttr.in 功能包括：

  * **显示当前天气以及 3 天内的天气预报，分为早晨、中午、傍晚和夜晚**（包括温度范围、风速和风向、可见度、降水量和概率）
  * **可以显示月相**
  * **基于你的 IP 地址自动检测位置**
  * **允许指定城市名称、3 字母的机场代码、区域代码、GPS 坐标、IP 地址或域名**。你还可以指定地理位置，如湖泊、山脉、地标等）
  * **支持多语言位置名称**（查询字符串必须以 Unicode 指定）
  * **支持指定**天气预报显示的语言（它支持超过 50 种语言）
  * **来自美国的查询使用 USCS 单位用于，世界其他地方使用公制系统**，但你可以通过附加 `?u` 使用 USCS，附加 `?m` 使用公制系统。 ）
  * **3 种输出格式：终端的 ANSI，浏览器的 HTML 和 PNG**

就像我在文章开头提到的那样，使用 wttr.in，你只需要 cURL 或 Wget，但你也可以在你的服务器上[安装它][3]。 或者你可以安装 [wego][4]，这是一个使用 wtter.in 的终端气候应用，虽然 wego 要求注册一个 API 密钥来安装。

**在使用 wttr.in 之前，请确保已安装 cURL。**在 Debian、Ubuntu 或 Linux Mint（以及其他基于 Debian 或 Ubuntu 的 Linux 发行版）中，使用以下命令安装 cURL：

```
sudo apt install curl
```

### wttr.in 命令行示例

获取你所在位置的天气（wttr.in 会根据你的 IP 地址猜测你的位置）：

```
curl wttr.in
```

通过在 `curl` 之后添加 `-4`，强制 cURL 将名称解析为 IPv4 地址（如果你用 IPv6 访问 wttr.in 有问题）：

```
curl -4 wttr.in
```

如果你想检索天气预报保存为 png，**还可以使用 Wget**（而不是 cURL），或者你想这样使用它：

```
wget -O- -q wttr.in
```

如果相对 cURL 你更喜欢 Wget ，可以在下面的所有命令中用 `wget -O- -q` 替换 `curl`。

指定位置：

```
curl wttr.in/Dublin
```

显示地标的天气信息（本例中为艾菲尔铁塔）：

```
curl wttr.in/~Eiffel+Tower
```

获取 IP 地址位置的天气信息（以下 IP 属于 GitHub）：

```
curl wttr.in/@192.30.253.113
```

使用 USCS 单位检索天气：

```
curl wttr.in/Paris?u
```

如果你在美国，强制 wttr.in 使用公制系统（SI）：

```
curl wttr.in/New+York?m
```

使用 Wget 将当前天气和 3 天预报下载为 PNG 图像：

```
wget wttr.in/Istanbul.png
```

你可以指定 PNG 的[透明度][5]，这在你要使用一个脚本自动添加天气信息到某些图片（比如墙纸）上有用。

**对于其他示例，请查看 wttr.in [项目页面][2]或在终端中输入：**

```
curl wttr.in/:help
```


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/07/display-weather-forecast-in-your.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/118280394805678839070
[1]:https://wttr.in/
[2]:https://github.com/chubin/wttr.in
[3]:https://github.com/chubin/wttr.in#installation
[4]:https://github.com/schachmat/wego
[5]:https://github.com/chubin/wttr.in#supported-formats
