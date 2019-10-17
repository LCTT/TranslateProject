[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Object-Oriented Programming and Essential State)
[#]: via: (https://theartofmachinery.com/2019/10/13/oop_and_essential_state.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Object-Oriented Programming and Essential State
======

Back in 2015, Brian Will wrote a provocative blog post: [Object-Oriented Programming: A Disaster Story][1]. He followed it up with a video called [Object-Oriented Programming is Bad][2], which is much more detailed. I recommend taking the time to watch the video, but here’s my one-paragraph summary:

The Platonic ideal of OOP is a sea of decoupled objects that send stateless messages to one another. No one really makes software like that, and Brian points out that it doesn’t even make sense: objects need to know which other objects to send messages to, and that means they need to hold references to one another. Most of the video is about the pain that happens trying to couple objects for control flow, while pretending that they’re decoupled by design.

Overall his ideas resonate with my own experiences of OOP: objects can be okay, but I’ve just never been satisfied with object-_orientation_ for modelling a program’s control flow, and trying to make code “properly” object-oriented always seems to create layers of unneccessary complexity.

There’s one thing I don’t think he explains fully. He says outright that “encapsulation does not work”, but follows it with the footnote “at fine-grained levels of code”, and goes on to acknowledge that objects can sometimes work, and that encapsulation can be okay at the level of, say, a library or file. But he doesn’t explain exactly why it sometimes works and sometimes doesn’t, and how/where to draw the line. Some people might say that makes his “OOP is bad” claim flawed, but I think his point stands, and that the line can be drawn between essential state and accidental state.

If you haven’t heard this usage of the terms “essential” and “accidental” before, you should check out Fred Brooks’ classic [No Silver Bullet][3] essay. (He’s written many great essays about building software systems, by the way.) I’ve aleady written [my own post about essential and accidential complexity][4] before, but here’s a quick TL;DR: Software is complex. Partly that’s because we want software to solve messy real-world problems, and we call that “essential complexity”. “Accidental complexity” is all the other complexity that exists because we’re trying to use silicon and metal to solve problems that have nothing to do with silicon and metal. For example, code for memory management, or transferring data between RAM and disk, or parsing text formats, is all “accidental complexity” for most programs.

Suppose you’re building a chat application that supports multiple channels. Messages can arrive for any channel at any time. Some channels are especially interesting and the user wants to be notified or pinged when a new message comes in. Other channels are muted: the message is stored, but the user isn’t interrupted. You need to keep track of the user’s preferred setting for each channel.

One way to do it is to use a map (a.k.a, hash table, dictionary or associative array) between the channels and channel settings. Note that a map is the kind of abstract data type (ADT) that Brian Will said can work as an object.

If we get a debugger and look inside the map object in memory, what will we see? We’ll find channel IDs and channel settings data of course (or pointers to them, at least). But we’ll also find other data. If the map is implemented using a red-black tree, we’ll see tree node objects with red/black labels and pointers to other nodes. The channel-related data is the essential state, and the tree nodes are the accidental state. Notice something, though: The map effectively encapsulates its accidental state — you could replace the map with another one implemented using AVL trees and your chat app would still work. On the other hand, the map doesn’t encapsulate the essential state (simply using `get()` and `set()` methods to access data isn’t encapsulation). In fact, the map is as agnostic as possible about the essential state — you could use basically the same map data structure to store other mappings unrelated to channels or notifications.

And that’s why the map ADT is so successful: it encapsulates accidental state and is decoupled from essential state. If you think about it, the problems that Brian describes with encapsulation are problems with trying to encapsulate essential state. The benefits that others describe are benefits from encapsulating accidental state.

It’s pretty hard to make entire software systems meet this ideal, but scaling up, I think it looks something like this:

  * No global, mutable state
  * Accidental state encapsulated (in objects or modules or whatever)
  * Stateless accidental complexity enclosed in free functions, decoupled from data
  * Inputs and outputs made explicit using tricks like dependency injection
  * Components fully owned and controlled from easily identifiable locations



Some of this goes against instincts I had a long time ago. For example, if you have a function that makes a database query, the interface looks simpler and nicer if the database connection handling is hidden inside the function, and the only parameters are the query parameters. However, when you build a software system out of functions like this, it actually becomes more complex to coordinate the database usage. Not only are the components doing things their own ways, they’re trying to hide what they’re doing as “implementation details”. The fact that a database query requires a database connection never was an implementation detail. If something can’t be hidden, it’s saner to make it explicit.

I’m wary of feeding the OOP and functional programming false dichotomy, but I think it’s interesting that FP goes to the opposite extreme of OOP: OOP tries to encapsulate things, including the essential complexity that can’t be encapsulated, while pure FP tends to make things explicit, including some accidental complexity. Most of the time, that’s the safer side to go wrong, but sometimes (such as when [building self-referential data structures in a purely functional language][5]) you can get designs that are more for the sake of FP than for the sake of simplicity (which is why [Haskell includes some escape hatches][6]). I’ve written before about [the middle ground of so-called “weak purity”][7].

Brian found that encapsulation works at a larger scale for a couple of reasons. One is that larger components are simply more likely to contain accidental state, just because of size. Another is that what’s “accidental” is relative to what problem you’re solving. From the chat app user’s point of view, “accidental complexity” is anything unrelated to messages and channels and users, etc. As you break the problems into subproblems, however, more things become essential. For example, the mapping between channel names and channel IDs is arguably accidental complexity when solving the “build a chat app” problem, but it’s essential complexity when solving the “implement the `getChannelIdByName()` function” subproblem. So, encapsulation tends to be less useful for subcomponents than supercomponents.

By the way, at the end of his video, Brian Will wonders if any language supports anonymous functions that _can’t_ access they scope they’re in. [D][8] does. Anonymous lambdas in D are normally closures, but anonymous stateless functions can also be declared if that’s what you want:

```
import std.stdio;

void main()
{
    int x = 41;

    // Value from immediately executed lambda
    auto v1 = () {
        return x + 1;
    }();
    writeln(v1);

    // Same thing
    auto v2 = delegate() {
        return x + 1;
    }();
    writeln(v2);

    // Plain functions aren't closures
    auto v3 = function() {
        // Can't access x
        // Can't access any mutable global state either if also marked pure
        return 42;
    }();
    writeln(v3);
}
```

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/10/13/oop_and_essential_state.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://medium.com/@brianwill/object-oriented-programming-a-personal-disaster-1b044c2383ab
[2]: https://www.youtube.com/watch?v=QM1iUe6IofM
[3]: http://www.cs.nott.ac.uk/~pszcah/G51ISS/Documents/NoSilverBullet.html
[4]: https://theartofmachinery.com/2017/06/25/compression_complexity_and_software.html
[5]: https://wiki.haskell.org/Tying_the_Knot
[6]: https://en.wikibooks.org/wiki/Haskell/Mutable_objects#The_ST_monad
[7]: https://theartofmachinery.com/2016/03/28/dirtying_pure_functions_can_be_useful.html
[8]: https://dlang.org
