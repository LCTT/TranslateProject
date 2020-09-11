[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why bother writing tests at all?)
[#]: via: (https://dave.cheney.net/2019/05/14/why-bother-writing-tests-at-all)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Why bother writing tests at all?
======

In previous posts and presentations I talked about [how to test][1], and [when to test][2]. To conclude this series of I’m going to ask the question, _why test at all?_

### Even if you don’t, someone _will_ test your software

I’m sure no-one reading this post thinks that software should be delivered without being tested first. Even if that were true, your customers are going to test it, or at least use it. If nothing else, it would be good to discover any issues with the code before your customers do. If not for the reputation of your company, at least for your professional pride.

So, if we agree that software should be tested, the question becomes: _who_ should do that testing?

### The majority of testing should be performed by development teams

I argue that the majority of the testing should be done by development groups. Moreover, testing should be automated, and thus the majority of these tests should be unit style tests.

To be clear, I am _not_ saying you shouldn’t write integration, functional, or end to end tests. I’m also _not_ saying that you shouldn’t have a QA group, or integration test engineers. However at a recent software conference, in a room of over 1,000 engineers, nobody raised their hand when I asked if they considered themselves in a pure quality assurance role.

You might argue that the audience was self selecting, that QA engineers did not feel a software conference was relevant–or welcoming–to them. However, I think this proves my point, the days of [one developer to one test engineer][3] are gone and not coming back.

If development teams aren’t writing the majority of tests, who is?

### Manual testing should not be the majority of your testing because manual testing is O(n)

Thus, if individual contributors are expected to test the software they write, why do we need to automate it? Why is a manual testing plan not good enough?

Manual testing of software or manual verification of a defect is not sufficient because it does not scale. As the number of manual tests grows, engineers are tempted to skip them or only execute the scenarios they _think_ are could be affected. Manual testing is expensive in terms of time, thus dollars, and it is boring. 99.9% of the tests that passed last time are _expected_ to pass again. Manual testing is looking for a needle in a haystack, except you don’t stop when you find the first needle.

This means that your first response when given a bug to fix or a feature to implement should be to write a failing test. This doesn’t need to be a unit test, but it should be an automated test. Once you’ve fixed the bug, or added the feature, now have the test case to prove it worked–and you can check them in together.

### Tests are the critical component that ensure you can always ship your master branch

As a development team, you are judged on your ability to deliver working software to the business. No, seriously, the business could care less about OOP vs FP, CI/CD, table tennis or limited run La Croix.

Your super power is, at any time, anyone on the team should be confident that the master branch of your code is shippable. This means at any time they can deliver a release of your software to the business and the business can recoup its investment in your development R&D.

I cannot emphasise this enough. If you want the non technical parts of the business to believe you are heros, you must never create a situation where you say “well, we can’t release right now because we’re in the middle of an important refactoring. It’ll be a few weeks. We hope.”

Again, I’m not saying you cannot refactor, but at every stage your product must be shippable. Your tests have to pass. It may not have all the desired features, but the features that are there should work as described on the tin.

### Tests lock in behaviour

Your tests are the contract about what your software does and does not do. Unit tests should lock in the behaviour of the package’s API. Integration tests do the same for complex interactions. Tests describe, in code, what the program promises to do.

If there is a unit test for each input permutation, you have defined the contract for what the code will do _in code_ , not documentation. This is a contract anyone on your team can assert by simply running the tests. At any stage you _know_ with a high degree of confidence that the behaviour people relied on before your change continues to function after your change.

### Tests give you confidence to change someone else’s code

Lastly, and this is the biggest one, for programmers working on a piece of code that has been through many hands. Tests give you the confidence to make changes.

Even though we’ve never met, something I know about you, the reader, is you will eventually leave your current employer. Maybe you’ll be moving on to a new role, or perhaps a promotion, perhaps you’ll move cities, or follow your partner overseas. Whatever the reason, the succession of the maintenance of programs you write is key.

If people cannot maintain our code then as you and I move from job to job we’ll leave behind programs which cannot be maintained. This goes beyond advocacy for a language or tool. Programs which cannot be changed, programs which are too hard to onboard new developers, or programs which feel like career digression to work on them will reach only one end state–they are a dead end. They represent a balance sheet loss for the business. They will be replaced.

If you worry about who will maintain your code after you’re gone, write good tests.

#### Related posts:

  1. [Writing table driven tests in Go][4]
  2. [Prefer table driven tests][5]
  3. [Automatically run your package’s tests with inotifywait][6]
  4. [The value of TDD][7]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/05/14/why-bother-writing-tests-at-all

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://dave.cheney.net/2019/05/07/prefer-table-driven-tests
[2]: https://dave.cheney.net/paste/absolute-unit-test-london-gophers.pdf
[3]: https://docs.microsoft.com/en-us/azure/devops/learn/devops-at-microsoft/evolving-test-practices-microsoft
[4]: https://dave.cheney.net/2013/06/09/writing-table-driven-tests-in-go (Writing table driven tests in Go)
[5]: https://dave.cheney.net/2019/05/07/prefer-table-driven-tests (Prefer table driven tests)
[6]: https://dave.cheney.net/2016/06/21/automatically-run-your-packages-tests-with-inotifywait (Automatically run your package’s tests with inotifywait)
[7]: https://dave.cheney.net/2016/04/11/the-value-of-tdd (The value of TDD)
