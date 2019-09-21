[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Testing isn't everything)
[#]: via: (https://arp242.net/weblog/testing.html)
[#]: author: (Martin Tournoij https://arp242.net/)

Testing isn't everything
======

This is adopted from a discussion about [Want to write good unit tests in go? Don’t panic… or should you?][1] While this mainly talks about Go a lot of the points also apply to other languages.

Some of the most difficult code I’ve worked with is code that is “easily testable”. Code that abstracts everything to the point where you have no idea what’s going on, just so that it can add a “unit test” to what would otherwise be a very straightforward function. DHH called this [Test-induced design damage][2].

Testing is just one tool to make sure that your program works, out of several. Another very important tool is writing code in such a way that it is easy to understand and reason about (“simplicity”).

Books that advocate extensive testing – such as Robert C. Martin’s Clean Code – were written, in part, as a response to ever more complex programs, where you read 1,000 lines of code but still had no idea what’s going on. I recently had to port a simple Java “emoji replacer” (😂 ➙ 😂) to Go. To ensure compatibility I looked up the im­ple­men­ta­tion. It was a whole bunch of classes, factories, and whatnot which all just resulted in calling a regexp on a string. 🤷

In dynamic languages like Ruby and Python tests are important for a different reason, as something like this will “work” just fine:

```
if condition:
 print('w00t')
else:
 nonexistent_function()
```

Except of course if that `else` branch is entered. It’s easy to typo stuff, or mix stuff up.

In Go, both of these problems are less of a concern. It has a good static type system, and the focus is on simple straightforward code that is easy to comprehend. Even for a number of dynamic languages there are optional typing systems (function annotations in Python, TypeScript for JavaScript).

Sometimes you can do a straightforward implementation that doesn’t sacrifice anything for testability; great! But sometimes you have to strike a balance. For some code, not adding a unit test is fine.

Intensive focus on “unit tests” can be incredibly damaging to a code base. Some codebases have a gazillion unit tests, which makes any change excessively time-consuming as you’re fixing up a whole bunch of tests for even trivial changes. Often times a lot of these tests are just duplicates; adding tests to every layer of a simple CRUD HTTP endpoint is a common example. In many apps it’s fine to just rely on a single integration test.

Stuff like SQL mocks is another great example. It makes code more complex, harder to change, all so we can say we added a “unit test” to `select * from foo where x=?`. The worst part is, it doesn’t even test anything other than verifying you didn’t typo an SQL query. As soon as the test starts doing anything useful, such as verifying that it actually returns the correct rows from the database, the Unit Test purists will start complaining that it’s not a True Unit Test™ and that You’re Doing It Wrong™.
For most queries, the integration tests and/or manual tests are fine, and extensive SQL mocks are entirely superfluous at best, and harmful at worst.

There are exceptions, of course; if you’ve got a lot of `if cond { q += "more sql" }` then adding SQL mocks to verify the correctness of that logic might be a good idea. Even in those cases a “non-unit unit test” (e.g. one that just accesses the database) is still a viable option. Integration tests are also still an option. A lot of applications don’t have those kind of complex queries anyway.

One important reason for the focus on unit tests is to ensure test code runs fast. This was a response to massive test harnesses that take a day to run. This, again, is not really a problem in Go. All integration tests I’ve written run in a reasonable amount of time (several seconds at most, usually faster). The test cache introduced in Go 1.10 makes it even less of a concern.

Last year a coworker refactored our ETag-based caching library. The old code was very straightforward and easy to understand, and while I’m not claiming it was guaranteed bug-free, it did work very well for a long time.

It should have been written with some tests in place, but it wasn’t (I didn’t write the original version). Note that the code was not completely untested, as we did have integration tests.

The refactored version is much more complex. Aside from the two weeks lost on refactoring a working piece of code to … another working piece of code (topic for another post), I’m not so convinced it’s actually that much better. I consider myself a reasonably accomplished and experienced programmer, with a reasonable knowledge and experience in Go. I think that in general, based on feedback from peers and performance reviews, I am at least a programmer of “average” skill level, if not more.

If an average programmer has trouble comprehending what is in essence a handful of simple functions because there are so many layers of abstractions, then something has gone wrong. The refactor traded one tool to verify correctness (simplicity) with another (testing). Simplicity is hardly a guarantee to ensure correctness, but neither are unit tests. Ideally, we should do both.

Postscript: the refactor introduced a bug and removed a feature that was useful, but is now harder to add, not in the least because the code is much more complex.

All units working correctly gives exactly zero guarantees that the program is working correctly. A lot of logic errors won’t be caught because the logic consists of several units working together. So you need integration tests, and if the integration tests duplicate half of your unit tests, then why bother with those unit tests?

Test Driven Development (TDD) is also just one tool. It works well for some problems; not so much for others. In particular, I think that “forced to write code in tiny units” can be terribly harmful in some cases. Some code is just a serial script which says “do this, and then that, and then this”. Splitting that up in a whole bunch of “tiny units” can greatly reduce how easy the code is to understand, and thus harder to verify that it is correct.

I’ve had to fix some Ruby code where everything was in tiny units – there is a strong culture of TDD in the Ruby community – and even though the units were easy to understand I found it incredibly hard to understand the application logic. If everything is split in “tiny units” then understanding how everything fits together to create an actual program that does something useful will be much harder.

You see the same friction in the old microkernel vs. monolithic kernel debate, or the more recent microservices vs. monolithic app one. In principle splitting everything up in small parts sounds like a great idea, but in practice it turns out that making all the small parts work together is a very hard problem. A hybrid approach seems to work best for kernels and app design, balancing the ad­van­tages and downsides of both approaches. I think the same applies to code.

To be clear, I am not against unit tests or TDD and claiming we should all gung-go cowboy code our way through life 🤠. I write unit tests and practice TDD, when it makes sense. My point is that unit tests and TDD are not the solution to every single last problem and should applied indiscriminately. This is why I use words such as “some” and “often” so frequently.

This brings me to the topic of testing frameworks. I have never understood what problem libraries such as [goblin][3] are solving. How is this:

```
Expect(err).To(nil)
Expect(out).To(test.wantOut)
```

An improvement over this?

```
if err != nil {
    t.Fatal(err)
}

if out != tt.want {
    t.Errorf("out: %q\nwant: %q", out, tt.want)
}
```

What’s wrong with `if` and `==`? Why do we need to abstract it? Note that with table-driven tests you’re only typing these checks once, so you’re saving just a few lines here.

[Ginkgo][4] is even worse. It turns a very simple, straightforward, and understandable piece of code and doesn’t just abstract `if`, it also chops up the execution in several different functions (`BeforeEach()` and `DescribeTable()`).

This is known as Behaviour-driven development (BDD). I am not entirely sure what to think of BDD. I am skeptical, but I’ve never properly used it in a large project so I’m hesitant to just dismiss it. Note that I said “properly”: most projects don’t really use BDD, they just use a library with a BDD syntax and shoehorn their testing code in to that. That’s ad-hoc BDD, or faux-BDD.

Whatever merits BDD may have, they are not present simply because your testing code vaguely resembles BDD-style syntax. This on its own demonstrates that BDD is perhaps not a great idea for many projects.

I think there are real problems with these BDD(-ish) test tools, as they obfuscate what you’re actually doing. No matter what, testing remains a matter of getting the output of a function and checking if that matches what you expected. No testing methodology is going to change that fundamental. The more layers you add on top of that, the harder it will be to debug.

When determining if something is “easy” then my prime concern is not how easy something is to write, but how easy something is to debug when things fail. I will gladly spend a bit more effort writing things if that makes things a lot easier to debug.

All code – including testing code – can fail in confusing, surprising, and unexpected ways (a “bug”), and then you’re expected to debug that code. The more complex the code, the harder it is to debug.

You should expect all code – including testing code – to go through several debugging cycles. Note that with debugging cycle I don’t mean “there is a bug in the code you need to fix”, but rather “I need to look at this code to fix the bug”.

In general, I already find testing code harder to debug than regular code, as the “code surface” tends to be larger. You have the testing code and the actual implementation code to think of. That’s a lot more than just thinking of the implementation code.

Adding these abstractions means you will now also have to think about that, too! This might be okay if the abstractions would reduce the scope of what you have to think about, which is a common reason to add abstractions in regular code, but it doesn’t. It just adds more things to think about.

So these are exactly the wrong kind of abstractions: they wrap and obfuscate, rather than separate concerns and reduce the scope.

If you’re interested in soliciting contributions from other people in open source projects then making your tests understandable is a very important concern (it’s also important in business context, but a bit less so, as you’ve got actual time to train people).

Seeing PRs with “here’s the code, it works, but I couldn’t figure out the tests, plz halp!” is not uncommon; and I’m fairly sure that at least a few people never even bothered to submit PRs just because they got stuck on the tests. I know I have.

There is one open source project that I contributed to, and would like to contribute more to, but don’t because it’s just too hard to write and run tests. Every change is “write working code in 15 minutes, spend 45 minutes dealing with tests”. It’s … no fun at all.

Writing good software is hard. I’ve got some ideas on how to do it, but don’t have a comprehensive view. I’m not sure if anyone really does. I do know that “always add unit tests” and “always practice TDD” isn’t the answer, in spite of them being useful concepts. To give an analogy: most people would agree that a free market is a good idea, but at the same time even most libertarians would agree it’s not the complete solution to every single problem (well, [some do][5], but those ideas are … rather misguided).

You can mail me at [martin@arp242.net][6] or [create a GitHub issue][7] for feedback, questions, etc.

--------------------------------------------------------------------------------

via: https://arp242.net/weblog/testing.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: https://medium.com/@jens.neuse/want-to-write-good-unit-tests-in-go-dont-panic-or-should-you-ba3eb5bf4f51
[2]: http://david.heinemeierhansson.com/2014/test-induced-design-damage.html
[3]: https://github.com/franela/goblin
[4]: https://github.com/onsi/ginkgo
[5]: https://en.wikipedia.org/wiki/Murray_Rothbard#Children's_rights_and_parental_obligations
[6]: mailto:martin@arp242.net
[7]: https://github.com/Carpetsmoker/arp242.net/issues/new
