[#]: subject: (Create a countdown clock with a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/3/raspberry-pi-countdown-clock)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)
[#]: collector: (lujun9972)
[#]: translator: (Donkey-Hao)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

使用树莓派做一个倒计时闹钟
======
使用树莓派和 ePaper 显示器开始倒计时您的下一个假期。
![Alarm clocks with different time][1]

2021年[ Pi Day ][2]来了又走，留下美好的回忆以及[许多树莓派项目][3]等待我们去尝试。在任何令人精神振奋、充满欢乐的假期后回到工作中都很难， Pi Day 也不例外。当我们回望三月的时候，渴望那些天的快乐。但是不用害怕，亲爱的 Pi Day 庆祝者们，我们开始下一个 Pi Day 的漫长倒计时！

好了，严肃点。我做了一个 Pi Day 倒计时器，你也可以！

不久前，我购买了一个 [树莓派 Zero W][4] 并且用它来 [解决 WiFi 较差的原因][5] 。我也对使用 ePaper 来作为显示器十分感兴趣。而我却没有一个很好的用途，但是那看起来很有趣！我买了一个十分适合放在树莓派的顶部的 2.13 英寸的 [ WaveShare 显示器][6] 。安装很简单：只需要将显示器接到树莓派的 GPIO 上即可。

我使用 [树莓派系统][7] 来实现该项目，虽然其他的操作系统肯定也能完成。但是下面的 `raspi-config` 指令在树莓派系统上很容易使用。

### 设置树莓派和 ePaper 显示器

设置树莓派和 ePaper 显示器一起工作，需要你在树莓派上启用串行外设接口 (SPI) 软件，安装 BCM2835 C 库（来访问树莓派上的 Broadcom BCM 2835 芯片的 GPIO 函数），安装 Python GPIO 库来控制 ePaper 显示器。最后，你需要安装 WaveShare 的库来使用 Python 控制 2.13 英寸的显示器。

下面是完成这些的步骤。

#### 启用 SPI

树莓派上启用 SPI 最简单的方式是使用`raspi-config` 命令。SPI 总线允许串行数据通信与设备一起使用——在本例中，ePaper 显示：


```
`$ sudo raspi-config`
```

从弹出的菜单中, 选择 **Interfacing Options** -&gt; **SPI** -&gt; **Yes** 来启用 SPI 接口，然后启动。

#### 安装 BCM2835 库

如上所述，BCM2835 库是用在树莓派 Broadcom BCM2385 芯片的软件，它允许访问 GPIO 引脚来控制设备。

在我写这篇文章之时，用于树莓派的最新 Broadcom BCM2385 库版本是 v1.68 。安装此库需要下载软件压缩包然后使用 `make` 来安装：


```
# 下载 BCM2853 库并解压
$ curl -sSL <http://www.airspayce.com/mikem/bcm2835/bcm2835-1.68.tar.gz> -o - | tar -xzf -

# 进入解压后的文件夹
$ pushd bcm2835-1.68/

# 配置、检查并安装 BCM2853 库
$ sudo ./configure
$ sudo make check
$ sudo make install

# 返回上级目录
$ popd
```

#### 安装需要的 Python 库

你用 Python 控制 ePaper 显示器需要安装 Python 库 `RPi.GPIO` ，还需要 `python3-pil` 包画图。显然， PIL 包已经不行了， Pillow 可以作为代替方案。我还没有为该项目测试 Pillow ，但它可行：


```
# 安装需要的 Python 库
$ sudo apt-get update
$ sudo apt-get install python3-pip python3-pil
$ sudo pip3 install RPi.GPIO
```

_注意：这些是 Python3 的指令。你可以在 WaveShare 网站查到 Python2 的指令。_

####  下载 WaveShare 示例和 Python 库

Waveshare 维护一个 Python 和 C 的 Git 库，用于使用其 ePaper 显示器和一些展示如何使用它们的示例。对这个倒计时时钟而言，你需要克隆这个库并用于 2.13 英寸的显示器：

```
# 克隆这个 WaveShare e-Paper git 库
$ git clone <https://github.com/waveshare/e-Paper.git>
```

如果你用不同的显示器或者其他公司产品，需要使用适配软件。

Waveshare 提供了很多指导：

  * [WaveShare ePaper 设置指导][9]
  * [WaveShare ePaper 库安装指导][10]



#### 获得有趣的字体（选做）

你可以随心所欲的使用显示器，为什么不搞点花样？找一个炫酷的字体！

这有大量 [开放字体许可][11] 的字体可用。我十分喜爱 Bangers 字体。如果你看过 YouTube 那你见过这种字体了，它十分流行。你可以下载到本地的共享字体目录文件中，并且所有的应用都可以使用，包括这个项目：

```
# “Bangers” 字体是 Vernon Adams 用 Google 字体开放许可授权的字体
$ mkdir -p ~/.local/share/fonts
$ curl -sSL <https://github.com/google/fonts/raw/master/ofl/bangers/Bangers-Regular.ttf> -o fonts/Bangers-Regular.ttf
```

### 创建一个 Pi Day 倒计时器

现在你已经安装好了软件，可以使用带有炫酷字体的 ePaper 显示器了。你可以创建一个有趣的项目：倒计时到下一个 Pi Day ！

如果你想，你可以从该项目的 [GitHub repo][13] 直接下载 [countdown.py][12] 这个 Python 文件并跳到文章结尾。

为了满足大家的好奇心，我将逐步讲解。

#### 导入一些库


```
#!/usr/bin/python3
# -*- coding:utf-8 -*-
import logging
import os
import sys
import time

from datetime import datetime
from pathlib import Path
from PIL import Image,ImageDraw,ImageFont

logging.basicConfig(level=logging.INFO)

basedir = Path(__file__).parent
waveshare_base = basedir.joinpath('e-Paper', 'RaspberryPi_JetsonNano', 'python')
libdir = waveshare_base.joinpath('lib')
```

开始先导入一些标准库之后脚本中用。也需要你添加一些 PIL 的包： `Image`, `ImageDraw` ，和 `ImageFont` ，你会 用到这些包来画一些简单的图形。最后，为包含用于 2.13 英寸显示器的 Waveshare Python 库的本地 `lib` 目录设置一些变量，稍后你可以使用这些变量从本地目录加载库。

#### 字体大小辅助函数

下一部分是为你选择的字体建立一个修改大小的辅助函数： Bangers-Regular.ttf 。该函数将整型变量作为大小参数并返回一个图形字体对象来用于显示：

```
def set_font_size(font_size):
    logging.info("Loading font...")
    return ImageFont.truetype(f"{basedir.joinpath('Bangers-Regular.ttf').resolve()}", font_size)
```

#### 倒计时逻辑

接下来是计算这个项目的一个函数：距下次 Pi Day 还有多久。如果 Pi Day 在一月，那么计算剩余天数将很简单。但是你需要考虑是否今年的 Pi Day 这一天已经过去了。如果是这样的话，那么计算量将会很大：


```
def countdown(now):
    piday = datetime(now.year, 3, 14)

    # 如果错过了就增加一年
    if piday &lt; now:
        piday = datetime((now.year + 1), 3, 14)

    days = (piday - now).days

    logging.info(f"Days till piday: {days}")
    return day
```

#### 主函数

最后，到了主函数，需要初始化显示器并向它写数据。这时，你应该写一个欢迎语然后再开始倒计时。但是首先，你需要加载 Waveshare 库：


```
def main():

    if os.path.exists(libdir):
        sys.path.append(f"{libdir}")
        from waveshare_epd import epd2in13_V2
    else:
        logging.fatal(f"not found: {libdir}")
        sys.exit(1)
```

上面的代码片段检查以确保该库已下载到倒计时脚本旁边的目录中，然后加载“epd2in13_V2”库。 如果你使用不同的显示器，则需要使用不同的库。 如果你愿意，也可以自己编写。我发现阅读 Waveshare 随显示器提供的 Python 代码很有趣，它比我想象的要简单得多。

下一段代码创建一个 EPD（ ePaper 显示器）对象以与显示器交互并初始化硬件：

```
    logging.info("Starting...")
    try:
        # 创建一个显示对象
        epd = epd2in13_V2.EPD()

        # 初始化并清空显示
        # ePaper 保持它的状态处分更新
        logging.info("Initialize and clear...")
        epd.init(epd.FULL_UPDATE)
        epd.Clear(0xFF)
```

关于 ePaper 的一个有趣之处：它仅在将像素从白色变为黑色或从黑色变为白色时才使用电源。这意味着当设备断电或应用程序因任何原因停止时，屏幕上的任何内容都会保留下来。从功耗的角度来看，这很好，但这也意味着您需要在启动时清除显示，否则您的脚本只会覆盖屏幕上已有的内容。 因此，`epd.Clear(0xFF)` 用于在脚本启动时清除显示。

接下来，创建一个“画布”来绘制剩余的显示输出：


```
    # 创建一个图形对象
    # 注意："epd.heigh" 是屏幕的长边
    # 注意："epd.width" 是屏幕的短边
    # 真是反直觉…
    logging.info(f"Creating canvas - height: {epd.height}, width: {epd.width}")
    image = Image.new('1', (epd.height, epd.width), 255)  # 255: clear the frame
    draw = ImageDraw.Draw(image)
```

这与显示器的宽度和高度相匹配——但它有点反直觉，因为显示器的短边是宽度。我认为长边是宽度，所以这只是需要注意的一点。 请注意，`epd.height` 和 `epd.width` 由 Waveshare 库设置以对应于你使用的设备。

#### 欢迎语

接下来，你将开始画一些画。这涉及在你之前创建的“画布”对象上设置数据。这还没有将它绘制到 ePaper 显示器上——你现在只是在构建你想要的图像。由你为这个项目绘制带有一块馅饼的图像，来创建一个庆祝 Pi Day 的欢迎信息：

![画一块馅饼][14]

(Chris Collins, [CC BY-SA 4.0][15])

很可爱，不是吗？


```
    logging.info("Set text text...")
    bangers64 = set_font_size(64)
    draw.text((0, 30), 'PI DAY!', font = bangers64, fill = 0)

    logging.info("Set BMP...")
    bmp = Image.open(basedir.joinpath("img", "pie.bmp"))
    image.paste(bmp, (150,2))
```
最后，_最后_，你可以展示你画的图画：

```
    logging.info("Display text and BMP")
    epd.display(epd.getbuffer(image))
```

That bit above updates the display to show the image you drew.

接下来，准备另一幅图像展示你的倒计时：

#### Pi Day 倒计时
首先，创建一个用来展示倒计时的项目。也需要设置数字的字体大小：


```
    logging.info("Pi Date countdown; press CTRL-C to exit")
    piday_image = Image.new('1', (epd.height, epd.width), 255)
    piday_draw = ImageDraw.Draw(piday_image)

    # 设置字体大小
    bangers36 = set_font_size(36)
    bangers64 = set_font_size(64)
```

为了使它显示的时候更像一个倒计时，更新图像的一部分是更加有效的手段，仅更改已经改变的显示数据部分。下面的代码准备以这样方式运行：


```
    # 准备更新显示
    epd.displayPartBaseImage(epd.getbuffer(piday_image))
    epd.init(epd.PART_UPDATE)
```

最后，需要计时，开始一个无限循环来检查据下次 Pi Day 还有多久并显示在 ePaper上。如果到了 Pi Day ，你可以输出一些庆祝短语：


```
    while (True):
        days = countdown(datetime.now())
        unit = get_days_unit(days)
        
        # 通过绘制一个填充有白色的矩形来清除屏幕的下半部分
        piday_draw.rectangle((0, 50, 250, 122), fill = 255)

        # 绘制页眉
        piday_draw.text((10,10), "Days till Pi-day:", font = bangers36, fill = 0)

        if days == 0:
            # 绘制庆祝语
            piday_draw.text((0, 50), f"It's Pi Day!", font = bangers64, fill = 0)
        else:
            # 绘制距下一次 Pi Day 的时间
            piday_draw.text((70, 50), f"{str(days)} {unit}", font = bangers64, fill = 0)

        # 渲染屏幕
        epd.displayPartial(epd.getbuffer(piday_image))
        time.sleep(5)
```

脚本最后做了一些错误处理，包括捕获键盘中断，这样你可以使用 **Ctrl**+**C** 来结束无限循环，以及一个根据计数来打印 'day' 或 'days' 的函数：

```
    except IOError as e:
        logging.info(e)

    except KeyboardInterrupt:
        logging.info("Exiting...")
        epd.init(epd.FULL_UPDATE)
        epd.Clear(0xFF)
        time.sleep(1)
        epd2in13_V2.epdconfig.module_exit()
        exit()

def get_days_unit(count):
    if count == 1:
        return "day"

    return "days"

if __name__ == "__main__":
    main()
```

现在你已经拥有一个倒计时脚本并显示剩余天数！这是在我的树莓派上的显示（视频经过加速，我没有足够的磁盘空间来保存一整天的视频）：

![Pi Day Countdown Timer In Action][16]

(Chris Collins, [CC BY-SA 4.0][15])

#### 安装 systemd 服务（选做）

如果你希望在系统打开时运行倒计时显示并且无需登录并运行脚本，您可以将可选的 systemd 单元安装为 [systemd 用户服务][17].

将 GitHub 上的 [piday.service][18] 文件复制到 `${HOME}/.config/systemd/user`，如果该目录不存在，请先创建该目录。然后你可以启用该服务并启动它：


```
$ mkdir -p ~/.config/systemd/user
$ cp piday.service ~/.config/systemd/user
$ systemctl --user enable piday.service
$ systemctl --user start piday.service

# Enable lingering, to create a user session at boot
# and allow services to run after logout
$ loginctl enable-linger $USER
```

该脚本将输出到 systemd 日志，可以使用 `journalctl` 命令查看输出。

### 它开始看起来很像 Pi Day ！

现在你拥有了一个树莓派 Zero W 显示在 ePaper显示器上的 Pi Day 倒计时器！并在系统启动时使用 systemd 单元文件启动！现在只有 350 天左右我们才可以再次相聚庆祝奇妙的设备———树莓派。通过我们的小项目，我们可以一目了然地看到确切的天数。

但事实上，任何人都可以全年都在心中举行 Pi Day，因此请享受使用自己的树莓派创建一些有趣且具有教育意义的项目吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/raspberry-pi-countdown-clock

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/clocks_time.png?itok=_ID09GDk (Alarm clocks with different time)
[2]: https://en.wikipedia.org/wiki/Pi_Day
[3]: https://opensource.com/tags/raspberry-pi
[4]: https://www.raspberrypi.org/products/raspberry-pi-zero-w/
[5]: https://opensource.com/article/21/3/troubleshoot-wifi-go-raspberry-pi
[6]: https://www.waveshare.com/product/displays/e-paper.htm
[7]: https://www.raspberrypi.org/software/operating-systems/
[8]: https://pypi.org/project/Pillow/
[9]: https://www.waveshare.com/wiki/2.13inch_e-Paper_HAT
[10]: https://www.waveshare.com/wiki/Libraries_Installation_for_RPi
[11]: https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL
[12]: https://github.com/clcollins/epaper-pi-ex/blob/main/countdown.py
[13]: https://github.com/clcollins/epaper-pi-ex/
[14]: https://opensource.com/sites/default/files/uploads/pie.png (drawing of a piece of pie)
[15]: https://creativecommons.org/licenses/by-sa/4.0/
[16]: https://opensource.com/sites/default/files/uploads/piday_countdown.gif (Pi Day Countdown Timer In Action)
[17]: https://wiki.archlinux.org/index.php/systemd/User
[18]: https://github.com/clcollins/epaper-pi-ex/blob/main/piday.service
