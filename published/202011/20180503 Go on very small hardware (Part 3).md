[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12782-1.html)
[#]: subject: (Go on very small hardware Part 3)
[#]: via: (https://ziutek.github.io/2018/05/03/go_on_very_small_hardware3.html)
[#]: author: (Michał Derkacz )

Go 语言在极小硬件上的运用（三）
======

![](https://img.linux.net.cn/data/attachment/album/202010/24/090026to9c9sweyrw9ww37.png)


在本系列的 [第一][3] 和 [第二][4] 部分中讨论的大多数示例都是以某种方式闪烁的 LED。起初它可能很有趣，但是一段时间后变得有些无聊。让我们做些更有趣的事情……

…让我们点亮更多的 LED！

![STM32F030F4P6][1]

### WS281x LED

[WS281x][5] RGB LED（及其克隆品）非常受欢迎。你可以以单个元素购买、链成长条或组装成矩阵、环或其他形状。

![WS2812B][6]

它们可以串联连接，基于这个事实，你可以只用 MCU 的单个引脚就可以控制一个很长的 LED 灯条。不幸的是，它们的内部控制器使用的物理协议不能直接适用于你在 MCU 中可以找到的任何外围设备。你必须使用 <ruby>位脉冲<rt>bit-banging</rt></ruby>或以特殊方式使用可用的外设。

哪种可用的解决方案最有效取决于同时控制的 LED 灯条数量。如果你必须驱动 4 到 16 个灯条，那么最有效的方法是 [使用定时器和 DMA][7]（请不要忽略这篇文章末尾的链接）。

如果只需要控制一个或两个灯条，请使用可用的 SPI 或 UART 外设。对于 SPI，你只能在发送的一个字节中编码两个 WS281x 位。由于巧妙地使用了起始位和停止位，UART 允许更密集的编码：每发送一个字节 3 位。

我在 [此站点][8] 上找到了有关 UART 协议如何适用于 WS281x 协议的最佳解释。如果你不懂波兰语，这里是 [英文翻译][9]。

基于 WS281x 的 LED 仍然是最受欢迎的，但市场上也有 SPI 控制的 LED：[APA102][10]、[SK9822][11]。关于它们的三篇有趣的文章在这里：[1][12]、[2][13]、[3][14]。

### LED 环

市场上有许多基于 WS2812 的环。我有一个这样的：

![WS2812B][15]

它具有 24 个可单独寻址的 RGB LED（WS2812B），并暴露出四个端子：GND、5V、DI 和 DO。通过将 DI（数据输入）端子连接到上一个的 DO（数据输出）端子，可以链接更多的环或其他基于 WS2812 的东西。

让我们将这个环连接到我们的 STM32F030 板上。我们将使用基于 UART 的驱动程序，因此 DI 应连接到 UART 接头连接器上的 TXD 引脚。 WS2812B LED 需要至少 3.5V 的电源。 24 个 LED 会消耗大量电流，因此在编程/调试期间，最好将环上的 GND 和 5V 端子直接连接到 ST-LINK 编程器上可用的 GND 和 5V 引脚：

![WS2812B][16]

我们的 STM32F030F4P6 MCU 和整个 STM32 F0、F3、F7、L4 系列具有 F1、F4、L1 MCU 不具备的一项重要功能：它可以反转 UART 信号，因此我们可以将环直接连接到 UART TXD 引脚。如果你不知道我们需要这种反转，那么你可能没有读过我上面提到的 [文章][9]。

因此，你不能以这种方式使用流行的 [Blue Pill][17] 或 [STM32F4-DISCOVERY][18]。使用其 SPI 外设或外部反相器。有关使用 SPI 的 NUCLEO-F411RE，请参见 [圣诞树灯][19] 项目作为 UART + 逆变器的示例或 [WS2812示例][20]。

顺便说一下，大多数 DISCOVERY 板可能还有一个问题：它们在 VDD = 3V 而不是 3.3V 的情况下工作。 对于高 DI，WS281x 至少要求电源电压 * 0.7。如果是 5V 电源，则为 3.5V；如果是 4.7V 电源，则为 3.3V；可在 DISCOVERY 的 5V 引脚上找到。如你所见，即使在我们的情况下，第一个 LED 的工作电压也低于规格 0.2V。对于 DISCOVERY 板，如果供电 4.7V，它将工作在低于规格的 0.3V 下；如果供电 5V，它将工作在低于规格 0.5V 下。

让我们结束这段冗长的介绍并转到代码：

```
package main

import (
    "delay"
    "math/rand"
    "rtos"

    "led"
    "led/ws281x/wsuart"

    "stm32/hal/dma"
    "stm32/hal/gpio"
    "stm32/hal/irq"
    "stm32/hal/system"
    "stm32/hal/system/timer/systick"
    "stm32/hal/usart"
)

var tts *usart.Driver

func init() {
    system.SetupPLL(8, 1, 48/8)
    systick.Setup(2e6)

    gpio.A.EnableClock(true)
    tx := gpio.A.Pin(9)

    tx.Setup(&gpio.Config{Mode: gpio.Alt})
    tx.SetAltFunc(gpio.USART1_AF1)

    d := dma.DMA1
    d.EnableClock(true)

    tts = usart.NewDriver(usart.USART1, d.Channel(2, 0), nil, nil)
    tts.Periph().EnableClock(true)
    tts.Periph().SetBaudRate(3000000000 / 1390)
    tts.Periph().SetConf2(usart.TxInv)
    tts.Periph().Enable()
    tts.EnableTx()

    rtos.IRQ(irq.USART1).Enable()
    rtos.IRQ(irq.DMA1_Channel2_3).Enable()
}

func main() {
    var rnd rand.XorShift64
    rnd.Seed(1)
    rgb := wsuart.GRB
    strip := wsuart.Make(24)
    black := rgb.Pixel(0)
    for {
        c := led.Color(rnd.Uint32()).Scale(127)
        pixel := rgb.Pixel(c)
        for i := range strip {
            strip[i] = pixel
            tts.Write(strip.Bytes())
            delay.Millisec(40)
        }
        for i := range strip {
            strip[i] = black
            tts.Write(strip.Bytes())
            delay.Millisec(20)
        }
    }
}

func ttsISR() {
    tts.ISR()
}

func ttsDMAISR() {
    tts.TxDMAISR()
}

//c:__attribute__((section(".ISRs")))
var ISRs = [...]func(){
    irq.USART1:          ttsISR,
    irq.DMA1_Channel2_3: ttsDMAISR,
}
```

#### 导入部分

与前面的示例相比，导入部分中的新内容是 `rand/math` 包和带有 `led/ws281x` 子树的 `led` 包。 `led` 包本身包含 `Color` 类型的定义。 `led/ws281x/wsuart` 定义了 `ColorOrder`、`Pixel` 和 `Strip` 类型。

我想知道如何使用 `image/color` 中的 `Color` 或 `RGBA` 类型，以及如何以它将实现 `image.Image` 接口的方式定义 `Strip`。 但是由于使用了 [gamma 校正][21] 和 大开销的 `color/draw` 包，我以简单的方式结束：

```
type Color uint32
type Strip []Pixel
```

使用一些有用的方法。然而，这种情况在未来可能会改变。

#### init 函数

`init` 函数没有太多新颖之处。 UART 波特率从 115200 更改为 3000000000/1390 ≈ 2158273，相当于每个 WS2812 位 1390 纳秒。 CR2 寄存器中的 TxInv 位设置为反转 TXD 信号。

#### main 函数

`XorShift64` 伪随机数生成器用于生成随机颜色。 [XORSHIFT][22] 是目前由 `math/rand` 包实现的唯一算法。你必须使用带有非零参数的 `Seed` 方法显式初始化它。

`rgb` 变量的类型为 `wsuart.ColorOrder`，并设置为 WS2812 使用的 GRB 颜色顺序（WS2811 使用 RGB 顺序）。然后用于将颜色转换为像素。

`wsuart.Make(24)` 创建 24 像素的初始化条带。它等效于：

```
strip := make(wsuart.Strip, 24)
strip.Clear()
```

其余代码使用随机颜色绘制类似于 “Please Wait…” 微调器的内容。

`strip` 切片充当帧缓冲区。 `tts.Write(strip.Bytes())` 将帧缓冲区的内容发送到环。

#### 中断

该程序由处理中断的代码组成，与先前的 [UART 示例][23] 中的代码相同。

让我们编译并运行：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  14088     240     204   14532    38c4 cortexm0.elf
$ openocd -d0 -f interface/stlink.cfg -f target/stm32f0x.cfg -c 'init; program cortexm0.elf; reset run; exit'
```

我跳过了 `openocd` 的输出。下面的视频显示了该程序的工作原理：

![video](https://ziutek.github.io/videos/rgbspinner.mp4)

### 让我们做些有用的事情...

在 [第一部分][3] 的开头，我曾问过：“Go 能深入到多低层，而还能做一些有用的事情？”。 我们的 MCU 实际上是一种低端设备（8 比特的人可能会不同意我的看法），但到目前为止，我们还没有做任何有用的事情。

所以... 让我们做些有用的事情... 让我们做个时钟！

在互联网上有许多由 RGB LED 构成的时钟示例。让我们用我们的小板子和 RGB 环制作自己的时钟。我们按照下面的描述更改先前的代码。

#### 导入部分

删除 `math/rand` 包，然后添加 `stm32/hal/exti`。

#### 全局变量

添加两个新的全局变量：`btn` 和 `btnev`：

```
var (
    tts   *usart.Driver
    btn   gpio.Pin
    btnev rtos.EventFlag
)
```

它们将用来处理那些用于设置时钟的 “按钮”。我们的板子除了重置之外没有其他按钮，但是如果没有它，我们仍然可以通过某种方式进行管理。

#### init 函数

将这段代码添加到 `init` 函数：

```
btn = gpio.A.Pin(4)

btn.Setup(&gpio.Config{Mode: gpio.In, Pull: gpio.PullUp})
ei := exti.Lines(btn.Mask())
ei.Connect(btn.Port())
ei.EnableFallTrig()
ei.EnableRiseTrig()
ei.EnableIRQ()

rtos.IRQ(irq.EXTI4_15).Enable()
```

在内部<ruby>上拉电阻<rt>pull-up resistor</rt></ruby>启用的情况下，将 PA4 引脚配置为输入。它已连接至板载 LED，但这不会妨碍任何事情。更重要的是它位于 GND 引脚旁边，所以我们可以使用任何金属物体来模拟按钮并设置时钟。作为奖励，我们还有来自板载 LED 的其他反馈。

我们使用 EXTI 外设来跟踪 PA4 状态。它被配置为在发生任何更改时都会产生中断。

#### btnWait 函数

定义一个新的辅助函数：

```
func btnWait(state int, deadline int64) bool {
    for btn.Load() != state {
        if !btnev.Wait(1, deadline) {
            return false // timeout
        }
        btnev.Reset(0)
    }
    delay.Millisec(50) // debouncing
    return true
}
```

它等待 “按钮” 引脚上的指定状态，但只等到最后期限出现。这是稍微改进的轮询代码：

```
for btn.Load() != state {
    if rtos.Nanosec() >= deadline {
        // timeout
    }
}
```

我们的 `btnWait` 函数不是忙于等待 `state` 或 `deadline`，而是使用 `rtos.EventFlag` 类型的 `btnev` 变量休眠，直到有事情发生。你当然可以使用通道而不是 `rtos.EventFlag`，但是后者便宜得多。

#### main 函数

我们需要全新的 `main` 函数：

```
func main() {
    rgb := wsuart.GRB
    strip := wsuart.Make(24)
    ds := 4 * 60 / len(strip) // Interval between LEDs (quarter-seconds).
    adjust := 0
    adjspeed := ds
    for {
        qs := int(rtos.Nanosec() / 25e7) // Quarter-seconds since reset.
        qa := qs + adjust

        qa %= 12 * 3600 * 4 // Quarter-seconds since 0:00 or 12:00.
        hi := len(strip) * qa / (12 * 3600 * 4)

        qa %= 3600 * 4 // Quarter-seconds in the current hour.
        mi := len(strip) * qa / (3600 * 4)

        qa %= 60 * 4 // Quarter-seconds in the current minute.
        si := len(strip) * qa / (60 * 4)

        hc := led.Color(0x550000)
        mc := led.Color(0x005500)
        sc := led.Color(0x000055)

        // Blend the colors if the hands of the clock overlap.
        if hi == mi {
            hc |= mc
            mc = hc
        }
        if mi == si {
            mc |= sc
            sc = mc
        }
        if si == hi {
            sc |= hc
            hc = sc
        }

        // Draw the clock and write to the ring.
        strip.Clear()
        strip[hi] = rgb.Pixel(hc)
        strip[mi] = rgb.Pixel(mc)
        strip[si] = rgb.Pixel(sc)
        tts.Write(strip.Bytes())

        // Sleep until the button pressed or the second hand should be moved.
        if btnWait(0, int64(qs+ds)*25e7) {
            adjust += adjspeed
            // Sleep until the button is released or timeout.
            if !btnWait(1, rtos.Nanosec()+100e6) {
                if adjspeed < 5*60*4 {
                    adjspeed += 2 * ds
                }
                continue
            }
            adjspeed = ds
        }
    }
}
```

我们使用 `rtos.Nanosec` 函数代替 `time.Now` 来获取当前时间。这样可以节省大量的闪存，但也使我们的时钟变成了不知道日、月、年的老式设备，最糟糕的是它无法处理夏令时的变化。

我们的环有 24 个 LED，因此秒针的显示精度可以达到 2.5 秒。为了不牺牲这种精度并获得流畅的运行效果，我们使用 1/4 秒作为基准间隔。半秒就足够了，但四分之一秒更准确，而且与 16 和 48 个 LED 配合使用也很好。

红色、绿色和蓝色分别用于时针、分针和秒针。这允许我们使用简单的“逻辑或操作”进行颜色混合。我们 `Color.Blend` 方法可以混合任意颜色，但是我们闪存不多，所以我们选择最简单的解决方案。

我们只有在秒针移动时才重画时钟。

```
btnWait(0, int64(qs+ds)*25e7)
```

上面的这行代码等待的正是那一刻，或者是按钮的按下。

每按一下按钮就会把时钟向前调一调。按住按钮一段时间会加速调整。

#### 中断

定义新的中断处理程序：

```
func exti4_15ISR() {
    pending := exti.Pending() & 0xFFF0
    pending.ClearPending()
    if pending&exti.Lines(btn.Mask()) != 0 {
        btnev.Signal(1)
    }
}
```

并将 `irq.EXTI4_15: exti4_15ISR` 条目添加到 ISR 数组。

该处理程序（或中断服务程序）处理 EXTI4_15 IRQ。 Cortex-M0 CPU 支持的 IRQ 明显少于其较大的同类兄弟处理器，因此你经常可以看到一个 IRQ 被多个中断源共享。在我们的例子中，一个 IRQ 由 12 个 EXTI 线共享。

exti4_15ISR 读取所有挂起的位，并从中选择 12 个更高的有效位。接下来，它清除 EXTI 中选中的位并开始处理它们。在我们的例子中，仅检查第 4 位。 `btnev.Signal(1)` 引发 `btnev.Wait(1, deadline)` 唤醒并返回 `true`。

你可以在 [Github][24] 上找到完整的代码。让我们来编译它：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  15960     240     216   16416    4020 cortexm0.elf
```

这里所有的改进只得到 184 个字节。让我们再次重新构建所有内容，但这次在 typeinfo 中不使用任何类型和字段名：

```
$ cd $HOME/emgo
$ ./clean.sh
$ cd $HOME/firstemgo
$ egc -nf -nt
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  15120     240     216   15576    3cd8 cortexm0.elf
```

现在，有了千字节的空闲空间，你可以改进一些东西。让我们看看它是如何工作的：

![video](https://ziutek.github.io/videos/rgbclock.mp4)

我不知道我是怎么精确打到 3:00 的！？

以上就是所有内容！在第 4 部分（本系列的结束）中，我们将尝试在 LCD 上显示一些内容。（LCTT 译注：然而烂尾了，第三篇写于 2018 年，整个博客当年就停更了。）

--------------------------------------------------------------------------------

via: https://ziutek.github.io/2018/05/03/go_on_very_small_hardware3.html

作者：[Michał Derkacz][a]
选题：[lujun9972][b]
译者：[gxlct008](https://github.com/gxlct008)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ziutek.github.io
[b]: https://github.com/lujun9972
[1]: https://ziutek.github.io/images/mcu/f030-demo-board/board.jpg
[2]: https://ziutek.github.io/2018/05/03/go_on_very_small_hardware3.html
[3]: https://linux.cn/article-11383-1.html
[4]: https://linux.cn/article-12747-1.html
[5]: http://www.world-semi.com/solution/list-4-1.html
[6]: https://ziutek.github.io/images/led/ws2812b.jpg
[7]: http://www.martinhubacek.cz/arm/improved-stm32-ws2812b-library
[8]: http://mikrokontrolery.blogspot.com/2011/03/Diody-WS2812B-sterowanie-XMega-cz-2.html
[9]: https://translate.google.pl/translate?sl=pl&tl=en&u=http://mikrokontrolery.blogspot.com/2011/03/Diody-WS2812B-sterowanie-XMega-cz-2.html
[10]: http://neon-world.com/en/product.php
[11]: http://www.normandled.com/index.php/Product/view/id/800.html
[12]: https://cpldcpu.wordpress.com/2014/08/27/apa102/
[13]: https://cpldcpu.wordpress.com/2014/11/30/understanding-the-apa102-superled/
[14]: https://cpldcpu.wordpress.com/2016/12/13/sk9822-a-clone-of-the-apa102/
[15]: https://ziutek.github.io/images/led/rgbring.jpg
[16]: https://ziutek.github.io/images/led/ring-stlink-f030.jpg
[17]: https://jeelabs.org/article/1649a/
[18]: http://www.st.com/en/evaluation-tools/stm32f4discovery.html
[19]: https://github.com/ziutek/emgo/tree/master/egpath/src/stm32/examples/minidev/treelights
[20]: https://github.com/ziutek/emgo/tree/master/egpath/src/stm32/examples/nucleo-f411re/ws2812
[21]: https://en.wikipedia.org/wiki/Gamma_correction
[22]: https://en.wikipedia.org/wiki/Xorshift
[23]: https://ziutek.github.io/2018/04/14/go_on_very_small_hardware2.html#uart
[24]: https://github.com/ziutek/emgo/tree/master/egpath/src/stm32/examples/f030-demo-board/ws2812-clock
