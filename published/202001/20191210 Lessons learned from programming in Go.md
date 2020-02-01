[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11778-1.html)
[#]: subject: (Lessons learned from programming in Go)
[#]: via: (https://opensource.com/article/19/12/go-common-pitfalls)
[#]: author: (Eduardo Ferreira https://opensource.com/users/edufgf)

Go 并发编程中的经验教训
======

> 通过学习如何定位并发处理的陷阱来避免未来处理这些问题时的困境。

![](https://img.linux.net.cn/data/attachment/album/202001/13/150539n217ak1vcf717uzx.jpg)

在复杂的分布式系统进行任务处理时，你通常会需要进行并发的操作。在 [Mode.net][2] 公司，我们每天都要和实时、快速和灵活的软件打交道。而没有一个高度并发的系统，就不可能构建一个毫秒级的动态地路由数据包的全球专用网络。这个动态路由是基于网络状态的，尽管这个过程需要考虑众多因素，但我们的重点是链路指标。在我们的环境中，链路指标可以是任何跟网络链接的状态和当前属性（如链接延迟）有关的任何内容。

### 并发探测链接监控

我们的动态路由算法 [H.A.L.O.][4]（<ruby>逐跳自适应链路状态最佳路由<rt>Hop-by-Hop Adaptive Link-State Optimal Routing</rt></ruby>）部分依赖于链路指标来计算路由表。这些指标由位于每个 PoP（<ruby>存活节点<rt>Point of Presence</rt></ruby>）上的独立组件收集。PoP 是表示我们的网络中单个路由实体的机器，通过链路连接并分布在我们的网络拓扑中的各个位置。某个组件使用网络数据包探测周围的机器，周围的机器回复数据包给前者。从接收到的探测包中可以获得链路延迟。由于每个 PoP 都有不止一个临近节点，所以这种探测任务实质上是并发的：我们需要实时测量每个临近连接点的延迟。我们不能串行地处理；为了计算这个指标，必须尽快处理每个探测。

![latency computation graph][6]

### 序列号和重置：一个重新排列场景

我们的探测组件互相发送和接收数据包，并依靠序列号进行数据包处理。这旨在避免处理重复的包或顺序被打乱的包。我们的第一个实现依靠特殊的序列号 0 来重置序列号。这个数字仅在组件初始化时使用。主要的问题是我们考虑了递增的序列号总是从 0 开始。在该组件重启后，包的顺序可能会重新排列，某个包的序列号可能会轻易地被替换成重置之前使用过的值。这意味着，后继的包都会被忽略掉，直到排到重置之前用到的序列值。

### UDP 握手和有限状态机

这里的问题是该组件重启前后的序列号是否一致。有几种方法可以解决这个问题，经过讨论，我们选择了实现一个带有清晰状态定义的三步握手协议。这个握手过程在初始化时通过链接建立会话。这样可以确保节点通过同一个会话进行通信且使用了适当的序列号。

为了正确实现这个过程，我们必须定义一个有清晰状态和过渡的有限状态机。这样我们就可以正确管理握手过程中的所有极端情况。

![finite state machine diagram][7]

会话 ID 由握手的初始化程序生成。一个完整的交换顺序如下：

1. 发送者发送一个 `SYN(ID)` 数据包。
2. 接收者存储接收到的 `ID` 并发送一个 `SYN-ACK(ID)`。
3. 发送者接收到 `SYN-ACK(ID)` 并发送一个 `ACK(ID)`。它还发送一个从序列号 0 开始的数据包。
4. 接收者检查最后接收到的 `ID`，如果 ID 匹配，则接受 `ACK(ID)`。它还开始接受序列号为 0 的数据包。

### 处理状态超时

基本上，每种状态下你都需要处理最多三种类型的事件：链接事件、数据包事件和超时事件。这些事件会并发地出现，因此你必须正确处理并发。

* 链接事件包括网络连接或网络断开的变化，相应的初始化一个链接会话或断开一个已建立的会话。
* 数据包事件是控制数据包（`SYN`/`SYN-ACK`/`ACK`）或只是探测响应。
* 超时事件在当前会话状态的预定超时时间到期后触发。

这里面临的最主要的问题是如何处理并发的超时到期和其他事件。这里很容易陷入死锁和资源竞争的陷阱。

### 第一种方法

本项目使用的语言是 [Golang][8]。它确实提供了原生的同步机制，如自带的通道和锁，并且能够使用轻量级线程来进行并发处理。

![gophers hacking together][9]

*gopher 们聚众狂欢*

首先，你可以设计两个分别表示我们的会话和超时处理程序的结构体。

```go
type Session struct {  
  State SessionState  
  Id SessionId  
  RemoteIp string  
}

type TimeoutHandler struct {  
  callback func(Session)  
  session Session  
  duration int  
  timer *timer.Timer  
}
```

`Session` 标识连接会话，内有表示会话 ID、临近的连接点的 IP 和当前会话状态的字段。

`TimeoutHandler` 包含回调函数、对应的会话、持续时间和指向调度计时器的指针。

每一个临近连接点的会话都包含一个保存调度 `TimeoutHandler` 的全局映射。

```
SessionTimeout map[Session]*TimeoutHandler
```

下面方法注册和取消超时：

```go
// schedules the timeout callback function.  
func (timeout* TimeoutHandler) Register() {  
  timeout.timer = time.AfterFunc(time.Duration(timeout.duration) * time.Second, func() {  
    timeout.callback(timeout.session)  
  })  
}

func (timeout* TimeoutHandler) Cancel() {  
  if timeout.timer == nil {  
    return  
  }  
  timeout.timer.Stop()  
}
```

你可以使用类似下面的方法来创建和存储超时：

```go
func CreateTimeoutHandler(callback func(Session), session Session, duration int) *TimeoutHandler {  
  if sessionTimeout[session] == nil {  
    sessionTimeout[session] := new(TimeoutHandler)  
  }  
   
  timeout = sessionTimeout[session]  
  timeout.session = session  
  timeout.callback = callback  
  timeout.duration = duration  
  return timeout  
}
```

超时处理程序创建后，会在经过了设置的 `duration` 时间（秒）后执行回调函数。然而，有些事件会使你重新调度一个超时处理程序（与 `SYN` 状态时的处理一样，每 3 秒一次）。

为此，你可以让回调函数重新调度一次超时：

```go
func synCallback(session Session) {  
  sendSynPacket(session)

  // reschedules the same callback.  
  newTimeout := NewTimeoutHandler(synCallback, session, SYN_TIMEOUT_DURATION)  
  newTimeout.Register()

  sessionTimeout[state] = newTimeout  
}
```

这次回调在新的超时处理程序中重新调度自己，并更新全局映射 `sessionTimeout`。

### 数据竞争和引用

你的解决方案已经有了。可以通过检查计时器到期后超时回调是否执行来进行一个简单的测试。为此，注册一个超时，休眠 `duration` 秒，然后检查是否执行了回调的处理。执行这个测试后，最好取消预定的超时时间（因为它会重新调度），这样才不会在下次测试时产生副作用。

令人惊讶的是，这个简单的测试发现了这个解决方案中的一个问题。使用 `cancel` 方法来取消超时并没有正确处理。以下顺序的事件会导致数据资源竞争：

1. 你有一个已调度的超时处理程序。
2. 线程 1：
    1. 你接收到一个控制数据包，现在你要取消已注册的超时并切换到下一个会话状态（如发送 `SYN` 后接收到一个 `SYN-ACK`）
    2. 你调用了 `timeout.Cancel()`，这个函数调用了 `timer.Stop()`。（请注意，Golang 计时器的停止不会终止一个已过期的计时器。）
3. 线程 2：
    1. 在取消调用之前，计时器已过期，回调即将执行。
    2. 执行回调，它调度一次新的超时并更新全局映射。
4. 线程 1：
    1. 切换到新的会话状态并注册新的超时，更新全局映射。

两个线程并发地更新超时映射。最终结果是你无法取消注册的超时，然后你也会丢失对线程 2 重新调度的超时的引用。这导致处理程序在一段时间内持续执行和重新调度，出现非预期行为。

### 锁也解决不了问题

使用锁也不能完全解决问题。如果你在处理所有事件和执行回调之前加锁，它仍然不能阻止一个过期的回调运行：

```go
func (timeout* TimeoutHandler) Register() {  
  timeout.timer = time.AfterFunc(time.Duration(timeout.duration) * time._Second_, func() {  
    stateLock.Lock()  
    defer stateLock.Unlock()

    timeout.callback(timeout.session)  
  })  
}
```

现在的区别就是全局映射的更新是同步的，但是这还是不能阻止在你调用 `timeout.Cancel()` 后回调的执行 —— 这种情况出现在调度计时器过期了但是还没有拿到锁的时候。你还是会丢失一个已注册的超时的引用。

### 使用取消通道

你可以使用取消通道，而不必依赖不能阻止到期的计时器执行的 golang 函数 `timer.Stop()`。

这是一个略有不同的方法。现在你可以不用再通过回调进行递归地重新调度；而是注册一个死循环，这个循环接收到取消信号或超时事件时终止。

新的 `Register()` 产生一个新的 go 线程，这个线程在超时后执行你的回调，并在前一个超时执行后调度新的超时。返回给调用方一个取消通道，用来控制循环的终止。

```go
func (timeout *TimeoutHandler) Register() chan struct{} {  
  cancelChan := make(chan struct{})  
   
  go func () {  
    select {  
    case _ = <- cancelChan:  
      return  
    case _ = <- time.AfterFunc(time.Duration(timeout.duration) * time.Second):  
      func () {  
        stateLock.Lock()  
        defer stateLock.Unlock()

        timeout.callback(timeout.session)  
      } ()  
    }  
  } ()

  return cancelChan  
}

func (timeout* TimeoutHandler) Cancel() {  
  if timeout.cancelChan == nil {  
    return  
  }  
  timeout.cancelChan <- struct{}{}  
}
```

这个方法给你注册的所有超时提供了取消通道。一个取消调用向通道发送一个空结构体并触发取消操作。然而，这并不能解决前面的问题；可能在你通过通道取消之前以及超时线程拿到锁之前，超时时间就已经到了。

这里的解决方案是，在拿到锁**之后**，检查一下超时范围内的取消通道。

```go
  case _ = <- time.AfterFunc(time.Duration(timeout.duration) * time.Second):  
    func () {  
      stateLock.Lock()  
      defer stateLock.Unlock()  
     
      select {  
      case _ = <- handler.cancelChan:  
        return  
      default:  
        timeout.callback(timeout.session)  
      }  
    } ()  
  }
```

最终，这可以确保在拿到锁之后执行回调，不会触发取消操作。

### 小心死锁

这个解决方案看起来有效；但是还是有个隐患：[死锁][10]。

请阅读上面的代码，试着自己找到它。考虑下描述的所有函数的并发调用。

这里的问题在取消通道本身。我们创建的是无缓冲通道，即发送的是阻塞调用。当你在一个超时处理程序中调用取消函数时，只有在该处理程序被取消后才能继续处理。问题出现在，当你有多个调用请求到同一个取消通道时，这时一个取消请求只被处理一次。当多个事件同时取消同一个超时处理程序时，如连接断开或控制包事件，很容易出现这种情况。这会导致死锁，可能会使应用程序停机。

![gophers on a wire, talking][11]

*有人在听吗？*

（已获得 Trevor Forrey 授权。）

这里的解决方案是创建通道时指定缓存大小至少为 1，这样向通道发送数据就不会阻塞，也显式地使发送变成非阻塞的，避免了并发调用。这样可以确保取消操作只发送一次，并且不会阻塞后续的取消调用。

```go
func (timeout* TimeoutHandler) Cancel() {  
  if timeout.cancelChan == nil {  
    return  
  }  
   
  select {  
  case timeout.cancelChan <- struct{}{}:  
  default:  
    // can’t send on the channel, someone has already requested the cancellation.  
  }  
}
```

### 总结

在实践中你学到了并发操作时出现的常见错误。由于其不确定性，即使进行大量的测试，也不容易发现这些问题。下面是我们在最初的实现中遇到的三个主要问题：

#### 在非同步的情况下更新共享数据

这似乎是个很明显的问题，但如果并发更新发生在不同的位置，就很难发现。结果就是数据竞争，由于一个更新会覆盖另一个，因此对同一数据的多次更新中会有某些更新丢失。在我们的案例中，我们是在同时更新同一个共享映射里的调度超时引用。（有趣的是，如果 Go 检测到在同一个映射对象上的并发读写，会抛出致命错误 — 你可以尝试下运行 Go 的[数据竞争检测器](https://golang.org/doc/articles/race_detector.html)）。这最终会导致丢失超时引用，且无法取消给定的超时。当有必要时，永远不要忘记使用锁。

![gopher assembly line][13]

*不要忘记同步 gopher 们的工作*

#### 缺少条件检查

在不能仅依赖锁的独占性的情况下，就需要进行条件检查。我们遇到的场景稍微有点不一样，但是核心思想跟[条件变量][14]是一样的。假设有个一个生产者和多个消费者使用一个共享队列的经典场景，生产者可以将一个元素添加到队列并唤醒所有消费者。这个唤醒调用意味着队列中的数据是可访问的，并且由于队列是共享的，消费者必须通过锁来进行同步访问。每个消费者都可能拿到锁；然而，你仍然需要检查队列中是否有元素。因为在你拿到锁的瞬间并不知道队列的状态，所以还是需要进行条件检查。

在我们的例子中，超时处理程序收到了计时器到期时发出的“唤醒”调用，但是它仍需要检查是否已向其发送了取消信号，然后才能继续执行回调。

![gopher boot camp][15]

*如果你要唤醒多个 gopher，可能就需要进行条件检查*

#### 死锁

当一个线程被卡住，无限期地等待一个唤醒信号，但是这个信号永远不会到达时，就会发生这种情况。死锁可以通过让你的整个程序停机来彻底杀死你的应用。

在我们的案例中，这种情况的发生是由于多次发送请求到一个非缓冲且阻塞的通道。这意味着向通道发送数据只有在从这个通道接收完数据后才能返回。我们的超时线程循环迅速从取消通道接收信号；然而，在接收到第一个信号后，它将跳出循环，并且再也不会从这个通道读取数据。其他的调用会一直被卡住。为避免这种情况，你需要仔细检查代码，谨慎处理阻塞调用，并确保不会发生线程饥饿。我们例子中的解决方法是使取消调用成为非阻塞调用 — 我们不需要阻塞调用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/go-common-pitfalls

作者：[Eduardo Ferreira][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/edufgf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/go-golang.png?itok=OAW9BXny (Goland gopher illustration)
[2]: http://mode.net
[3]: https://en.wikipedia.org/wiki/Metrics_%28networking%29
[4]: https://people.ece.cornell.edu/atang/pub/15/HALO_ToN.pdf
[5]: https://en.wikipedia.org/wiki/Point_of_presence
[6]: https://opensource.com/sites/default/files/uploads/image2_0_3.png (latency computation graph)
[7]: https://opensource.com/sites/default/files/uploads/image3_0.png (finite state machine diagram)
[8]: https://golang.org/
[9]: https://opensource.com/sites/default/files/uploads/image4.png (gophers hacking together)
[10]: https://en.wikipedia.org/wiki/Deadlock
[11]: https://opensource.com/sites/default/files/uploads/image5_0_0.jpg (gophers on a wire, talking)
[12]: https://golang.org/doc/articles/race_detector.html
[13]: https://opensource.com/sites/default/files/uploads/image6.jpeg (gopher assembly line)
[14]: https://en.wikipedia.org/wiki/Monitor_%28synchronization%29#Condition_variables
[15]: https://opensource.com/sites/default/files/uploads/image7.png (gopher boot camp)
