[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Data Still Dominates)
[#]: via: (https://theartofmachinery.com/2019/06/30/data_still_dominates.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Data Still Dominates
======

Here’s [a quote from Linus Torvalds in 2006][1]:

> I’m a huge proponent of designing your code around the data, rather than the other way around, and I think it’s one of the reasons git has been fairly successful… I will, in fact, claim that the difference between a bad programmer and a good one is whether he considers his code or his data structures more important. Bad programmers worry about the code. Good programmers worry about data structures and their relationships.

Which sounds a lot like [Eric Raymond’s “Rule of Representation” from 2003][2]:

> Fold knowledge into data, so program logic can be stupid and robust.

Which was just his summary of ideas like [this one from Rob Pike in 1989][3]:

> Data dominates. If you’ve chosen the right data structures and organized things well, the algorithms will almost always be self-evident. Data structures, not algorithms, are central to programming.

Which cites [Fred Brooks from 1975][4]:

> ### Representation is the Essence of Programming
>
> Beyond craftmanship lies invention, and it is here that lean, spare, fast programs are born. Almost always these are the result of strategic breakthrough rather than tactical cleverness. Sometimes the strategic breakthrough will be a new algorithm, such as the Cooley-Tukey Fast Fourier Transform or the substitution of an n log n sort for an n2 set of comparisons.
>
> Much more often, strategic breakthrough will come from redoing the representation of the data or tables. This is where the heart of your program lies. Show me your flowcharts and conceal your tables, and I shall be continued to be mystified. Show me your tables, and I won’t usually need your flowcharts; they’ll be obvious.

So, smart people have been saying this again and again for nearly half a century: focus on the data first. But sometimes it feels like the most famous piece of smart programming advice that everyone forgets.

Let me give some real examples.

### The Highly Scalable System that Couldn’t

This system was designed from the start to handle CPU-intensive loads with incredible scalability. Nothing was synchronous. Everything was done with callbacks, task queues and worker pools.

But there were two problems: The first was that the “CPU-intensive load” turned out not to be that CPU-intensive after all — a single task took a few milliseconds at worst. So most of the architecture was doing more harm than good. The second problem was that although it sounded like a highly scalable distributed system, it wasn’t one — it only ran on one machine. Why? Because all communication between asynchronous components was done using files on the local filesystem, which was now the bottleneck for any scaling. The original design didn’t say much about data at all, except to advocate local files in the name of “simplicity”. Most of the document was about all the extra architecture that was “obviously” needed to handle the “CPU-intensiveness” of the load.

### The Service-Oriented Architecture that was Still Data-Oriented

This system followed a microservices design, made up of single-purpose apps with REST-style APIs. One component was a database that stored documents (basically responses to standard forms, and other electronic paperwork). Naturally it exposed an API for basic storage and retrieval, but pretty quickly there was a need for more complex search functionality. The designers felt that adding this search functionality to the existing document API would have gone against the principles of microservices design. They could talk about “search” as being a different kind of service from “get/put”, so their architecture shouldn’t couple them together. Besides, the tool they were planning to use for search indexing was separate from the database itself, so creating a new service made sense for implementation, too.

In the end, a search API was created containing a search index that was essentially a duplicate of the data in the main database. This data was being updated dynamically, so any component that mutated document data through the main database API had to also update the search API. It’s impossible to do this with REST APIs without race conditions, so the two sets of data kept going out of sync every now and then, anyway.

Despite what the architecture diagram promised, the two APIs were tightly coupled through their data dependencies. Later on it was recognised that the search index should be an implementation detail of a unified document service, and this made the system much more maintainable. “Do one thing” works at the data level, not the verb level.

### The Fantastically Modular and Configurable Ball of Mud

This system was a kind of automated deployment pipeline. The original designers wanted to make a tool that was flexible enough to solve deployment problems across the company. It was written as a set of pluggable components, with a configuration file system that not only configured the components, but acted as a [DSL][5] for programming how the components fitted into the pipeline.

Fast forward a few years and it’s turned into “that program”. There was a long list of known bugs that no one was ever fixing. No one wanted to touch the code out of fear of breaking things. No one used any of the flexibility of the DSL. Everyone who used the program copy-pasted the same known-working configuration that everyone else used.

What had gone wrong? Although the original design document used words like “modular”, “decoupled”, “extensible” and “configurable” a lot, it never said anything about data. So, data dependencies between components ended up being handled in an ad-hoc way using a globally shared blob of JSON. Over time, components made more and more undocumented assumptions about what was in or not in the JSON blob. Sure, the DSL allowed rearranging components into any order, but most configurations didn’t work.

### Lessons

I chose these three examples because they’re easy to explain, not to pick on others. I once tried to build a website, and failed trying to instead build some cringe-worthy XML database that didn’t even solve the data problems I had. Then there’s the project that turned into a broken mockery of half the functionality of `make`, again because I didn’t think about what I really needed. I wrote a post before based on a time I wrote [a castle-in-the-sky OOP class hierarchy that should have been encoded in data instead][6].

Update:

Apparently many people still thought I wrote this to make fun of others. People who’ve actually worked with me will know I’m much more interested in the things I’m fixing than in blaming the people who did most of the work building them, but, okay, here’s what I think of the engineers involved.

Honestly, the first example obviously happened because the designer was more interested in bringing a science project to work than in solving the problem at hand. Most of us have done that (mea culpa), but it’s really annoying to our colleagues who’ll probably have to help maintain them when we’re bored of them. If this sounds like you, please don’t get offended; please just stop. (I’d still rather work on the single-node distributed system than anything built around my “XML database”.)

There’s nothing personal in the second example. Sometimes it feels like everyone is talking about how wonderful it is to split up services, but no one is talking about exactly when not to. People are learning the hard way all the time.

The third example was actually from some of the smartest people I’ve ever had the chance to work with.

(End update.)

“Does this talk about the problems created by data?” turns out to be a pretty useful litmus test for good systems design. It’s also pretty handy for detecting false expert advice. The hard, messy systems design problems are data problems, so false experts love to ignore them. They’ll show you a wonderfully beautiful architecture, but without talking about what kind of data it’s appropriate for, and (crucially) what kind of data it isn’t.

For example, a false expert might tell you that you should use a pub/sub system because pub/sub systems are loosely coupled, and loosely coupled components are more maintainable. That sounds nice and results in pretty diagrams, but it’s backwards thinking. Pub/sub doesn’t _make_ your components loosely coupled; pub/sub _is_ loosely coupled, which may or may not match your data needs.

On the flip side, a well-designed data-oriented architecture goes a long way. Functional programming, service meshes, RPCs, design patterns, event loops, whatever, all have their merits, but personally I’ve seen tools like [boring old databases][7] be responsible for a lot more successfully shipped software.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/06/30/data_still_dominates.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://lwn.net/Articles/193245/
[2]: http://www.catb.org/~esr/writings/taoup/html/ch01s06.html
[3]: http://doc.cat-v.org/bell_labs/pikestyle
[4]: https://archive.org/stream/mythicalmanmonth00fred/mythicalmanmonth00fred_djvu.txt
[5]: https://martinfowler.com/books/dsl.html
[6]: https://theartofmachinery.com/2016/06/21/code_vs_data.html
[7]: https://theartofmachinery.com/2017/10/28/rdbs_considered_useful.html
