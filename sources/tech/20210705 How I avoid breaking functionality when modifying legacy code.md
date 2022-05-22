[#]: subject: (How I avoid breaking functionality when modifying legacy code)
[#]: via: (https://opensource.com/article/21/7/legacy-code)
[#]: author: (Alex Bunardzic https://opensource.com/users/alex-bunardzic)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How I avoid breaking functionality when modifying legacy code
======
Extract methods give the biggest bang for the buck when it comes to
modifying legacy code while avoiding the risk of breaking the
functionality.
![Coding on a computer][1]

Allow me a bit of introspection. I've been working in the software engineering field for 31 years. During those 31 years, I've modified a lot of legacy software.

Over time, I've formed certain habits when working with legacy code. Because on most projects I get paid to deliver working software that is easy to maintain, I cannot afford the luxury of taking my sweet time trying to fully understand the legacy code I am about to modify. So, I tend to skim. Skimming the code helps me quickly identify relevant portions in the repo. It is a race against time, and I don't have cycles at my disposal to dwell on less-relevant minutia. I'm always going for the most relevant area in the code. Once I find it, I slow down and start analyzing it.

I rely heavily on my power tools—integrated development environments (IDEs). It doesn't matter which power tool; these days, they're all pretty much capable of doing the same thing. What's important to me is having the ability to quickly find where functions are called and where variables are used.

Sooner or later, after I'm done skimming the code and analyzing the code segment I intend to change, I identify a place where I want to insert some code. Now that I understand the meaning of the classes, components, and objects involved in performing the function, I write a test first.

After that, I write code to make the test pass. I type the name of the object I intend to use and then press the dot key (**.**) and the IDE responds by giving me a full list of methods defined for that object. All those methods are callable from the location where my cursor is.

I then pick the method that makes sense to me. I fill in the blanks (that is, I supply values for the expected arguments/parameters), save the change, and run the test. If the test passes, I'm done with that micro change.

I typically repeat this activity many times per hour. Throughout the workday, it is not unusual to see it repeated dozens, even hundreds of times.

I believe the way I modify software is not unique to my work habits. I think it describes a typical flow that many (I'd even say most) software engineers adhere to.

### A few observations

The first thing apparent in this way of modifying legacy software is the absence of any work on documentation. Experience shows that software developers very rarely spend time reaching out for documentation. Time spent preparing the documentation and generating it to produce HTML-style online documents is often wasted.

Instead, most developers rely solely upon power tools. And rightly so—IDEs never lie, as they always offer the real-time picture of the system they are modifying, and documentation is usually stale.

Another thing is that developers don't read the source code the way it was written. When writing code from scratch (first pass), many developers tend to write long functions. Source code tends to bunch up. Bunching code up makes it easier to read and reason about on the first pass and debug. But after the first pass, people rarely, if ever, consume the code the way it was written. If we catch ourselves reading a whole function from beginning to end, it is most likely because we have exhausted all other options and have no choice but to slow down and read the code in a pedestrian way. However, in my experience, that slow and orderly reading of the code seldom happens.

### Problems caused by bunched-up code

If you were to leave the code as it was written during the first pass (i.e., long functions, a lot of bunched-up code for easy initial understanding and debugging), it would render IDEs powerless. If you cram all capabilities an object can offer into a single, giant function, later, when you're trying to utilize that object, IDEs will be of no help. IDEs will show the existence of one method (which will probably contain a large list of parameters providing values that enforce the branching logic inside that method). So, you won't know how to really use that object unless you open its source code and read its processing logic very carefully. And even then, your head will probably hurt.

Another problem with hastily cobbled-up, "bunched-up" code is that its processing logic is not testable. While you can still write an end-to-end test for that code (input values and the expected output values), you have no way of knowing if the bunched-up code is doing any other potentially risky processing. Also, you have no way of testing for edge cases, unusual scenarios, difficult-to-reproduce scenarios, etc. That renders your code untestable, which is a very bad thing to live with.

### Break up bunched-up code by extracting methods

Long functions or methods are always a sign of muddled thinking. When a block of code contains numerous statements, it usually means it is doing way too much processing. Cramming a lot of processing in one place typically means the developer hasn't carefully thought things through.

You don't need to look further than into how companies are typically organized. Instead of having hundreds of employees working in a single department, companies tend to break up into numerous smaller departments. That way, it is much clearer where responsibilities lie.

Software code is no different. An application exists to automate a lot of intricate processing. Processing gets broken into multiple smaller steps, so each step must be mapped onto a separate, isolated block of code. You create such separate, isolated, and autonomous blocks of code by extracting methods. You take a long, bulky block of code and break it up by extracting responsibilities into separate blocks of code.

### Extracted methods enable better naming

Developers write software code, but it is much more often consumed (i.e., read) by developers than written.

When consuming software code, it helps if the code is expressive. Expressiveness boils down to proper structure and proper naming. Consider the following statement:


```
`if((x && !y) && !b) || (b && y) && !(z >= 65))`
```

It would be literally impossible to understand the meaning and the intention of this statement without running the code and stepping through it with a debugger. Such activity is called GAK (Geek at Keyboard). It is 100% unproductive and quite wasteful.

Here is where the extract method and proper naming practices come to the rescue. Take the complex statement contained within the `if` statement, extract it into its own method, and give that method a meaningful name. For example:


```
public bool IsEligible(bool b, bool x, bool y, int z) {
  return ((x &amp;&amp; !y) &amp;&amp; !b) || (b &amp;&amp; y) &amp;&amp; !(z &gt;= 65);
}
```

Now replace the ugly `if` statement with a more readable statement:


```
`if(IsEligible(b, x, y, z))`
```

Of course, you should also replace dumb one-character variable names with more meaningful names to improve readability.

### Reusing legacy code

Experience shows that any functionality that is not extracted and properly named and moved to the most reasonable class will never be reused. The extract method fosters frequent reuse, which goes a long way toward improving code quality.

### Testing legacy code

Writing tests for existing code is hard and feels less rewarding than doing [test-driven development][2] (TDD). Even after you determine that there should be several tests to ensure production code works as expected, when you realize production code must be changed to enable testing, you often decide to skip writing tests. In such situations, achieving your goal to deliver testable code, slowly but surely, keeps diminishing.

Writing tests for legacy code is tedious because it often requires a lot of time and code to set up the preconditions. That's the opposite of how you write tests when doing TDD, where time spent writing preconditions is minimal.

The best way to make legacy code testable is to practice the extract method approach. Locating a block of code nested in loops and conditionals and extracting it enables you to write small, precise tests. Such tests on extracted functions improve not only the testability of the code but also the understandability. If legacy code becomes more understandable thanks to extracting methods and writing legible tests, the chance of introducing defects is drastically reduced.

### Conclusion

Most of the discussion about extracting methods would not be necessary with TDD. Writing one test first, then making the test pass, then scanning that code for more insights into how the code should be structured and improved, making improvements, and finally making changes to part of the code base guarantees there will be no need to worry about extracting methods. Since legacy code usually means code that was not crafted with TDD methodology, you are forced to adopt a different approach. In my experience, extract methods give the biggest bang for the buck when it comes to modifying legacy code while avoiding the risk of breaking the functionality.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/legacy-code

作者：[Alex Bunardzic][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alex-bunardzic
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/20/1/test-driven-development
