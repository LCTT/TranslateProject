[#]: subject: "Patterns in confusing explanations"
[#]: via: "https://jvns.ca/blog/confusing-explanations/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Patterns in confusing explanations
======

Hello! Recently I’ve been thinking about why I explain things the way I do. The usual way I write is:

  1. Try to learn a topic
  2. Read a bunch of explanations that I find confusing
  3. Eventually understand the topic
  4. Write an explanation that makes sense to me, to help others



So why do I find all these explanations so confusing? I decided to try and find out! I came up with a list of 12 patterns that make explanations hard for me to understand. For each pattern I’ll also explain what I like to do instead to avoid the issue.

### these patterns are very normal

This list isn’t meant to make you feel bad about your writing. I’ve probably done all of these things! I’m certainly going to do them again! I even did at least one of them **while writing this post**!

But knowing that I’m likely to accidently do these things makes it easier for me to avoid them, and it makes me more receptive to critique when people I ask for help point out issues with my writing (“Julia, this is assuming a lot of knowledge that I don’t have!“).

Being aware of these patterns also helps me when _reading_ a confusing explanation: “oh, I’m not confused by this explanation because I’m stupid, I’m confused because it’s introduced 6 new-to-me concepts and it hasn’t explained what any of them is yet!“.

### why this post is framed in a negative way

I practically always write in a positive way (“X is a good practice!”) instead of in a negative way (“Y is a bad practice!”). So why am I writing about confusing patterns instead of writing about positive patterns?

Writing clearly is a LOT of work. A big part of what motivates me to put in the work to write clearly is my frustration with confusing technical explanations (“ugh, everything I read about Linux containers was SO confusing, I wish someone had just told me X Y Z…“).

But, if I’m not careful, it’s easy to reproduce the exact same confusing patterns in my own writing! And the problem with positive patterns (like “avoid introducing unnecessary jargon”) is that they seem so obvious that I trick myself into thinking I’m following them, even when I’m not! So I’m writing these down to try to keep myself honest and hopefully help you avoid some of these patterns as well.

### now for the patterns!

Now that I’ve explained my motivation, let’s explain the patterns! Here’s a quick index of all of them. They’re not in any particular order.

  * [pattern 1: making outdated assumptions about the audience’s knowledge][1]
  * [pattern 2: having inconsistent expectations of the reader’s knowledge][2]
  * [pattern 3: strained analogies][3]
  * [pattern 4: pretty pictures on confusing explanations][4]
  * [pattern 5: unrealistic examples][5]
  * [pattern 6: jargon that doesn’t mean anything][6]
  * [pattern 7: missing key information][7]
  * [pattern 8: introducing too many concepts at a time][8]
  * [pattern 9: starting out abstract][9]
  * [pattern 10: unsupported statements][10]
  * [pattern 11: no examples][11]
  * [pattern 12: explaining the “wrong” way to do something without saying it’s wrong][12]



### pattern 1: making outdated assumptions about the audience’s knowledge

I see a lot of writing, especially systems writing, that makes outdated assumptions about what the reader knows. For example, here’s a paragraph from [this Git book][13] comparing Git’s implementation of branching to other version control tools.

> Nearly every VCS has some form of branching support. […] In many VCS tools, this is a somewhat expensive process, often requiring you to create a new copy of your source code directory, which can take a long time for large projects.

The outdated assumption here is that you (the reader) know how other version control systems implement branching, and that comparing other tools’ implementation of branching to Git’s implementation will help you understand branching.

But if you’re reading this and you’ve never used another version control system and never plan to, this explanation is useless! Who cares about how other version control systems implement branching? You just want to understand how Git works!

The reason this explanation is written this way is probably that the first edition of the book was published in 2009, and this assumption was probably true in 2009! Many people learning Git shortly after it was released were switching from Subversion or CVS or something and found comparisons like this helpful.

But in 2021 Git has been the dominant version control system for a long time, and most people learning Git for the first time won’t have _any_ experience with version control other than Git.

I also sometimes see this “outdated assumptions about the audience’s knowledge” problem with newer writing. It generally happens when the writer learned the concept many years ago, but doesn’t have a lot of experience explaining it in the present. So they give the type of explanation that assumes that the reader knows approximately the same things they and their friends knew in 2005 and don’t realize that most people learning it today have a different set of knowledge.

#### instead: test your explanations!

Usually if I learned a concept a long time ago, it means that I’ve lost touch with what it’s like to learn it for the first time today. So running an explanation by a few people who **don’t already know the concept** helps to catch incorrect assumptions I’ve made.

(I bolded “don’t already know the concept” because it’s tempting to ask someone who already understands the concept for a review. But they might have the exact same blind spots as you!)

### pattern 2: having inconsistent expectations of the reader’s knowledge

For example, a new language tutorial might explain a concept that almost all programmers would know, like how a for loop is used for iteration, while the writing that immediately follows implicitly assumes knowledge that many people don’t have, like how the stack works, how malloc works, etc. (thanks to Dan Luu for this example!)

The problem with this is that are probably 0 people who understand malloc but don’t understand how a for loop works! And even though it sounds silly, it’s easy to accidentally write like this if you don’t have a clear idea of who you’re writing for.

#### instead: pick 1 specific person and write for them!

You can pick a friend, a coworker, or just a past version of yourself. Writing for just 1 person might feel insufficiently general (“what about all the other people??“) but writing that’s easy to understand for 1 person (other than you!) has a good chance of being easy to understand for many other people as well.

### pattern 3: strained analogies

Sometimes when trying to explain a complex technical concept, an author will start with a real-world concept that the reader definitely understands and use a very involved analogy to compare them.

Here’s an example I made up:

> Imagine our event system is like the Mississippi River. It travels through many different ecosystems, and some rain particles don’t make it all the way. Sometimes it flows at different speeds depending on environmental conditions. The Mississippi River ends in many different tributaries.
>
> Many different kinds of fish live in the event system. Different fish have different destinations. Humans decide to live along the river and use it for different purposes. They construct dams to control the flow.

This example is a parody, but I always find this type of analogy confusing because I end up wasting a lot of time trying to analyze exactly how an event stream is different / the same as the Mississippi river instead of just learning technical facts about event streams:

I think authors do this because.. it’s kind of fun to write these Big Weird Analogies! Like, is there something in an stream processing system that’s like a dam? Maybe! It’s kind of fun to think about! But even though these can be fun to write, they’re not as fun to read – it’s a struggle to extract the actual technical facts you want to know.

#### instead: keep analogies to a single idea

Instead of using “big” analogies where I explain in depth exactly how an event processing system is like a river, I prefer to explain the analogy in one or two sentences to make a specific point and then leave the analogy behind.

Here are 2 ways to do that.

**option 1: use “implicit” metaphors**

For example, if we’re talking about streams, I might write:

> Every event in an stream flows from a producer to a consumer.

Here I’m using the world “flow”, which is definitely a water metaphor. I think this is great – it’s an efficient way to evoke an idea of directionality and the idea that there are potentially a large number of events.

I put together a bunch more metaphors in this style in [Metaphors in man pages][14].

**option 2: use a very limited analogy**

For example, here’s a nice explanation from [When costs are nonlinear, keep it small][15] by Jessica Kerr that explains batching using an analogy to doing your laundry in a batch.

> We like batching. Batching is more efficient: doing ten at once is faster than doing one, one, two, one, one, etc. I don’t wash my socks as soon as I take them off, because lumping them in with the next load is free.

This analogy is very clear! I think it works well because batching in laundry works for the same reasons as batching in computing – batching your laundry works because there’s a low incremental cost to adding another pair of socks to the load. And it’s only uesd to illustrate one idea – that batching is a good choice when there’s a low incremental cost for adding a new item.

### pattern 4: fun illustrations on dry explanations

Sometimes I see authors put fun illustrations with a very dry explanation to make the explanation seem more appealing and approachable.

The goal isn’t generally to trick the reader into expecting a more friendly explanation – I think the logic is usually more like “people like fun illustrations! let’s add some!“. But no matter what the intent, the problem is that the reader can end up feeling misled.

#### instead: make the design reflect the style of the explanation

There are lots of great examples of illustrated explanations where the writing is in a clear and friendly style:

  * [Learn You a Haskell For Great Good][16] (which I haven’t read but seems well-reviewed)
  * [how dns works][17]
  * [why’s (poignant) guide to ruby][18]
  * [how do calculators even][19]



On the other hand, dry explanations are useful too! Nobody expects the [Intel instruction-set reference][20] to be light reading! The writing is dry and technical, and the design is very utilitarian, which matches the style of the writing.

### pattern 5: unrealistic examples

Here’s an unrealistic example of how to use `lambda` in Python:

>

```
>     numbers = [1, 2, 3, 4]
>     squares = map(lambda x: x * x, numbers)
>
```

This example is unrealistic because most people don’t use `map` in Python – you’d use list comprehensions to do this instead.

Here’s another unrealistic example: an interface example from [the Oracle docs on interfaces][21].

>

```
>     interface Bicycle {
>         //  wheel revolutions per minute
>         void changeCadence(int newValue);
>         void changeGear(int newValue);
>         void speedUp(int increment);
>         void applyBrakes(int decrement);
>     }
>
```

This kind of “real world example” is super common in object oriented programming explanations but I find it quite confusing – I’ve never implemented a bicycle or car in my code! It doesn’t tell me anything about what interfaces are useful for!

#### instead: write realistic examples!

Here’s a more realistic example of Python lambdas, which sorts a list of children by their age. (from my post [Write good examples by starting with real code][22]) This is how I use Python lambdas the most in practice.

>

```
>     children = [
>         {"name": "ashwin", "age": 12},
>         {"name": "radhika", "age": 3},
>     ]
>     sorted_children = sorted(children, key=lambda x: x['age'])
>
```

Here’s a more realistic example of Java interfaces.

> The `Comparable` interface (from [the JDK source][23]) just has one method -- here's its full implementation.

```
>     public interface Comparable {
>         int compareTo(T o);
>     }
>
```
>
> To implement this interface, you just need to implement the `compareTo` method. And if you write a class that implements this interface (like a `Money` class for example), then you get all sorts of useful things for free! You can sort an array of `Money` objects with `Arrays.sort`! You can put them in a `SortedSet`!

In this Java example, of course it’s not enough to explain built-in Java interfaces – you also need realistic examples of how to create and use your own interfaces. But this post isn’t about Java interfaces so let’s move on.

### pattern 6: jargon that doesn’t mean anything

Let’s talk about this sentence from this [chapter on commit signing][24]:

> Git is cryptographically secure, but it’s not foolproof.

“Cryptographically secure” is unclear here because it _sounds_ like it should have a specific technical meaning, but it’s not explained anywhere what’s actualy meant. Is it saying that Git uses SHA-1 to hash commits and it’s difficult to generate SHA-1 hash collisions? I don’t know!

Using jargon in a meaningless way like this is confusing because it can trick the reader into thinking something specific is being said, when the information they need is not actually there. (the chapter doesn’t explain anywhere what’s meant by “cryptographically secure” in this context)

#### instead: Avoid jargon where it’s not needed

A lot of the time I find I can communicate what I need to without using any jargon at all! For example, I’d explain why commit signing is important like this:

> When making a Git commit, you can set any name and email you want! For example, I can make a commit right now saying I'm Linus Torvalds like this:

```
>     git commit -m"Very Serious Kernel Update" \
>      --author='Linus Torvalds <[email protected]>'
>
>
```

### pattern 7: missing key information

Sometimes explanations of a concept are missing the most important idea to understand the concept. For example, take this explanation from [this chapter on the Git object model][25] (which by the way has a nice concrete example of how to explore Git’s object model):

> Git is a **content-addressable filesystem**. Great. What does that mean? It means that at the core of Git is a simple key-value data store. What this means is that you can insert any kind of content into a Git repository, for which Git will hand you back a unique key you can use later to retrieve that content.

This paragraph is missing what to me is the main idea of content-addressable storage – that the key for a piece of content is a deterministic function of the content, usually a hash (though the page does later say that Git uses a SHA-1 hash). It’s important that the key is a function of the content and not just any random unique key because the idea is that the content is addressed by _itself_ – if the content changes, then its key also has to change.

This pattern is hard to recognize as a reader because – how are you supposed to recognize that there’s a key idea missing when you don’t know what the key ideas _are_? So this is a case where an reviewer who understands the subject well can be really helpful.

### pattern 8: introducing too many concepts at a time

Here’s an explanation of linkers from [this page][26] that I find confusing:

> During the link process, the linker will pick up all the object modules specified on the command line, add some system-specific startup code in front and try to resolve all external references in the object module with external definitions in other object files (object files can be specified directly on the command line or may implicitly be added through libraries). It will then assign load addresses for the object files, that is, it specifies where the code and data will end up in the address space of the finished program. Once it’s got the load addresses, it can replace all the symbolic addresses in the object code with “real”, numerical addresses in the target’s address space. The program is ready to be executed now.

Here are the concepts in this paragraph:

  * object modules (`.o` files)
  * external references
  * symbolic addresses
  * load addresses
  * system-specific startup code



It’s too much!

#### instead: give each concept some space to breathe

For example, I might explain “external references” like this:

> if you run `objdump -d myfile.o` on an object file you can see that the `call` function calls are missing a target address, so that's why the linker needs to fill that in.

```
>       33:   e8 00 00 00 00          call   38
>                ^^^^^^^^^^^
>                  this address is all 0s -- it needs to be filled in by the linker!
>                  with the actual function that's going to be called!
>       38:   84 c0                   test   %al,%al
>       3a:   74 3b                   je     77
>       3c:   48 83 7d f8 00          cmpq   $0x0,-0x8(%rbp)
>
>
```

There’s still a lot of missing information here (how does the linker know what address to fill in?), but it’s a clear starting point and gives you questions to ask.

### pattern 9: starting out abstract

Imagine I try to explain to you what a Unix signal using the [definition from Wikipedia][27].

> Signals are a limited form of inter-process communication (IPC), typically used in Unix, Unix-like, and other POSIX-compliant operating systems. A signal is an asynchronous notification sent to a process or to a specific thread within the same process to notify it of an event. Signals originated in 1970s Bell Labs Unix and were later specified in the POSIX standard.

By itself, this probably isn’t going to help you understand signals if you’ve never heard of them before! It’s very abstract and jargon-heavy (“asynchonous notification”, “inter-process communication”) and doesn’t any information about what Unix signals are used for in practice.

Of course, the Wikipedia explanation isn’t “bad” exactly – it’s probably written like that because teaching people about signals for the first time isn’t really the goal of the Wikipedia article on signals.

#### instead: start out concrete

For example, I wrote this page explaining signals a few years ago.

[![][28]][29]

I start out by relating signals to the reader’s experience (“have you used `kill`? you’ve used signals!“) before explaining how they work.

### pattern 10: unsupported statements

Here’s an explanation of C header files, from [this page][30].

> In modern C, **header files are crucial tools** that must be designed and used correctly. They allow the compiler to cross-check independently compiled parts of a program.
>
> Headers declare types, functions, macros etc that are needed by the consumers of a set of facilities. All the code that uses any of those facilities includes the header. All the code that defines those facilities includes the header. This allows the compiler to check that the uses and definitions match.

This says “In modern C, header files are crucial tools…” (which is true), but it doesn’t explain **why** header files are crucial. This of course wouldn’t be a problem if the audience already understood why header files in C are important (it’s a very fundamental concept!). But the whole point here is to explain header files, so it needs to be explained.

#### instead: Prove that your statements are true!

For example, I might write:

> Almost every C program includes header files. For example, if you've ever written `#include <stdio.h>` at the beginning of a C program, `stdio.h` is a header file. `#include` tells the C preprocessor to basically paste the contents of `stdio.h` at the beginning of the program.
>
> C programs need header files because **the C compiler doesn't let you use a function before declaring its type**. For example, this code by itself will fail to compile, because `printf` is used before it's declared:

```
>     int main() {
>         printf("hello world");
>     }
>
```

This example program lets the reader actually run that program themselves and verify that it doesn’t compile if they want – they don’t have to take my word for it!

### pattern 11: no examples

Another problem with the previous explanation of header files is – there aren’t any examples! Leaving out examples makes it harder for the reader to relate the new terminology to their own experiences.

Almost anyone who’s ever written a C program has definitely used header files, so a simple example (like mentioning `stdio.h`) can really help.

In that header files example, I replaced

> In modern C, header files are crucial tools…

with an explanation that includes a simple example:

> Almost every C program includes header files -- if you've ever seen something like `#include ` at the beginning of a C program, `stdio.h` is a header file.

### pattern 12: explaining the “wrong” way to do something without saying it’s wrong

Here’s a pattern I see sometimes in tutorials (though unfortunately I don’t have an example):

  1. Explain the “wrong” way of doing something without saying up front that it’s wrong
  2. Later on, show the consequences of doing the “wrong” thing
  3. Explain the “right” way



I think the intention of this is to imitate the real-life experience of making mistakes. Usually when you make a mistake, you don’t know that it’s wrong at the time!

But often the reader will end up feeling misled or confused about which way is actually “correct”. And it’s possible that they would never even have made that particular mistake on their own!

#### instead: here are four options for presenting mistakes

Here are a few ways of accomplishing the same thing without misleading the reader:

  1. Frame the “wrong” thing as an experiment (“what if we try doing it X way?”)
  2. State an incorrect belief the reader might have: (“You might think that the command line tool would need to run as root (because it’s talking to the kernel, but…“)
  3. Explain a common mistake (for example “Avoid Striding and Slicing in a Single Expression” in [Effective Python][31])
  4. Tell a story about a mistake you made and why it caused problems (here’s one of mine: [Why Ruby’s Timeout is dangerous (and Thread.raise is terrifying)][32])



Talking about mistakes is very important, just say up front that the thing is a mistake!

### that’s all for now!

Originally I thought it would be simple to put together these patterns (“there are so many confusing explanations!“) but it was surprisingly hard to articulate exactly what was confusing to me about each explanation in a convincing way.

It’s definitely incomplete, but I’ve already spent two weeks and 3000 words on it so I’ll stop here and I’d love to hear what I’ve missed :)

thanks to Laura, Dan, Kamal, Alyssa, Lindsey, Paul, Ivan, Edith, Hazem, Anton, and John for helping improve this post

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/confusing-explanations/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: tmp.4iSbeWYY0s#pattern-1-making-outdated-assumptions-about-the-audience-s-knowledge
[2]: tmp.4iSbeWYY0s#pattern-2-having-inconsistent-expectations-of-the-reader-s-knowledge
[3]: tmp.4iSbeWYY0s#pattern-3-strained-analogies
[4]: tmp.4iSbeWYY0s#pattern-4-pretty-pictures-on-confusing-explanations
[5]: tmp.4iSbeWYY0s#pattern-5-unrealistic-examples
[6]: tmp.4iSbeWYY0s#pattern-6-jargon-that-doesn-t-mean-anything
[7]: tmp.4iSbeWYY0s#pattern-7-missing-key-information
[8]: tmp.4iSbeWYY0s#pattern-8-introducing-too-many-concepts-at-a-time
[9]: tmp.4iSbeWYY0s#pattern-9-starting-out-abstract
[10]: tmp.4iSbeWYY0s#pattern-10-unsupported-statements
[11]: tmp.4iSbeWYY0s#pattern-11-no-examples
[12]: tmp.4iSbeWYY0s#pattern-12-explaining-the-wrong-way-to-do-something-without-saying-it-s-wrong
[13]: https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell
[14]: https://jvns.ca/blog/2020/05/08/metaphors-in-man-pages/
[15]: https://jessitron.com/2021/01/18/when-costs-are-nonlinear-keep-it-small/
[16]: http://learnyouahaskell.com/
[17]: https://howdns.works/ep1/
[18]: https://poignant.guide/
[19]: https://shop.bubblesort.io/products/how-do-calculators-even-zine
[20]: https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.html
[21]: https://docs.oracle.com/javase/tutorial/java/concepts/interface.html
[22]: https://jvns.ca/blog/2021/07/08/writing-great-examples/
[23]: https://github.com/openjdk/jdk/blob/739769c8fc4b496f08a92225a12d07414537b6c0/src/java.base/share/classes/java/lang/Comparable.java
[24]: https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work
[25]: https://git-scm.com/book/en/v2/Git-Internals-Git-Objects
[26]: https://riptutorial.com/c/example/4360/the-linker
[27]: https://en.wikipedia.org/wiki/Signal_(IPC)
[28]: https://wizardzines.com/comics/signals/signals.png
[29]: https://wizardzines.com/comics/signals/
[30]: https://riptutorial.com/c/topic/6257/create-and-include-header-files
[31]: https://effectivepython.com/
[32]: https://jvns.ca/blog/2015/11/27/why-rubys-timeout-is-dangerous-and-thread-dot-raise-is-terrifying/
