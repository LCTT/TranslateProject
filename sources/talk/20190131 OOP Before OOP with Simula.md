[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (OOP Before OOP with Simula)
[#]: via: (https://twobithistory.org/2019/01/31/simula.html)
[#]: author: (Sinclair Target https://twobithistory.org)

OOP Before OOP with Simula
======

Imagine that you are sitting on the grassy bank of a river. Ahead of you, the water flows past swiftly. The afternoon sun has put you in an idle, philosophical mood, and you begin to wonder whether the river in front of you really exists at all. Sure, large volumes of water are going by only a few feet away. But what is this thing that you are calling a “river”? After all, the water you see is here and then gone, to be replaced only by more and different water. It doesn’t seem like the word “river” refers to any fixed thing in front of you at all.

In 2009, Rich Hickey, the creator of Clojure, gave [an excellent talk][1] about why this philosophical quandary poses a problem for the object-oriented programming paradigm. He argues that we think of an object in a computer program the same way we think of a river—we imagine that the object has a fixed identity, even though many or all of the object’s properties will change over time. Doing this is a mistake, because we have no way of distinguishing between an object instance in one state and the same object instance in another state. We have no explicit notion of time in our programs. We just breezily use the same name everywhere and hope that the object is in the state we expect it to be in when we reference it. Inevitably, we write bugs.

The solution, Hickey concludes, is that we ought to model the world not as a collection of mutable objects but a collection of processes acting on immutable data. We should think of each object as a “river” of causally related states. In sum, you should use a functional language like Clojure.

![][2] 
The author, on a hike, pondering the ontological commitments
of object-oriented programming.

Since Hickey gave his talk in 2009, interest in functional programming languages has grown, and functional programming idioms have found their way into the most popular object-oriented languages. Even so, most programmers continue to instantiate objects and mutate them in place every day. And they have been doing it for so long that it is hard to imagine that programming could ever look different.

I wanted to write an article about Simula and imagined that it would mostly be about when and how object-oriented constructs we are familiar with today were added to the language. But I think the more interesting story is about how Simula was originally so unlike modern object-oriented programming languages. This shouldn’t be a surprise, because the object-oriented paradigm we know now did not spring into existence fully formed. There were two major versions of Simula: Simula I and Simula 67. Simula 67 brought the world classes, class hierarchies, and virtual methods. But Simula I was a first draft that experimented with other ideas about how data and procedures could be bundled together. The Simula I model is not a functional model like the one Hickey proposes, but it does focus on processes that unfold over time rather than objects with hidden state that interact with each other. Had Simula 67 stuck with more of Simula I’s ideas, the object-oriented paradigm we know today might have looked very different indeed—and that contingency should teach us to be wary of assuming that the current paradigm will dominate forever.

### Simula 0 Through 67

Simula was created by two Norwegians, Kristen Nygaard and Ole-Johan Dahl.

In the late 1950s, Nygaard was employed by the Norwegian Defense Research Establishment (NDRE), a research institute affiliated with the Norwegian military. While there, he developed Monte Carlo simulations used for nuclear reactor design and operations research. These simulations were at first done by hand and then eventually programmed and run on a Ferranti Mercury. Nygaard soon found that he wanted a higher-level way to describe these simulations to a computer.

The kind of simulation that Nygaard commonly developed is known as a “discrete event model.” The simulation captures how a sequence of events change the state of a system over time—but the important property here is that the simulation can jump from one event to the next, since the events are discrete and nothing changes in the system between events. This kind of modeling, according to a paper that Nygaard and Dahl presented about Simula in 1966, was increasingly being used to analyze “nerve networks, communication systems, traffic flow, production systems, administrative systems, social systems, etc.” So Nygaard thought that other people might want a higher-level way to describe these simulations too. He began looking for someone that could help him implement what he called his “Simulation Language” or “Monte Carlo Compiler.”

Dahl, who had also been employed by NDRE, where he had worked on language design, came aboard at this point to play Wozniak to Nygaard’s Jobs. Over the next year or so, Nygaard and Dahl worked to develop what has been called “Simula 0.” This early version of the language was going to be merely a modest extension to ALGOL 60, and the plan was to implement it as a preprocessor. The language was then much less abstract than what came later. The primary language constructs were “stations” and “customers.” These could be used to model certain discrete event networks; Nygaard and Dahl give an example simulating airport departures. But Nygaard and Dahl eventually came up with a more general language construct that could represent both “stations” and “customers” and also model a wider range of simulations. This was the first of two major generalizations that took Simula from being an application-specific ALGOL package to a general-purpose programming language.

In Simula I, there were no “stations” or “customers,” but these could be recreated using “processes.” A process was a bundle of data attributes associated with a single action known as the process’ operating rule. You might think of a process as an object with only a single method, called something like `run()`. This analogy is imperfect though, because each process’ operating rule could be suspended or resumed at any time—the operating rules were a kind of coroutine. A Simula I program would model a system as a set of processes that conceptually all ran in parallel. Only one process could actually be “current” at any time, but once a process suspended itself the next queued process would automatically take over. As the simulation ran, behind the scenes, Simula would keep a timeline of “event notices” that tracked when each process should be resumed. In order to resume a suspended process, Simula needed to keep track of multiple call stacks. This meant that Simula could no longer be an ALGOL preprocessor, because ALGOL had only once call stack. Nygaard and Dahl were committed to writing their own compiler.

In their paper introducing this system, Nygaard and Dahl illustrate its use by implementing a simulation of a factory with a limited number of machines that can serve orders. The process here is the order, which starts by looking for an available machine, suspends itself to wait for one if none are available, and then runs to completion once a free machine is found. There is a definition of the order process that is then used to instantiate several different order instances, but no methods are ever called on these instances. The main part of the program just creates the processes and sets them running.

The first Simula I compiler was finished in 1965. The language grew popular at the Norwegian Computer Center, where Nygaard and Dahl had gone to work after leaving NDRE. Implementations of Simula I were made available to UNIVAC users and to Burroughs B5500 users. Nygaard and Dahl did a consulting deal with a Swedish company called ASEA that involved using Simula to run job shop simulations. But Nygaard and Dahl soon realized that Simula could be used to write programs that had nothing to do with simulation at all.

Stein Krogdahl, a professor at the University of Oslo that has written about the history of Simula, claims that “the spark that really made the development of a new general-purpose language take off” was [a paper called “Record Handling”][3] by the British computer scientist C.A.R. Hoare. If you read Hoare’s paper now, this is easy to believe. I’m surprised that you don’t hear Hoare’s name more often when people talk about the history of object-oriented languages. Consider this excerpt from his paper:

> The proposal envisages the existence inside the computer during the execution of the program, of an arbitrary number of records, each of which represents some object which is of past, present or future interest to the programmer. The program keeps dynamic control of the number of records in existence, and can create new records or destroy existing ones in accordance with the requirements of the task in hand.

> Each record in the computer must belong to one of a limited number of disjoint record classes; the programmer may declare as many record classes as he requires, and he associates with each class an identifier to name it. A record class name may be thought of as a common generic term like “cow,” “table,” or “house” and the records which belong to these classes represent the individual cows, tables, and houses.

Hoare does not mention subclasses in this particular paper, but Dahl credits him with introducing Nygaard and himself to the concept. Nygaard and Dahl had noticed that processes in Simula I often had common elements. Using a superclass to implement those common elements would be convenient. This also raised the possibility that the “process” idea itself could be implemented as a superclass, meaning that not every class had to be a process with a single operating rule. This then was the second great generalization that would make Simula 67 a truly general-purpose programming language. It was such a shift of focus that Nygaard and Dahl briefly considered changing the name of the language so that people would know it was not just for simulations. But “Simula” was too much of an established name for them to risk it.

In 1967, Nygaard and Dahl signed a contract with Control Data to implement this new version of Simula, to be known as Simula 67. A conference was held in June, where people from Control Data, the University of Oslo, and the Norwegian Computing Center met with Nygaard and Dahl to establish a specification for this new language. This conference eventually led to a document called the [“Simula 67 Common Base Language,”][4] which defined the language going forward.

Several different vendors would make Simula 67 compilers. The Association of Simula Users (ASU) was founded and began holding annual conferences. Simula 67 soon had users in more than 23 different countries.

### 21st Century Simula

Simula is remembered now because of its influence on the languages that have supplanted it. You would be hard-pressed to find anyone still using Simula to write application programs. But that doesn’t mean that Simula is an entirely dead language. You can still compile and run Simula programs on your computer today, thanks to [GNU cim][5].

The cim compiler implements the Simula standard as it was after a revision in 1986. But this is mostly the Simula 67 version of the language. You can write classes, subclass, and virtual methods just as you would have with Simula 67. So you could create a small object-oriented program that looks a lot like something you could easily write in Python or Ruby:

```
! dogs.sim ;
Begin
    Class Dog;
        ! The cim compiler requires virtual procedures to be fully specified ;
        Virtual: Procedure bark Is Procedure bark;;
    Begin
        Procedure bark;
        Begin
            OutText("Woof!");
            OutImage;           ! Outputs a newline ;
        End;
    End;

    Dog Class Chihuahua;        ! Chihuahua is "prefixed" by Dog ;
    Begin
        Procedure bark;
        Begin
            OutText("Yap yap yap yap yap yap");
            OutImage;
        End;
    End;

    Ref (Dog) d;
    d :- new Chihuahua;         ! :- is the reference assignment operator ;
    d.bark;
End;
```

You would compile and run it as follows:

```
$ cim dogs.sim
Compiling dogs.sim:
gcc -g -O2 -c dogs.c
gcc -g -O2 -o dogs dogs.o -L/usr/local/lib -lcim
$ ./dogs
Yap yap yap yap yap yap
```

(You might notice that cim compiles Simula to C, then hands off to a C compiler.)

This was what object-oriented programming looked like in 1967, and I hope you agree that aside from syntactic differences this is also what object-oriented programming looks like in 2019. So you can see why Simula is considered a historically important language.

But I’m more interested in showing you the process model that was central to Simula I. That process model is still available in Simula 67, but only when you use the `Process` class and a special `Simulation` block.

In order to show you how processes work, I’ve decided to simulate the following scenario. Imagine that there is a village full of villagers next to a river. The river has lots of fish, but between them the villagers only have one fishing rod. The villagers, who have voracious appetites, get hungry every 60 minutes or so. When they get hungry, they have to use the fishing rod to catch a fish. If a villager cannot use the fishing rod because another villager is waiting for it, then the villager queues up to use the fishing rod. If a villager has to wait more than five minutes to catch a fish, then the villager loses health. If a villager loses too much health, then that villager has starved to death.

This is a somewhat strange example and I’m not sure why this is what first came to mind. But there you go. We will represent our villagers as Simula processes and see what happens over a day’s worth of simulated time in a village with four villagers.

The full program is [available here as a Gist][6].

The last lines of my output look like the following. Here we are seeing what happens in the last few hours of the day:

```
1299.45: John is hungry and requests the fishing rod.
1299.45: John is now fishing.
1311.39: John has caught a fish.
1328.96: Betty is hungry and requests the fishing rod.
1328.96: Betty is now fishing.
1331.25: Jane is hungry and requests the fishing rod.
1340.44: Betty has caught a fish.
1340.44: Jane went hungry waiting for the rod.
1340.44: Jane starved to death waiting for the rod.
1369.21: John is hungry and requests the fishing rod.
1369.21: John is now fishing.
1379.33: John has caught a fish.
1409.59: Betty is hungry and requests the fishing rod.
1409.59: Betty is now fishing.
1419.98: Betty has caught a fish.
1427.53: John is hungry and requests the fishing rod.
1427.53: John is now fishing.
1437.52: John has caught a fish.
```

Poor Jane starved to death. But she lasted longer than Sam, who didn’t even make it to 7am. Betty and John sure have it good now that only two of them need the fishing rod.

What I want you to see here is that the main, top-level part of the program does nothing but create the four villager processes and get them going. The processes manipulate the fishing rod object in the same way that we would manipulate an object today. But the main part of the program does not call any methods or modify and properties on the processes. The processes have internal state, but this internal state only gets modified by the process itself.

There are still fields that get mutated in place here, so this style of programming does not directly address the problems that pure functional programming would solve. But as Krogdahl observes, “this mechanism invites the programmer of a simulation to model the underlying system as a set of processes, each describing some natural sequence of events in that system.” Rather than thinking primarily in terms of nouns or actors—objects that do things to other objects—here we are thinking of ongoing processes. The benefit is that we can hand overall control of our program off to Simula’s event notice system, which Krogdahl calls a “time manager.” So even though we are still mutating processes in place, no process makes any assumptions about the state of another process. Each process interacts with other processes only indirectly.

It’s not obvious how this pattern could be used to build, say, a compiler or an HTTP server. (On the other hand, if you’ve ever programmed games in the Unity game engine, this should look familiar.) I also admit that even though we have a “time manager” now, this may not have been exactly what Hickey meant when he said that we need an explicit notion of time in our programs. (I think he’d want something like the superscript notation [that Ada Lovelace used][7] to distinguish between the different values a variable assumes through time.) All the same, I think it’s really interesting that right there at the beginning of object-oriented programming we can find a style of programming that is not all like the object-oriented programming we are used to. We might take it for granted that object-oriented programming simply works one way—that a program is just a long list of the things that certain objects do to other objects in the exact order that they do them. Simula I’s process system shows that there are other approaches. Functional languages are probably a better thought-out alternative, but Simula I reminds us that the very notion of alternatives to modern object-oriented programming should come as no surprise.

If you enjoyed this post, more like it come out every four weeks! Follow [@TwoBitHistory][8] on Twitter or subscribe to the [RSS feed][9] to make sure you know when a new post is out.

Previously on TwoBitHistory…

> Hey everyone! I sadly haven't had time to do any new writing but I've just put up an updated version of my history of RSS. This version incorporates interviews I've since done with some of the key people behind RSS like Ramanathan Guha and Dan Libby.<https://t.co/WYPhvpTGqB>
>
> — TwoBitHistory (@TwoBitHistory) [December 18, 2018][10]



--------------------------------------------------------------------------------

1. Jan Rune Holmevik, “The History of Simula,” accessed January 31, 2019, http://campus.hesge.ch/daehne/2004-2005/langages/simula.htm. ↩

2. Ole-Johan Dahl and Kristen Nygaard, “SIMULA—An ALGOL-Based Simulation Langauge,” Communications of the ACM 9, no. 9 (September 1966): 671, accessed January 31, 2019, http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.95.384&rep=rep1&type=pdf. ↩

3. Stein Krogdahl, “The Birth of Simula,” 2, accessed January 31, 2019, http://heim.ifi.uio.no/~steinkr/papers/HiNC1-webversion-simula.pdf. ↩

4. ibid. ↩

5. Ole-Johan Dahl and Kristen Nygaard, “The Development of the Simula Languages,” ACM SIGPLAN Notices 13, no. 8 (August 1978): 248, accessed January 31, 2019, https://hannemyr.com/cache/knojd_acm78.pdf. ↩

6. Dahl and Nygaard (1966), 676. ↩

7. Dahl and Nygaard (1978), 257. ↩

8. Krogdahl, 3. ↩

9. Ole-Johan Dahl, “The Birth of Object-Orientation: The Simula Languages,” 3, accessed January 31, 2019, http://www.olejohandahl.info/old/birth-of-oo.pdf. ↩

10. Dahl and Nygaard (1978), 265. ↩

11. Holmevik. ↩

12. Krogdahl, 4. ↩


--------------------------------------------------------------------------------

via: https://twobithistory.org/2019/01/31/simula.html

作者：[Sinclair Target][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://www.infoq.com/presentations/Are-We-There-Yet-Rich-Hickey
[2]: /images/river.jpg
[3]: https://archive.computerhistory.org/resources/text/algol/ACM_Algol_bulletin/1061032/p39-hoare.pdf
[4]: http://web.eah-jena.de/~kleine/history/languages/Simula-CommonBaseLanguage.pdf
[5]: https://www.gnu.org/software/cim/
[6]: https://gist.github.com/sinclairtarget/6364cd521010d28ee24dd41ab3d61a96
[7]: https://twobithistory.org/2018/08/18/ada-lovelace-note-g.html
[8]: https://twitter.com/TwoBitHistory
[9]: https://twobithistory.org/feed.xml
[10]: https://twitter.com/TwoBitHistory/status/1075075139543449600?ref_src=twsrc%5Etfw
