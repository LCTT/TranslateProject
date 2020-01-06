[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Lessons learned from programming in Go"
[#]: via: "https://opensource.com/article/19/12/go-common-pitfalls"
[#]: author: "Eduardo Ferreira https://opensource.com/users/edufgf"

用 Go 编程受到的启发
======
通过学习如何定位并发处理的陷阱来避免未来处理这些问题时的困境。
![Goland gopher illustration][1]

在复杂的分布式系统进行任务处理时，你通常会需要进行并发的操作。[Mode.net][2] 公司系统每天要处理实时、快速和灵活的以毫秒为单位动态路由数据包的全球专用网络和数据，需要高度并发的系统。他们的动态路由是基于网络状态的，而这个过程需要考虑众多因素，我们只考虑关系链的监控。在我们的环境中，调用关系链监控可以是任何跟网络调用关系链有关的状态和当前属性（如连接延迟）。

### 并发探测链接指标

[H.A.L.O.][4] (Hop-by-Hop Adaptive Link-State Optimal Routing，译注：逐跳自适应链路状态最佳路由), 我们的动态路由算法部分依赖于链路度量来计算路由表。 这些指标由位于每个PoP（译注：存活节点）上的独立组件收集。PoP是表示我们的网络中单个路由实体的机器，通过链路连接并分布在我们的网络拓扑中的各个位置。某个组件使用网络数据包探测周围的机器，周围的机器回复数据包给前者。从接收到的探测包中可以获得链路延迟。由于每个 PoP 都有多个临近节点，所以这种探测任务实质上是并发的：我们需要实时测量每个临近连接点的延迟。我们不能串行地处理；为了计算这个指标，必须尽快处理每个探针。

![latency computation graph][6]

### 序列号和重置：一个记录场景

我们的探测组件互相发送和接收数据包并依靠序列号进行数据包处理。旨在避免处理重复的包或顺序被打乱的包。我们的第一个实现依靠特殊的序列号0来重置序列号。这个数字仅在组件初始化时使用。主要的问题是我们只考虑了始终从 0 开始递增的序列号。组件重启后，包的顺序可能会重新排列，某个包的序列号可能会轻易地被替换成重置之前使用过的值。这意味着，直到排到重置之前用到的值之前，它后面的包都会被忽略掉。

### UDP 握手和有限状态机

这里的问题是重启前后的序列号是否一致。有几种方法可以解决这个问题，经过讨论，我们选择了实现一个带有清晰状态定义的三向交握协议。这个握手过程在初始化时通过链接建立 session。这样可以确保节点通过同一个 session 进行通信且使用了适当的序列号。

为了正确实现这个过程，我们必须顶一个一个有清晰状态和过渡的有限状态机。这样我们就可以正确管理握手过程中的所有极端情况。

![finite state machine diagram][7]

session ID 由握手的初始化程序生成。一个完整的交换顺序如下：

  1. sender 发送一个 **SYN (ID)** 数据包。
  2. receiver 存储接收到的 **ID** 并发送一个 **SYN-ACK (ID)**.
  3. sender 接收到 **SYN-ACK (ID)** _并发送一个 **ACK (ID)**_。它还发送一个从序列号 0 开始的数据包。
  4. receiver 检查最后接收到的 **ID**，如果 ID 匹配，_则接受 **ACK (ID)**_。它还开始接受序列号为 0 的数据包。



### 处理状态超时

Basically, at each state, you need to handle, at most, three types of events: link events, packet events, and timeout events. And those events show up concurrently, so here you have to handle concurrency properly.基本上，每种状态下你都需要处理最多三种类型的事件：链接事件、数据包事件和超时事件。这些事件会并发地出现，因此你必须正确处理并发。

  * 链接事件包括连接和断开，连接时会初始化一个链接 session，断开时会断开一个已建立的 seesion。
  * 数据包事件是控制数据包 **(SYN/SYN-ACK/ACK)** 或只是探测响应。
  * 超时事件在当前 session 状态的预定超时时间到期后触发。



这里面临的最主要的问题是如何处理并发超时到期和其他事件。这里很容易陷入死锁和资源竞争的陷阱。

### 第一种方法

本项目使用的语言是 [Golang][8]. 它确实提供了原生的同步机制，如自带的 channel 和锁，并且能够使用轻量级线程来进行并发处理。

![gophers hacking together][9]

gophers hacking together

首先，你可以设计两个分别表示我们的 **Session** 和 **Timeout Handlers** 的结构体。


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

**Session** 标识连接 session，内有表示 session ID、临近的连接点的 IP 和当前 session 状态的字段。

**TimeoutHandler** 包含回调函数、对应的 session、持续时间和指向调度计时器的 timer 指针。

每一个临近连接点的 session 都包含一个保存调度 `TimeoutHandler` 的全局 map。


```
`SessionTimeout map[Session]*TimeoutHandler`
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

超时 handler 创建后，会在经过了设置的 _duration_ 时间（秒）后执行回调函数。然而，有些事件会使你重新调度一个超时 handler（与 **SYN** 状态时的处理一样 — 每 3 秒一次）。

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

这次回调在新的超时 handler 中重新调度自己，并更新全局 map **sessionTimeout**。

### 数据竞争和引用

你的解决方案已经有了。可以通过检查计时器到期后超时回调是否执行来进行一个简单的测试。为此，注册一个超时，在 *duration* 时间内 sleep，然后检查是否执行的回调的处理。执行这个测试后，最好取消预定的超时时间（因为它会重新调度），这样才不会在下次测试时产生副作用。

令人惊讶的是，这个简单的测试发现了这个解决方案中的一个 bug。使用 cancel 方法来取消超时并没有正确处理。以下顺序的事件会导致数据资源竞争：

  1. 你有一个已调度的超时 handler。
  2. 线程 1:
a) 你接收到一个控制数据包，现在你要取消已注册的超时并切换到下一个 session 状态（如 发送 **SYN** 后接收到一个 **SYN-ACK**）
b) 你调用了 **timeout.Cancel()**，这个函数调用了 **timer.Stop()**。（请注意，Golang 计时器的 stop 不会终止一个已过期的计时器。）
  3. 线程 2:
a) 在调用 cancel 之前，计时器已过期，回调即将执行。
b) 执行回调，它调度一次新的超时并更新全局 map。
  4. 线程 1:
a) 切换到新的 session 状态并注册新的超时，更新全局 map。



两个线程同时更新超时 map。最终结果是你无法取消注册的超时，然后你也会丢失对线程 2 重新调度的超时的引用。这导致 handler 在一段时间内持续执行和重新调度，出现非预期行为。

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

现在的区别就是全局 map 的更新是同步的，但是这还是不能阻止在你调用 **timeout.Cancel() ** 后回调的执行 — 这种情况出现在调度计时器过期了但是还没有拿到锁的时候。你还是会丢失一个已注册的超时的引用。

### 使用取消 channel

你可以使用取消 channel，而不必依赖不能阻止到期的计时器执行的 golang 函数 **timer.Stop()**。

这是一个略有不同的方法。现在你可以不用再通过回调进行递归地重新调度；而是注册一个死循环，这个循环接收到取消信号或超时事件是终止。

新的 **Register()** 产生一个新的 go 协程，这个协程在在超时后执行你的回调，并在前一个超时执行后调度新的超时。返回给调用发一个取消 channel，用来控制循环的终止。


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

这个方法提供了你注册的所有超时的取消 channel。对 cancel 的一次调用向 channel 发送一个空结构体并触发取消操作。然而，这并不能解决前面的问题；可能在你通过 channel 调用 cancel 超时线程还没有拿到锁之前，超时时间就已经到了。

这里的解决方案是，在拿到锁之后，检查一下超时范围内的取消 channel。


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

这里的问题在取消 channel 本身。我们创建的是无缓冲 channel，即发送是阻塞调用。当你在一个超时 handler 中调用取消函数时，只有在该 handler 被取消后才能继续处理。问题出现在，当你有多个调用请求到同一个取消 channel 时，这时一个取消请求只被处理一次。当多个事件同时取消同一个超时 handler 时，如链接断开或控制包事件，很容易出现这种情况。这会导致死锁，可能会使应用程序 halt。

![gophers on a wire, talking][11]

还有人吗？

已获得 Trevor Forrey 授权。

这里的解决方案是创建 channel 时指定大小至少为 1，这样向 channel 发送数据就不会阻塞，也显式地使发送变成非阻塞的，避免了并发调用。这样可以确保取消操作只发送一次，并且不会则色后续的取消调用。


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

This seems like an obvious one, but it’s actually hard to spot if your concurrent updates happen in different locations. The result is data race, where multiple updates to the same data can cause update loss, due to one update overriding another. In our case, we were updating the scheduled timeout reference on the same shared map. (Interestingly, if Go detects a concurrent read/write on the same Map object, it throws a fatal error —you can try to run Go’s [data race detector][12]). This eventually results in losing a timeout reference and making it impossible to cancel that given timeout. Always remember to use locks when they are needed.



![gopher assembly line][13]

don’t forget to synchronize gophers’ work

#### Missing condition checks

Condition checks are needed in situations where you can’t rely only on the lock exclusivity. Our situation is a bit different, but the core idea is the same as [condition variables][14]. Imagine a classic situation where you have one producer and multiple consumers working with a shared queue. A producer can add one item to the queue and wake up all consumers. The wake-up call means that some data is available at the queue, and because the queue is shared, access must be synchronized through a lock. Every consumer has a chance to grab the lock; however, you still need to check if there are items in the queue. A condition check is needed because you don’t know the queue status by the time you grab the lock.

In our example, the timeout handler got a ‘wake up’ call from a timer expiration, but it still needed to check if a cancel signal was sent to it before it could proceed with the callback execution.

![gopher boot camp][15]

condition checks might be needed if you wake up multiple gophers

#### Deadlocks

This happens when one thread is stuck, waiting indefinitely for a signal to wake up, but this signal will never arrive. Those can completely kill your application by halting your entire program execution.

In our case, this happened due to multiple send calls to a non-buffered and blocking channel. This meant that the send call would only return after a receive is done on the same channel. Our timeout thread loop was promptly receiving signals on the cancellation channel; however, after the first signal is received, it would break off the loop and never read from that channel again. The remaining callers are stuck forever. To avoid this situation, you need to carefully think through your code, handle blocking calls with care, and guarantee that thread starvation doesn’t happen. The fix in our example was to make the cancellation calls non-blocking—we didn’t need a blocking call for our needs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/go-common-pitfalls

作者：[Eduardo Ferreira][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/edufgf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/go-golang.png?itok=OAW9BXny "Goland gopher illustration"
[2]: http://mode.net
[3]: https://en.wikipedia.org/wiki/Metrics_%28networking%29
[4]: https://people.ece.cornell.edu/atang/pub/15/HALO_ToN.pdf
[5]: https://en.wikipedia.org/wiki/Point_of_presence
[6]: https://opensource.com/sites/default/files/uploads/image2_0_3.png "latency computation graph"
[7]: https://opensource.com/sites/default/files/uploads/image3_0.png "finite state machine diagram"
[8]: https://golang.org/
[9]: https://opensource.com/sites/default/files/uploads/image4.png "gophers hacking together"
[10]: https://en.wikipedia.org/wiki/Deadlock
[11]: https://opensource.com/sites/default/files/uploads/image5_0_0.jpg "gophers on a wire, talking"
[12]: https://golang.org/doc/articles/race_detector.html
[13]: https://opensource.com/sites/default/files/uploads/image6.jpeg "gopher assembly line"
[14]: https://en.wikipedia.org/wiki/Monitor_%28synchronization%29#Condition_variables
[15]: https://opensource.com/sites/default/files/uploads/image7.png "gopher boot camp"
