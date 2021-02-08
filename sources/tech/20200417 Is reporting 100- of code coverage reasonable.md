[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Is reporting 100% of code coverage reasonable?)
[#]: via: (https://opensource.com/article/20/4/testing-code-coverage)
[#]: author: (Eric Herman https://opensource.com/users/ericherman)

Is reporting 100% of code coverage reasonable?
======
The time required to reach reporting 100% of code coverage is
considerably less than what I would have estimated before this
exploration.
![Code going into a computer.][1]

The [Foundation for Public Code][2] works to enable open and collaborative public-purpose software for public organizations (like local governments) internationally. We do this by supporting software at the codebase level through codebase stewardship. We also publish the [Standard for Public Code][3] (draft version 0.1.4 at the time of this writing), which helps open source codebase communities build solutions that can be reused successfully by other organizations. It includes guidance for policymakers, managers, developers, designers, and vendors.

Among other things, the standard addresses [code coverage][4], or how much of the code is executed when an automated test suite runs. It's one way to measure the likelihood that the code contains undetected software bugs. In the standard's ["Use continuous integration" requirements][5], it says, "source code test and documentation coverage **should** be monitored." Additionally, the [guidance to check][6] this requirement states, "code coverage tools check whether coverage is at 100% of the code."

Over my software development career, which spans more than two decades, I have worked on codebases large and small and some with very high percentages of code coverage. Yet none of the non-trivial codebases I have contributed to have reported 100% test coverage. This made me question whether the "_check whether coverage is at 100%_" guidance would be followed.

When I think about the nature of the test coverage gaps in the codebases I have worked on, they typically have been around system states that are very difficult (and in some cases, impossible) to create. For instance, in earlier versions of Java, I recall we were required to write catch blocks for exceptions that could never be thrown.

Previously, I reasoned that 100% test coverage is something to aspire to, but it is probably not worth the cost on most codebases and may not be realistic in a few.

Coverage tools have been getting smarter and more tunable over time. Languages have been getting lighter, and libraries have been getting easier to mock and test. So how unreasonable is 100% coverage of functionality today?

### Resource exhaustion

The high-quality but low test-coverage codebases I contribute to happen to be written in C or C++. A quick glance at these codebases shows that there is a class of common low-coverage situations that I'll lump together under the umbrella of resource exhaustion: out of memory, out of disk space, etc.

Here is a simple example of code that does not check for resource exhaustion; in this case, memory allocation failure:


```
char *buf = malloc(80);
sprintf(buf, "hello, world");
```

This example code needs to allocate a small buffer, so it calls **malloc(80)**, and **malloc** usually returns a pointer to 80 bytes of memory … but that can fail. In the (unlikely) case that **malloc** returns **NULL**, the code above will proceed to call **sprintf** with a **NULL** pointer which causes a crash. It is typical in C code to do something more like this:


```
char *buf = malloc(80);
if (buf == NULL) {
    fprintf(stderr, "malloc returned NULL for 80 bytes?\n");
    return NULL;
}
sprintf(buf, "hello, world");
```

This code guards against **malloc** returning **NULL**, which is better. However, creating tests for correct behavior in the face of this kind of resource exhaustion can be really hard. It's not impossible, of course, and there are multiple approaches. Many approaches result in fragile tests, which require a lot of maintenance over time, and these tests can be very time-consuming to build in the first place.

### Exploration

Pondering this, I decided to run a little experiment to see if I could learn something about the costs and consequences of this strict, 100% criterion.

Since I do some embedded-systems development, I have a few C libraries that I've developed and reused over the years in my embedded projects. I decided to look at some of these libraries and see just how hard it would be to bring them up to 100% code coverage. In the process, I paid attention to the impact on code clarity, code structure, and performance.

#### A library with preexisting dependency injection

Step one is measuring by adding code coverage to a codebase. Since this is C, **gcc** provides quite a lot by default with the **\--coverage** option, and **lcov** (with **genhtml**) does a good job of making reports; thus, this step was easy. I expected the starting coverage to be pretty good—it was, but it had a few untested branches, as well as the predicted gaps around error conditions and error reporting.

I made error reporting pluggable, so it was easier to capture and make assertions around error messages in previously untested branches.

Since this code already allowed for pluggable implementations of **malloc** and **free**, it was straightforward to write little malloc and free wrappers that I could inject memory allocation failures into. Within an hour or two, that was covered.

In the process, I realized that there was one condition where, from the perspective of the calling client code, it was impossible to distinguish between the situation where an error occurs and one where **NULL** is a valid return value. For you C programmers, it was essentially similar to the following:


```
/* stashes a copy of the value
 * returns the previously stashed value */
char *foo_stash(foo_s *context,
                char *stash_me,
                size_t stash_me_len)
{
    char *copy = malloc(stash_me_len);
    if (copy == NULL) {
        return NULL;
    }
    memcpy(copy, stash_me, stash_me_len);
    char *previous = context-&gt;stash;
    context-&gt;stash = copy;
    /* previous may be NULL */
    return previous;
}
```

I adjusted the API to allow the error information to be explicitly available. If you are a C developer, you know there are various ways this can be accomplished. I chose an approach similar to this:


```
/* stashes a copy of the value
 * returns the previously stashed value
 * on error, the 'err' pointer is set to 1 */
char *foo_stash2(foo_s *context,
                char *stash_me,
                size_t stash_me_len,
                int *err)
{
    char *copy = malloc(stash_me_len);
    if (copy == NULL) {
        *err = 1;
        return NULL;
    }
    memcpy(copy, stash_me, stash_me_len);
    char *previous = context-&gt;stash;
    context-&gt;stash = copy;
    /* previous may be NULL */
    return previous;
}
```

Without testing for resource exhaustion, it may have taken a long time for me to notice this (now obvious) shortcoming of the API.

To get **lcov** to report 100% test coverage, I had to tell the compiler to [not inline any code][7], something I learned it does even at optimization level zero.

When embedded in actual firmware, the compiler optimized away the unused indirection; therefore, the added indirection in the source code imposed no real-world performance penalty in the compiled firmware.

Of course, this was the easy library.

#### A more typical library

Once I established a method of injecting memory allocation failures in tests, I decided to move onto another library, but one for which malloc and free were not already pluggable. I had questions. How invasive will this be to the codebase? Will it clutter the code, making it less clear? How time-consuming will it be?

While I don't always record coverage metrics, I am a big believer in testing: more than 20 years ago, I learned that my code improves if I write the tests and client code [before][8] the implementation code, and I have worked that way ever since. (In [_Test-Driven Development: By Example_][9], you can find my name in the acknowledgments.) Yet, when I added code coverage reporting to the second library, I was surprised to see that (at some point in the past) I had added a pair of functions to the library without adding tests for them. The other untested areas were, unsurprisingly, code to handle memory-allocation failure.

Writing tests for the pair of untested functions was, of course, quick and easy. The coverage tools also revealed that I had a function with an untested code branch that, given only a quick glance, contained a bug. The fix was trivial, yet I was surprised to find a bug, given the different projects where I use this library. Nonetheless, there it was, a humbling reminder that, all too often, bugs lurk in untested code.

Next up was the more challenging stuff: testing for resource exhaustion. I started by introducing some global variables for the malloc/free function pointers, as well as a variable to hold a memory-tracking object. Once that was working, I moved those variables from global scope into a context argument that was already present. Refactoring the code to allow for the necessary indirection took only a couple of hours (less time than I expected), and the complexity added was negligible.

### Reflections

My conclusion from the first library was that it was well worth the time. The code is now more flexible, the API is now more complete for the caller, and writing the failure injection harness was pretty easy.

From the second library, I was reminded that even less-pluggable code could be made testable without adding undue levels of complexity. The code improved, I fixed a bug, and I can be more confident in the code. Also, the additional modularity of being able to plug in an alternative memory allocator is a feature that may prove more valuable in the future.

Exclusion comments are a feature of **lcov** to cause coverage reporting to ignore a block of code. Interestingly, I didn't feel the need to use exclusion comments in either library.

I am more certain than ever that even very good code is improved by investing in test coverage.

Both of these codebases are small, had some modularity already, began from a point of good testing, are single-threaded, and contain no graphical UI code. If I were to try to tackle this on one of the larger, more monolithic codebases I contribute to, it would be harder and require a larger time investment. There would likely be some sections of code where I might still conclude that the best thing to do would be to "cheat" by tuning the tooling to not report on some section of code.

That said, I estimate that the time required to reach reporting 100% of code coverage is considerably less than what I would have estimated before this exploration.

If you happen to be a C coder and want to see a running example of this, including **gcov** / **lcov** usage, I extracted the out-of-memory injecting code and put it in an [example repository][10].

Have you pushed a codebase to 100% coverage by tests, or tried to? What was your experience? Please share it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/testing-code-coverage

作者：[Eric Herman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ericherman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 (Code going into a computer.)
[2]: https://publiccode.net/
[3]: https://standard.publiccode.net
[4]: https://en.wikipedia.org/wiki/Code_coverage
[5]: https://standard.publiccode.net/criteria/continuous-integration.html#requirements
[6]: https://standard.publiccode.net/criteria/continuous-integration.html#how-to-test
[7]: https://twitter.com/Eric_Herman/status/1224983465784938496
[8]: https://opensource.com/article/20/2/automate-unit-tests
[9]: https://www.oreilly.com/library/view/test-driven-development/0321146530/
[10]: https://github.com/ericherman/context-alloc
