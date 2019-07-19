[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Unfortunately, Garbage Collection isn't Enough)
[#]: via: (https://theartofmachinery.com/2018/12/05/gc_not_enough.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Unfortunately, Garbage Collection isn't Enough
======

Here’s a little story of some mysterious server failures I had to debug a year ago. The servers would run okay for a while, then eventually start crashing. After that, trying to run practically anything on the machines failed with “No space left on device” errors, but the filesystem only reported a few gigabytes of files on the ~20GB disks.

The problem turned out to be caused by a log shipper. This was a Ruby app that read in log files, sent the data to a remote server, and deleted the old files. The bug was that the open log files weren’t being explicitly closed. The app was letting Ruby’s automatic garbage collector clean up the `File` objects, instead. Trouble is, `File` objects don’t use much memory, so the log shipper could theoretically keep millions of log files open before a collection was needed.

*nix filesystems decouple filenames from file data. File data on disk can have multiple filenames pointing to it (i.e., hard links), and the data is only deleted when the last reference is removed. An open file descriptor counts as a reference, so if you delete a file while a program is reading it, the filename disappears from the directory listing, but the file data stays until the program closes it. That’s what was happening with the log shipper. The `du` (“disk usage”) command finds files using directory listings, so it didn’t see the gigabytes of file data for the thousands of log files the shipper had open. Those files only appeared after running `lsof` (“list open files”).

Of course, the same kind of bug happens with other things. A couple of months ago I had to deal with a Java app that was breaking in production after a few days because it leaked network connections.

Once upon a time, I wrote most of my code in C and then C++. In those days, I thought manual resource management was enough. How hard could it be? Every `malloc()` needs a `free()`, and every `open()` needs a `close()`. Simple. Except not all programs are simple, so manual resource management became a straitjacket. Then one day I discovered reference counting and garbage collection. I thought that solved all my problems, and I stopped caring about resource management completely. Once again, that was okay for simple programs, but not all programs are simple.

Relying on garbage collection doesn’t work because it only solves the _memory_ management problem, and complex programs have to deal with a lot more than just memory. There’s a popular meme that responds to that by saying that [memory is 95% of your resource problems][1]. Well, you could say that all resources are 0% of your problems — until you run out of one of them. Then that resource becomes 100% of your problems.

But that kind of thinking still treats resources as a special case. The deeper problem is that as programs get more complex, everything tends to become a resource. For example, take a calendar program. A complex calendar program allows multiple users to manage multiple, shareable calendars, with events that can be shared across calendars. Any piece of data will eventually have multiple parts of the program depending on it being up-to-date and accurate. So all dynamic data needs an owner, and not just for memory management. As more features are added, more parts of the program will need to update data. If you’re sane, you’ll only allow one part of the program to update data at a time, so the right and responsibility to update data becomes a limited resource, itself. Modelling mutable data with immutable datastructures doesn’t make these problems disappear; it just translates them into a different paradigm.

Planning the ownership and lifespan of resources is an inescapable part of designing complex software. It’s easier if you exploit some common patterns. One pattern is fungible resources. An example is an immutable string “foo”, which is semantically the same as any other immutable string “foo”. This kind of resource doesn’t need a pre-determined lifespan or ownership. In fact, to keep the system as simple as possible, it’s better to have _no_ pre-determined lifespan or ownership. Another pattern is resources that are non-fungible, but have a deterministic lifespan. This includes network connections, as well as more abstract things like the ownership of a piece of data. It’s sanest to explicitly enforce the lifespan of these things in code.

Notice that automatic garbage collection is really good for implementing the first pattern, but not the second, while manual resource management techniques (like RAII) are great for implementing the second pattern, but terrible for the first. The two approaches become complements in complex programs.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2018/12/05/gc_not_enough.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://yosefk.com/c++fqa/dtor.html#fqa-11.1
