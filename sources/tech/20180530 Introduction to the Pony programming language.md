Introduction to the Pony programming language
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keys.jpg?itok=O4qaYCHK)

At [Wallaroo Labs][1], where I'm the VP of engineering, we're are building a [high-performance, distributed stream processor][2] written in the [Pony][3] programming language. Most people haven't heard of Pony, but it has been an excellent choice for Wallaroo, and it might be an excellent choice for your next project, too.

> "A programming language is just another tool. It's not about syntax. It's not about expressiveness. It's not about paradigms or models. It's about managing hard problems." —Sylvan Clebsch, creator of Pony

I'm a contributor to the Pony project, but here I'll touch on why Pony is a good choice for applications like Wallaroo and share ways I've used Pony. If you are interested in a more in-depth look at why we use Pony to write Wallaroo, we have a [blog post][4] about that.

### What is Pony?

You can think of Pony as something like "Rust meets Erlang." Pony sports buzzworthy features. It is:

  * Type-safe
  * Memory-safe
  * Exception-safe
  * Data-race-free
  * Deadlock-free



Additionally, it's compiled to efficient native code, and it's developed in the open and available under a two-clause BSD license.

That's a lot of features, but here I'll focus on the few that were key to my company adopting Pony.

### Why Pony?

Writing fast, safe, efficient, highly concurrent programs is not easy with most of our existing tools. "Fast, efficient, and highly concurrent" is an achievable goal, but throw in "safe," and things get a lot harder. With Wallaroo, we wanted to accomplish all four, and Pony has made it easy to achieve.

#### Highly concurrent

Pony makes concurrency easy. Part of the way it does that is by providing an opinionated concurrency story. In Pony, all concurrency happens via the [actor model][5].

The actor model is most famous via the implementations in Erlang and Akka. The actor model has been around since the 1970s, and details vary widely from implementation to implementation. What doesn't vary is that all computation is executed by actors that communicate via asynchronous messaging.

Think of the actor model this way: objects in object-oriented programming are state + synchronous methods and actors are state + asynchronous methods.

When an actor receives a message, it executes a corresponding method. That method might operate on a state that is accessible by only that actor. The actor model allows us to use a mutable state in a concurrency-safe manner. Every actor is single-threaded. Two methods within an actor are never run concurrently. This means that, within a given actor, data updates cannot cause data races or other problems commonly associated with threads and mutable states.

#### Fast and efficient

Pony actors are scheduled with an efficient work-stealing scheduler. There's a single Pony scheduler per available CPU. The thread-per-core concurrency model is part of Pony's attempt to work in concert with the CPU to operate as efficiently as possible. The Pony runtime attempts to be as CPU-cache friendly as possible. The less your code thrashes the cache, the better it will run. Pony aims to help your code play nice with CPU caches.

The Pony runtime also features per-actor heaps so that, during garbage collection, there's no "stop the world" garbage collection step. This means your program is always doing at least some work. As a result, Pony programs end up with very consistent performance and predictable latencies.

#### Safe

The Pony type system introduces a novel concept: reference capabilities, which make data safety part of the type system. The type of every variable in Pony includes information about how the data can be shared between actors. The Pony compiler uses the information to verify, at compile time, that your code is data-race- and deadlock-free.

If this sounds a bit like Rust, it's because it is. Pony's reference capabilities and Rust's borrow checker both provide data safety; they just approach it in different ways and have different tradeoffs.

### Is Pony right for you?

Deciding whether to use a new programming language for a non-hobby project is hard. You must weigh the appropriateness of the tool against its immaturity compared to other solutions. So, what about Pony and you?

Pony might be the right solution if you have a hard concurrency problem to solve. Concurrent applications are Pony's raison d'être. If you can accomplish what you want in a single-threaded Python script, you probably don't need Pony. If you have a hard concurrency problem, you should consider Pony and its powerful data-race-free, concurrency-aware type system.

You'll get a compiler that will prevent you from introducing many concurrency-related bugs and a runtime that will give you excellent performance characteristics.

### Getting started with Pony

If you're ready to get started with Pony, your first visit should be the [Learn section][6] of the Pony website. There you will find directions for installing the Pony compiler and resources for learning the language.

If you like to contribute to the language you are using, we have some [beginner-friendly issues][7] waiting for you on GitHub.

Also, I can't wait to start talking with you on [our IRC channel][8] and the [Pony mailing list][9].

To learn more about Pony, attend Sean Allen's talk, [Pony: How I learned to stop worrying and embrace an unproven technology][10], at the [20th OSCON][11], July 16-19, 2018, in Portland, Ore.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/pony

作者：[Sean T Allen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/seantallen
[1]:http://www.wallaroolabs.com/
[2]:https://github.com/wallaroolabs/wallaroo
[3]:https://www.ponylang.org/
[4]:https://blog.wallaroolabs.com/2017/10/why-we-used-pony-to-write-wallaroo/
[5]:https://en.wikipedia.org/wiki/Actor_model
[6]:https://www.ponylang.org/learn/
[7]:https://github.com/ponylang/ponyc/issues?q=is%3Aissue+is%3Aopen+label%3A%22complexity%3A+beginner+friendly%22
[8]:https://webchat.freenode.net/?channels=%23ponylang
[9]:https://pony.groups.io/g/user
[10]:https://conferences.oreilly.com/oscon/oscon-or/public/schedule/speaker/213590
[11]:https://conferences.oreilly.com/oscon/oscon-or
