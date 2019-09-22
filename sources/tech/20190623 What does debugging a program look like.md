[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What does debugging a program look like?)
[#]: via: (https://jvns.ca/blog/2019/06/23/a-few-debugging-resources/)
[#]: author: (Julia Evans https://jvns.ca/)

What does debugging a program look like?
======

I was debugging with a friend who’s a relatively new programmer yesterday, and showed them a few debugging tips. Then I was thinking about how to teach debugging this morning, and [mentioned on Twitter][1] that I’d never seen a really good guide to debugging your code. (there are a ton of really great replies by Anne Ogborn to that tweet if you are interested in debugging tips)

As usual, I got a lot of helpful answers and now I have a few ideas about how to teach debugging skills / describe the process of debugging.

### a couple of debugging resources

I was hoping for more links to debugging books/guides, but here are the 2 recommendations I got:

**“Debugging” by David Agans**: Several people recommended the book [Debugging][2], which looks like a nice and fairly short book that explains a debugging strategy. I haven’t read it yet (though I ordered it to see if I should be recommending it) and the rules laid out in the book (“understand the system”, “make it fail”, “quit thinking and look”, “divide and conquer”, “change one thing at a time”, “keep an audit trail”, “check the plug”, “get a fresh view”, and “if you didn’t fix it, it ain’t fixed”) seem extremely resaonable :). He also has a charming [debugging poster][3].

**“How to debug” by John Regehr**: [How to Debug][4] is a very good blog post based on Regehr’s experience teaching a university embedded systems course. Lots of good advice. He also has a [blog post reviewing 4 books about debugging][5], including Agans’ book.

### reproduce your bug (but how do you do that?)

The rest of this post is going to be an attempt to aggregate different ideas about debugging people tweeted at me.

Somewhat obviously, everybody agrees that being able to consistently reproduce a bug is important if you want to figure out what’s going on. I have an intuitive sense for how to do this but I’m not sure how to **explain** how to go from “I saw this bug twice” to “I can consistently reproduce this bug on demand on my laptop”, and I wonder whether the techniques you use to do this depend on the domain (backend web dev, frontend, mobile, games, C++ programs, embedded etc).

### reproduce your bug _quickly_

Everybody also agrees that it’s extremely useful be able to reproduce the bug quickly (if it takes you 3 minutes to check if every change helped, iterating is VERY SLOW).

A few suggested approaches:

  * for something that requires clicking on a bunch of things in a browser to reproduce, recording what you clicked on with [Selenium][6] and getting Selenium to replay the UI interactions (suggested [here][7])
  * writing a unit test that reproduces the bug (if you can). bonus: you can add this to your test suite later if it makes sense
  * writing a script / finding a command line incantation that does it (like `curl MY_APP.local/whatever`)



### accept that it’s probably your code’s fault

Sometimes I see a problem and I’m like “oh, library X has a bug”, “oh, it’s DNS”, “oh, SOME OTHER THING THAT IS NOT MY CODE is broken”. And sometimes it’s not my code! But in general between an established library and my code that I wrote last month, usually it’s my code that I wrote last month that’s the problem :).

### start doing experiments

@act_gardner gave a [nice, short explanation of what you have to do after you reproduce your bug][8]

> I try to encourage people to first fully understand the bug - What’s happening? What do you expect to happen? When does it happen? When does it not happen? Then apply their mental model of the system to guess at what could be breaking and come up with experiments.
>
> Experiments could be changing or removing code, making API calls from a REPL, trying new inputs, poking at memory values with a debugger or print statements.

I think the loop here may be:

  * make guess about one aspect about what might be happening (“this variable is set to X where it should be Y”, “the server is being sent the wrong request”, “this code is never running at all”)
  * do experiment to check that guess
  * repeat until you understand what’s going on



### change one thing at a time

Everybody definitely agrees that it is important to change one thing a time when doing an experiment to verify an assumption.

### check your assumptions

A lot of debugging is realizing that something you were **sure** was true (“wait this request is going to the new server, right, not the old one???“) is actually… not true. I made an attempt to [list some common incorrect assumptions][9]. Here are some examples:

  * this variable is set to X (“that filename is definitely right”)
  * that variable’s value can’t possibly have changed between X and Y
  * this code was doing the right thing before
  * this function does X
  * I’m editing the right file
  * there can’t be any typos in that line I wrote it is just 1 line of code
  * the documentation is correct
  * the code I’m looking at is being executed at some point
  * these two pieces of code execute sequentially and not in parallel
  * the code does the same thing when compiled in debug / release mode (or with -O2 and without, or…)
  * the compiler is not buggy (though this is last on purpose, the compiler is only very rarely to blame :))



### weird methods to get information

There are a lot of normal ways to do experiments to check your assumptions / guesses about what the code is doing (print out variable values, use a debugger, etc). Sometimes, though, you’re in a more difficult environment where you can’t print things out and don’t have access to a debugger (or it’s inconvenient to do those things, maybe because there are too many events). Some ways to cope:

  * [adding sounds on mobile][10]: “In the mobile world, I live on this advice. Xcode can play a sound when you hit a breakpoint (and continue without stopping). I place them certain places in the code, and listen for buzzing Tink to indicate tight loops or Morse/Pop pairs to catch unbalanced events” (also [this tweet][11])
  * there’s a very cool talk about [using XCode to play sound for iOS debugging here][12]
  * [adding LEDs][13]: “When I did embedded dev ages ago on grids of transputers, we wired up an LED to an unused pin on each chip. It was surprisingly effective for diagnosing parallelism issues.”
  * [string][14]: “My networks prof told me about a hack he saw at Xerox in the early days of Ethernet: a tap in the coax with an amp and motor and piece of string. The busier the network was, the faster the string twirled.”
  * [peep][15] is a “network auralizer” that translates what’s happening on your system into sounds. I spent 10 minutes trying to get it to compile and failed so far but it looks very fun and I want to try it!!



The point here is that information is the most important thing and you need to do whatever’s necessary to get information.

### write your code so it’s easier to debug

Another point a few people brought up is that you can improve your program to make it easier to debug. tef has a nice post about this: [Write code that’s easy to delete, and easy to debug too.][16] here. I thought this was very true:

> Debuggable code isn’t necessarily clean, and code that’s littered with checks or error handling rarely makes for pleasant reading.

I think one interpretation of “easy to debug” is “every single time there’s an error, the program reports to you exactly what happened in an easy to understand way”. Whenever my program has a problem and says sometihng “error: failure to connect to SOME_IP port 443: connection timeout” I’m like THANK YOU THAT IS THE KIND OF THING I WANTED TO KNOW and I can check if I need to fix a firewall thing or if I got the wrong IP for some reason or what.

One simple example of this recently: I was making a request to a server I wrote and the reponse I got was “upstream connect error or disconnect/reset before headers”. This is an nginx error which basically in this case boiled down to “your program crashed before it sent anything in response to the request”. Figuring out the cause of the crash was pretty easy, but having better error handling (returning an error instead of crashing) would have saved me a little time because instead of having to go check the cause of the crash, I could have just read the error message and figured out what was going on right away.

### error messages are better than silently failing

To get closer to the dream of “every single time there’s an error, the program reports to you exactly what happened in an easy to understand way” you also need to be disciplined about immediately returning an error message instead of silently writing incorrect data / passing a nonsense value to another function which will do WHO KNOWS WHAT with it and cause you a gigantic headache. This means adding code like this:

```
if UNEXPECTED_THING:
    raise "oh no THING happened"
```

This isn’t easy to get right (it’s not always obvious where you should be raising errors!“) but it really helps a lot.

### failure: print out a stack of errors, not just one error.

Related to returning helpful errors that make it easy to debug: Rust has a really incredible error handling library [called failure][17] which basicaly lets you return a chain of errors instead of just one error, so you can print out a stack of errors like:

```
"error starting server process" caused by
"error initializing logging backend" caused by
"connection failure: timeout connecting to 1.2.3.4 port 1234".
```

This is SO MUCH MORE useful than just `connection failure: timeout connecting to 1.2.3.4 port 1234` by itself because it tells you the significance of 1.2.3.4 (it’s something to do with the logging backend!). And I think it’s also more useful than `connection failure: timeout connecting to 1.2.3.4 port 1234` with a stack trace, because it summarizes at a high level the parts that went wrong instead of making you read all the lines in the stack trace (some of which might not be relevant!).

tools like this in other languages:

  * Go: the idiom to do this seems to be to just concatenate your stack of errors together as a big string so you get “error: thing one: error: thing two : error: thing three” which works okay but is definitely a lot less structured than `failure`’s system
  * Java: I hear you can give exceptions causes but haven’t used that myself
  * Python 3: you can use `raise ... from` which sets the `__cause__` attribute on the exception and then your exceptions will be separated by `The above exception was the direct cause of the following exception:..`



If you know how to do this in other languages I’d be interested to hear!

### understand what the error messages mean

One sub debugging skill that I take for granted a lot of the time is understanding what error messages mean! I came across this nice graphic explaining [common Python errors and what they mean][18], which breaks down things like `NameError`, `IOError`, etc.

I think a reason interpreting error messages is hard is that understanding a new error message might mean learning a new concept – `NameError` can mean “Your code uses a variable outside the scope where it’s defined”, but to really understand that you need to understand what variable scope is! I ran into this a lot when learning Rust – the Rust compiler would be like “you have a weird lifetime error” and I’d like be “ugh ok Rust I get it I will go actually learn about how lifetimes work now!“.

And a lot of the time error messages are caused by a problem very different from the text of the message, like how “upstream connect error or disconnect/reset before headers” might mean “julia, your server crashed!“. The skill of understanding what error messages mean is often not transferable when you switch to a new area (if I started writing a lot of React or something tomorrow, I would probably have no idea what any of the error messages meant!). So this definitely isn’t just an issue for beginner programmers.

### that’s all for now!

I feel like the big thing I’m missing when talking about debugging skills is a stronger understanding of where people get stuck with debugging – it’s easy to say “well, you need to reproduce the problem, then make a more minimal reproduction, then start coming up with guesses and verifying them, and improve your mental model of the system, and then figure it out, then fix the problem and hopefully write a test to make it not come back”, but – where are people actually getting stuck in practice? What are the hardest parts? I have some sense of what the hardest parts usually are for me but I’m still not sure what the hardest parts usually are for someone newer to debugging their code.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2019/06/23/a-few-debugging-resources/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/b0rk/status/1142825259546140673
[2]: http://debuggingrules.com/
[3]: http://debuggingrules.com/?page_id=40
[4]: https://blog.regehr.org/archives/199
[5]: https://blog.regehr.org/archives/849
[6]: https://www.seleniumhq.org/
[7]: https://twitter.com/AnnieTheObscure/status/1142843984642899968
[8]: https://twitter.com/act_gardner/status/1142838587437830144
[9]: https://twitter.com/b0rk/status/1142812831420768257
[10]: https://twitter.com/cocoaphony/status/1142847665690030080
[11]: https://twitter.com/AnnieTheObscure/status/1142842421954244608
[12]: https://qnoid.com/2013/06/08/Sound-Debugging.html
[13]: https://twitter.com/wombatnation/status/1142887843963867136
[14]: https://twitter.com/irvingreid/status/1142887472441040896
[15]: http://peep.sourceforge.net/intro.html
[16]: https://programmingisterrible.com/post/173883533613/code-to-debug
[17]: https://github.com/rust-lang-nursery/failure
[18]: https://pythonforbiologists.com/29-common-beginner-errors-on-one-page/
