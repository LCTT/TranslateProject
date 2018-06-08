一些常见的并发编程错误
============================================================

Go 是一个内置支持并发编程的语言。借助使用 `go` 关键字去创建<ruby>协程<rt>goroutine</rt></ruby>（轻量级线程）和在 Go 中提供的 [使用][8] [信道][9] 和 [其它的并发][10] [同步方法][11]，使得并发编程变得很容易、很灵活和很有趣。

另一方面，Go 并不会阻止一些因 Go 程序员粗心大意或者缺乏经验而造成的并发编程错误。在本文的下面部分将展示一些在 Go 编程中常见的并发编程错误，以帮助 Go 程序员们避免再犯类似的错误。

### 需要同步的时候没有同步

代码行或许 [不是按出现的顺序运行的][2]。

在下面的程序中有两个错误。

*   第一，在 `main` 协程中读取 `b` 和在新的 协程 中写入 `b` 可能导致数据争用。
*   第二，条件 `b == true` 并不能保证在 `main` 协程 中的 `a != nil`。在新的协程中编译器和 CPU 可能会通过 [重排序指令][1] 进行优化，因此，在运行时 `b` 赋值可能发生在 `a` 赋值之前，在 `main` 协程 中当 `a` 被修改后，它将会让部分 `a` 一直保持为 `nil`。

```
package main

import (
	"time"
	"runtime"
)

func main() {
	var a []int // nil
	var b bool  // false

	// a new goroutine
	go func () {
		a = make([]int, 3)
		b = true // write b
	}()

	for !b { // read b
		time.Sleep(time.Second)
		runtime.Gosched()
	}
	a[0], a[1], a[2] = 0, 1, 2 // might panic
}
```

上面的程序或者在一台计算机上运行的很好，但是在另一台上可能会引发异常。或者它可能运行了 _N_ 次都很好，但是可能在第 _(N+1)_ 次引发了异常。

我们将使用 `sync` 标准包中提供的信道或者同步方法去确保内存中的顺序。例如，

```
package main

func main() {
	var a []int = nil
	c := make(chan struct{})

	// a new goroutine
	go func () {
		a = make([]int, 3)
		c <- struct{}{}
	}()

	<-c
	a[0], a[1], a[2] = 0, 1, 2
}

```

### 使用 `time.Sleep` 调用去做同步

我们先来看一个简单的例子。

```
package main

import (
	"fmt"
	"time"
)

func main() {
	var x = 123

	go func() {
		x = 789 // write x
	}()

	time.Sleep(time.Second)
	fmt.Println(x) // read x
}

```

我们预期程序将打印出 `789`。如果我们运行它，通常情况下，它确定打印的是 `789`。但是，这个程序使用的同步方式好吗？No！原因是 Go 运行时并不保证 `x` 的写入一定会发生在 `x` 的读取之前。在某些条件下，比如在同一个操作系统上，大部分 CPU 资源被其它运行的程序所占用的情况下，写入 `x` 可能就会发生在读取 `x` 之后。这就是为什么我们在正式的项目中，从来不使用 `time.Sleep` 调用去实现同步的原因。

我们来看一下另外一个示例。

```
package main

import (
	"fmt"
	"time"
)

var x = 0

func main() {
	var num = 123
	var p = &num

	c := make(chan int)

	go func() {
		c <- *p + x
	}()

	time.Sleep(time.Second)
	num = 789
	fmt.Println(<-c)
}
```

你认为程序的预期输出是什么？`123` 还是 `789`？事实上它的输出与编译器有关。对于标准的 Go 编译器 1.10 来说，这个程序很有可能输出是 `123`。但是在理论上，它可能输出的是 `789`，或者其它的随机数。

现在，我们来改变 `c <- *p + x` 为 `c <- *p`，然后再次运行这个程序。你将会发现输出变成了 `789` （使用标准的 Go 编译器 1.10）。这再次说明它的输出是与编译器相关的。

是的，在上面的程序中存在数据争用。表达式 `*p` 可能会被先计算、后计算、或者在处理赋值语句 `num = 789` 时计算。`time.Sleep` 调用并不能保证 `*p` 发生在赋值语句处理之前进行。

对于这个特定的示例，我们将在新的协程创建之前，将值保存到一个临时值中，然后在新的协程中使用临时值去消除数据争用。

```
...
	tmp := *p + x
	go func() {
		c <- tmp
	}()
...
```

### 使协程挂起

挂起协程是指让协程一直处于阻塞状态。导致协程被挂起的原因很多。比如，

*   一个协程尝试从一个 nil 信道中或者从一个没有其它协程给它发送值的信道中检索数据。
*   一个协程尝试去发送一个值到 nil 信道，或者发送到一个没有其它的协程接收值的信道中。
*   一个协程被它自己死锁。
*   一组协程彼此死锁。
*   当运行一个没有 `default` 分支的 `select` 代码块时，一个协程被阻塞，以及在 `select` 代码块中  `case` 关键字后的所有信道操作保持阻塞状态。

除了有时我们为了避免程序退出，特意让一个程序中的 `main` 协程保持挂起之外，大多数其它的协程挂起都是意外情况。Go 运行时很难判断一个协程到底是处于挂起状态还是临时阻塞。因此，Go  运行时并不会去释放一个挂起的协程所占用的资源。

在 [谁先响应谁获胜][12] 的信道使用案例中，如果使用的 future 信道容量不够大，当尝试向 Future 信道发送结果时，一些响应较慢的信道将被挂起。比如，如果调用下面的函数，将有 4 个协程处于永远阻塞状态。

```
func request() int {
	c := make(chan int)
	for i := 0; i < 5; i++ {
		i := i
		go func() {
			c <- i // 4 goroutines will hang here.
		}()
	}
	return <-c
}
```

为避免这 4 个协程一直处于挂起状态， `c` 信道的容量必须至少是  `4`。

在 [实现谁先响应谁获胜的第二种方法][13] 的信道使用案例中，如果将 future 信道用做非缓冲信道，那么有可能这个信息将永远也不会有响应而挂起。例如，如果在一个协程中调用下面的函数，协程可能会挂起。原因是，如果接收操作  `<-c` 准备就绪之前，五个发送操作全部尝试发送，那么所有的尝试发送的操作将全部失败，因此那个调用者协程将永远也不会接收到值。

```
func request() int {
	c := make(chan int)
	for i := 0; i < 5; i++ {
		i := i
		go func() {
			select {
			case c <- i:
			default:
			}
		}()
	}
	return <-c
}
```

将信道 `c` 变成缓冲信道将保证五个发送操作中的至少一个操作会发送成功，这样，上面函数中的那个调用者协程将不会被挂起。

### 在 `sync` 标准包中拷贝类型值

在实践中，`sync` 标准包中的类型值不会被拷贝。我们应该只拷贝这个值的指针。

下面是一个错误的并发编程示例。在这个示例中，当调用 `Counter.Value` 方法时，将拷贝一个 `Counter` 接收值。作为接收值的一个字段，`Counter` 接收值的各个 `Mutex` 字段也会被拷贝。拷贝不是同步发生的，因此，拷贝的 `Mutex` 值可能会出错。即便是没有错误，拷贝的 `Counter` 接收值的访问保护也是没有意义的。

```
import "sync"

type Counter struct {
	sync.Mutex
	n int64
}

// This method is okay.
func (c *Counter) Increase(d int64) (r int64) {
	c.Lock()
	c.n += d
	r = c.n
	c.Unlock()
	return
}

// The method is bad. When it is called, a Counter
// receiver value will be copied.
func (c Counter) Value() (r int64) {
	c.Lock()
	r = c.n
	c.Unlock()
	return
}

```

我们只需要改变 `Value` 接收类型方法为指针类型 `*Counter`，就可以避免拷贝 `Mutex` 值。

在官方的 Go SDK 中提供的 `go vet` 命令将会报告潜在的错误值拷贝。

### 在错误的地方调用 `sync.WaitGroup` 的方法

每个 `sync.WaitGroup` 值维护一个内部计数器，这个计数器的初始值为 0。如果一个 `WaitGroup` 计数器的值是 0，调用 `WaitGroup` 值的 `Wait` 方法就不会被阻塞，否则，在计数器值为 0 之前，这个调用会一直被阻塞。

为了让 `WaitGroup` 值的使用有意义，当一个 `WaitGroup` 计数器值为 0 时，必须在相应的 `WaitGroup` 值的  `Wait` 方法调用之前，去调用 `WaitGroup` 值的 `Add` 方法。

例如，下面的程序中，在不正确位置调用了 `Add` 方法，这将使最后打印出的数字不总是 `100`。事实上，这个程序最后打印的数字可能是在 `[0, 100)` 范围内的一个随意数字。原因就是 `Add` 方法的调用并不保证一定会发生在 `Wait` 方法调用之前。

```
package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

func main() {
	var wg sync.WaitGroup
	var x int32 = 0
	for i := 0; i < 100; i++ {
		go func() {
			wg.Add(1)
			atomic.AddInt32(&x, 1)
			wg.Done()
		}()
	}

	fmt.Println("To wait ...")
	wg.Wait()
	fmt.Println(atomic.LoadInt32(&x))
}

```

为让程序的表现符合预期，在 `for` 循环中，我们将把 `Add` 方法的调用移动到创建的新协程的范围之外，修改后的代码如下。

```
...
	for i := 0; i < 100; i++ {
		wg.Add(1)
		go func() {
			atomic.AddInt32(&x, 1)
			wg.Done()
		}()
	}
...
```

### 不正确使用 futures 信道

在 [信道使用案例][14] 的文章中，我们知道一些函数将返回 [futures 信道][15]。假设 `fa` 和 `fb` 就是这样的两个函数，那么下面的调用就使用了不正确的 future 参数。

```
doSomethingWithFutureArguments(<-fa(), <-fb())
```

在上面的代码行中，两个信道接收操作是顺序进行的，而不是并发的。我们做如下修改使它变成并发操作。

```
ca, cb := fa(), fb()
doSomethingWithFutureArguments(<-c1, <-c2)
```

### 没有等协程的最后的活动的发送结束就关闭信道

Go 程序员经常犯的一个错误是，还有一些其它的协程可能会发送值到以前的信道时，这个信道就已经被关闭了。当这样的发送（发送到一个已经关闭的信道）真实发生时，将引发一个异常。

这种错误在一些以往的著名 Go 项目中也有发生，比如在 Kubernetes 项目中的 [这个 bug][3] 和 [这个 bug][4]。

如何安全和优雅地关闭信道，请阅读 [这篇文章][5]。

### 在值上做 64 位原子操作时没有保证值地址 64 位对齐

到目前为止（Go 1.10），在标准的 Go 编译器中，在一个 64 位原子操作中涉及到的值的地址要求必须是 64 位对齐的。如果没有对齐则导致当前的协程异常。对于标准的 Go 编译器来说，这种失败仅发生在 32 位的架构上。请阅读 [内存布局][6] 去了解如何在一个 32 位操作系统上保证 64 位对齐。

### 没有注意到大量的资源被 `time.After` 函数调用占用

在 `time` 标准包中的 `After` 函数返回 [一个延迟通知的信道][7]。这个函数在某些情况下用起来很便捷，但是，每次调用它将创建一个 `time.Timer` 类型的新值。这个新创建的 `Timer` 值在通过传递参数到  `After` 函数指定期间保持激活状态，如果在这个期间过多的调用了该函数，可能会有太多的 `Timer` 值保持激活，这将占用大量的内存和计算资源。

例如，如果调用了下列的 `longRunning` 函数，将在一分钟内产生大量的消息，然后在某些周期内将有大量的 `Timer` 值保持激活，即便是大量的这些 `Timer` 值已经没用了也是如此。

```
import (
	"fmt"
	"time"
)

// The function will return if a message arrival interval
// is larger than one minute.
func longRunning(messages <-chan string) {
	for {
		select {
		case <-time.After(time.Minute):
			return
		case msg := <-messages:
			fmt.Println(msg)
		}
	}
}
```

为避免在上述代码中创建过多的 `Timer` 值，我们将使用一个单一的 `Timer` 值去完成同样的任务。

```
func longRunning(messages <-chan string) {
	timer := time.NewTimer(time.Minute)
	defer timer.Stop()

	for {
		select {
		case <-timer.C:
			return
		case msg := <-messages:
			fmt.Println(msg)
			if !timer.Stop() {
				<-timer.C
			}
		}

		// The above "if" block can also be put here.

		timer.Reset(time.Minute)
	}
}

```

### 不正确地使用 `time.Timer` 值

在最后，我们将展示一个符合语言使用习惯的 `time.Timer` 值的使用示例。需要注意的一个细节是，那个 `Reset` 方法总是在停止或者 `time.Timer` 值释放时被使用。

在 `select` 块的第一个 `case` 分支的结束部分，`time.Timer` 值被释放，因此，我们不需要去停止它。但是必须在第二个分支中停止定时器。如果在第二个分支中 `if` 代码块缺失，它可能至少在 `Reset` 方法调用时，会（通过 Go 运行时）发送到 `timer.C` 信道，并且那个 `longRunning` 函数可能会早于预期返回，对于 `Reset` 方法来说，它可能仅仅是重置内部定时器为 0，它将不会清理（耗尽）那个发送到 `timer.C` 信道的值。

例如，下面的程序很有可能在一秒内而不是十秒时退出。并且更重要的是，这个程序并不是 DRF 的（LCTT 译注：data race free，多线程程序的一种同步程度）。

```
package main

import (
	"fmt"
	"time"
)

func main() {
	start := time.Now()
	timer := time.NewTimer(time.Second/2)
	select {
	case <-timer.C:
	default:
		time.Sleep(time.Second) // go here
	}
	timer.Reset(time.Second * 10)
	<-timer.C
	fmt.Println(time.Since(start)) // 1.000188181s
}
```

当 `time.Timer` 的值不再被其它任何一个东西使用时，它的值可能被停留在一种非停止状态，但是，建议在结束时停止它。

在多个协程中如果不按建议使用 `time.Timer` 值并发，可能会有 bug 隐患。

我们不应该依赖一个 `Reset` 方法调用的返回值。`Reset` 方法返回值的存在仅仅是为了兼容性目的。

--------------------------------------------------------------------------------

via: https://go101.org/article/concurrent-common-mistakes.html

作者：[go101.org][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:go101.org
[1]:https://go101.org/article/memory-model.html
[2]:https://go101.org/article/memory-model.html
[3]:https://github.com/kubernetes/kubernetes/pull/45291/files?diff=split
[4]:https://github.com/kubernetes/kubernetes/pull/39479/files?diff=split
[5]:https://go101.org/article/channel-closing.html
[6]:https://go101.org/article/memory-layout.html
[7]:https://go101.org/article/channel-use-cases.html#timer
[8]:https://go101.org/article/channel-use-cases.html
[9]:https://go101.org/article/channel.html
[10]:https://go101.org/article/concurrent-atomic-operation.html
[11]:https://go101.org/article/concurrent-synchronization-more.html
[12]:https://go101.org/article/channel-use-cases.html#first-response-wins
[13]:https://go101.org/article/channel-use-cases.html#first-response-wins-2
[14]:https://go101.org/article/channel-use-cases.html
[15]:https://go101.org/article/channel-use-cases.html#future-promise
