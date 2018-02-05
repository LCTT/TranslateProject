并发服务器（一）：简介
============================================================

这是关于并发网络服务器编程的第一篇教程。我计划测试几个主流的、可以同时处理多个客户端请求的服务器并发模型，基于可扩展性和易实现性对这些模型进行评判。所有的服务器都会监听套接字连接，并且实现一些简单的协议用于与客户端进行通讯。

该系列的所有文章：

*   [第一节 - 简介][7]
*   [第二节 - 线程][8]
*   [第三节 - 事件驱动][9]

### 协议

该系列教程所用的协议都非常简单，但足以展示并发服务器设计的许多有趣层面。而且这个协议是 _有状态的_ —— 服务器根据客户端发送的数据改变内部状态，然后根据内部状态产生相应的行为。并非所有的协议都是有状态的 —— 实际上，基于 HTTP 的许多协议是无状态的，但是有状态的协议也是很常见，值得认真讨论。

在服务器端看来，这个协议的视图是这样的：

![](https://raw.githubusercontent.com/LCTT/wiki-images/master/TranslateProject/ref_img/005.png)

总之：服务器等待新客户端的连接；当一个客户端连接的时候，服务器会向该客户端发送一个 `*` 字符，进入“等待消息”的状态。在该状态下，服务器会忽略客户端发送的所有字符，除非它看到了一个 `^` 字符，这表示一个新消息的开始。这个时候服务器就会转变为“正在通信”的状态，这时它会向客户端回送数据，把收到的所有字符的每个字节加 1 回送给客户端^注1 。当客户端发送了 `$` 字符，服务器就会退回到等待新消息的状态。`^` 和 `$` 字符仅仅用于分隔消息 —— 它们不会被服务器回送。

每个状态之后都有个隐藏的箭头指向 “等待客户端” 状态，用来客户端断开连接。因此，客户端要表示“我已经结束”的方法很简单，关掉它那一端的连接就好。

显然，这个协议是真实协议的简化版，真实使用的协议一般包含复杂的报文头、转义字符序列（例如让消息体中可以出现 `$` 符号），额外的状态变化。但是我们这个协议足以完成期望。

另一点：这个系列是介绍性的，并假设客户端都工作的很好（虽然可能运行很慢）；因此没有设置超时，也没有设置特殊的规则来确保服务器不会因为客户端的恶意行为（或是故障）而出现阻塞，导致不能正常结束。

### 顺序服务器

这个系列中我们的第一个服务端程序是一个简单的“顺序”服务器，用 C 进行编写，除了标准的 POSIX 中用于套接字的内容以外没有使用其它库。服务器程序是顺序，因为它一次只能处理一个客户端的请求；当有客户端连接时，像之前所说的那样，服务器会进入到状态机中，并且不再监听套接字接受新的客户端连接，直到当前的客户端结束连接。显然这不是并发的，而且即便在很少的负载下也不能服务多个客户端，但它对于我们的讨论很有用，因为我们需要的是一个易于理解的基础。

这个服务器的完整代码在[这里][11]；接下来，我会着重于一些重点的部分。`main` 函数里面的外层循环用于监听套接字，以便接受新客户端的连接。一旦有客户端进行连接，就会调用 `serve_connection`，这个函数中的代码会一直运行，直到客户端断开连接。

顺序服务器在循环里调用 `accept` 用来监听套接字，并接受新连接：

```
while (1) {
  struct sockaddr_in peer_addr;
  socklen_t peer_addr_len = sizeof(peer_addr);

  int newsockfd =
      accept(sockfd, (struct sockaddr*)&peer_addr, &peer_addr_len);

  if (newsockfd < 0) {
    perror_die("ERROR on accept");
  }

  report_peer_connected(&peer_addr, peer_addr_len);
  serve_connection(newsockfd);
  printf("peer done\n");
}
```

`accept` 函数每次都会返回一个新的已连接的套接字，然后服务器调用 `serve_connection`；注意这是一个 _阻塞式_ 的调用 —— 在 `serve_connection` 返回前，`accept` 函数都不会再被调用了；服务器会被阻塞，直到客户端结束连接才能接受新的连接。换句话说，客户端按 _顺序_ 得到响应。

这是 `serve_connection` 函数：

```
typedef enum { WAIT_FOR_MSG, IN_MSG } ProcessingState;

void serve_connection(int sockfd) {
  if (send(sockfd, "*", 1, 0) < 1) {
    perror_die("send");
  }

  ProcessingState state = WAIT_FOR_MSG;

  while (1) {
    uint8_t buf[1024];
    int len = recv(sockfd, buf, sizeof buf, 0);
    if (len < 0) {
      perror_die("recv");
    } else if (len == 0) {
      break;
    }

    for (int i = 0; i < len; ++i) {
      switch (state) {
      case WAIT_FOR_MSG:
        if (buf[i] == '^') {
          state = IN_MSG;
        }
        break;
      case IN_MSG:
        if (buf[i] == '$') {
          state = WAIT_FOR_MSG;
        } else {
          buf[i] += 1;
          if (send(sockfd, &buf[i], 1, 0) < 1) {
            perror("send error");
            close(sockfd);
            return;
          }
        }
        break;
      }
    }
  }

  close(sockfd);
}
```

它完全是按照状态机协议进行编写的。每次循环的时候，服务器尝试接收客户端的数据。收到 0 字节意味着客户端断开连接，然后循环就会退出。否则，会逐字节检查接收缓存，每一个字节都可能会触发一个状态。

`recv` 函数返回接收到的字节数与客户端发送消息的数量完全无关（`^...$` 闭合序列的字节）。因此，在保持状态的循环中遍历整个缓冲区很重要。而且，每一个接收到的缓冲中可能包含多条信息，但也有可能开始了一个新消息，却没有显式的结束字符；而这个结束字符可能在下一个缓冲中才能收到，这就是处理状态在循环迭代中进行维护的原因。

例如，试想主循环中的 `recv` 函数在某次连接中返回了三个非空的缓冲：

1.  `^abc$de^abte$f`
2.  `xyz^123`
3.  `25$^ab$abab`

服务端返回的是哪些数据？追踪代码对于理解状态转变很有用。（答案见^注[2] ）

###  多个并发客户端

如果多个客户端在同一时刻向顺序服务器发起连接会发生什么事情？

服务器端的代码（以及它的名字 “顺序服务器”）已经说的很清楚了，一次只能处理 _一个_ 客户端的请求。只要服务器在 `serve_connection` 函数中忙于处理客户端的请求，就不会接受别的客户端的连接。只有当前的客户端断开了连接，`serve_connection` 才会返回，然后最外层的循环才能继续执行接受其他客户端的连接。

为了演示这个行为，[该系列教程的示例代码][13] 包含了一个 Python 脚本，用于模拟几个想要同时连接服务器的客户端。每一个客户端发送类似之前那样的三个数据缓冲 ^注3 ，不过每次发送数据之间会有一定延迟。

客户端脚本在不同的线程中并发地模拟客户端行为。这是我们的序列化服务器与客户端交互的信息记录：

```
$ python3.6 simple-client.py  -n 3 localhost 9090
INFO:2017-09-16 14:14:17,763:conn1 connected...
INFO:2017-09-16 14:14:17,763:conn1 sending b'^abc$de^abte$f'
INFO:2017-09-16 14:14:17,763:conn1 received b'b'
INFO:2017-09-16 14:14:17,802:conn1 received b'cdbcuf'
INFO:2017-09-16 14:14:18,764:conn1 sending b'xyz^123'
INFO:2017-09-16 14:14:18,764:conn1 received b'234'
INFO:2017-09-16 14:14:19,764:conn1 sending b'25$^ab0000$abab'
INFO:2017-09-16 14:14:19,765:conn1 received b'36bc1111'
INFO:2017-09-16 14:14:19,965:conn1 disconnecting
INFO:2017-09-16 14:14:19,966:conn2 connected...
INFO:2017-09-16 14:14:19,967:conn2 sending b'^abc$de^abte$f'
INFO:2017-09-16 14:14:19,967:conn2 received b'b'
INFO:2017-09-16 14:14:20,006:conn2 received b'cdbcuf'
INFO:2017-09-16 14:14:20,968:conn2 sending b'xyz^123'
INFO:2017-09-16 14:14:20,969:conn2 received b'234'
INFO:2017-09-16 14:14:21,970:conn2 sending b'25$^ab0000$abab'
INFO:2017-09-16 14:14:21,970:conn2 received b'36bc1111'
INFO:2017-09-16 14:14:22,171:conn2 disconnecting
INFO:2017-09-16 14:14:22,171:conn0 connected...
INFO:2017-09-16 14:14:22,172:conn0 sending b'^abc$de^abte$f'
INFO:2017-09-16 14:14:22,172:conn0 received b'b'
INFO:2017-09-16 14:14:22,210:conn0 received b'cdbcuf'
INFO:2017-09-16 14:14:23,173:conn0 sending b'xyz^123'
INFO:2017-09-16 14:14:23,174:conn0 received b'234'
INFO:2017-09-16 14:14:24,175:conn0 sending b'25$^ab0000$abab'
INFO:2017-09-16 14:14:24,176:conn0 received b'36bc1111'
INFO:2017-09-16 14:14:24,376:conn0 disconnecting
```

这里要注意连接名：`conn1` 是第一个连接到服务器的，先跟服务器交互了一段时间。接下来的连接 `conn2` —— 在第一个断开连接后，连接到了服务器，然后第三个连接也是一样。就像日志显示的那样，每一个连接让服务器变得繁忙，持续了大约 2.2 秒的时间（这实际上是人为地在客户端代码中加入的延迟），在这段时间里别的客户端都不能连接。

显然，这不是一个可扩展的策略。这个例子中，客户端中加入了延迟，让服务器不能处理别的交互动作。一个智能服务器应该能处理一堆客户端的请求，而这个原始的服务器在结束连接之前一直繁忙（我们将会在之后的章节中看到如何实现智能的服务器）。尽管服务端有延迟，但这不会过度占用 CPU；例如，从数据库中查找信息（时间基本上是花在连接到数据库服务器上，或者是花在硬盘中的本地数据库）。

###  总结及期望

这个示例服务器达成了两个预期目标：

1.  首先是介绍了问题范畴和贯彻该系列文章的套接字编程基础。
2.  对于并发服务器编程的抛砖引玉 —— 就像之前的部分所说，顺序服务器还不能在非常轻微的负载下进行扩展，而且没有高效的利用资源。

在看下一篇文章前，确保你已经理解了这里所讲的服务器/客户端协议，还有顺序服务器的代码。我之前介绍过了这个简单的协议；例如 [串行通信分帧][15] 和 [用协程来替代状态机][16]。要学习套接字网络编程的基础，[Beej 的教程][17] 用来入门很不错，但是要深入理解我推荐你还是看本书。

如果有什么不清楚的，请在评论区下进行评论或者向我发送邮件。深入理解并发服务器！

***

- 注1：状态转变中的 In/Out 记号是指 [Mealy machine][2]。
- 注2：回应的是 `bcdbcuf23436bc`。
- 注3：这里在结尾处有一点小区别，加了字符串 `0000` —— 服务器回应这个序列，告诉客户端让其断开连接；这是一个简单的握手协议，确保客户端有足够的时间接收到服务器发送的所有回复。

--------------------------------------------------------------------------------

via: https://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/

作者：[Eli Bendersky][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://eli.thegreenplace.net/pages/about
[1]:https://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/#id1
[2]:https://en.wikipedia.org/wiki/Mealy_machine
[3]:https://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/#id2
[4]:https://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/#id3
[5]:https://eli.thegreenplace.net/tag/concurrency
[6]:https://eli.thegreenplace.net/tag/c-c
[7]:http://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/
[8]:http://eli.thegreenplace.net/2017/concurrent-servers-part-2-threads/
[9]:http://eli.thegreenplace.net/2017/concurrent-servers-part-3-event-driven/
[10]:https://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/#id4
[11]:https://github.com/eliben/code-for-blog/blob/master/2017/async-socket-server/sequential-server.c
[12]:https://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/#id5
[13]:https://github.com/eliben/code-for-blog/tree/master/2017/async-socket-server
[14]:https://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/#id6
[15]:http://eli.thegreenplace.net/2009/08/12/framing-in-serial-communications/
[16]:http://eli.thegreenplace.net/2009/08/29/co-routines-as-an-alternative-to-state-machines
[17]:http://beej.us/guide/bgnet/
[18]:https://eli.thegreenplace.net/2017/concurrent-servers-part-1-introduction/
