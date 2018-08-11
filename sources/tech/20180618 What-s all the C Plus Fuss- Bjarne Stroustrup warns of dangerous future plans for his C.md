What's all the C Plus Fuss? Bjarne Stroustrup warns of dangerous future plans for his C++
======

![](https://regmedia.co.uk/2018/06/15/shutterstock_38621860.jpg?x=442&y=293&crop=1)

**Interview** Earlier this year, Bjarne Stroustrup, creator of C++, managing director in the technology division of Morgan Stanley, and a visiting professor of computer science at Columbia University in the US, wrote [a letter][1] inviting those overseeing the evolution of the programming language to “Remember the Vasa!”

Easy for a Dane to understand no doubt, but perhaps more of a stretch for those with a few gaps in their knowledge of 17th century Scandinavian history. The Vasa was a Swedish warship, commissioned by King Gustavus Adolphus. It was the most powerful warship in the Baltic Sea from its maiden voyage on the August 10, 1628, until a few minutes later when it sank.

The formidable Vasa suffered from a design flaw: it was top-heavy, so much so that it was [undone by a gust of wind][2]. By invoking the memory of the capsized ship, Stroustrup served up a cautionary tale about the risks facing C++ as more and more features get added to the language.

Quite a few such features have been suggested. Stroustrup cited 43 proposals in his letter. He contends those participating in the evolution of the ISO standard language, a group known as [WG21][3], are working to advance the language but not together.

In his letter, he wrote:

>Individually, many proposals make sense. Together they are insanity to the point of endangering the future of C++.

He makes clear that he doesn’t interpret the fate of the Vasa to mean that incremental improvements spell doom. Rather, he takes it as a lesson to build a solid foundation, to learn from experience and to test thoroughly.

With the recent conclusion of the C++ Standardization Committee Meeting in Rapperswil, Switzerland, earlier this month, Stroustrup addressed a few questions put to him by _The Register_ about what's next for the language. (The most recent version is C++17, which arrived last year; the next version C++20 is under development and expected in 2020.)

**_Register:_ In your note, Remember the Vasa!, you wrote:**

>The foundation begun in C++11 is not yet complete, and C++17 did little to make our foundation more solid, regular, and complete. Instead, it added significant surface complexity and increased the number of features people need to learn. C++ could crumble under the weight of these – mostly not quite fully-baked – proposals. We should not spend most our time creating increasingly complicated facilities for experts, such as ourselves.

**Is C++ too challenging for newcomers, and if so, what features do you believe would make the language more accessible?**

_**Stroustrup:**_ Some parts of C++ are too challenging for newcomers.

On the other hand, there are parts of C++ that makes it far more accessible to newcomers than C or 1990s C++. The difficulty is to get the larger community to focus on those parts and help beginners and casual C++ users to avoid the parts that are there to support implementers of advanced libraries.

I recommend the [C++ Core Guidelines][4] as an aide for that.

Also, my “A Tour of C++” can help people get on the right track with modern C++ without getting lost in 1990s complexities or ensnarled by modern facilities meant for expert use. The second edition of “A Tour of C++” covering C++17 and parts of C++20 is on its way to the stores.

I and others have taught C++ to 1st year university students with no previous programming experience in 3 months. It can be done as long as you don’t try to dig into every obscure corner of the language and focus on modern C++.

“Making simple things simple” is a long-term goal of mine. Consider the C++11 range-for loop:
```
for (int& x : v) ++x; // increment each element of the container v

```

where v can be just about any container. In C and C-style C++, that might look like this:
```
for (int i=0; i<MAX; i++) ++v[i]; // increment each element of the array v

```

Some people complained that adding the range-for loop made C++ more complicated, and they were obviously correct because it added a feature, but it made the _use_ of C++ simpler. It also eliminated some common errors with the use of the traditional for loop.

Another example is the C++11 standard thread library. It is far simpler to use and less error-prone than using the POSIX or Windows thread C APIs directly.

**_Register:_ How would you characterize the current state of the language?**

_**Stroustrup:**_ C++11 was a major improvement of C++ and C++14 completed that work. C++17 added quite a few features without offering much support for novel techniques. C++20 looks like it might become a major improvement. The state of compilers and standard-library implementations are excellent and very close to the latest standards. C++17 is already usable. The tool support is improving steadily. There are lots of third-party libraries and many new tools. Unfortunately, those can be hard to find.

The worries I expressed in the Vasa paper relate to the standards process that combines over-enthusiasm for novel facilities with perfectionism that delays significant improvements. “The best is the enemy of the good.” There were 160 participants at the June Rapperswil meeting. It is hard to keep a consistent focus in a group that large and diverse. There is also a tendency for experts to design more for themselves than for the community at large.

 **Register: Is there a desired state for the language or rather do you strive simply for a desired adaptability to what programmers require at any given time?

**Stroustrup:** Both. I’d like to see C++ supporting a guaranteed completely type-safe and resource-safe style of programming. This should not be done by restricting applicability or adding cost, but by improved expressiveness and performance. I think it can be done and that the approach of giving programmers better (and easier to use) language facilities can get us there.

That end-goal will not be met soon or just through language design alone. We need a combination of improved language features, better libraries, static analysis, and rules for effective programming. The C++ Core Guidelines is part of my broad, long-term approach to improve the quality of C++ code.

**Register: Is there an identifiable threat to C++? If so, what form does that take? (e.g. slow evolution, the attraction of emerging low-level languages, etc...your note seems to suggest it may be too many proposals.)**

**Stroustrup:** Certainly; we have had 400 papers this year already. They are not all new proposals, of course. Many relate the necessary and unglamorous work on precisely specifying the language and its standard library, but the volume is getting unmanageable. You can find all the committee papers on the WG21 website.

I wrote the “Remember the Vasa!” as a call to action. I am scared of the pressure to add language features to address immediate needs and fashions, rather than to strengthen the language foundations (e.g. improving the static type system). Adding anything new, however minor carries a cost, such as implementation, teaching, tools upgrades. Major features are those that change the way we think about programming. Those are the ones we must concentrate on.

The committee has established a “Direction Group” of experienced people with strong track records in many areas of the language, the standard library, implementation, and real-word use. I’m a member and we wrote up something on direction, design philosophy, and suggested areas of emphasis.

For C++20, we recommend to focus on:

    Concepts
    Modules (offering proper modularity and dramatic compile-time improvements)
    Ranges (incl. some of the infinite sequence extensions)
    Networking Concepts in the standard library

After the Rappwerwil meeting, the odds are reasonable, though getting modules and networking is obviously a stretch. I’m an optimist and the committee members are working very hard.

I don’t worry about other languages or new languages. I like programming languages. If a new language offers something useful that other languages don’t, it has a role and we can all learn from it. And then, of course, each language has its own problems. Many of C++’s problems relate to its very wide range of application areas, its very large and diverse user population, and overenthusiasm. Most language communities would love to have such problems.

**Register: Are there any architectural decisions about the language you've reconsidered?**

**Stroustrup:** I always consider older decisions and designs when I work on something new. For example, see my History of Programming papers 1, 2.

There are no major decisions I regret, though there is hardly any feature I wouldn’t do somewhat differently if I had to do it again.

As ever, the ability to deal directly with hardware plus zero-overhead abstraction is the guiding idea. The use of constructors and destructors to handle resources is key (RAII) and the STL is a good example of what can be done in a C++ library.

**Register: Does the three-year release cadence, adopted in 2011 it seems, still work? I ask because Java has been dealing with a desire for faster iteration.**

**Stroustrup:** I think C++20 will be delivered on time (like C++14 and C++17 were) and that the major compilers will conform to it almost instantly. I also hope that C++20 will be a major improvement over C++17.

I don’t worry too much about how other languages manage their releases. C++ is controlled by a committee working under ISO rules, rather by a corporation or a “beneficent dictator for life.” This will not change. For ISO standards, C++’s three-year cycle is a dramatic innovation. The standard is 5- or 10-year cycles.

**Register: In your note you wrote:**

    We need a reasonably coherent language that can be used by 'ordinary programmers' whose main concern is to ship great applications on time. 

Are changes to the language sufficient to address this or might this also involve more accessible tooling and educational support?

**Stroustrup:** I try hard to communicate my ideas of what C++ is and how it might be used and I encourage others to do the same.

In particular, I encourage presenters and authors to make useful ideas accessible to the great mass of C++ programmers, rather than demonstrating how clever they are by presenting complicated examples and techniques. My 2017 CppCon keynote was “Learning and Teaching C++” and it also pointed to the need for better tools.

I mentioned build support and package managers. Those have traditionally been areas of weakness for C++. The standards committee now has a tools Study Group and will probably soon have an Education Study group.

The C++ community has traditionally been completely disorganized, but over the last five years many more meetings and blogs have sprung up to satisfy the community’s appetite for news and support. CppCon, isocpp.org, and Meeting++ are examples.

Design in a committee is very hard. However committees are a fact of life in all large projects. I am concerned, but being concerned and facing up to the problems is necessary for success.

**Register: How would you characterize the C++ community process? Are there aspects of the communication and decision making procedure that you'd like to see change?**

**Stroustrup:** C++ doesn’t have a corporately controlled “community process”; it has an ISO standards process. We can’t significantly change the ISO rules. Ideally, we’d have a small full-time “secretariat” making the final decisions and setting directions, but that’s not going to happen. Instead, we have hundreds of people discussion on-line, about 160 people voting on technical issues, about 70 organizations and 11 nations formally voting on the resulting proposals. That’s messy, but sometimes we make it work.

**Register: Finally, what upcoming C++ features do you feel will be most beneficial for C++ users?**

**Stroustrup:**

    + Concepts to significantly simplify generic programming
    + _Parallel algorithms – there is no easier way to use the power of the concurrency features of modern hardware
    + Coroutines, if the committee can decide on those for C++20.
    + Modules to improve the way organize our source code and dramatically improve compile times. I hope we can get such modules, but it is not yet certain that we can do that for C++20.
    + A standard networking library, but it is not yet certain that we can do that for C++20.

In addition:

    + Contracts (run-time checked pre-conditions, post-conditions, and assertions) could become significant for many.
    + The date and time-zone support library will be significant for many (in industry).

**Register: Is there anything else you'd like to add?**

**Stroustrup:** If the C++ standards committee can focus on major issues to solve major problems, C++20 will be great. Until then, we have C++17 that is still far better than many people’s outdated impressions of C++. ®

--------------------------------------------------------------------------------

via: https://www.theregister.co.uk/2018/06/18/bjarne_stroustrup_c_plus_plus/

作者：[Thomas Claburn][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theregister.co.uk/Author/3190
[1]:http://open-std.org/JTC1/SC22/WG21/docs/papers/2018/p0977r0.pdf
[2]:https://www.vasamuseet.se/en/vasa-history/disaster
[3]:http://open-std.org/JTC1/SC22/WG21/
[4]:https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md
[5]:https://go.theregister.co.uk/tl/1755/shttps://continuouslifecycle.london/
