[#]: subject: "Build a concurrent TCP server in Go"
[#]: via: "https://opensource.com/article/18/5/building-concurrent-tcp-server-go"
[#]: author: "Mihalis Tsoukalos https://opensource.com/users/mtsouk"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Build a concurrent TCP server in Go
======
Develop a concurrent TCP server that generates random numbers using only about 65 lines of Go code.

![gopher illustrations][1]
(Image by: Renee French. CC BY 3.0)

TCP and UDP servers are everywhere serving network clients over TCP/IP networks. In this article, I will explain how to develop a concurrent TCP server, in the [Go programming language][2], that returns random numbers. For each incoming connection from a TCP client, the TCP server will start a new goroutine to handle that request.

You can find this project, [concTCP.go][3], on GitHub.

### Handling TCP connections

The logic of the program can be found in the Go code of the `handleConnection()` function, which is implemented as follows:

```
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

If the TCP client sends the "STOP" string, then the goroutine that serves that particular TCP client will terminate; otherwise, the TCP server will send a random number back to the TCP client. The `for` loop makes sure that the TCP client will be served for as long as the TCP client desires. The Go code in the `for` loop reads the data from the TCP client, line by line, using `bufio.NewReader(c).ReadString('\n')` and sends back data using `c.Write([]byte(string(result)))`. (You may find the net standard Go package [documentation][4] helpful.)

### Being concurrent

The implementation of the `main()` function tells the TCP server to start a new goroutine each time it has to serve a TCP client:

```
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

First, `main()` makes sure that the program has at least one command line argument. Notice that the existing code does not check whether the given command line argument is a valid TCP port number or not. However, if the given value is not a valid TCP port number, the call to `net.Listen()` will fail with an error message similar to the following:

```
$ go run concTCP.go 12a
listen tcp4: lookup tcp4/12a: nodename nor servname provided, or not known
$ go run concTCP.go -10
listen tcp4: address -10: invalid port
```

The `net.Listen()` call is used for telling a Go program to accept network connections and thus act as a server. The return value of `net.Listen()` is of the `net.Conn` type, which implements the `io.Reader` and `io.Writer` interfaces. The `main()` function also calls the `rand.Seed()` function in order to initialize the random number generator. Finally, the `for` loop allows the program to keep accepting new TCP clients using `Accept()` that will be handled by instances of the `handleConnection()` function, which are executed as goroutines.

### The first parameter of net.Listen()

The first parameter of the `net.Listen()` function defines the type of network that will be used, while the second parameter defines the server address as well as the port number the server will listen to. Valid values for the first parameter are tcp, tcp4 (IPv4-only), tcp6 (IPv6-only), udp, udp4 (IPv4- only), udp6 (IPv6-only), ip, ip4 (IPv4-only), ip6 (IPv6-only), Unix (Unix sockets), Unixgram, and Unixpacket.

### The concurrent TCP server in action

concTCP.go requires a single command line argument, which is the port number that it will listen to. The output you will get from concTCP.go when serving TCP clients will be similar to the following:

```
$ go run concTCP.go 8001
Serving 127.0.0.1:62554
Serving 127.0.0.1:62556
```

The output of the `netstat(1)` can verify that concTCP.go serves multiple TCP clients while listening for more connections:

```
$ netstat -anp TCP | grep 8001
tcp4       0      0  127.0.0.1.8001         127.0.0.1.62556        ESTABLISHED
tcp4       0      0  127.0.0.1.62556        127.0.0.1.8001         ESTABLISHED
tcp4       0      0  127.0.0.1.8001         127.0.0.1.62554        ESTABLISHED
tcp4       0      0  127.0.0.1.62554        127.0.0.1.8001         ESTABLISHED
tcp4       0      0  *.8001                 *.*                    LISTEN
```

The last line of the output of the preceding command informs us that there is a process that listens to port 8001, which means that you can still connect to TCP port 8001. The first two lines verify that there is an established TCP network connection that uses port numbers 8001 and 62556. Similarly, the third and fourth lines verify that there is another established TCP connection that uses port numbers 8001 and 62554.

This image shows the output of concTCP.go when serving multiple TCP clients:

![The concTCP.go TCP server in action][5]

Analogously, the following image shows the output from two TCP clients that are implemented using the `nc(1)` utility:

![Using the nc(1) utility as the TCP client to concTCP.go][6]

You can find more information about `nc(1)`, which is also called `netcat(1)`, [on Wikipedia][7].

### Summary

So, you have just learned how to develop a concurrent TCP server that generates random numbers using about 65 lines of Go code, which is pretty impressive! If you want your TCP server to perform a different job, just change the implementation of the `handleConnection()` function.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/building-concurrent-tcp-server-go

作者：[Mihalis Tsoukalos][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
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
