wenwensnow is translating

Go on very small hardware (Part 1) Go语言在极小硬件上的运用（第一部分）
============================================================


How low we can  _Go_  and still do something useful?
_Go_ 语言，能在多低下的配置上运行并发挥作用呢？
I recently bought this ridiculously cheap board:
我最近购买了一个特别便宜的开发板：

 [![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/board.jpg)][2] 


I bought it for three reasons. First, I have never dealt (as a programmer) with STM32F0 series. Second, the STM32F10x series is getting old. MCUs belonging to the STM32F0 family are just as cheap if not cheaper and has newer peripherals, with many improvements and bugs fixed. Thirdly, I chose the smallest member of the family for the purpose of this article, to make the whole thing a little more intriguing.
我购买它的理由有三个。首先，我（作为程序员）从未接触过STM320系列的开发板。其次， STM32F10x系列使用的频率也在降低。STM320系列的MCU很便宜，有更新的外设，对系列产品进行了改进，问题修复也做得更好了。最后，我为了这篇文章，选用了这一系列中最低配置的开发板，整件事情就变得有趣起来了。


### 硬件部分

[STM32F030F4P6][3] 给人留下了很深的印象：

*   CPU: [Cortex M0][1] 48 MHz (最低配置，只有12000个逻辑门电路),

*   RAM: 4 KB,

*   Flash: 16 KB,

*   ADC, SPI, I2C, USART 和几个定时器,

all enclosed in TSSOP20 package. As you can see, it is very small 32-bit system.
以上这些采用了TSSOP20封装。正如你所见，这是一个很小的32位系统。

### 软件部分

If you hoped to see how to use [Go][4] to program this board, you need to read the hardware specification one more time. You must face the truth: there is a negligible chance that someone will ever add support for Cortex-M0 to the Go compiler and this is just the beginning of work.
如果你想知道如何在这块开发板上使用 [Go][4] 编程，你需要反复阅读硬件手册。你必须明白：有人在Go 编译器中给Cortex-M0提供支持，可能性很小。而且，这还仅仅只是第一个要解决的问题。

I’ll use [Emgo][5], but don’t worry, you will see that it gives you as much Go as it can on such small system.
我会使用[Emgo][5]，但别担心，你会在之后看到，它如何让Go在如此小的系统上尽可能发挥作用。

There was no support for any F0 MCU in [stm32/hal][6] before this board arrived to me. After brief study of [RM][7], the STM32F0 series appeared to be striped down STM32F3 series, which made work on new port easier.
在我拿到这块开发板之前，对 [stm32/hal][6] 系列下的F0 MCU 没有任何支持。在简单研究 [参考手册][7]后，我发现 STM32F0系列是STM32F3的一个基础，这让

如果你想接着本文的步骤做下去，需要先安装Emgo 

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

更详细的说明可以在 [Emgo][8]网站上找到。

Ensure that egc is on your PATH. You can use `go build` instead of `go install` and copy egc to your  _$HOME/bin_  or  _/usr/local/bin_ .

要确保 egc 在你的PATH 中。 你可以使用 `go build` 来代替 `go install`,然后把 egc 复制到你的 _$HOME/bin_ 或  _/usr/local/bin_ 中。

现在为你的第一个Emgo程序创建一个新文件夹，随后把示例中链接器脚本复制过来：

```
mkdir $HOME/firstemgo
cd $HOME/firstemgo
cp $EGPATH/src/stm32/examples/f030-demo-board/blinky/script.ld .

```

### 最基本程序

在 _main.go_ 文件中创建一个最基本的程序：

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

第一次编译可能会花点时间。编译后产生的二进制占用了7624个字节的Flash空间（文本+数据）。对于一个什么都没做的程序来说，所占用的空间有些大。还剩下8760字节，可以用来做些有用的事。 
The first compilation can take some time. The resulting binary takes 7624 bytes of Flash (text+data), quite a lot for a program that does nothing. There are 8760 free bytes left to do something useful.

不妨试试传统的 _Hello, World!_  程序：

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

 _Hello, World!_   需要 STM32F030x6 上的 至少32KB 的Flash空间.

The  _fmt_  package forces to include whole  _strconv_  and  _reflect_  packages. All three are pretty big, even a slimmed-down versions in Emgo. We must forget about it. There are many applications that don’t require fancy formatted text output. Often one or more LEDs or seven segment display are enough. However, in Part 2, I’ll try to use  _strconv_  package to format and print some numbers and text over UART.
_fmt_ 包强制包含整个 _strconv_ 和  _reflect_ 包。这三个包，即使在精简版本中的Emgo中，占用空间也很大。我们不能使用这个例子了。有很多的应用不需要好看的文本输出。通常，一个或多个LED，或者七段数码管显示就足够了。不过，在第二部分，我会尝试使用 _strconv_ 包来格式化，并在UART 上显示一些数字和文本。


### 闪烁

我们的开发板上有一个与PA4引脚和 VCC 相连的LED。这次我们的代码稍稍长了一些： 

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

By convention, the  _init_  function is used to initialize the basic things and configure peripherals.
按照惯例， _init_ 函数用来初始化和配置外设。 

`system.SetupPLL(8, 1, 48/8)` 用来配置RCC，将外部的8 MHz振荡器的PLL作为系统时钟源。PLL 分频器设置为1，倍频数 设置为 48/8 =6，这样系统时钟频率为48MHz.

`systick.Setup(2e6)` 将 Cortex-M SYSTICK 时钟作为系统时钟，每隔 2e6次纳秒运行一次（每秒钟500次）。 

`gpio.A.EnableClock(false)` 
enables clock for GPIO port A.  _False_  means that this clock should be disabled in low-power mode, but this is not implemented int STM32F0 series.
开启了 GPIO A 口的时钟。 _False_ 意味着这一时钟在低功耗模式下会被禁用，但在STM32F0系列中没有实现这一模式。

`led.Setup(cfg)` 设置 PA4 引脚为开漏输出.

`led.Clear()` 将 PA4 引脚设为低, 在开漏设置中，打开LED.

`led.Set()` 将 PA4 设为高电平状态 , 意为关掉LED.

 编译这个代码：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
   9772     172     168   10112    2780 cortexm0.elf

```

As you can see, blinky takes 2320 bytes more than minimal program. There are still 6440 bytes left for more code.
正如你所看到的，闪烁占用了2320 字节，比最小程序占用空间要大。还有6440字节的剩余空间。


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

For this article, the first time in my life, I converted short video to [animated PNG][9] sequence. I’m impressed, goodbye YouTube and sorry IE users. See [apngasm][10] for more info. I should study HTML5 based alternative, but for now, APNG is my preffered way for short looped videos.
在这篇文章中，这是我第一次，将一个短视频转换成[动画PNG][9]。我对此印象很深，再见了 YouTube. 对于IE用户，我很抱歉，更多信息请看[apngasm][10].我本应该学习 HTML5，但现在，APNG是我最喜欢的用来展现循环短视频的方法了。 

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/blinky.png)

### 更多的Go语言编程

If you aren’t a Go programmer but you’ve heard something about Go language, you can say: “This syntax is nice, but not a significant improvement over C. Show me  _Go language_ , give mi  _channels_  and  _goroutines!_ ”.
如果你不是一个Go 程序员，但是你已经听说过一些关于Go 语言的事情，你可能会说：“这语法很好，但跟C比起来，没有明显的提升.给我看看 _Go 语言_ 的  _channels_ 和  _goroutines!”


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

Code changes are minor: the second LED was added and the previous  _main_  function was renamed to  _blinky_  and now requires two parameters.  _Main_  starts first  _blinky_  in new goroutine, so both LEDs are handled  _concurrently_ . It is worth mentioning that  _gpio.Pin_  type supports concurrent access to different pins of the same GPIO port.
代码改动很小: 添加了第二个LED，上一个例子中的 _main_ 函数被重命名为 _blinky_ 并且需要提供两个参数. _Main_ 在新的goroutine 中先调用 _blinky_, 所以两个LED灯在并行使用. 值得一提的是，  _gpio.Pin_  可以同时访问同一GPIO口的不同引脚。 

Emgo 还有很多不足。其中之一就是你需要提前规定goroutines(tasks)的最大执行数量.是时候修改 _script.ld_ 了:

```
ISRStack = 1024;
MainStack = 1024;
TaskStack = 1024;
MaxTasks = 2;

INCLUDE stm32/f030x4
INCLUDE stm32/loadflash
INCLUDE noos-cortexm

```

The size of the stacks are set by guess, and we’ll not care about them at the moment.

栈的大小需要靠猜，现在还不用关心这一点。


```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  10020     172     172   10364    287c cortexm0.elf

```
另一个LED 和 goroutine 一共占用了248字节的Flash空间.


![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/goroutines.png)

### Channels

Channels 是Go语言中goroutines之间相互通信的一种[推荐方式][11]. Emgo goes even further and allows to use  _buffered_  channels by  _interrupt handlers_ . The next example actually shows such case.
Emgo 甚至能允许通过 _中断处理_ 来使用缓冲channel. 下一个例子就展示了这种情况.

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

Changes compared to the previous example: 与之前例子相比较之下的不同:

1.  Thrid LED was added and connected to PA9 pin (TXD pin on UART header).
1. 添加了第三个LED，并连接到 PA9 引脚.（UART头的TXD引脚）

2. 时钟（TIM3）作为中断源.

3. 新函数 _timerISR_  用来处理  _irq.TIM3_ 的中断.

4. 新增容量为1 的缓冲channel 是为了 _timerISR_ 和  _blinky_  goroutines 之间的通信.

5. _ISRs_ 数组作为 _中断向量表_，是 _异常向量表_ 的一部分. 

6.   _blinky中的for语句_  被替换成  _range语句_ .

For convenience, all LEDs, or rather their pins, have been collected in the  _leds_  array. Additionally, all pins have been set to a known initial state (high), just before they were configured as outputs.
为了方便，所有的LED，或者说他们的引脚，都被放在 _leds_ 这个数组里. 另外， 所有引脚在被配置为输出之前，都设置为一种已知的初始状态（高电平状态）.

在这个例子里，我们想让时钟以1 kHz的频率运行。为了配置预分频器，我们需要知道它的输入时钟频率。 通过参考手册我们知道，输入时钟频率在  APBCLK = AHBCLK时,与APBCLK 相同，反之等于2倍的APBCLK。

如果CNT寄存器增加 1kHz,那么ARR寄存器的值等于 _更新事件_ （重载事件）在毫秒中的计数周期。 为了让更新事件产生中断，必须要设置DIER 寄存器中的UIE位。CEN位能启动时钟。 

时钟外设在低功耗模式下必须启用，为了自身能在CPU处于休眠时保持运行: `timer.EnableClock(true)`。在STM32F0中无所谓，但是对代码可移植性却十分重要。

_timerISR_ 函数处理 _irq.TIM3_ 的中断请求。  `timer.SR.Store(0)` 会清除 SR寄存器里的所有事件标志，无效化 向[NVIC][12]发出的所有中断请求。凭借经验，由于中断请求无效的延时性，需要在程序一开始马上清除所有的中断标志。这避免了无意间再次调用处理。为了确保万无一失，需要先清除标志，再读取，但是在我们的例子中，清除标志就已经足够了。

下面的这几行代码：

```
select {
case ch <- 0:
	// Success
default:
	leds[0].Clear()
}

```

is a Go way to non-blocking sending on a channel. No one interrupt handler can afford to wait for a free space in the channel. If the channel is full, the default case is taken, and the onboard LED is set on, until the next interrupt.
这是Go 语言中，如何在channel 中非阻塞的发送消息。 中断处理程序无法一直等待channel 中的空余空间。如果channel已满，则执行default,开发板上的LED就会开启，直到下一次中断。

The  _ISRs_  array contains interrupt vectors. The `//c:__attribute__((section(".ISRs")))` causes that the linker will inserted it into .ISRs section.
_ISRs_ 数组包含了中断向量表。 `//c:__attribute__((section(".ISRs")))` 会导致链接器将数组插入到 .ISRs section 中。

_blinky’s for_  循环的新写法：

```
for range ch {
	led.Clear()
	delay.Millisec(100)
	led.Set()
	delay.Millisec(period - 100)
}

```

等价于:

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

Note that in this case we aren’t interested in the value received from the channel. We’re interested only in the fact that there is something to receive. We can give it expression by declaring the channel’s element type as empty struct `struct{}` instead of  _int_  and send `struct{}{}` values instead of 0, but it can be strange for newcomer’s eyes.

注意，在这个例子中，我们不在意channel中收到的值，我们只对其接受到的消息感兴趣。我们可以在声明时，将channel元素类型 中的 _int_ 用空的结构体来代替，发送消息时， 用`struct{}{}` 结构体的值代替0，但这一部分对新手来说可能会有些奇怪。 


让我们来编译一下代码:

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  11096     228     188   11512    2cf8 cortexm0.elf

```

新的例子占用了11324字节的Flash 空间，比上一个例子多占用了1132字节。

With the current timings, both  _blinky_  goroutines consume from the channel much faster than the  _timerISR_  sends to it. So they both wait for new data simultaneously and you can observe the randomness of  _select_ , required by the [Go specification][13].

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/channels1.png)

The onboard LED is always off, so the channel overrun never occurs.

Let’s speed up sending, by changing `timer.ARR.Store(700)` to `timer.ARR.Store(200)`. Now the  _timerISR_ sends 5 messages per second but both recipients together can receive only 4 messages per second.

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/channels2.png)

As you can see, the  _timerISR_  lights the yellow LED which means there is no space in the channel.

This is where I finish the first part of this article. You should know that this part didn’t show you the most important thing in Go language,  _interfaces_ .

Goroutines and channels are only nice and convenient syntax. You can replace them with your own code - not easy but feasible. Interfaces are the essence of Go, and that’s what I will start with in the [second part][14] of this article.

We still have some free space on Flash.

--------------------------------------------------------------------------------

via: https://ziutek.github.io/2018/03/30/go_on_very_small_hardware.html

作者：[ Michał Derkacz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
