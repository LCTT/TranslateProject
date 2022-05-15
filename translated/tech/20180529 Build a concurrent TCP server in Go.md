[#]: subject: "Build a concurrent TCP server in Go"
[#]: via: "https://opensource.com/article/18/5/building-concurrent-tcp-server-go"
[#]: author: "Mihalis Tsoukalos https://opensource.com/users/mtsouk"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Go 中实现一个支持并发的 TCP 服务端
======
仅用大约 65 行代码，开发一个用于生成随机数、支持并发的 TCP 服务端。

![土拨鼠插图][1]
（图源：Renee French, CC BY 3.0）

TCP 和 UDP 服务端随处可见，它们基于 TCP/IP 协议栈，通过网络为客户端提供服务。在这篇文章中，我将介绍如何使用 [Go 语言][2] 开发一个用于返回随机数、支持并发的 TCP 服务端。对于每一个来自 TCP 客户端的连接，它都会启动一个新的 goroutine（轻量级线程）来处理相应的请求。

你可以在 GitHub 上找到本项目的源码：[concTcp.go][3]。

### 处理 TCP 连接

这个程序的主要逻辑在 `handleConnection()` 函数中，具体实现如下：

```go
func handleConnection(c net.Conn) {
        fmt.Printf("Serving %s\n", c.RemoteAddr().String())
        for {
                netData, err := bufio.NewReader(c).ReadString('\n')
                if err != nil {
                        fmt.Println(err)
                        return
                }

                temp := strings.TrimSpace(string(netData))
                if temp == "STOP" {
                        break
                }

                result := strconv.Itoa(random()) + "\n"
                c.Write([]byte(string(result)))
        }
        c.Close()
}
```

如果 TCP 客户端发送了一个“STOP”字符串，为它提供服务的 goroutine 就会终止；否则，TCP 服务端就会返回一个随机数给它。只要客户端不主动终止，服务端就会一直提供服务，这是由 `for` 循环保证的。具体来说，`for` 循环中的代码使用了 `bufio.NewReader(c).ReadString('\n')` 来逐行读取客户端发来的数据，并使用 `c.Write([]byte(string(result)))` 来返回数据（生成的随机数）。你可以在 Go 的 net 标准包 [文档][4] 中了解更多。


### 支持并发

在 `main()` 函数的实现部分，每当 TCP 服务端收到 TCP 客户端的连接请求，它都会启动一个新的 goroutine 来为这个请求提供服务。

```go
func main() {
        arguments := os.Args
        if len(arguments) == 1 {
                fmt.Println("Please provide a port number!")
                return
        }

        PORT := ":" + arguments[1]
        l, err := net.Listen("tcp4", PORT)
        if err != nil {
                fmt.Println(err)
                return
        }
        defer l.Close()
        rand.Seed(time.Now().Unix())

        for {
                c, err := l.Accept()
                if err != nil {
                        fmt.Println(err)
                        return
                }
                go handleConnection(c)
        }
}
```

首先，`main()` 确保程序至少有一个命令行参数。注意，现有代码并没有检查这个参数是否为有效的 TCP 端口号。不过，如果它是一个无效的 TCP 端口号，`net.Listen()` 就会调用失败，并返回一个错误信息，类似下面这样：

```
$ go run concTCP.go 12a
listen tcp4: lookup tcp4/12a: nodename nor servname provided, or not known
$ go run concTCP.go -10
listen tcp4: address -10: invalid port
```

`net.Listen()` 函数用于告诉 Go 接受网络连接，因而承担了服务端的角色。它的返回值类型是 `net.Conn`，后者实现了 `io.Reader` 和 `io.Writer` 接口。此外，`main()` 函数中还调用了 `rand.Seed()` 函数，用于初始化随机数生成器。最后，`for` 循环允许程序一直使用 `Accept()` 函数来接受 TCP 客户端的连接请求，并以 goroutine 的方式来运行 `handleConnection(c)` 函数，处理客户端的后续请求。

### net.Listen() 的第一个参数

`net.Listen()` 函数的第一个参数定义了使用的网络类型，而第二个参数定义了服务端监听的地址和端口号。第一个参数的有效值为 `tcp`、`tcp4`、`tcp6`、`udp`、`udp4`、`udp6`、`ip`、`ip4`、`ip6`、`Unix`（Unix 套接字）、`Unixgram` 和 `Unixpacket`，其中：`tcp4`、`udp4` 和 `ip4` 只接受 IPv4 地址，而 `tcp6`、`udp6` 和 `ip6` 只接受 IPv6 地址。

### 服务端并发测试

`concTCP.go` 需要一个命令行参数，来指定监听的端口号。当它开始服务 TCP 客户端时，你会得到类似下面的输出：

```
$ go run concTCP.go 8001
Serving 127.0.0.1:62554
Serving 127.0.0.1:62556
```

`netstat` 的输出可以确认 `congTCP.go` 正在为多个 TCP 客户端提供服务，并且仍在继续监听建立连接的请求：

```
$ netstat -anp TCP | grep 8001
tcp4       0      0  127.0.0.1.8001         127.0.0.1.62556        ESTABLISHED
tcp4       0      0  127.0.0.1.62556        127.0.0.1.8001         ESTABLISHED
tcp4       0      0  127.0.0.1.8001         127.0.0.1.62554        ESTABLISHED
tcp4       0      0  127.0.0.1.62554        127.0.0.1.8001         ESTABLISHED
tcp4       0      0  *.8001                 *.*                    LISTEN
```

在上面输出中，最后一行显示了有一个进程正在监听 8001 端口，这意味着你可以继续连接 TCP 的 8001 端口。第一行和第二行显示了有一个已建立的 TCP 网络连接，它占用了 8001 和 62556 端口。相似地，第三行和第四行显示了有另一个已建立的 TCP 连接，它占用了 8001 和 62554 端口。

下面这张图片显示了 `concTCP.go` 在服务多个 TCP 客户端时的输出：

![concTCP.go TCP 服务端测试][5]

类似地，下面这张图片显示了两个 TCP 客户端的输出（使用了 `nc` 工具）：

![是用 nc 工具作为 concTCP.go 的 TCP 客户端][6]

你可以在 [维基百科][7] 上找到更多关于 `nc`（即 `netcat`）的信息。

### 总结

现在，你学会了如何用大约 65 行 Go 代码来开发一个生成随机数、支持并发的 TCP 服务端，这真是太棒了！如果你想要让你的 TCP 服务端执行别的任务，只需要修改 `handleConnection()` 函数即可。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/building-concurrent-tcp-server-go

作者：[Mihalis Tsoukalos][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mtsouk
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/go-golang.png
[2]: https://golang.org/
[3]: https://github.com/mactsouk/opensource.com
[4]: https://golang.org/pkg/net/
[5]: https://opensource.com/sites/default/files/uploads/tcp-in-go_server.png
[6]: https://opensource.com/sites/default/files/uploads/tcp-in-go_client.png
[7]: https://en.wikipedia.org/wiki/Netcat
