[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The office coffee model of concurrent garbage collection)
[#]: via: (https://dave.cheney.net/2018/12/28/the-office-coffee-model-of-concurrent-garbage-collection)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

The office coffee model of concurrent garbage collection
======

Garbage collection is a field with its own terminology. Concepts like like _mutator_ s, _card marking_ , and _write barriers_ create a hurdle to understanding how garbage collectors work. Here’s an analogy to explain the operations of a concurrent garbage collector using everyday items found in the workplace.

Before we discuss the operation of _concurrent_ garbage collection, let’s introduce the dramatis personae. In offices around the world you’ll find one of these:

![][1]

In the workplace coffee is a natural resource. Employees visit the break room and fill their cups as required. That is, until the point someone goes to fill their cup only to discover the pot is _empty_!

Immediately the office is thrown into chaos. Meeting are called. Investigations are held. The perpetrator who took the last cup without refilling the machine is found and [reprimanded][2]. Despite many passive aggressive notes the situation keeps happening, thus a committee is formed to decide if a larger coffee pot should be requisitioned. Once the coffee maker is again full office productivity slowly returns to normal.

This is the model of _stop the world_ garbage collection. The various parts of your program proceed through their day consuming memory, or in our analogy coffee, without a care about the next allocation that needs to be made. Eventually one unlucky attempt to allocate memory is made only to find the heap, or the coffee pot, exhausted, triggering a stop the world garbage collection.

* * *

Down the road at a more enlightened workplace, management have adopted a different strategy for mitigating their break room’s coffee problems. Their policy is simple: if the pot is more than half full, fill your cup and be on your way. However, if the pot is less than half full, _before_ filling your cup, you must add a little coffee and a little water to the top of the machine. In this way, by the time the next person arrives for their re-up, the level in the pot will hopefully have risen higher than when the first person found it.

This policy does come at a cost to office productivity. Rather than filling their cup and hoping for the best, each worker may, depending on the aggregate level of consumption in the office, have to spend a little time refilling the percolator and topping up the water. However, this is time spent by a person who was already heading to the break room. It costs a few extra minutes to maintain the coffee machine, but does not impact their officemates who aren’t in need of caffeination. If several people take a break at the same time, they will all find the level in the pot below the half way mark and all proceed to top up the coffee maker–the more consumption, the greater the rate the machine will be refilled, although this takes a little longer as the break room becomes congested.

This is the model of _concurrent garbage collection_ as practiced by the Go runtime (and probably other language runtimes with concurrent collectors). Rather than each heap allocation proceeding blindly until the heap is exhausted, leading to a long stop the world pause, concurrent collection algorithms spread the work of walking the heap to find memory which is no longer reachable over the parts of the program allocating memory. In this way the parts of the program which allocate memory each pay a small cost–in terms of latency–for those allocations rather than the whole program being forced to halt when the heap is exhausted.

Lastly, in keeping with the office coffee model, if the rate of coffee consumption in the office is so high that management discovers that their staff are always in the break room trying desperately to refill the coffee machine, it’s time to invest in a machine with a bigger pot–or in garbage collection terms, grow the heap.

### Related posts:

  1. [Visualising the Go garbage collector][3]
  2. [A whirlwind tour of Go’s runtime environment variables][4]
  3. [Why is a Goroutine’s stack infinite ?][5]
  4. [Introducing Go 2.0][6]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2018/12/28/the-office-coffee-model-of-concurrent-garbage-collection

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://dave.cheney.net/wp-content/uploads/2018/12/20181204175004_79256.jpg
[2]: https://www.youtube.com/watch?v=ww86iaucd2A
[3]: https://dave.cheney.net/2014/07/11/visualising-the-go-garbage-collector (Visualising the Go garbage collector)
[4]: https://dave.cheney.net/2015/11/29/a-whirlwind-tour-of-gos-runtime-environment-variables (A whirlwind tour of Go’s runtime environment variables)
[5]: https://dave.cheney.net/2013/06/02/why-is-a-goroutines-stack-infinite (Why is a Goroutine’s stack infinite ?)
[6]: https://dave.cheney.net/2016/10/25/introducing-go-2-0 (Introducing Go 2.0)
