[#]: collector: (lujun9972)
[#]: translator: (gxlct008)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Go channels are bad and you should feel bad)
[#]: via: (https://www.jtolio.com/2016/03/go-channels-are-bad-and-you-should-feel-bad)
[#]: author: (jtolio.com https://www.jtolio.com/)

Go channels are bad and you should feel bad
======

_Update: If you’re coming to this blog post from a compendium titled “Go is not good,” I want to make it clear that I am ashamed to be on such a list. Go is absolutely the least worst programming language I’ve ever used. At the time I wrote this, I wanted to curb a trend I was seeing, namely, overuse of one of the more warty parts of Go. I still think channels could be much better, but overall, Go is wonderful. It’s like if your favorite toolbox had [this][1] in it; the tool can have uses (even if it could have had more uses), and it can still be your favorite toolbox!_

_Update 2: I would be remiss if I didn’t point out this excellent survey of real issues: [Understanding Real-World Concurrency Bugs In Go][2]. A significant finding of this survey is that… Go channels cause lots of bugs._

I’ve been using Google’s [Go programming language][3] on and off since mid-to-late 2010, and I’ve had legitimate product code written in Go for [Space Monkey][4] since January 2012 (before Go 1.0!). My initial experience with Go was back when I was researching Hoare’s [Communicating Sequential Processes][5] model of concurrency and the [π-calculus][6] under [Matt Might][7]’s [UCombinator research group][8] as part of my ([now redirected][9]) PhD work to better enable multicore development. Go was announced right then (how serendipitous!) and I immediately started kicking tires.

It quickly became a core part of Space Monkey development. Our production systems at Space Monkey currently account for over 425k lines of pure Go (_not_ counting all of our vendored libraries, which would make it just shy of 1.5 million lines), so not the most Go you’ll ever see, but for the relatively young language we’re heavy users. We’ve [written about our Go usage][10] before. We’ve open-sourced some fairly heavily used libraries; many people seem to be fans of our [OpenSSL bindings][11] (which are faster than [crypto/tls][12], but please keep openssl itself up-to-date!), our [error handling library][13], [logging library][14], and [metric collection library/zipkin client][15]. We use Go, we love Go, we think it’s the least bad programming language for our needs we’ve used so far.

Although I don’t think I can talk myself out of mentioning my widely avoided [goroutine-local-storage library][16] here either (which even though it’s a hack that you shouldn’t use, it’s a beautiful hack), hopefully my other experience will suffice as valid credentials that I kind of know what I’m talking about before I explain my deliberately inflamatory post title.

![][17]

### Wait, what?

If you ask the proverbial programmer on the street what’s so special about Go, she’ll most likely tell you that Go is most known for channels and goroutines. Go’s theoretical underpinnings are heavily based in Hoare’s CSP model, which is itself incredibly fascinating and interesting and I firmly believe has much more to yield than we’ve appropriated so far.

CSP (and the π-calculus) both use communication as the core synchronization primitive, so it makes sense Go would have channels. Rob Pike has been fascinated with CSP (with good reason) for a [considerable][18] [while][19] [now][20].

But from a pragmatic perspective (which Go prides itself on), Go got channels wrong. Channels as implemented are pretty much a solid anti-pattern in my book at this point. Why? Dear reader, let me count the ways.

#### You probably won’t end up using just channels.

Hoare’s Communicating Sequential Processes is a computational model where essentially the only synchronization primitive is sending or receiving on a channel. As soon as you use a mutex, semaphore, or condition variable, bam, you’re no longer in pure CSP land. Go programmers often tout this model and philosophy through the chanting of the [cached thought][21] “[share memory by communicating][22].”

So let’s try and write a small program using just CSP in Go! Let’s make a high score receiver. All we will do is keep track of the largest high score value we’ve seen. That’s it.

First, we’ll make a `Game` struct.

```
type Game struct {
  bestScore int
  scores    chan int
}
```

`bestScore` isn’t going to be protected by a mutex! That’s fine, because we’ll simply have one goroutine manage its state and receive new scores over a channel.

```
func (g *Game) run() {
  for score := range g.scores {
    if g.bestScore < score {
      g.bestScore = score
    }
  }
}
```

Okay, now we’ll make a helpful constructor to start a game.

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

Next, let’s assume someone has given us a `Player` that can return scores. It might also return an error, cause hey maybe the incoming TCP stream can die or something, or the player quits.

```
type Player interface {
  NextScore() (score int, err error)
}
```

To handle the player, we’ll assume all errors are fatal and pass received scores down the channel.

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

Yay! Okay, we have a `Game` type that can keep track of the highest score a `Player` receives in a thread-safe way.

You wrap up your development and you’re on your way to having customers. You make this game server public and you’re incredibly successful! Lots of games are being created with your game server.

Soon, you discover people sometimes leave your game. Lots of games no longer have any players playing, but nothing stopped the game loop. You are getting overwhelmed by dead `(*Game).run` goroutines.

**Challenge:** fix the goroutine leak above without mutexes or panics. For real, scroll up to the above code and come up with a plan for fixing this problem using just channels.

I’ll wait.

For what it’s worth, it totally can be done with channels only, but observe the simplicity of the following solution which doesn’t even have this problem:

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

Which one would you rather work on? Don’t be deceived into thinking that the channel solution somehow makes this more readable and understandable in more complex cases. Teardown is very hard. This sort of teardown is just a piece of cake with a mutex, but the hardest thing to work out with Go-specific channels only. Also, if anyone replies that channels sending channels is easier to reason about here it will cause me an immediate head-to-desk motion.

Importantly, this particular case might actually be _easily_ solved _with channels_ with some runtime assistance Go doesn’t provide! Unfortunately, as it stands, there are simply a surprising amount of problems that are solved better with traditional synchronization primitives than with Go’s version of CSP. We’ll talk about what Go could have done to make this case easier later.

**Exercise:** Still skeptical? Try making both solutions above (channel-only vs. mutex-only) stop asking for scores from `Players` once `bestScore` is 100 or greater. Go ahead and open your text editor. This is a small, toy problem.

The summary here is that you will be using traditional synchronization primitives in addition to channels if you want to do anything real.

#### Channels are slower than implementing it yourself

One of the things I assumed about Go being so heavily based in CSP theory is that there should be some pretty killer scheduler optimizations the runtime can make with channels. Perhaps channels aren’t always the most straightforward primitive, but surely they’re efficient and fast, right?

![][23]

As [Dustin Hiatt][24] points out on [Tyler Treat’s post about Go][25],

> Behind the scenes, channels are using locks to serialize access and provide threadsafety. So by using channels to synchronize access to memory, you are, in fact, using locks; locks wrapped in a threadsafe queue. So how do Go’s fancy locks compare to just using mutex’s from their standard library `sync` package? The following numbers were obtained by using Go’s builtin benchmarking functionality to serially call Put on a single set of their respective types.

```
>     BenchmarkSimpleSet-8 3000000 391 ns/op
>     BenchmarkSimpleChannelSet-8 1000000 1699 ns/o
>
```

It’s a similar story with unbuffered channels, or even the same test under contention instead of run serially.

Perhaps the Go scheduler will improve, but in the meantime, good old mutexes and condition variables are very good, efficient, and fast. If you want performance, you use the tried and true methods.

#### Channels don’t compose well with other concurrency primitives

Alright, so hopefully I have convinced you that you’ll at least be interacting with primitives besides channels sometimes. The standard library certainly seems to prefer traditional synchronization primitives over channels.

Well guess what, it’s actually somewhat challenging to use channels alongside mutexes and condition variables correctly!

One of the interesting things about channels that makes a lot of sense coming from CSP is that channel sends are synchronous. A channel send and channel receive are intended to be synchronization barriers, and the send and receive should happen at the same virtual time. That’s wonderful if you’re in well-executed CSP-land.

![][26]

Pragmatically, Go channels also come in a buffered variety. You can allocate a fixed amount of space to account for possible buffering so that sends and receives are disparate events, but the buffer size is capped. Go doesn’t provide a way to have arbitrarily sized buffers - you have to allocate the buffer size in advance. _This is fine_, I’ve seen people argue on the mailing list, _because memory is bounded anyway._

Wat.

This is a bad answer. There’s all sorts of reasons to use an arbitrarily buffered channel. If we knew everything up front, why even have `malloc`?

Not having arbitrarily buffered channels means that a naive send on _any_ channel could block at any time. You want to send on a channel and update some other bookkeeping under a mutex? Careful! Your channel send might block!

```
// ...
s.mtx.Lock()
// ...
s.ch <- val // might block!
s.mtx.Unlock()
// ...
```

This is a recipe for dining philosopher dinner fights. If you take a lock, you should quickly update state and release it and not do anything blocking under the lock if possible.

There is a way to do a non-blocking send on a channel in Go, but it’s not the default behavior. Assume we have a channel `ch := make(chan int)` and we want to send the value `1` on it without blocking. Here is the minimum amount of typing you have to do to send without blocking:

```
select {
case ch <- 1: // it sent
default: // it didn't
}
```

This isn’t what naturally leaps to mind for beginning Go programmers.

The summary is that because many operations on channels block, it takes careful reasoning about philosophers and their dining to successfully use channel operations alongside and under mutex protection, without causing deadlocks.

#### Callbacks are strictly more powerful and don’t require unnecessary goroutines.

![][27]

Whenever an API uses a channel, or whenever I point out that a channel makes something hard, someone invariably points out that I should just spin up a goroutine to read off the channel and make whatever translation or fix I need as it reads of the channel.

Um, no. What if my code is in a hotpath? There’s very few instances that require a channel, and if your API could have been designed with mutexes, semaphores, and callbacks and no additional goroutines (because all event edges are triggered by API events), then using a channel forces me to add another stack of memory allocation to my resource usage. Goroutines are much lighter weight than threads, yes, but lighter weight doesn’t mean the lightest weight possible.

As I’ve formerly [argued in the comments on an article about using channels][28] (lol the internet), your API can _always_ be more general, _always_ more flexible, and take drastically less resources if you use callbacks instead of channels. “Always” is a scary word, but I mean it here. There’s proof-level stuff going on.

If someone provides a callback-based API to you and you need a channel, you can provide a callback that sends on a channel with little overhead and full flexibility.

If, on the other hand, someone provides a channel-based API to you and you need a callback, you have to spin up a goroutine to read off the channel _and_ you have to hope that no one tries to send more on the channel when you’re done reading so you cause blocked goroutine leaks.

For a super simple real-world example, check out the [context interface][29] (which incidentally is an incredibly useful package and what you should be using instead of [goroutine-local storage][16]):

```
type Context interface {
  ...
  // Done returns a channel that closes when this work unit should be canceled.
  Done() <-chan struct{}

  // Err returns a non-nil error when the Done channel is closed
  Err() error
  ...
}
```

Imagine all you want to do is log the corresponding error when the `Done()` channel fires. What do you have to do? If you don’t have a good place you’re already selecting on a channel, you have to spin up a goroutine to deal with it:

```
go func() {
  <-ctx.Done()
  logger.Errorf("canceled: %v", ctx.Err())
}()
```

What if `ctx` gets garbage collected without closing the channel `Done()` returned? Whoops! Just leaked a goroutine!

Now imagine we changed `Done`’s signature:

```
// Done calls cb when this work unit should be canceled.
Done(cb func())
```

First off, logging is so easy now. Check it out: `ctx.Done(func() { log.Errorf("canceled: %v", ctx.Err()) })`. But lets say you really do need some select behavior. You can just call it like this:

```
ch := make(chan struct{})
ctx.Done(func() { close(ch) })
```

Voila! No expressiveness lost by using a callback instead. `ch` works like the channel `Done()` used to return, and in the logging case we didn’t need to spin up a whole new stack. I got to keep my stack traces (if our log package is inclined to use them); I got to avoid another stack allocation and another goroutine to give to the scheduler.

Next time you use a channel, ask yourself if there’s some goroutines you could eliminate if you used mutexes and condition variables instead. If the answer is yes, your code will be more efficient if you change it. And if you’re trying to use channels just to be able to use the `range` keyword over a collection, I’m going to have to ask you to put your keyboard away or just go back to writing Python books.

![more like Zooey De-channel, amirite][30]

#### The channel API is inconsistent and just cray-cray

Closing or sending on a closed channel panics! Why? If you want to close a channel, you need to either synchronize its closed state externally (with mutexes and so forth that don’t compose well!) so that other writers don’t write to or close a closed channel, or just charge forward and close or write to closed channels and expect you’ll have to recover any raised panics.

This is such bizarre behavior. Almost every other operation in Go has a way to avoid a panic (type assertions have the `, ok =` pattern, for example), but with channels you just get to deal with it.

Okay, so when a send will fail, channels panic. I guess that makes some kind of sense. But unlike almost everything else with nil values, sending to a nil channel won’t panic. Instead, it will block forever! That’s pretty counter-intuitive. That might be useful behavior, just like having a can-opener attached to your weed-whacker might be useful (and found in Skymall), but it’s certainly unexpected. Unlike interacting with nil maps (which do implicit pointer dereferences), nil interfaces (implicit pointer dereferences), unchecked type assertions, and all sorts of other things, nil channels exhibit actual channel behavior, as if a brand new channel was just instantiated for this operation.

Receives are slightly nicer. What happens when you receive on a closed channel? Well, that works - you get a zero value. Okay that makes sense I guess. Bonus! Receives allow you to do a `, ok =`-style check if the channel was open when you received your value. Thank heavens we get `, ok =` here.

But what happens if you receive from a nil channel? _Also blocks forever!_ Yay! Don’t try and use the fact that your channel is nil to keep track of if you closed it!

### What are channels good for?

Of course channels are good for some things (they are a generic container after all), and there are certain things you can only do with them (`select`).

#### They are another special-cased generic datastructure

Go programmers are so used to arguments about generics that I can feel the PTSD coming on just by bringing up the word. I’m not here to talk about it so wipe the sweat off your brow and let’s keep moving.

Whatever your opinion of generics is, Go’s maps, slices, and channels are data structures that support generic element types, because they’ve been special-cased into the language.

In a language that doesn’t allow you to write your own generic containers, _anything_ that allows you to better manage collections of things is valuable. Here, channels are a thread-safe datastructure that supports arbitrary value types.

So that’s useful! That can save some boilerplate I suppose.

I’m having trouble counting this as a win for channels.

#### Select

The main thing you can do with channels is the `select` statement. Here you can wait on a fixed number of inputs for events. It’s kind of like epoll, but you have to know upfront how many sockets you’re going to be waiting on.

This is truly a useful language feature. Channels would be a complete wash if not for `select`. But holy smokes, let me tell you about the first time you decide you might need to select on multiple things but you don’t know how many and you have to use `reflect.Select`.

### How could channels be better?

It’s really tough to say what the most tactical thing the Go language team could do for Go 2.0 is (the Go 1.0 compatibility guarantee is good but hand-tying), but that won’t stop me from making some suggestions.

#### Select on condition variables!

We could just obviate the need for channels! This is where I propose we get rid of some sacred cows, but let me ask you this, how great would it be if you could select on any custom synchronization primitive? (A: So great.) If we had that, we wouldn’t need channels at all.

#### GC could help us?

In the very first example, we could easily solve the high score server cleanup with channels if we were able to use directionally-typed channel garbage collection to help us clean up.

![][31]

As you know, Go has directionally-typed channels. You can have a channel type that only supports reading (`<-chan`) and a channel type that only supports writing (`chan<-`). Great!

Go also has garbage collection. It’s clear that certain kinds of book keeping are just too onerous and we shouldn’t make the programmer deal with them. We clean up unused memory! Garbage collection is useful and neat.

So why not help clean up unused or deadlocked channel reads? Instead of having `make(chan Whatever)` return one bidirectional channel, have it return two single-direction channels (`chanReader, chanWriter := make(chan Type)`).

Let’s reconsider the original example:

```
type Game struct {
  bestScore int
  scores    chan<- int
}

func run(bestScore *int, scores <-chan int) {
  // we don't keep a reference to a *Game directly because then we'd be holding
  // onto the send side of the channel.
  for score := range scores {
    if *bestScore < score {
      *bestScore = score
    }
  }
}

func NewGame() (g *Game) {
  // this make(chan) return style is a proposal!
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

If garbage collection closed a channel when we could prove no more values are ever coming down it, this solution is completely fixed. Yes yes, the comment in `run` is indicative of the existence of a rather large gun aimed at your foot, but at least the problem is easily solveable now, whereas it really wasn’t before. Furthermore, a smart compiler could probably make appropriate proofs to reduce the damage from said foot-gun.

#### Other smaller issues

  * **Dup channels?** \- If we could use an equivalent of the `dup` syscall on channels, then we could also solve the multiple producer problem quite easily. Each producer could close their own `dup`-ed channel without ruining the other producers.
  * **Fix the channel API!** \- Close isn’t idempotent? Send on closed channel panics with no way to avoid it? Ugh!
  * **Arbitrarily buffered channels** \- If we could make buffered channels with no fixed buffer size limit, then we could make channels that don’t block.



### What do we tell people about Go then?

If you haven’t yet, please go take a look at my current favorite programming post: [What Color is Your Function][32]. Without being about Go specifically, this blog post much more eloquently than I could lays out exactly why goroutines are Go’s best feature (and incidentally one of the ways Go is better than Rust for some applications).

If you’re still writing code in a programming language that forces keywords like `yield` on you to get high performance, concurrency, or an event-driven model, you are living in the past, whether or not you or anyone else knows it. Go is so far one of the best entrants I’ve seen of languages that implement an M:N threading model that’s not 1:1, and dang that’s powerful.

So, tell folks about goroutines.

If I had to pick one other leading feature of Go, it’s interfaces. Statically-typed [duck typing][33] makes extending and working with your own or someone else’s project so fun and amazing it’s probably worth me writing an entirely different set of words about it some other time.

### So…

I keep seeing people charge in to Go, eager to use channels to their full potential. Here’s my advice to you.

**JUST STAHP IT**

When you’re writing APIs and interfaces, as bad as the advice “never” can be, I’m pretty sure there’s never a time where channels are better, and every Go API I’ve used that used channels I’ve ended up having to fight. I’ve never thought “oh good, there’s a channel here;” it’s always instead been some variant of _**WHAT FRESH HELL IS THIS?**_

So, _please, please use channels where appropriate and only where appropriate._

In all of my Go code I work with, I can count on one hand the number of times channels were really the best choice. Sometimes they are. That’s great! Use them then. But otherwise just stop.

![][34]

_Special thanks for the valuable feedback provided by my proof readers Jeff Wendling, [Andrew Harding][35], [George Shank][36], and [Tyler Treat][37]._

If you want to work on Go with us at Space Monkey, please [hit me up][38]!

--------------------------------------------------------------------------------

via: https://www.jtolio.com/2016/03/go-channels-are-bad-and-you-should-feel-bad

作者：[jtolio.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
