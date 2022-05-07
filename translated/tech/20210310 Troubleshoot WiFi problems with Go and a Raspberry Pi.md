[#]: subject: "Troubleshoot WiFi problems with Go and a Raspberry Pi"
[#]: via: "https://opensource.com/article/21/3/troubleshoot-wifi-go-raspberry-pi"
[#]: author: "Chris Collins https://opensource.com/users/clcollins"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "turbokernel"
[#]: publisher: " "
[#]: url: " "

使用 Go 和树莓派排查 WiFi 问题
======
实现一个 WiFi 扫描器玩玩～

![在在门廊上喝茶][1]
（图源：opensource.com）

去年夏天，我和妻子变卖了家产，带着我们的两只狗移居了夏威夷。这里有美丽的阳光、温暖的沙滩、凉爽的冲浪等你能想到的一切。我们同样遇到了一些意料之外的事：WiFi 问题。

不过，这不是夏威夷的问题，而是我们租住公寓的问题。我们住在一个单身公寓里，与房东的公寓仅一墙之隔。我们的租房协议中包含了免费的网络连接！好耶！只不过，它是由房东的公寓里的 WiFi 提供的，哇哦……

说实话，它的效果还不错……吗？好吧，我承认它不尽如人意，并且不知道是哪里的问题。路由器明明就在墙的另一边，但我们的信号就是很不稳定，经常会自动断开连接。在家的时候，我们的 WiFi 路由器的信号能够穿过层层墙壁和地板。事实上，它所覆盖的区域比我们居住的 600 平方英尺（大约 55 平方米）的公寓还要大。

在这种情况下，一个优秀的技术人员会怎么做呢？既然想知道为什么，当然是开始排查咯！

幸运的是，我们在搬家之前并没有变卖掉树莓派 Zero W。它是如此小巧便携! 我当然就把它一起带来了。我有一个机智的想法：通过树莓派和它内置的 WiFi 适配器，使用 Go 语言编写一个小程序来测量并显示从路由器收到的 WiFi 信号。我打算先简单快速地把它实现出来，以后再去考虑优化。烦死了！我现在只想知道这个 WiFi 是怎么回事！

谷歌搜索了一番后，我发现了一个相对有用的 Go 依赖包 [mdlayher/wifi][2]，它专门用于 WiFi 相关操作，听起来很有希望！

### 获取 WiFi 接口的信息

我计划遍历 WiFi 接口的统计数据并返回信号强度，所以我需要先找到设备上的接口。幸运的是，mdlayher/wifi 包有一个查询它们的方法，所以我可以创建一个 `main.go` 来实现它，具体代码如下：

```go
package main

import (
    "fmt"
    "github.com/mdlayher/wifi"
)

func main() {
    c, err := wifi.New()
    defer c.Close()

    if err != nil {
        panic(err)
    }

    interfaces, err := c.Interfaces()

    for _, x := range interfaces {
        fmt.Printf("%+v\n", x)
    }
}
```

让我们来看看上面的代码都做了什么吧！首先是导入依赖包，导入后，我就可以使用 mdlayher/wifi 模块就在 main 函数中创建一个新的客户端（类型为 `*Client`）。接下来，只需要调用这个新的客户端（变量名为 `c`）的 `c.Interfaces()` 方法就可以获得系统中的接口列表。接着，我就可以遍历包含接口指针的切片（变长数组），然后打印出它们的具体信息。

注意到 `%+v` 中有一个 “+” 了吗？它意味着程序会详细输出 `*Interface` 结构体中的属性名，这将有助于我标识出我看到的东西，而不用去查阅文档。

运行上面的代码后，我得到了机器上的 WiFi 接口列表：

```
&{Index:0 Name: HardwareAddr:5c:5f:67:f3:0a:a7 PHY:0 Device:3 Type:P2P device Frequency:0}
&{Index:3 Name:wlp2s0 HardwareAddr:5c:5f:67:f3:0a:a7 PHY:0 Device:1 Type:station Frequency:2412}
```

注意，两行输出中的 MAC 地址(`HardwareAddr`) 是相同的，这意味着它们是同一个物理硬件。你也可以通过 `PHY: 0` 来确认。查阅 Go 的 [wifi 模块文档][3]，`PHY` 指的就是接口所属的物理设备。

第一个接口没有名字，类型是 `TYPE: P2P`。第二个接口名为 `wpl2s0`，类型是 `TYPE: Station`。Go 的 wifi 模块文档列出了 [不同类型的接口][4]，以及他们的用途。根据文档，“<ruby>P2P<rt>点对点传输</rt></ruby>” 类型表示“该接口属于点对点客户端网络中的一个设备”。我认为这个接口的用途是 [WiFi 直连][5] ，这是一个允许两个 WiFi 设备在没有中间接入点的情况下直接连接的标准。

“<ruby>Station<rt>基站</rt></ruby>” 类型表示“该接口是具有<ruby>控制接入点<rt>controlling access point</rt></ruby>的客户端设备管理的<ruby>基本服务集（BSS）<rt>basic service set</rt></ruby>的一部分”。这是大众熟悉的无线设备标准功能，也作为一个客户端来连接到网络接入点。这是测试 WiFi 质量的重要接口。

### 利用接口获取基站信息

利用该信息，我可以修改遍历接口的代码来获取所需信息：

```go
for _, x := range interfaces {
    if x.Type == wifi.InterfaceTypeStation {
        // c.StationInfo(x) returns a slice of all
        // the staton information about the interface
        info, err := c.StationInfo(x)
        if err != nil {
            fmt.Printf("Station err: %s\n", err)
        }
        for _, x := range info {
            fmt.Printf("%+v\n", x)
        }
    }
}
```

首先，这段程序检查了 `x.Type`（接口类型）是否为 `wifi.InterfaceTypeStation`，它是一个基站接口（也是本练习中唯一涉及到的类型）。不幸的是，这个接口“类型”和 Golang 中的“类型”存在命名冲突。事实上，我在这里使用了一个叫做 `interfaceType` 的 Go 类型来代表接口类型。呼，我花了一分钟才弄明白！

然后，假设接口的类型符合预期，我们就可以调用 `c.StationInfo(x)` 来检索基站信息，`StationInfo()` 方法可以获取到关于这个接口 `x` 的信息。

这将返回一个包含 `*StationInfo` 指针的切片。我不大确定这里为什么要用切片，或许是因为接口可能返回多个 `StationInfo`？不管怎么样，我都可以遍历这个切片，然后使用之前提到的 `+%v` 技巧格式化打印出 `StationInfo` 结构的属性名和属性值。

运行上面的程序后，我得到了下面的输出：

```
&{HardwareAddr:70:5a:9e:71:2e:d4 Connected:17m10s Inactive:1.579s ReceivedBytes:2458563 TransmittedBytes:1295562 ReceivedPackets:6355 TransmittedPackets:6135 ReceiveBitrate:2000000 TransmitBitrate:43300000 Signal:-79 TransmitRetries:2306 TransmitFailed:4 BeaconLoss:2}
```

我感兴趣的是“<ruby>信号<rt>Signal</rt></ruby>”部分，可能还有“<ruby>传输失败<rt>TransmitFailed</rt></ruby>”和“<ruby>信标丢失<rt>BeaconLoss</rt></ruby>”部分。信号强度是以 dBm（全称 <ruby>decibel-milliwatts<rt>分贝-毫瓦</rt><ruby>）为单位来报告的。

#### 简短科普：如何读懂 WiFi dBm

根据 [MetaGeek][6] 的说法：

* -30 最佳，但它既不现实也没有必要
* -67 非常好，它适用于需要可靠数据包传输的应用，例如流媒体
* -70 还不错，它是实现可靠数据包传输的底线，适用于电子邮件和网页浏览
* -80 很差，只能保持绝对的基本连接，不可靠的数据包传输
* -90 不可用，接近“<ruby>噪音底线<rt>noise floor</rt></ruby>”

*注意：dBm 是对数尺度，-60 比 -30 要低 1000 倍。*

### 使它成为一个真的“扫描器”

所以，看着上面输出显示的我的信号：-79。哇哦，感觉不大好呢。不过单看这个结果并没有太大帮助，它只能提供某个时间点的参考，只对 WiFi 网络适配器在特定物理空间的某一瞬间有效。一个连续的读数会更有用，借助于它，我们观察到信号随着树莓派的移动而变化。我可以再次修改主函数来实现这一点。

```go
var i *wifi.Interface

for _, x := range interfaces {
    if x.Type == wifi.InterfaceTypeStation {
        // Loop through the interfaces, and assign the station
        // to var x
        // We could hardcode the station by name, or index,
        // or hardwareaddr, but this is more portable, if less efficient
        i = x
        break
    }
}

for {
    // c.StationInfo(x) returns a slice of all
    // the staton information about the interface
    info, err := c.StationInfo(i)
    if err != nil {
        fmt.Printf("Station err: %s\n", err)
    }

    for _, x := range info {
        fmt.Printf("Signal: %d\n", x.Signal)
    }

    time.Sleep(time.Second)
}
```

首先，我命名了一个 `wifi.Interface` 类型的变量 `i`。因为它在循环的范围外，所以我可以用它来存储接口信息。循环内创建的任何变量在该循环的范围外都是不可访问的。

然后，我可以把这个循环一分为二。第一个遍历了 `c.Interfaces()` 返回的接口切片，如果元素是一个 `Station` 类型，它就将其存储在先前创建的变量 `i`中，并跳出循环。

第二个循环是一个死循环，它将不断地运行，直到我按下 **Ctrl** + **C** 来结束程序。和之前一样，这个循环内部获取接口信息、检索基站信息，并打印出信号信息。然后它会休眠一秒钟，再次运行，反复打印信号信息，直到我退出为止。

运行上面的程序后，我得到了下面的输出：

```
[chris@marvin wifi-monitor]$ go run main.go
Signal: -81
Signal: -81
Signal: -79
Signal: -81
```

哇哦，感觉不妙。

### 绘制公寓信号分布图

不管怎么说，知道这些信息总比不知道要好。让树莓派连接上显示器或者电子墨水屏，并接上电源，我就可以让它在公寓里移动，并绘制出信号死角的位置。

剧透一下：由于房东的接入点在隔壁的公寓里，对我来说最大的死角是公寓厨房的冰箱那里发射出的一个圆锥体形状区域......这个冰箱与房东的公寓共用一堵墙！

我想如果用《龙与地下城》里的黑话来说，它就是一个“<ruby>沉默之锥<rt>Cone of Silence</rt></ruby>”。或者至少是一个“<ruby>糟糕的网络连接之锥<rt>Cone of Poor Internet</rt></ruby>”。

总之，这段代码可以直接在树莓派上运行 `go build -o wifi_scanner` 来编译，得到的二进制文件 `wifi_scanner` 可以与任何其他 ARM 设备（同一版本）共享。另外，它也可以在常规系统上用正确的 ARM 设备库进行编译。

祝你扫描愉快！希望你的 WiFi 路由器不在你的冰箱后面！你可以在 [我的 GitHub repo][7] 中找到这个项目所用的代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/troubleshoot-wifi-go-raspberry-pi

作者：[Chris Collins][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_selfcare_wfh_porch_520.png
[2]: https://github.com/mdlayher/wifi
[3]: https://godoc.org/github.com/mdlayher/wifi#Interface
[4]: https://godoc.org/github.com/mdlayher/wifi#InterfaceType
[5]: https://en.wikipedia.org/wiki/Wi-Fi_Direct
[6]: https://www.metageek.com/training/resources/wifi-signal-strength-basics.html
[7]: https://github.com/clcollins/goPiWiFi
