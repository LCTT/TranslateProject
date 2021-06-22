[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12984-1.html)
[#]: subject: (Go channels are bad and you should feel bad)
[#]: via: (https://www.jtolio.com/2016/03/go-channels-are-bad-and-you-should-feel-bad)
[#]: author: (jtolio.com https://www.jtolio.com/)

Go 通道是糟糕的，你应该也觉得很糟糕
======

![](https://img.linux.net.cn/data/attachment/album/202101/05/101049y2995vz8l9mdg4bz.jpg)

更新：如果你是从一篇题为 《[糟糕的 Go 语言](https://github.com/ksimka/go-is-not-good)》 的汇编文章看到这篇博文的话，那么我想表明的是，我很惭愧被列在这样的名单上。Go 绝对是我使用过的最不糟糕的的编程语言。在我写作本文时，我是想遏制我所看到的一种趋势，那就是过度使用 Go 的一些较复杂的部分。我仍然认为 <ruby>
通道<rt>Channel</rt></ruby>可以更好，但是总体而言，Go 很棒。这就像你最喜欢的工具箱中有 [这个工具][1]；它可以有用途（甚至还可能有更多的用途），它仍然可以成为你最喜欢的工具箱！

更新 2：如果我没有指出这项对真实问题的优秀调查，那我将是失职的：《[理解 Go 中的实际并发错误][2]》。这项调查的一个重要发现是...Go 通道会导致很多错误。

从 2010 年中后期开始，我就断断续续地在使用 Google 的 [Go 编程语言][3]，自 2012 年 1 月开始（在 Go 1.0  之前！），我就用 Go 为 [Space Monkey][4] 编写了合规的产品代码。我对 Go 的最初体验可以追溯到我在研究 Hoare 的 [通信顺序进程][5] 并发模型和 [Matt Might][7] 的 [UCombinator 研究组][8] 下的 [π-演算][6] 时，作为我（[现在已重定向][9]）博士工作的一部分，以更好地支持多核开发。Go 就是在那时发布的（多么巧合啊！），我当即就开始学习尝试了。

它很快就成为了 Space Monkey 开发的核心部分。目前，我们在 Space Monkey 的生产系统有超过 42.5 万行的纯 Go 代码（_不_ 包括我们所有的 vendored 库中的代码量，这将使它接近 150 万行），所以也并不是你见过的最多的 Go 代码，但是对于相对年轻的语言，我们是重度用户。我们之前 [写了我们的 Go 使用情况][10]。也开源了一些使用率很高的库；许多人似乎是我们的 [OpenSSL 绑定][11]（比 [crypto/tls][12] 更快，但请保持 openssl 本身是最新的！）、我们的 [错误处理库][13]、[日志库][14] 和 [度量标准收集库/zipkin 客户端][15] 的粉丝。我们使用 Go、我们热爱 Go、我们认为它是目前为止我们使用过的最不糟糕的、符合我们需求的编程语言。

尽管我也不认为我能说服自己不要提及我的广泛避免使用 [goroutine-local-storage 库][16] （尽管它是一个你不应该使用的魔改技巧，但它是一个漂亮的魔改），希望我的其他经历足以证明我在解释我故意煽动性的帖子标题之前知道我在说什么。

![][17]

### 等等，什么？

如果你在大街上问一个有名的程序员，Go 有什么特别之处？ 她很可能会告诉你 Go 最出名的是<ruby>通道<rt>Channels</rt></ruby> 和 goroutine。 Go 的理论基础很大程度上是建立在 Hoare 的 CSP（<ruby>通信顺序进程<rt>Communicating Sequential Processes</rt></ruby>）模型上的，该模型本身令人着迷且有趣，我坚信，到目前为止，它产生的收益远远超过了我们的预期。

CSP（和 π-演算）都使用通信作为核心同步原语，因此 Go 会有通道是有道理的。Rob Pike 对 CSP 着迷（有充分的理由）[相当深][18] 已经有一段时间了。（[当时][19] 和 [现在][20]）。

但是从务实的角度来看（也是 Go 引以为豪的），Go 把通道搞错了。在这一点上，通道的实现在我的书中几乎是一个坚实的反模式。为什么这么说呢？亲爱的读者，让我细数其中的方法。

#### 你可能最终不会只使用通道

Hoare 的 “通信顺序进程” 是一种计算模型，实际上，唯一的同步原语是在通道上发送或接收的。一旦使用 <ruby>互斥量<rt>mutex</rt></ruby>、<ruby>信号量<rt>semaphore</rt></ruby> 或 <ruby>条件变量<rt>condition variable</rt></ruby>、bam，你就不再处于纯 CSP 领域。 Go 程序员经常通过高呼 “[通过交流共享内存][22]” 的 [缓存的思想][21] 来宣扬这种模式和哲学。

那么，让我们尝试在 Go 中仅使用 CSP 编写一个小程序！让我们成为高分接收者。我们要做的就是跟踪我们看到的最大的高分值。如此而已。

首先，我们将创建一个 `Game` 结构体。

```
type Game struct {
  bestScore int
  scores    chan int
}
```

`bestScore` 不会受到<ruby>互斥量<rt>mutex</rt></ruby>的保护！这很好，因为我们只需要一个 goroutine 来管理其状态并通过通道来接收新的分值即可。

```
func (g *Game) run() {
  for score := range g.scores {
    if g.bestScore < score {
      g.bestScore = score
    }
  }
}
```

好的，现在我们将创建一个有用的构造函数来开始 `Game`。

```
func NewGame() (g *Game) {
  g = &Game{
    bestScore: 0,
    scores:    make(chan int),
  }
  go g.run()
  return g
}
```

接下来，假设有人给了我们一个可以返回分数的 `Player`。它也可能会返回错误，因为可能传入的 TCP 流可能会死掉或发生某些故障，或者玩家退出。

```
type Player interface {
  NextScore() (score int, err error)
}
```

为了处理 `Player`，我们假设所有错误都是致命的，并将获得的比分向下传递到通道。

```
func (g *Game) HandlePlayer(p Player) error {
  for {
    score, err := p.NextScore()
    if err != nil {
      return err
    }
    g.scores <- score
  }
}
```

好极了！现在我们有了一个 `Game` 类型，可以以线程安全的方式跟踪 `Player` 获得的最高分数。

你圆满完成了自己的开发工作，并开始拥有客户。你将这个游戏服务器公开，就取得了令人难以置信的成功！你的游戏服务器上也许正在创建许多游戏。

很快，你发现人们有时会离开你的游戏。许多游戏不再有任何玩家在玩，但没有任何东西可以阻止游戏运行的循环。死掉的 `(*Game).run` goroutines 让你不知所措。

**挑战：** 在无需互斥量或 panics 的情况下修复上面的 goroutine 泄漏。实际上，可以滚动到上面的代码，并想出一个仅使用通道来解决此问题的方案。

我等着。

就其价值而言，它完全可以只通过通道来完成，但是请观察以下解决方案的简单性，它甚至没有这个问题：

```
type Game struct {
  mtx sync.Mutex
  bestScore int
}

func NewGame() *Game {
  return &Game{}
}

func (g *Game) HandlePlayer(p Player) error {
  for {
    score, err := p.NextScore()
    if err != nil {
      return err
    }
    g.mtx.Lock()
    if g.bestScore < score {
      g.bestScore = score
    }
    g.mtx.Unlock()
  }
}
```

你想选择哪一个？不要被欺骗了，以为通道的解决方案可以使它在更复杂的情况下更具可读性和可理解性。<ruby>拆解<rt>Teardown</rt></ruby>是非常困难的。这种拆解若用<ruby>互斥量<rt>mutex</rt></ruby>来做那只是小菜一碟，但最困难的是只使用 Go 专用通道来解决。另外，如果有人回复说发送通道的通道更容易推理，我马上就是感到头疼。

重要的是，这个特殊的情况可能真的 **很容易** 解决，而通道有一些运行时的帮助，而 Go 没有提供！不幸的是，就目前的情况来看，与 Go 的 CSP 版本相比，使用传统的<ruby>同步原语<rt>synchronization primitives</rt></ruby>可以更好地解决很多问题，这是令人惊讶的。稍后，我们将讨论 Go 可以做些什么来简化此案例。

**练习：** 还在怀疑？ 试着让上面两种解决方案（只使用通道与只使用互斥量channel-only vs mutex-only）在一旦 `bestScore` 大于或等于 100 时，就停止向 `Players` 索要分数。继续打开你的文本编辑器。这是一个很小的玩具问题。

这里的总结是，如果你想做任何实际的事情，除了通道之外，你还会使用传统的同步原语。

#### 通道比你自己实现要慢一些

Go 如此重视 CSP 理论，我认为其中一点就是，运行时应该可以通过通道做一些杀手级的调度优化。也许通道并不总是最直接的原语，但肯定是高效且快速的，对吧？

![][23]

正如 [Dustin Hiatt][24] 在 [Tyler Treat’s post about Go][25] 上指出的那样，

> 在幕后，通道使用锁来序列化访问并提供线程安全性。 因此，通过使用通道同步对内存的访问，你实际上就是在使用锁。 被包装在线程安全队列中的锁。 那么，与仅仅使用标准库 `sync` 包中的互斥量相比，Go 的花式锁又如何呢？ 以下数字是通过使用 Go 的内置基准测试功能，对它们的单个集合连续调用 Put 得出的。

```
> BenchmarkSimpleSet-8 3000000 391 ns/op
> BenchmarkSimpleChannelSet-8 1000000 1699 ns/o
>
```

无缓冲通道的情况与此类似，甚至是在争用而不是串行运行的情况下执行相同的测试。

也许 Go 调度器会有所改进，但与此同时，良好的旧互斥量和条件变量是非常好、高效且快速。如果你想要提高性能，请使用久经考验的方法。

#### 通道与其他并发原语组合不佳

好的，希望我已经说服了你，有时候，你至少还会与除了通道之外的原语进行交互。标准库似乎显然更喜欢传统的同步原语而不是通道。

你猜怎么着，正确地将通道与互斥量和条件变量一起使用，其实是有一定的挑战性的。

关于通道的一个有趣的事情是，通道发送是同步的，这在 CSP 中是有很大意义的。通道发送和通道接收的目的是为了成为同步屏蔽，发送和接收应该发生在同一个虚拟时间。如果你是在执行良好的 CSP 领域，那就太好了。

![][26]

实事求是地说，Go 通道也有多种缓冲方式。你可以分配一个固定的空间来考虑可能的缓冲，以便发送和接收是不同的事件，但缓冲区大小是有上限的。Go 并没有提供一种方法来让你拥有任意大小的缓冲区 —— 你必须提前分配缓冲区大小。 *这很好*，我在邮件列表上看到有人在争论，*因为无论如何内存都是有限的*。

What。

这是个糟糕的答案。有各种各样的理由来使用一个任意缓冲的通道。如果我们事先知道所有的事情，为什么还要使用 `malloc` 呢？

没有任意缓冲的通道意味着在 *任何* 通道上的幼稚发送可能会随时阻塞。你想在一个通道上发送，并在互斥下更新其他一些记账吗？小心！你的通道发送可能被阻塞！

```
// ...
s.mtx.Lock()
// ...
s.ch <- val // might block!
s.mtx.Unlock()
// ...
```

这是哲学家晚餐大战的秘诀。如果你使用了锁，则应该迅速更新状态并释放它，并且尽可能不要在锁下做任何阻塞。

有一种方法可以在 Go 中的通道上进行非阻塞发送，但这不是默认行为。假设我们有一个通道 `ch := make(chan int)`，我们希望在其上无阻塞地发送值 `1`。以下是在不阻塞的情况下你必须要做的最小量的输入：

```
select {
case ch <- 1: // it sent
default:      // it didn't
}
```

对于刚入门的 Go程序员来说，这并不是自然而然就能想到的事情。

综上所述，因为通道上的很多操作都会阻塞，所以需要对哲学家及其就餐仔细推理，才能在互斥量的保护下，成功地将通道操作与之并列使用，而不会造成死锁。

#### 严格来说，回调更强大，不需要不必要的 goroutines

![][27]

每当 API 使用通道时，或者每当我指出通道使某些事情变得困难时，总会有人会指出我应该启动一个 goroutine 来读取该通道，并在读取该通道时进行所需的任何转换或修复。

呃，不。如果我的代码位于热路径中怎么办？需要通道的实例很少，如果你的 API 可以设计为使用<ruby>互斥量<rt>mutexes</rt></ruby>、<ruby>信号量<rt>semaphores</rt></ruby>和<ruby>回调<rt>callbacks</rt></ruby>，而不使用额外的 goroutine （因为所有事件边缘都是由 API 事件触发的），那么使用通道会迫使我在资源使用中添加另一个内存分配堆栈。是的，goroutine 比线程轻得多，但更轻量并不意味着是最轻量。

正如我以前 [在一篇关于使用通道的文章的评论中争论过的][28]（呵呵，互联网），如果你使用回调而不是通道，你的 API  *总是* 可以更通用，*总是* 更灵活，而且占用的资源也会大大减少。“总是” 是一个可怕的词，但我在这里是认真的。有证据级的东西在进行。

如果有人向你提供了一个基于回调的 API，而你需要一个通道，你可以提供一个回调，在通道上发送，开销不大，灵活性十足。

另一方面，如果有人提供了一个基于通道的 API 给你，而你需要一个回调，你必须启动一个 goroutine 来读取通道，*并且* 你必须希望当你完成读取时，没有人试图在通道上发送更多的东西，这样你就会导致阻塞的 goroutine 泄漏。

对于一个超级简单的实际例子，请查看 [context 接口][29]（顺便说一下，它是一个非常有用的包，你应该用它来代替 [goroutine 本地存储][16]）。

```
type Context interface {
  ...
  // Done returns a channel that closes when this work unit should be canceled.
  // Done 返回一个通道，该通道在应该取消该工作单元时关闭。
  Done() <-chan struct{}

  // Err returns a non-nil error when the Done channel is closed
  // 当 Done 通道关闭时，Err 返回一个非 nil 错误
  Err() error
  ...
}
```

想象一下，你要做的只是在 `Done()` 通道触发时记录相应的错误。你该怎么办？如果你没有在通道中选择的好地方，则必须启动 goroutine 进行处理：

```
go func() {
  <-ctx.Done()
  logger.Errorf("canceled: %v", ctx.Err())
}()
```

如果 `ctx` 在不关闭返回 `Done()` 通道的情况下被垃圾回收怎么办？哎呀！这正是一个 goroutine 泄露！

现在假设我们更改了 `Done` 的签名：

```
// Done calls cb when this work unit should be canceled.
Done(cb func())
```

首先，现在日志记录非常容易。看看：`ctx.Done(func() { log.Errorf ("canceled:%v", ctx.Err()) })`。但是假设你确实需要某些选择行为。你可以这样调用它：

```
ch := make(chan struct{})
ctx.Done(func() { close(ch) })
```

瞧！通过使用回调，不会失去表现力。 `ch` 的工作方式类似于用于返回的通道 `Done()`，在日志记录的情况下，我们不需要启动整个新堆栈。我必须保留堆栈跟踪信息（如果我们的日志包倾向于使用它们）；我必须避免将其他堆栈分配和另一个 goroutine 分配给调度程序。

下次你使用通道时，问问你自己，如果你用互斥量和条件变量代替，是否可以消除一些 goroutine ？ 如果答案是肯定的，那么修改这些代码将更加有效。而且，如果你试图使用通道只是为了在集合中使用 `range` 关键字，那么我将不得不请你放下键盘，或者只是回去编写 Python 书籍。

![more like Zooey De-channel, amirite][30]

#### 通道 API 不一致，只是 cray-cray

在通道已关闭的情况下，执行关闭或发送消息将会引发 panics！为什么呢？ 如果想要关闭通道，你需要在外部同步它的关闭状态（使用互斥量等，这些互斥量的组合不是很好！），这样其他写入者才不会写入或关闭已关闭的通道，或者只是向前冲，关闭或写入已关闭的通道，并期望你必须恢复所有引发的 panics。

这是多么怪异的行为。 Go 中几乎所有其他操作都有避免 panic 的方法（例如，类型断言具有 `, ok =` 模式），但是对于通道，你只能自己动手处理它。

好吧，所以当发送失败时，通道会出现 panic。我想这是有一定道理的。但是，与几乎所有其他带有 nil 值的东西不同，发送到 nil 通道不会引发 panic。相反，它将永远阻塞！这很违反直觉。这可能是有用的行为，就像在你的除草器上附加一个开罐器，可能有用（在 Skymall 可以找到）一样，但这肯定是意想不到的。与 nil 映射（执行隐式指针解除引用），nil 接口（隐式指针解除引用），未经检查的类型断言以及其他所有类型交互不同，nil 通道表现出实际的通道行为，就好像为该操作实例化了一个全新的通道一样。

接收的情况稍微好一点。在已关闭的通道上执行接收会发生什么？好吧，那会是有效操作——你将得到一个零值。好吧，我想这是有道理的。奖励！接收允许你在收到值时进行 `, ok =` 样式的检查，以确定通道是否打开。谢天谢地，我们在这里得到了 `, ok =`。

但是，如果你从 nil 渠道接收会发生什么呢？ *也是永远阻塞！* 耶！不要试图利用这样一个事实：如果你关闭了通道，那么你的通道是 nil！

### 通道有什么好处？

当然，通道对于某些事情是有好处的（毕竟它们是一个通用容器），有些事情你只能用它们来做（比如 `select`）。

#### 它们是另一种特殊情况下的通用数据结构

Go 程序员已经习惯于对泛型的争论，以至于我一提起这个词就能感觉到 PTSD（创伤后应激障碍）的到来。我不是来谈论这件事的，所以擦擦额头上的汗，让我们继续前进吧。

无论你对泛型的看法是什么，Go 的映射、切片和通道都是支持泛型元素类型的数据结构，因为它们已经被特殊封装到语言中了。

在一种不允许你编写自己的泛型容器的语言中，任何允许你更好地管理事物集合的东西都是有价值的。在这里，通道是一个支持任意值类型的线程安全数据结构。

所以这很有用！我想这可以省去一些陈词滥调。

我很难把这算作是通道的胜利。

#### Select

使用通道可以做的主要事情是 `select` 语句。在这里，你可以等待固定数量的事件输入。它有点像 epoll，但你必须预先知道要等待多少个套接字。

这是真正有用的语言功能。如果不是 `select`，通道将被彻底清洗。但是我的天呐，让我告诉你，第一次决定可能需要在多个事物中选择，但是你不知道有多少项，因此必须使用 `reflect.Select`。

### 通道如何才能更好？

很难说 Go 语言团队可以为 Go 2.0 做的最具战术意义的事情是什么（Go 1.0 兼容性保证很好，但是很费劲），但这并不能阻止我提出一些建议。

#### 在条件变量上的 Select ！

我们可以不需要通道！这是我提议我们摆脱一些“<ruby>圣牛<rt>sacred cows</rt></ruby>”（LCTT 译注：神圣不可质疑的事物）的地方，但是让我问你，如果你可以选择任何自定义同步原语，那会有多棒？（答：太棒了。）如果有的话，我们根本就不需要通道了。

#### GC 可以帮助我们吗？

在第一个示例中，如果我们能够使用定向类型的通道垃圾回收（GC）来帮助我们进行清理，我们就可以轻松地解决通道的高分服务器清理问题。

![][31]

如你所知，Go 具有定向类型的通道。 你可以使用仅支持读取的通道类型（`<-chan`）和仅支持写入的通道类型（`chan<-`）。 这太棒了！

Go 也有垃圾回收功能。 很明显，某些类型的记账方式太繁琐了，我们不应该让程序员去处理它们。 我们清理未使用的内存！ 垃圾回收非常有用且整洁。

那么，为什么不帮助清理未使用或死锁的通道读取呢？ 与其让 `make(chan Whatever)` 返回一个双向通道，不如让它返回两个单向通道（`chanReader, chanWriter:= make(chan Type)`）。

让我们重新考虑一下最初的示例：

```
type Game struct {
  bestScore int
  scores    chan<- int
}

func run(bestScore *int, scores <-chan int) {
  // 我们不会直接保留对游戏的引用，因为这样我们就会保留着通道的发送端。
  for score := range scores {
    if *bestScore < score {
      *bestScore = score
    }
  }
}

func NewGame() (g *Game) {
  // 这种 make(chan) 返回风格是一个建议
  scoreReader, scoreWriter := make(chan int)
  g = &Game{
    bestScore: 0,
    scores:    scoreWriter,
  }
  go run(&g.bestScore, scoreReader)
  return g
}

func (g *Game) HandlePlayer(p Player) error {
  for {
    score, err := p.NextScore()
    if err != nil {
      return err
    }
    g.scores <- score
  }
}
```

如果垃圾回收关闭了一个通道，而我们可以证明它永远不会有更多的值，那么这个解决方案是完全可行的。是的，是的，`run` 中的评论暗示着有一把相当大的枪瞄准了你的脚，但至少现在这个问题可以很容易地解决了，而以前确实不是这样。此外，一个聪明的编译器可能会做出适当的证明，以减少这种脚枪造成的损害。

#### 其他小问题

* **Dup 通道吗？** —— 如果我们可以在通道上使用等效于 `dup` 的系统调用，那么我们也可以很容易地解决多生产者问题。 每个生产者可以关闭自己的 `dup` 版通道，而不会破坏其他生产者。
* **修复通道 API！** —— 关闭不是幂等的吗？ 在已关闭的通道上发送信息引起的 panics 没有办法避免吗？ 啊！
* **任意缓冲的通道** —— 如果我们可以创建没有固定的缓冲区大小限制的缓冲通道，那么我们可以创建非阻塞的通道。

### 那我们该怎么向大家介绍 Go 呢？

如果你还没有，请看看我目前最喜欢的编程文章：《[你的函数是什么颜色][32]》。虽然不是专门针对 Go，但这篇博文比我更有说服力地阐述了为什么 goroutines 是 Go 最好的特性（这也是 Go 在某些应用程序中优于 Rust 的方式之一）。

如果你还在使用这样的一种编程语言写代码，它强迫你使用类似 `yield` 关键字来获得高性能、并发性或事件驱动的模型，那么你就是活在过去，不管你或其他人是否知道这一点。到目前为止，Go 是我所见过的实现 M：N 线程模型（非 1：1 ）的语言中最好的入门者之一，而且这种模型非常强大。

所以，跟大家说说 goroutines 吧。

如果非要我选择 Go 的另一个主要特性，那就是接口。静态类型的 <ruby>[鸭子模型][33]<rt>duck typing</rt></ruby> 使得扩展、使用你自己或他人的项目变得如此有趣而令人惊奇，这也许值得我改天再写一组完全不同的文章来介绍它。

### 所以…

我一直看到人们争先恐后冲进 Go，渴望充分利用通道来发挥其全部潜力。这是我对你的建议。

**够了！**

当你在编写 API 和接口时，尽管“绝不”的建议可能很糟糕，但我非常肯定，通道从来没有什么时候好过，我用过的每一个使用通道的 Go API，最后都不得不与之抗争。我从来没有想过“哦 太好了，这里是一个通道；”它总是被一些变体取代，_**这是什么新鲜的地狱？**_

所以，_请在适当的地方，并且只在适当的地方使用通道。_

在我使用的所有 Go 代码中，我可以用一只手数出有多少次通道真的是最好的选择。有时候是这样的。那很好！那就用它们吧。但除此之外，就不要再使用了。

![][34]

_特别感谢我的校对读者 Jeff Wendling、[Andrew Harding][35]、[George Shank][36] 和 [Tyler Treat][37] 提供的宝贵反馈。_

如果你想和我们一起用 Go 在 Space Monkey 项目工作，请[给我打个招呼][38]！

--------------------------------------------------------------------------------

via: https://www.jtolio.com/2016/03/go-channels-are-bad-and-you-should-feel-bad

作者：[jtolds][a]
选题：[lujun9972][b]
译者：[gxlct008](https://github.com/gxlct008)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.jtolio.com/
[b]: https://github.com/lujun9972
[1]: https://blog.codinghorror.com/content/images/uploads/2012/06/6a0120a85dcdae970b017742d249d5970d-800wi.jpg
[2]: https://songlh.github.io/paper/go-study.pdf
[3]: https://golang.org/
[4]: http://www.spacemonkey.com/
[5]: https://en.wikipedia.org/wiki/Communicating_sequential_processes
[6]: https://en.wikipedia.org/wiki/%CE%A0-calculus
[7]: http://matt.might.net
[8]: http://www.ucombinator.org/
[9]: https://www.jtolio.com/writing/2015/11/research-log-cell-states-and-microarrays/
[10]: https://www.jtolio.com/writing/2014/04/go-space-monkey/
[11]: https://godoc.org/github.com/spacemonkeygo/openssl
[12]: https://golang.org/pkg/crypto/tls/
[13]: https://godoc.org/github.com/spacemonkeygo/errors
[14]: https://godoc.org/github.com/spacemonkeygo/spacelog
[15]: https://godoc.org/gopkg.in/spacemonkeygo/monitor.v1
[16]: https://github.com/jtolds/gls
[17]: https://www.jtolio.com/images/wat/darth-helmet.jpg
[18]: https://en.wikipedia.org/wiki/Newsqueak
[19]: https://en.wikipedia.org/wiki/Alef_%28programming_language%29
[20]: https://en.wikipedia.org/wiki/Limbo_%28programming_language%29
[21]: https://lesswrong.com/lw/k5/cached_thoughts/
[22]: https://blog.golang.org/share-memory-by-communicating
[23]: https://www.jtolio.com/images/wat/jon-stewart.jpg
[24]: https://twitter.com/HiattDustin
[25]: http://bravenewgeek.com/go-is-unapologetically-flawed-heres-why-we-use-it/
[26]: https://www.jtolio.com/images/wat/obama.jpg
[27]: https://www.jtolio.com/images/wat/yael-grobglas.jpg
[28]: http://www.informit.com/articles/article.aspx?p=2359758#comment-2061767464
[29]: https://godoc.org/golang.org/x/net/context
[30]: https://www.jtolio.com/images/wat/zooey-deschanel.jpg
[31]: https://www.jtolio.com/images/wat/joel-mchale.jpg
[32]: http://journal.stuffwithstuff.com/2015/02/01/what-color-is-your-function/
[33]: https://en.wikipedia.org/wiki/Duck_typing
[34]: https://www.jtolio.com/images/wat/michael-cera.jpg
[35]: https://github.com/azdagron
[36]: https://twitter.com/taterbase
[37]: http://bravenewgeek.com
[38]: https://www.jtolio.com/contact/
