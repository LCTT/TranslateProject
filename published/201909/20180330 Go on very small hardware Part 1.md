Go 语言在极小硬件上的运用（一）
=========

Go 语言，能在多低下的配置上运行并发挥作用呢？

我最近购买了一个特别便宜的开发板：

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/board.jpg) 

我购买它的理由有三个。首先，我（作为程序员）从未接触过 STM320 系列的开发板。其次，STM32F10x 系列使用也有点少了。STM320 系列的 MCU 很便宜，有更新一些的外设，对系列产品进行了改进，问题修复也做得更好了。最后，为了这篇文章，我选用了这一系列中最低配置的开发板，整件事情就变得有趣起来了。

### 硬件部分

[STM32F030F4P6][3] 给人留下了很深的印象：

*   CPU: [Cortex M0][1] 48 MHz（最低配置，只有 12000 个逻辑门电路）
*   RAM: 4 KB，
*   Flash: 16 KB，
*   ADC、SPI、I2C、USART 和几个定时器

以上这些采用了 TSSOP20 封装。正如你所见，这是一个很小的 32 位系统。

### 软件部分

如果你想知道如何在这块开发板上使用 [Go][4] 编程，你需要反复阅读硬件规范手册。你必须面对这样的真实情况：在 Go 编译器中给 Cortex-M0 提供支持的可能性很小。而且，这还仅仅只是第一个要解决的问题。

我会使用 [Emgo][5]，但别担心，之后你会看到，它如何让 Go 在如此小的系统上尽可能发挥作用。

在我拿到这块开发板之前，对 [stm32/hal][6] 系列下的 F0 MCU 没有任何支持。在简单研究[参考手册][7]后，我发现 STM32F0 系列是 STM32F3 削减版，这让在新端口上开发的工作变得容易了一些。

如果你想接着本文的步骤做下去，需要先安装 Emgo 

```
cd $HOME
git clone https://github.com/ziutek/emgo/
cd emgo/egc
go install
```

然后设置一下环境变量

```
export EGCC=path_to_arm_gcc      # eg. /usr/local/arm/bin/arm-none-eabi-gcc
export EGLD=path_to_arm_linker   # eg. /usr/local/arm/bin/arm-none-eabi-ld
export EGAR=path_to_arm_archiver # eg. /usr/local/arm/bin/arm-none-eabi-ar

export EGROOT=$HOME/emgo/egroot
export EGPATH=$HOME/emgo/egpath

export EGARCH=cortexm0
export EGOS=noos
export EGTARGET=f030x6
```

更详细的说明可以在 [Emgo][8] 官网上找到。

要确保 `egc` 在你的 `PATH` 中。 你可以使用 `go build` 来代替 `go install`，然后把 `egc` 复制到你的 `$HOME/bin` 或 `/usr/local/bin` 中。

现在，为你的第一个 Emgo 程序创建一个新文件夹，随后把示例中链接器脚本复制过来：

```
mkdir $HOME/firstemgo
cd $HOME/firstemgo
cp $EGPATH/src/stm32/examples/f030-demo-board/blinky/script.ld .
```

### 最基本程序

在 `main.go` 文件中创建一个最基本的程序：

```
package main

func main() {
}
```

文件编译没有出现任何问题：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
   7452     172     104    7728    1e30 cortexm0.elf
```

第一次编译可能会花点时间。编译后产生的二进制占用了 7624 个字节的 Flash 空间（文本 + 数据）。对于一个什么都没做的程序来说，占用的空间有些大。还剩下 8760 字节，可以用来做些有用的事。 

不妨试试传统的 “Hello, World!” 程序：

```
package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")
}
```

不幸的是，这次结果有些糟糕：

```
$ egc
/usr/local/arm/bin/arm-none-eabi-ld: /home/michal/P/go/src/github.com/ziutek/emgo/egpath/src/stm32/examples/f030-demo-board/blog/cortexm0.elf section `.text' will not fit in region `Flash'
/usr/local/arm/bin/arm-none-eabi-ld: region `Flash' overflowed by 10880 bytes
exit status 1
```

 “Hello, World!” 需要 STM32F030x6 上至少 32KB 的 Flash 空间。

`fmt` 包强制包含整个 `strconv` 和 `reflect` 包。这三个包，即使在精简版本中的 Emgo 中，占用空间也很大。我们不能使用这个例子了。有很多的应用不需要好看的文本输出。通常，一个或多个 LED，或者七段数码管显示就足够了。不过，在第二部分，我会尝试使用 `strconv` 包来格式化，并在 UART 上显示一些数字和文本。

### 闪烁

我们的开发板上有一个与 PA4 引脚和 VCC 相连的 LED。这次我们的代码稍稍长了一些： 

```
package main

import (
	"delay"

	"stm32/hal/gpio"
	"stm32/hal/system"
	"stm32/hal/system/timer/systick"
)

var led gpio.Pin

func init() {
	system.SetupPLL(8, 1, 48/8)
	systick.Setup(2e6)

	gpio.A.EnableClock(false)
	led = gpio.A.Pin(4)

	cfg := &gpio.Config{Mode: gpio.Out, Driver: gpio.OpenDrain}
	led.Setup(cfg)
}

func main() {
	for {
		led.Clear()
		delay.Millisec(100)
		led.Set()
		delay.Millisec(900)
	}
}
```

按照惯例，`init` 函数用来初始化和配置外设。 

`system.SetupPLL(8, 1, 48/8)` 用来配置 RCC，将外部的 8 MHz 振荡器的 PLL 作为系统时钟源。PLL 分频器设置为 1，倍频数设置为 48/8 =6，这样系统时钟频率为 48MHz。

`systick.Setup(2e6)` 将 Cortex-M SYSTICK 时钟作为系统时钟，每隔 2e6 次纳秒运行一次（每秒钟 500 次）。 

`gpio.A.EnableClock(false)` 开启了 GPIO A 口的时钟。`False` 意味着这一时钟在低功耗模式下会被禁用，但在 STM32F0 系列中并未实现这一功能。

`led.Setup(cfg)` 设置 PA4 引脚为开漏输出。

`led.Clear()` 将 PA4 引脚设为低，在开漏设置中，打开 LED。

`led.Set()` 将 PA4 设为高电平状态，关掉LED。

编译这个代码：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
   9772     172     168   10112    2780 cortexm0.elf
```

正如你所看到的，这个闪烁程序占用了 2320 字节，比最基本程序占用空间要大。还有 6440 字节的剩余空间。

看看代码是否能运行：

```
$ openocd -d0 -f interface/stlink.cfg -f target/stm32f0x.cfg -c 'init; program cortexm0.elf; reset run; exit'
Open On-Chip Debugger 0.10.0+dev-00319-g8f1f912a (2018-03-07-19:20)
Licensed under GNU GPL v2
For bug reports, read
        http://openocd.org/doc/doxygen/bugs.html
debug_level: 0
adapter speed: 1000 kHz
adapter_nsrst_delay: 100
none separate
adapter speed: 950 kHz
target halted due to debug-request, current mode: Thread 
xPSR: 0xc1000000 pc: 0x0800119c msp: 0x20000da0
adapter speed: 4000 kHz
** Programming Started **
auto erase enabled
target halted due to breakpoint, current mode: Thread 
xPSR: 0x61000000 pc: 0x2000003a msp: 0x20000da0
wrote 10240 bytes from file cortexm0.elf in 0.817425s (12.234 KiB/s)
** Programming Finished **
adapter speed: 950 kHz
```

在这篇文章中，这是我第一次，将一个短视频转换成[动画 PNG][9]。我对此印象很深，再见了 YouTube。 对于 IE 用户，我很抱歉，更多信息请看 [apngasm][10]。我本应该学习 HTML5，但现在，APNG 是我最喜欢的，用来播放循环短视频的方法了。 

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/blinky.png)

### 更多的 Go 语言编程

如果你不是一个 Go 程序员，但你已经听说过一些关于 Go 语言的事情，你可能会说：“Go 语法很好，但跟 C 比起来，并没有明显的提升。让我看看 Go 语言的通道和协程！”

接下来我会一一展示:

```
import (
	"delay"

	"stm32/hal/gpio"
	"stm32/hal/system"
	"stm32/hal/system/timer/systick"
)

var led1, led2 gpio.Pin

func init() {
	system.SetupPLL(8, 1, 48/8)
	systick.Setup(2e6)

	gpio.A.EnableClock(false)
	led1 = gpio.A.Pin(4)
	led2 = gpio.A.Pin(5)

	cfg := &gpio.Config{Mode: gpio.Out, Driver: gpio.OpenDrain}
	led1.Setup(cfg)
	led2.Setup(cfg)
}

func blinky(led gpio.Pin, period int) {
	for {
		led.Clear()
		delay.Millisec(100)
		led.Set()
		delay.Millisec(period - 100)
	}
}

func main() {
	go blinky(led1, 500)
	blinky(led2, 1000)
}

```

代码改动很小: 添加了第二个 LED，上一个例子中的 `main` 函数被重命名为 `blinky` 并且需要提供两个参数。 `main` 在新的协程中先调用 `blinky`，所以两个 LED 灯在并行使用。值得一提的是，`gpio.Pin` 可以同时访问同一 GPIO 口的不同引脚。 

Emgo 还有很多不足。其中之一就是你需要提前规定 `goroutines(tasks)` 的最大执行数量。是时候修改 `script.ld` 了:

```
ISRStack = 1024;
MainStack = 1024;
TaskStack = 1024;
MaxTasks = 2;

INCLUDE stm32/f030x4
INCLUDE stm32/loadflash
INCLUDE noos-cortexm
```

栈的大小需要靠猜，现在还不用关心这一点。

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  10020     172     172   10364    287c cortexm0.elf
```

另一个 LED 和协程一共占用了 248 字节的 Flash 空间。

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/goroutines.png)

### 通道

通道是 Go 语言中协程之间相互通信的一种[推荐方式][11]。Emgo 甚至能允许通过*中断处理*来使用缓冲通道。下一个例子就展示了这种情况。

```
package main

import (
	"delay"
	"rtos"

	"stm32/hal/gpio"
	"stm32/hal/irq"
	"stm32/hal/system"
	"stm32/hal/system/timer/systick"
	"stm32/hal/tim"
)

var (
	leds  [3]gpio.Pin
	timer *tim.Periph
	ch    = make(chan int, 1)
)

func init() {
	system.SetupPLL(8, 1, 48/8)
	systick.Setup(2e6)

	gpio.A.EnableClock(false)
	leds[0] = gpio.A.Pin(4)
	leds[1] = gpio.A.Pin(5)
	leds[2] = gpio.A.Pin(9)

	cfg := &gpio.Config{Mode: gpio.Out, Driver: gpio.OpenDrain}
	for _, led := range leds {
		led.Set()
		led.Setup(cfg)
	}

	timer = tim.TIM3
	pclk := timer.Bus().Clock()
	if pclk < system.AHB.Clock() {
		pclk *= 2
	}
	freq := uint(1e3) // Hz
	timer.EnableClock(true)
	timer.PSC.Store(tim.PSC(pclk/freq - 1))
	timer.ARR.Store(700) // ms
	timer.DIER.Store(tim.UIE)
	timer.CR1.Store(tim.CEN)

	rtos.IRQ(irq.TIM3).Enable()
}

func blinky(led gpio.Pin, period int) {
	for range ch {
		led.Clear()
		delay.Millisec(100)
		led.Set()
		delay.Millisec(period - 100)
	}
}

func main() {
	go blinky(leds[1], 500)
	blinky(leds[2], 500)
}

func timerISR() {
	timer.SR.Store(0)
	leds[0].Set()
	select {
	case ch <- 0:
		// Success
	default:
		leds[0].Clear()
	}
}

//c:__attribute__((section(".ISRs")))
var ISRs = [...]func(){
	irq.TIM3: timerISR,
}
```

与之前例子相比较下的不同:

1. 添加了第三个 LED，并连接到 PA9 引脚（UART 头的 TXD 引脚）。
2. 时钟（`TIM3`）作为中断源。
3. 新函数 `timerISR` 用来处理 `irq.TIM3` 的中断。
4. 新增容量为 1 的缓冲通道是为了 `timerISR` 和 `blinky` 协程之间的通信。
5. `ISRs` 数组作为*中断向量表*，是更大的*异常向量表*的一部分。
6. `blinky` 中的 `for` 语句被替换成 `range` 语句。

为了方便起见，所有的 LED，或者说它们的引脚，都被放在 `leds` 这个数组里。另外，所有引脚在被配置为输出之前，都设置为一种已知的初始状态（高电平状态）。

在这个例子里，我们想让时钟以 1 kHz 的频率运行。为了配置 TIM3 预分频器，我们需要知道它的输入时钟频率。通过参考手册我们知道，输入时钟频率在 `APBCLK = AHBCLK` 时，与 `APBCLK` 相同，反之等于 2 倍的 `APBCLK`。

如果 CNT 寄存器增加 1 kHz，那么 ARR 寄存器的值等于*更新事件*（重载事件）在毫秒中的计数周期。 为了让更新事件产生中断，必须要设置 DIER 寄存器中的 UIE 位。CEN 位能启动时钟。 

时钟外设在低功耗模式下必须启用，为了自身能在 CPU 处于休眠时保持运行: `timer.EnableClock(true)`。这在 STM32F0 中无关紧要，但对代码可移植性却十分重要。

`timerISR` 函数处理 `irq.TIM3` 的中断请求。`timer.SR.Store(0)` 会清除 SR 寄存器里的所有事件标志，无效化向 [NVIC][12] 发出的所有中断请求。凭借经验，由于中断请求无效的延时性，需要在程序一开始马上清除所有的中断标志。这避免了无意间再次调用处理。为了确保万无一失，需要先清除标志，再读取，但是在我们的例子中，清除标志就已经足够了。

下面的这几行代码：

```
select {
case ch <- 0:
	// Success
default:
	leds[0].Clear()
}
```

是 Go 语言中，如何在通道上非阻塞地发送消息的方法。中断处理程序无法一直等待通道中的空余空间。如果通道已满，则执行 `default`，开发板上的LED就会开启，直到下一次中断。

`ISRs` 数组包含了中断向量表。`//c:__attribute__((section(".ISRs")))` 会导致链接器将数组插入到 `.ISRs` 节中。

`blinky` 的 `for` 循环的新写法：

```
for range ch {
	led.Clear()
	delay.Millisec(100)
	led.Set()
	delay.Millisec(period - 100)
}
```

等价于：

```
for {
	_, ok := <-ch
	if !ok {
		break // Channel closed.
	}
	led.Clear()
	delay.Millisec(100)
	led.Set()
	delay.Millisec(period - 100)
}
```

注意，在这个例子中，我们不在意通道中收到的值，我们只对其接受到的消息感兴趣。我们可以在声明时，将通道元素类型中的 `int` 用空结构体 `struct{}` 来代替，发送消息时，用 `struct{}{}` 结构体的值代替 0，但这部分对新手来说可能会有些陌生。 

让我们来编译一下代码:

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  11096     228     188   11512    2cf8 cortexm0.elf
```

新的例子占用了 11324 字节的 Flash 空间，比上一个例子多占用了 1132 字节。

采用现在的时序，两个闪烁协程从通道中获取数据的速度，比 `timerISR` 发送数据的速度要快。所以它们在同时等待新数据，你还能观察到 `select` 的随机性，这也是 [Go 规范][13]所要求的。

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/channels1.png)

开发板上的 LED 一直没有亮起，说明通道从未出现过溢出。

我们可以加快消息发送的速度，将 `timer.ARR.Store(700)` 改为 `timer.ARR.Store(200)`。 现在 `timerISR` 每秒钟发送 5 条消息，但是两个接收者加起来，每秒也只能接受 4 条消息。

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/channels2.png)

正如你所看到的，`timerISR` 开启黄色 LED 灯，意味着通道上已经没有剩余空间了。

第一部分到这里就结束了。你应该知道，这一部分并未展示 Go 中最重要的部分，接口。

协程和通道只是一些方便好用的语法。你可以用自己的代码来替换它们，这并不容易，但也可以实现。接口是Go 语言的基础。这是文章中 [第二部分][14]所要提到的. 

在 Flash 上我们还有些剩余空间。

--------------------------------------------------------------------------------

via: https://ziutek.github.io/2018/03/30/go_on_very_small_hardware.html

作者：[Michał Derkacz][a]
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ziutek.github.io/
[1]:https://en.wikipedia.org/wiki/ARM_Cortex-M#Cortex-M0
[2]:https://ziutek.github.io/2018/03/30/go_on_very_small_hardware.html
[3]:http://www.st.com/content/st_com/en/products/microcontrollers/stm32-32-bit-arm-cortex-mcus/stm32-mainstream-mcus/stm32f0-series/stm32f0x0-value-line/stm32f030f4.html
[4]:https://golang.org/
[5]:https://github.com/ziutek/emgo
[6]:https://github.com/ziutek/emgo/tree/master/egpath/src/stm32/hal
[7]:http://www.st.com/resource/en/reference_manual/dm00091010.pdf
[8]:https://github.com/ziutek/emgo
[9]:https://en.wikipedia.org/wiki/APNG
[10]:http://apngasm.sourceforge.net/
[11]:https://blog.golang.org/share-memory-by-communicating
[12]:http://infocenter.arm.com/help/topic/com.arm.doc.ddi0432c/Cihbecee.html
[13]:https://golang.org/ref/spec#Select_statements
[14]:https://ziutek.github.io/2018/04/14/go_on_very_small_hardware2.html
