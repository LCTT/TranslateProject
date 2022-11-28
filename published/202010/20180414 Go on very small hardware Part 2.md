[#]: collector: (oska874)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12747-1.html)
[#]: subject: (Go on very small hardware Part 2)
[#]: via: (https://ziutek.github.io/2018/04/14/go_on_very_small_hardware2.html)
[#]: author: (Michał Derkacz https://ziutek.github.io/)

Go 语言在极小硬件上的运用（二）
============================================================

![](https://img.linux.net.cn/data/attachment/album/201909/24/210256yihkuy8kcigugr2h.png)

在本文的 [第一部分][2] 的结尾，我承诺要写关于接口的内容。我不想在这里写有关接口或完整或简短的讲义。相反，我将展示一个简单的示例，来说明如何定义和使用接口，以及如何利用无处不在的 `io.Writer` 接口。还有一些关于<ruby>反射<rt>reflection</rt></ruby>和<ruby>半主机<rt>semihosting</rt></ruby>的内容。

![STM32F030F4P6](https://ziutek.github.io/images/mcu/f030-demo-board/board.jpg)

接口是 Go 语言的重要组成部分。如果你想了解更多有关它们的信息，我建议你阅读《[高效的 Go 编程][3]》 和 [Russ Cox 的文章][4]。

### 并发 Blinky – 回顾

当你阅读前面示例的代码时，你可能会注意到一中打开或关闭 LED 的反直觉方式。 `Set` 方法用于关闭 LED，`Clear` 方法用于打开 LED。这是由于在 <ruby>漏极开路配置<rt>open-drain configuration</rt></ruby> 下驱动了 LED。我们可以做些什么来减少代码的混乱？让我们用 `On` 和 `Off` 方法来定义 `LED` 类型：

```
type LED struct {
    pin gpio.Pin
}

func (led LED) On() {
    led.pin.Clear()
}

func (led LED) Off() {
    led.pin.Set()
}
```

现在我们可以简单地调用 `led.On()` 和 `led.Off()`，这不会再引起任何疑惑了。

在前面的所有示例中，我都尝试使用相同的 <ruby>漏极开路配置<rt>open-drain configuration</rt></ruby>来避免代码复杂化。但是在最后一个示例中，对于我来说，将第三个 LED 连接到 GND 和 PA3 引脚之间并将 PA3 配置为<ruby>推挽模式<rt>push-pull mode</rt></ruby>会更容易。下一个示例将使用以此方式连接的 LED。

但是我们的新 `LED` 类型不支持推挽配置，实际上，我们应该将其称为 `OpenDrainLED`，并定义另一个类型 `PushPullLED`：

```
type PushPullLED struct {
    pin gpio.Pin
}

func (led PushPullLED) On() {
    led.pin.Set()
}

func (led PushPullLED) Off() {
    led.pin.Clear()
}
```

请注意，这两种类型都具有相同的方法，它们的工作方式也相同。如果在 LED 上运行的代码可以同时使用这两种类型，而不必注意当前使用的是哪种类型，那就太好了。 接口类型可以提供帮助：

```
package main

import (
    "delay"

    "stm32/hal/gpio"
    "stm32/hal/system"
    "stm32/hal/system/timer/systick"
)

type LED interface {
    On()
    Off()
}

type PushPullLED struct{ pin gpio.Pin }

func (led PushPullLED) On()  {
    led.pin.Set()
}

func (led PushPullLED) Off() {
    led.pin.Clear()
}

func MakePushPullLED(pin gpio.Pin) PushPullLED {
    pin.Setup(&gpio.Config{Mode: gpio.Out, Driver: gpio.PushPull})
    return PushPullLED{pin}
}

type OpenDrainLED struct{ pin gpio.Pin }

func (led OpenDrainLED) On()  {
    led.pin.Clear()
}

func (led OpenDrainLED) Off() {
    led.pin.Set()
}

func MakeOpenDrainLED(pin gpio.Pin) OpenDrainLED {
    pin.Setup(&gpio.Config{Mode: gpio.Out, Driver: gpio.OpenDrain})
    return OpenDrainLED{pin}
}

var led1, led2 LED

func init() {
    system.SetupPLL(8, 1, 48/8)
    systick.Setup(2e6)

    gpio.A.EnableClock(false)
    led1 = MakeOpenDrainLED(gpio.A.Pin(4))
    led2 = MakePushPullLED(gpio.A.Pin(3))
}

func blinky(led LED, period int) {
    for {
        led.On()
        delay.Millisec(100)
        led.Off()
        delay.Millisec(period - 100)
    }
}

func main() {
    go blinky(led1, 500)
    blinky(led2, 1000)
}

```

我们定义了 `LED` 接口，它有两个方法： `On` 和 `Off`。 `PushPullLED` 和 `OpenDrainLED` 类型代表两种驱动 LED 的方式。我们还定义了两个用作构造函数的 `Make*LED` 函数。这两种类型都实现了 `LED` 接口，因此可以将这些类型的值赋给 `LED` 类型的变量：

```
led1 = MakeOpenDrainLED(gpio.A.Pin(4))
led2 = MakePushPullLED(gpio.A.Pin(3))
```

在这种情况下，<ruby>可赋值性<rt>assignability</rt></ruby>在编译时检查。赋值后，`led1` 变量包含一个 `OpenDrainLED{gpio.A.Pin(4)}`，以及一个指向 `OpenDrainLED` 类型的方法集的指针。 `led1.On()` 调用大致对应于以下 C 代码：

```
led1.methods->On(led1.value)
```

如你所见，如果仅考虑函数调用的开销，这是相当廉价的抽象。

但是，对接口的任何赋值都会导致包含有关已赋值类型的大量信息。对于由许多其他类型组成的复杂类型，可能会有很多信息：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  10356     196     212   10764    2a0c cortexm0.elf
```

如果我们不使用 [反射][5]，可以通过避免包含类型和结构字段的名称来节省一些字节：

```
$ egc -nf -nt
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  10312     196     212   10720    29e0 cortexm0.elf
```

生成的二进制文件仍然包含一些有关类型的必要信息和关于所有导出方法（带有名称）的完整信息。在运行时，主要是当你将存储在接口变量中的一个值赋值给任何其他变量时，需要此信息来检查可赋值性。

我们还可以通过重新编译所导入的包来删除它们的类型和字段名称：

```
$ cd $HOME/emgo
$ ./clean.sh
$ cd $HOME/firstemgo
$ egc -nf -nt
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  10272     196     212   10680    29b8 cortexm0.elf
```

让我们加载这个程序，看看它是否按预期工作。这一次我们将使用 [st-flash][6] 命令：

```
$ arm-none-eabi-objcopy -O binary cortexm0.elf cortexm0.bin
$ st-flash write cortexm0.bin 0x8000000
st-flash 1.4.0-33-gd76e3c7
2018-04-10T22:04:34 INFO usb.c: -- exit_dfu_mode
2018-04-10T22:04:34 INFO common.c: Loading device parameters....
2018-04-10T22:04:34 INFO common.c: Device connected is: F0 small device, id 0x10006444
2018-04-10T22:04:34 INFO common.c: SRAM size: 0x1000 bytes (4 KiB), Flash: 0x4000 bytes (16 KiB) in pages of 1024 bytes
2018-04-10T22:04:34 INFO common.c: Attempting to write 10468 (0x28e4) bytes to stm32 address: 134217728 (0x8000000)
Flash page at addr: 0x08002800 erased
2018-04-10T22:04:34 INFO common.c: Finished erasing 11 pages of 1024 (0x400) bytes
2018-04-10T22:04:34 INFO common.c: Starting Flash write for VL/F0/F3/F1_XL core id
2018-04-10T22:04:34 INFO flash_loader.c: Successfully loaded flash loader in sram
 11/11 pages written
2018-04-10T22:04:35 INFO common.c: Starting verification of write complete
2018-04-10T22:04:35 INFO common.c: Flash written and verified! jolly good!

```

我没有将 NRST 信号连接到编程器，因此无法使用 `-reset` 选项，必须按下复位按钮才能运行程序。

![Interfaces](https://ziutek.github.io/images/mcu/f030-demo-board/interfaces.png)

看来，`st-flash` 与此板配合使用有点不可靠（通常需要复位 ST-LINK 加密狗）。此外，当前版本不会通过 SWD 发出复位命令（仅使用 NRST 信号）。软件复位是不现实的，但是它通常是有效的，缺少它会将会带来不便。对于<ruby>板卡程序员<rt>board-programmer</rt></ruby> 来说 OpenOCD 工作得更好。

### UART

UART（<ruby>通用异步收发传输器<rt>Universal Aynchronous Receiver-Transmitter</rt></ruby>）仍然是当今微控制器最重要的外设之一。它的优点是以下属性的独特组合：

* 相对较高的速度，
* 仅两条信号线（在 <ruby>半双工<rt>half-duplex</rt></ruby> 通信的情况下甚至一条），
* 角色对称，
* 关于新数据的 <ruby>同步带内信令<rt>synchronous in-band signaling</rt></ruby>（起始位），
* 在传输 <ruby>字<rt>words</rt></ruby> 内的精确计时。

这使得最初用于传输由 7-9 位的字组成的异步消息的 UART，也被用于有效地实现各种其他物理协议，例如被 [WS28xx LEDs][7] 或 [1-wire][8] 设备使用的协议。

但是，我们将以其通常的角色使用 UART：从程序中打印文本消息。

```
package main

import (
    "io"
    "rtos"

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
    tts.Periph().SetBaudRate(115200)
    tts.Periph().Enable()
    tts.EnableTx()

    rtos.IRQ(irq.USART1).Enable()
    rtos.IRQ(irq.DMA1_Channel2_3).Enable()
}

func main() {
    io.WriteString(tts, "Hello, World!\r\n")
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

你会发现此代码可能有些复杂，但目前 STM32 HAL 中没有更简单的 UART 驱动程序（在某些情况下，简单的轮询驱动程序可能会很有用）。 `usart.Driver` 是使用 DMA 和中断来减轻 CPU 负担的高效驱动程序。

STM32 USART 外设提供传统的 UART 及其同步版本。要将其用作输出，我们必须将其 Tx 信号连接到正确的 GPIO 引脚：

```
tx.Setup(&gpio.Config{Mode: gpio.Alt})
tx.SetAltFunc(gpio.USART1_AF1)
```

在 Tx-only 模式下配置 `usart.Driver` （rxdma 和 rxbuf 设置为 nil）：

```
tts = usart.NewDriver(usart.USART1, d.Channel(2, 0), nil, nil)
```

我们使用它的 `WriteString` 方法来打印这句名言。让我们清理所有内容并编译该程序：

```
$ cd $HOME/emgo
$ ./clean.sh
$ cd $HOME/firstemgo
$ egc
$ arm-none-eabi-size cortexm0.elf
  text       data        bss        dec        hex    filename
  12728        236        176      13140       3354    cortexm0.elf
```

要查看某些内容，你需要在 PC 中使用 UART 外设。

**请勿使用 RS232 端口或 USB 转 RS232 转换器！**

STM32 系列使用 3.3V 逻辑，但是 RS232 可以产生 -15 V ~ +15 V 的电压，这可能会损坏你的 MCU。你需要使用 3.3V 逻辑的 USB 转 UART 转换器。流行的转换器基于 FT232 或 CP2102 芯片。

![UART](https://ziutek.github.io/images/mcu/f030-demo-board/uart.jpg)

你还需要一些终端仿真程序（我更喜欢 [picocom][9]）。刷新新图像，运行终端仿真器，然后按几次复位按钮：

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
xPSR: 0xc1000000 pc: 0x080016f4 msp: 0x20000a20
adapter speed: 4000 kHz
** Programming Started **
auto erase enabled
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x2000003a msp: 0x20000a20
wrote 13312 bytes from file cortexm0.elf in 1.020185s (12.743 KiB/s)
** Programming Finished **
adapter speed: 950 kHz
$
$ picocom -b 115200 /dev/ttyUSB0
picocom v3.1

port is        : /dev/ttyUSB0
flowcontrol    : none
baudrate is    : 115200
parity is      : none
databits are   : 8
stopbits are   : 1
escape is      : C-a
local echo is  : no
noinit is      : no
noreset is     : no
hangup is      : no
nolock is      : no
send_cmd is    : sz -vv
receive_cmd is : rz -vv -E
imap is        :
omap is        :
emap is        : crcrlf,delbs,
logfile is     : none
initstring     : none
exit_after is  : not set
exit is        : no

Type [C-a] [C-h] to see available commands
Terminal ready
Hello, World!
Hello, World!
Hello, World!
```

每次按下复位按钮都会产生新的 “Hello，World！”行。一切都在按预期进行。

要查看此 MCU 的 <ruby>双向<rt>bi-directional</rt></ruby> UART 代码，请查看 [此示例][10]。

### io.Writer 接口

`io.Writer` 接口可能是 Go 中第二种最常用的接口类型，仅次于 `error` 接口。其定义如下所示：

```
type Writer interface {
    Write(p []byte) (n int, err error)
}
```

`usart.Driver` 实现了 `io.Writer`，因此我们可以替换：

```
tts.WriteString("Hello, World!\r\n")
```

为

```
io.WriteString(tts, "Hello, World!\r\n")
```

此外，你需要将 `io` 包添加到 `import` 部分。

`io.WriteString` 函数的声明如下所示：

```
func WriteString(w Writer, s string) (n int, err error)
```

如你所见，`io.WriteString` 允许使用实现了 `io.Writer` 接口的任何类型来编写字符串。在内部，它检查基础类型是否具有 `WriteString` 方法，并使用该方法代替 `Write`（如果可用）。

让我们编译修改后的程序：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  15456     320     248   16024    3e98 cortexm0.elf
```

如你所见，`io.WriteString` 导致二进制文件的大小显着增加：15776-12964 = 2812 字节。 Flash 上没有太多空间了。是什么引起了这么大规模的增长？

使用这个命令：

```
arm-none-eabi-nm --print-size --size-sort --radix=d cortexm0.elf
```

我们可以打印两种情况下按其大小排序的所有符号。通过过滤和分析获得的数据（`awk`，`diff`），我们可以找到大约 80 个新符号。最大的十个如下所示：

```
> 00000062 T stm32$hal$usart$Driver$DisableRx
> 00000072 T stm32$hal$usart$Driver$RxDMAISR
> 00000076 T internal$Type$Implements
> 00000080 T stm32$hal$usart$Driver$EnableRx
> 00000084 t errors$New
> 00000096 R $8$stm32$hal$usart$Driver$$
> 00000100 T stm32$hal$usart$Error$Error
> 00000360 T io$WriteString
> 00000660 T stm32$hal$usart$Driver$Read
```

因此，即使我们不使用 `usart.Driver.Read` 方法，但它被编译进来了，与 `DisableRx`、`RxDMAISR`、`EnableRx` 以及上面未提及的其他方法一样。不幸的是，如果你为接口赋值了一些内容，就需要它的完整方法集（包含所有依赖项）。对于使用大多数方法的大型程序来说，这不是问题。但是对于我们这种极简的情况而言，这是一个巨大的负担。

我们已经接近 MCU 的极限，但让我们尝试打印一些数字（你需要在 `import` 部分中用 `strconv` 替换 `io` 包）：

```
func main() {
    a := 12
    b := -123

    tts.WriteString("a = ")
    strconv.WriteInt(tts, a, 10, 0, 0)
    tts.WriteString("\r\n")
    tts.WriteString("b = ")
    strconv.WriteInt(tts, b, 10, 0, 0)
    tts.WriteString("\r\n")

    tts.WriteString("hex(a) = ")
    strconv.WriteInt(tts, a, 16, 0, 0)
    tts.WriteString("\r\n")
    tts.WriteString("hex(b) = ")
    strconv.WriteInt(tts, b, 16, 0, 0)
    tts.WriteString("\r\n")
}
```

与使用 `io.WriteString` 函数的情况一样，`strconv.WriteInt` 的第一个参数的类型为 `io.Writer`。

```
$ egc
/usr/local/arm/bin/arm-none-eabi-ld: /home/michal/firstemgo/cortexm0.elf section `.rodata' will not fit in region `Flash'
/usr/local/arm/bin/arm-none-eabi-ld: region `Flash' overflowed by 692 bytes
exit status 1
```

这一次我们的空间超出的不多。让我们试着精简一下有关类型的信息：

```
$ cd $HOME/emgo
$ ./clean.sh
$ cd $HOME/firstemgo
$ egc -nf -nt
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  15876     316     320   16512    4080 cortexm0.elf
```

很接近，但很合适。让我们加载并运行此代码：

```
a = 12
b = -123
hex(a) = c
hex(b) = -7b
```

Emgo 中的 `strconv` 包与 Go 中的原型有很大的不同。它旨在直接用于写入格式化的数字，并且在许多情况下可以替换沉重的 `fmt` 包。 这就是为什么函数名称以 `Write` 而不是 `Format` 开头，并具有额外的两个参数的原因。 以下是其用法示例：

```
func main() {
    b := -123
    strconv.WriteInt(tts, b, 10, 0, 0)
    tts.WriteString("\r\n")
    strconv.WriteInt(tts, b, 10, 6, ' ')
    tts.WriteString("\r\n")
    strconv.WriteInt(tts, b, 10, 6, '0')
    tts.WriteString("\r\n")
    strconv.WriteInt(tts, b, 10, 6, '.')
    tts.WriteString("\r\n")
    strconv.WriteInt(tts, b, 10, -6, ' ')
    tts.WriteString("\r\n")
    strconv.WriteInt(tts, b, 10, -6, '0')
    tts.WriteString("\r\n")
    strconv.WriteInt(tts, b, 10, -6, '.')
    tts.WriteString("\r\n")
}
```

下面是它的输出：

```
-123
  -123
-00123
..-123
-123
-123
-123..
```

### Unix 流 和 <ruby>莫尔斯电码<rt>Morse code</rt></ruby>

由于大多数写入的函数都使用 `io.Writer` 而不是具体类型（例如 C 中的 `FILE` ），因此我们获得了类似于 Unix <ruby>流<rt>stream</rt></ruby> 的功能。在 Unix 中，我们可以轻松地组合简单的命令来执行更大的任务。例如，我们可以通过以下方式将文本写入文件：

```
echo "Hello, World!" > file.txt
```

`>` 操作符将前面命令的输出流写入文件。还有 `|` 操作符，用于连接相邻命令的输出流和输入流。

多亏了流，我们可以轻松地转换/过滤任何命令的输出。例如，要将所有字母转换为大写，我们可以通过 `tr` 命令过滤 `echo` 的输出：

```
echo "Hello, World!" | tr a-z A-Z > file.txt
```

为了显示 `io.Writer` 和 Unix 流之间的类比，让我们编写以下代码：

```
io.WriteString(tts, "Hello, World!\r\n")
```

采用以下伪 unix 形式：

```
io.WriteString "Hello, World!" | usart.Driver usart.USART1
```

下一个示例将显示如何执行此操作：

```
io.WriteString "Hello, World!" | MorseWriter | usart.Driver usart.USART1
```

让我们来创建一个简单的编码器，它使用莫尔斯电码对写入的文本进行编码：

```
type MorseWriter struct {
    W io.Writer
}

func (w *MorseWriter) Write(s []byte) (int, error) {
    var buf [8]byte
    for n, c := range s {
        switch {
        case c == '\n':
            c = ' ' // Replace new lines with spaces.
        case 'a' <= c && c <= 'z':
            c -= 'a' - 'A' // Convert to upper case.
        }
        if c < ' ' || 'Z' < c {
            continue // c is outside ASCII [' ', 'Z']
        }
        var symbol morseSymbol
        if c == ' ' {
            symbol.length = 1
            buf[0] = ' '
        } else {
            symbol = morseSymbols[c-'!']
            for i := uint(0); i < uint(symbol.length); i++ {
                if (symbol.code>>i)&1 != 0 {
                    buf[i] = '-'
                } else {
                    buf[i] = '.'
                }
            }
        }
        buf[symbol.length] = ' '
        if _, err := w.W.Write(buf[:symbol.length+1]); err != nil {
            return n, err
        }
    }
    return len(s), nil
}

type morseSymbol struct {
    code, length byte
}

//emgo:const
var morseSymbols = [...]morseSymbol{
    {1<<0 | 1<<1 | 1<<2, 4}, // ! ---.
    {1<<1 | 1<<4, 6},        // " .-..-.
    {},                      // #
    {1<<3 | 1<<6, 7},        // $ ...-..-

    // Some code omitted...

    {1<<0 | 1<<3, 4},        // X -..-
    {1<<0 | 1<<2 | 1<<3, 4}, // Y -.--
    {1<<0 | 1<<1, 4},        // Z --..
}
```

你可以在 [这里][11] 找到完整的 `morseSymbols` 数组。 `//emgo:const` 指令确保 `morseSymbols` 数组不会被复制到 RAM 中。

现在我们可以通过两种方式打印句子：

```
func main() {
    s := "Hello, World!\r\n"
    mw := &MorseWriter{tts}

    io.WriteString(tts, s)
    io.WriteString(mw, s)
}
```

我们使用指向 `MorseWriter` `&MorseWriter{tts}` 的指针而不是简单的 `MorseWriter{tts}` 值，因为 `MorseWriter` 太大，不适合接口变量。

与 Go 不同，Emgo 不会为存储在接口变量中的值动态分配内存。接口类型的大小受限制，相当于三个指针（适合 `slice` ）或两个 `float64`（适合 `complex128`）的大小，以较大者为准。它可以直接存储所有基本类型和小型 “结构体/数组” 的值，但是对于较大的值，你必须使用指针。

让我们编译此代码并查看其输出：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  15152     324     248   15724    3d6c cortexm0.elf
```

```
Hello, World!
.... . .-.. .-.. --- --..--   .-- --- .-. .-.. -.. ---.
```

### 终极闪烁

Blinky 是等效于 “Hello，World！” 程序的硬件。一旦有了摩尔斯编码器，我们就可以轻松地将两者结合起来以获得终极闪烁程序：

```
package main

import (
    "delay"
    "io"

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

    cfg := gpio.Config{Mode: gpio.Out, Driver: gpio.OpenDrain, Speed: gpio.Low}
    led.Setup(&cfg)
}

type Telegraph struct {
    Pin   gpio.Pin
    Dotms int // Dot length [ms]
}

func (t Telegraph) Write(s []byte) (int, error) {
    for _, c := range s {
        switch c {
        case '.':
            t.Pin.Clear()
            delay.Millisec(t.Dotms)
            t.Pin.Set()
            delay.Millisec(t.Dotms)
        case '-':
            t.Pin.Clear()
            delay.Millisec(3 * t.Dotms)
            t.Pin.Set()
            delay.Millisec(t.Dotms)
        case ' ':
            delay.Millisec(3 * t.Dotms)
        }
    }
    return len(s), nil
}

func main() {
    telegraph := &MorseWriter{Telegraph{led, 100}}
    for {
        io.WriteString(telegraph, "Hello, World! ")
    }
}

// Some code omitted...

```

在上面的示例中，我省略了 `MorseWriter` 类型的定义，因为它已在前面展示过。完整版可通过 [这里][12] 获取。让我们编译它并运行：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  11772     244     244   12260    2fe4 cortexm0.elf
```

![Ultimate Blinky](https://ziutek.github.io/images/mcu/f030-demo-board/morse.png)

### 反射

是的，Emgo 支持 [反射][13]。`reflect` 包尚未完成，但是已完成的部分足以实现 `fmt.Print` 函数族了。来看看我们可以在小型 MCU 上做什么。

为了减少内存使用，我们将使用 <ruby>[半主机][14]<rt>semihosting</rt></ruby> 作为标准输出。为了方便起见，我们还编写了简单的 `println` 函数，它在某种程度上类似于 `fmt.Println`。

```
package main

import (
    "debug/semihosting"
    "reflect"
    "strconv"

    "stm32/hal/system"
    "stm32/hal/system/timer/systick"
)

var stdout semihosting.File

func init() {
    system.SetupPLL(8, 1, 48/8)
    systick.Setup(2e6)

    var err error
    stdout, err = semihosting.OpenFile(":tt", semihosting.W)
    for err != nil {
    }
}

type stringer interface {
    String() string
}

func println(args ...interface{}) {
    for i, a := range args {
        if i > 0 {
            stdout.WriteString(" ")
        }
        switch v := a.(type) {
        case string:
            stdout.WriteString(v)
        case int:
            strconv.WriteInt(stdout, v, 10, 0, 0)
        case bool:
            strconv.WriteBool(stdout, v, 't', 0, 0)
        case stringer:
            stdout.WriteString(v.String())
        default:
            stdout.WriteString("%unknown")
        }
    }
    stdout.WriteString("\r\n")
}

type S struct {
    A int
    B bool
}

func main() {
    p := &S{-123, true}

    v := reflect.ValueOf(p)

    println("kind(p) =", v.Kind())
    println("kind(*p) =", v.Elem().Kind())
    println("type(*p) =", v.Elem().Type())

    v = v.Elem()

    println("*p = {")
    for i := 0; i < v.NumField(); i++ {
        ft := v.Type().Field(i)
        fv := v.Field(i)
        println("  ", ft.Name(), ":", fv.Interface())
    }
    println("}")
}

```

`semihosting.OpenFile` 函数允许在主机端打开/创建文件。特殊路径 `:tt` 对应于主机的标准输出。

`println` 函数接受任意数量的参数，每个参数的类型都是任意的：

```
func println(args ...interface{})
```

可能是因为任何类型都实现了空接口 `interface{}`。 `println` 使用 [类型开关][15] 打印字符串，整数和布尔值：

```
switch v := a.(type) {
case string:
    stdout.WriteString(v)
case int:
    strconv.WriteInt(stdout, v, 10, 0, 0)
case bool:
    strconv.WriteBool(stdout, v, 't', 0, 0)
case stringer:
    stdout.WriteString(v.String())
default:
    stdout.WriteString("%unknown")
}
```

此外，它还支持任何实现了 `stringer` 接口的类型，即任何具有 `String()` 方法的类型。在任何 `case` 子句中，`v` 变量具有正确的类型，与 `case` 关键字后列出的类型相同。

`reflect.ValueOf(p)` 函数通过允许以编程的方式分析其类型和内容的形式返回 `p`。如你所见，我们甚至可以使用 `v.Elem()` 取消引用指针，并打印所有结构体及其名称。

让我们尝试编译这段代码。现在让我们看看如果编译时没有类型和字段名，会有什么结果：

```
$ egc -nt -nf
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  16028     216     312   16556    40ac cortexm0.elf
```

闪存上只剩下 140 个可用字节。让我们使用启用了半主机的 OpenOCD 加载它：

```
$ openocd -d0 -f interface/stlink.cfg -f target/stm32f0x.cfg -c 'init; program cortexm0.elf; arm semihosting enable; reset run'
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
xPSR: 0xc1000000 pc: 0x08002338 msp: 0x20000a20
adapter speed: 4000 kHz
** Programming Started **
auto erase enabled
target halted due to breakpoint, current mode: Thread
xPSR: 0x61000000 pc: 0x2000003a msp: 0x20000a20
wrote 16384 bytes from file cortexm0.elf in 0.700133s (22.853 KiB/s)
** Programming Finished **
semihosting is enabled
adapter speed: 950 kHz
kind(p) = ptr
kind(*p) = struct
type(*p) =
*p = {
   X. : -123
   X. : true
}
```

如果你实际运行此代码，则会注意到半主机运行缓慢，尤其是在逐字节写入时（缓冲很有用）。

如你所见，`*p` 没有类型名称，并且所有结构字段都具有相同的 `X.` 名称。让我们再次编译该程序，这次不带 `-nt -nf` 选项：

```
$ egc
$ arm-none-eabi-size cortexm0.elf
   text    data     bss     dec     hex filename
  16052     216     312   16580    40c4 cortexm0.elf
```

现在已经包括了类型和字段名称，但仅在 ~~_main.go_ 文件中~~ `main` 包中定义了它们。该程序的输出如下所示：

```
kind(p) = ptr
kind(*p) = struct
type(*p) = S
*p = {
   A : -123
   B : true
}
```

反射是任何易于使用的序列化库的关键部分，而像 [JSON][16] 这样的序列化 ~~算法~~ 在<ruby>物联网<rt>IoT</rt></ruby>时代也越来越重要。

这些就是我完成的本文的第二部分。我认为有机会进行第三部分，更具娱乐性的部分，在那里我们将各种有趣的设备连接到这块板上。如果这块板装不下，我们就换一块大一点的。

--------------------------------------------------------------------------------

via: https://ziutek.github.io/2018/04/14/go_on_very_small_hardware2.html

作者：[Michał Derkacz][a]
译者：[gxlct008](https://github.com/gxlct008)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://ziutek.github.io/
[1]:https://ziutek.github.io/2018/04/14/go_on_very_small_hardware2.html
[2]:https://linux.cn/article-11383-1.html
[3]:https://golang.org/doc/effective_go.html#interfaces
[4]:https://research.swtch.com/interfaces
[5]:https://blog.golang.org/laws-of-reflection
[6]:https://github.com/texane/stlink
[7]:http://www.world-semi.com/solution/list-4-1.html
[8]:https://en.wikipedia.org/wiki/1-Wire
[9]:https://github.com/npat-efault/picocom
[10]:https://github.com/ziutek/emgo/blob/master/egpath/src/stm32/examples/f030-demo-board/usart/main.go
[11]:https://github.com/ziutek/emgo/blob/master/egpath/src/stm32/examples/f030-demo-board/morseuart/main.go
[12]:https://github.com/ziutek/emgo/blob/master/egpath/src/stm32/examples/f030-demo-board/morseled/main.go
[13]:https://blog.golang.org/laws-of-reflection
[14]:http://infocenter.arm.com/help/topic/com.arm.doc.dui0471g/Bgbjjgij.html
[15]:https://golang.org/doc/effective_go.html#type_switch
[16]:https://en.wikipedia.org/wiki/JSON
