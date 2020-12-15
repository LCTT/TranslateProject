[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The story of the one line fix)
[#]: via: (https://dave.cheney.net/2020/12/15/the-story-of-the-one-line-fix)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

The story of the one line fix
======

Picture yourself, an engineer working at the hottest distributed microservices de jour, assigned to fix a bug. You jump into an unfamiliar codebase and quickly locate the line where the problem occurred. The fix is simple, just return early or substitute a default value in the case that one cannot be determined from your input. Boom, problem solved. Code compiles, fix goes out to production, and the card’s in the done pile in time for Tuesday drinks at the pub.

Now consider this alternative scenario. You find the problematic line and, before you make the fix, you decide to add a test so you will _know_ that your fix worked, and hopefully someone will not accidentally revert it in the future.

You’ve figured out that some weird edge case causes that line to be called without being able to determine the right value for `y`. You can see it clearly, `y` ends up being zero so the program crashes. To write a test, you need to get the conditions that caused `y` to be zero to occur on command. There are only two parameters passed into this function, this shouldn’t be hard. Oh, but this is a method, not a function, so you need to construct an instance of the object in the right state to trigger the bug. Hmm, this language uses constructors to make sure people can’t just monkey up the bits of the object they need for a test, you’ll have to find, mock, stub or build instances of all the objects dependencies (and their dependencies, and so on) then run the object through the precise series of operations to put the it in the state that causes `y` to be empty. Then you can write the test.

At this point Tuesday night drinks are fading before you eyes. Without being able to write a test for your fix, how will you convince a reviewer that it actually fixed what it fixed? All you can prove was your “simple” change didn’t break any behaviour that was covered by existing tests. 

Fast forward to Friday and your one line change has finally been merged, along with a few new test cases to make sure it doesn’t happen again. Next week you’re going to sit down and try to figure out a bunch of weird crashes you caused while trying to stub out calls to the database. Eventually you gave up and copied some code from another test that uses a copy of production data. It’s much slower than it needs to be, but it worked, and was the only way to put a reasonable estimate on a job that had already consumed your entire week.

The moral of the story; was the test the reason it took nearly a week to make a one line fix?

### Related posts:

  1. [The value of TDD][1]
  2. [Are Go maps sensitive to data races ?][2]
  3. [Suggestions for contributing to an Open Source project][3]
  4. [go test -v streaming output][4]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/12/15/the-story-of-the-one-line-fix

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://dave.cheney.net/2016/04/11/the-value-of-tdd (The value of TDD)
[2]: https://dave.cheney.net/2015/12/07/are-go-maps-sensitive-to-data-races (Are Go maps sensitive to data races ?)
[3]: https://dave.cheney.net/2016/03/12/suggestions-for-contributing-to-an-open-source-project (Suggestions for contributing to an Open Source project)
[4]: https://dave.cheney.net/2020/03/10/go-test-v-streaming-output (go test -v streaming output)
