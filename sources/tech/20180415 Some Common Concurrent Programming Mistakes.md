Translating by qhwdw
Some Common Concurrent Programming Mistakes
============================================================

Go is a language supporting built-in concurrent programming. By using the `go` keyword to create goroutines (light weight threads) and by [using][8] [channels][9] and [other concurrency][10] [synchronization techniques][11] provided in Go, concurrent programming becomes easy, flexible and enjoyable.

One the other hand, Go doesn't prevent Go programmers from making some concurrent programming mistakes which are caused by either carelessnesses or lacking of experiences. The remaining of the current article will show some common mistakes in Go concurrent programming, to help Go programmers avoid making such mistakes.

### No Synchronizations When Synchronizations Are Needed

Code lines may be [not executed by the appearance orders][2].

There are two mistakes in the following program.

*   First, the read of `b` in the main goroutine and the write of `b` in the new goroutine might cause data races.

*   Second, the condition `b == true` can't ensure that `a != nil` in the main goroutine. Compilers and CPUs may make optimizations by [reordering instructions][1] in the new goroutine, so the assignment of `b`may happen before the assignment of `a` at run time, which makes that slice `a` is still `nil` when the elements of `a` are modified in the main goroutine.

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

The above program may run well on one computer, but may panic on another one. Or it may run well for  _N_ times, but may panic at the  _(N+1)_ th time.

We should use channels or the synchronization techniques provided in the `sync` standard package to ensure the memory orders. For example,

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

### Use `time.Sleep` Calls To Do Synchronizations

Let's view a simple example.

```
ppackage main

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

We expect the program to print `789`. If we run it, it really prints `789`, almost always. But is it a program with good syncrhonization? No! The reason is Go runtime doesn't guarantee the write of `x` happens before the read of `x` for sure. Under certain conditions, such as most CPU resources are cunsumed by other programs running on same OS, the write of `x` might happen after the read of `x`. This is why we should never use `time.Sleep` calls to do syncrhonizations in formal projects.

Let's view another example.

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

What do you expect the program will output? `123`, or `789`? In fact, the output is compiler dependent. For the standard Go compiler 1.10, it is very possible the program will output `123`. But in theory, it might output `789`, or another random number.

Now, let's change `c <- *p + x` to `c <- *p` and run the program again. You will find the output becomes to `789` (for the he standard Go compiler 1.10). Again, the output is compiler dependent.

Yes, there are data races in the above program. The expression `*p` might be evaluated before, after, or when the assignment `num = 789` is processed. The `time.Sleep` call can't guarantee the evaluation of `*p`happens before the assignment is processed.

For this specified example, we should store the value to be sent in a temporary value before creating the new goroutine and send the temporary value instead in the new goroutine to remove the data races.

```
...
	tmp := *p + x
	go func() {
		c <- tmp
	}()
...

```

### Leave Goroutines Hanging

Hanging goroutines are the goroutines staying in blocking state for ever. There are many reasons leading goroutines into hanging. For example,

*   a goroutine tries to receive a value from a nil channel or from a channel which no more other goroutines will send values to.

*   a goroutine tries to send a value to nil channel or to a channel which no more other goroutines will receive values from.

*   a goroutine is dead locked by itself.

*   a group of goroutines are dead locked by each other.

*   a goroutine is blocked when executing a `select` code block without `default` branch, and all the channel operations following the `case` keywords in the `select` code block keep blocking for ever.

Except sometimes we deliberately let the main goroutine in a program hanging to avoid the program exiting, most other hanging goroutine cases are unexpected. It is hard for Go runtime to judge whether or not a goroutine in blocking state is hanging or stays in blocking state temporarily. So Go runtime will never release the resources consumed by a hanging goroutine.

In the [first-response-wins][12] channel use case, if the capacity of the channel which is used a future is not large enough, some slower response goroutines will hang when trying to send a result to the future channel. For example, if the following function is called, there will be 4 goroutines stay in blocking state for ever.

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

To avoid the four goroutines hanging, the capacity of channel `c` must be at least `4`.

In [the second way to implement the first-response-wins][13] channel use case, if the channel which is used as a future is an unbufferd channel, it is possible that the channel reveiver will never get a response and hang. For example, if the following function is called in a goroutine, the goroutine might hang. The reason is, if the five try-send operations all happen before the receive operation `<-c` is ready, then all the five try-send operations will fail to send values so that the caller goroutine will never receive a value.

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

Changing the channel `c` as a buffered channel will guarantee at least one of the five try-send operations succeed so that the caller goroutine will never hang in the above function.

### Copy Values Of The Types In The `sync` Standard Package

In practice, values of the types in the `sync` standard package shouldn't be copied. We should only copy pointers of such values.

The following is bad concurrent programming example. In this example, when the `Counter.Value` method is called, a `Counter` receiver value will be copied. As a field of the receiver value, the respective `Mutex` field of the `Counter` receiver value will also be copied. The copy is not synchronized, so the copied `Mutex` value might be corrupt. Even if it is not corrupt, what it protects is the accessment of the copied `Counter` receiver value, which is meaningless generally.

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

We should change the reveiver type of the `Value` method to the poiner type `*Counter` to avoid copying `Mutex` values.

The `go vet` command provided in the official Go SDK will report potential bad value copies.

### Call Methods Of `sync.WaitGroup` At Wrong Places

Each `sync.WaitGroup` value maintains a counter internally, The initial value of the counter is zero. If the counter of a `WaitGroup` value is zero, a call to the `Wait` method of the `WaitGroup` value will not block, otherwise, the call blocks until the counter value becomes zero.

To make the uses of `WaitGroup` value meaningful, when the counter of a `WaitGroup` value is zero, a call to the `Add` method of the `WaitGroup` value must happen before the corresponding call to the `Wait` method of the `WaitGroup` value.

For example, in the following program, the `Add` method is called at an improper place, which makes that the final printed number is not always `100`. In fact, the final printed number of the program may be an arbitrary number in the range `[0, 100)`. The reason is none of the `Add` method calls are guaranteed to happen before the `Wait` method call.

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

To make the program behave as expected, we should move the `Add` method calls out of the new goroutines created in the `for` loop, as the following code shown.

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

### Use Channels As Futures Improperly

From the article [channel use cases][14], we know that some functions will return [channels as futures][15]. Assume `fa` and `fb` are two such functions, then the following call uses future arguments improperly.

```
doSomethingWithFutureArguments(<-fa(), <-fb())

```

In the above code line, the two channel receive operations are processed in sequentially, instead of concurrently. We should modify it as the following to process them concurrently.

```
ca, cb := fa(), fb()
doSomethingWithFutureArguments(<-c1, <-c2)

```

### Close Channels Not From The Last Active Sender Goroutine

A common mistake made by Go programmers is closing a channel when there are still some other goroutines will potentially send values to the channel later. When such a potential send (to the closed channel) really happens, a panic will occur.

This mistake was ever made in some famous Go projects, such as [this bug][3] and [this bug][4] in the kubernetes project.

Please read [this article][5] for explanations on how to safely and gracefully close channels.

### Do 64-bit Atomic Operations On Values Which Are Not Guaranteed To Be 64-bit Aligned

Up to now (Go 1.10), for the standard Go compiler, the address of the value involved in a 64-bit atomic operation is required to be 64-bit aligned. Failure to do so may make the current goroutine panic. For the standard Go compiler, such failure can only happen on 32-bit architectures. Please read [memory layouts][6] to get how to guarantee the addresses of 64-bit word 64-bit aligned on 32-bit OSes.

### Not Pay Attention To Too Many Resources Are Consumed By Calls To The `time.After` Function

The `After` function in the `time` standard package returns [a channel for delay notification][7]. The function is convenient, however each of its calls will create a new value of the `time.Timer` type. The new created `Timer` value will keep alive in the duration specified by the passed argument to the `After` function. If the function is called many times in the duration, there will be many `Timer` values alive and consuming much memory and computation.

For example, if the following `longRunning` function is called and there are millions of messages coming in one minute, then there will be millions of `Timer` values alive in a certain period, even if most of these `Timer`values have already become useless.

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

To avoid too many `Timer` values being created in the above code, we should use a single `Timer` value to do the same job.

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

### Use `time.Timer` Values Incorrectly

An idiomatic use example of a `time.Timer` value has been shown in the last section. One detail which should be noted is that the `Reset` method should always be invoked on stopped or expired `time.Timer`values.

At the end of the first `case` branch of the `select` block, the `time.Timer` value has expired, so we don't need to stop it. But we must stop the timer in the second branch. If the `if` code block in the second branch is missing, it is possible that a send (by the Go runtime) to the channel `timer.C` races with the `Reset`method call, and it is possible that the `longRunning` function returns earlier than expected, for the `Reset`method will only reset the internal timer to zero, it will not clear (drain) the value which has been sent to the `timer.C` channel.

For example, the following program is very possible to exit in about one second, instead of ten seconds. and more importantly, the program is not data race free.

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

A `time.Timer` value can be leaved in non-stopping status when it is not used any more, but it is recommended to stop it in the end.

It is bug prone and not recommended to use a `time.Timer` value concurrently in multiple goroutines.

We should not rely on the return value of a `Reset` method call. The return result of the `Reset` method exists just for compatibility purpose.

--------------------------------------------------------------------------------

via: https://go101.org/article/concurrent-common-mistakes.html

作者：[go101.org ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
