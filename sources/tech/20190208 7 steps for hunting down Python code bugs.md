[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 steps for hunting down Python code bugs)
[#]: via: (https://opensource.com/article/19/2/steps-hunting-code-python-bugs)
[#]: author: (Maria Mckinley https://opensource.com/users/parody)

7 steps for hunting down Python code bugs
======
Learn some tricks to minimize the time you spend tracking down the reasons your code fails.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug-insect-butterfly-diversity-inclusion-2.png?itok=TcC9eews)

It is 3 pm on a Friday afternoon. Why? Because it is always 3 pm on a Friday when things go down. You get a notification that a customer has found a bug in your software. After you get over your initial disbelief, you contact DevOps to find out what is happening with the logs for your app, because you remember receiving a notification that they were being moved.

Turns out they are somewhere you can't get to, but they are in the process of being moved to a web application—so you will have this nifty application for searching and reading them, but of course, it is not finished yet. It should be up in a couple of days. I know, totally unrealistic situation, right? Unfortunately not; it seems logs or log messages often come up missing at just the wrong time. Before we track down the bug, a public service announcement: Check your logs to make sure they are where you think they are and logging what you think they should log, regularly. Amazing how these things just change when you aren't looking.

OK, so you found the logs or tried the call, and indeed, the customer has found a bug. Maybe you even think you know where the bug is.

You immediately open the file you think might be the problem and start poking around.

### 1. Don't touch your code yet

Go ahead and look at it, maybe even come up with a hypothesis. But before you start mucking about in the code, take that call that creates the bug and turn it into a test. This will be an integration test because although you may have suspicions, you do not yet know exactly where the problem is.

Make sure this test fails. This is important because sometimes the test you make doesn't mimic the broken call; this is especially true if you are using a web or other framework that can obfuscate the tests. Many things may be stored in variables, and it is unfortunately not always obvious, just by looking at the test, what call you are making in the test. I'm not going to say that I have created a test that passed when I was trying to imitate a broken call, but, well, I have, and I don't think that is particularly unusual. Learn from my mistakes.

### 2. Write a failing test

Now that you have a failing test or maybe a test with an error, it is time to troubleshoot. But before you do that, let's do a review of the stack, as this makes troubleshooting easier.

The stack consists of all of the tasks you have started but not finished. So, if you are baking a cake and adding the flour to the batter, then your stack would be:

  * Make cake
  * Make batter
  * Add flour



You have started making your cake, you have started making the batter, and you are adding the flour. Greasing the pan is not on the list since you already finished that, and making the frosting is not on the list because you have not started that.

If you are fuzzy on the stack, I highly recommend playing around on [Python Tutor][1], where you can watch the stack as you execute lines of code.

Now, if something goes wrong with your Python program, the interpreter helpfully prints out the stack for you. This means that whatever the program was doing at the moment it became apparent that something went wrong is on the bottom.

### 3. Always check the bottom of the stack first

Not only is the bottom of the stack where you can see which error occurred, but often the last line of the stack is where you can find the issue. If the bottom doesn't help, and your code has not been linted in a while, it is amazing how helpful it can be to run. I recommend pylint or flake8. More often than not, it points right to where there is an error that I have been overlooking.

If the error is something that seems obscure, your next move might just be to Google it. You will have better luck if you don't include information that is relevant only to your code, like the name of variables, files, etc. If you are using Python 3 (which you should be), it's helpful to include the 3 in the search; otherwise, Python 2 solutions tend to dominate the top.

Once upon a time, developers had to troubleshoot without the benefit of a search engine. This was a dark time. Take advantage of all the tools available to you.

Unfortunately, sometimes the problem occurred earlier and only became apparent during the line executed on the bottom of the stack. Think about how forgetting to add the baking powder becomes obvious when the cake doesn't rise.

It is time to look up the stack. Chances are quite good that the problem is in your code, and not Python core or even third-party packages, so scan the stack looking for lines in your code first. Plus it is usually much easier to put a breakpoint in your own code. Stick the breakpoint in your code a little further up the stack and look around to see if things look like they should.

"But Maria," I hear you say, "this is all helpful if I have a stack trace, but I just have a failing test. Where do I start?"

Pdb, the Python Debugger.

Find a place in your code where you know this call should hit. You should be able to find at least one place. Stick a pdb break in there.

#### A digression

Why not a print statement? I used to depend on print statements. They still come in handy sometimes. But once I started working with complicated code bases, and especially ones making network calls, print just became too slow. I ended up with print statements all over the place, I lost track of where they were and why, and it just got complicated. But there is a more important reason to mostly use pdb. Let's say you put a print statement in and discover that something is wrong—and must have gone wrong earlier. But looking at the function where you put the print statement, you have no idea how you got there. Looking at code is a great way to see where you are going, but it is terrible for learning where you've been. And yes, I have done a grep of my code base looking for where a function is called, but this can get tedious and doesn't narrow it down much with a popular function. Pdb can be very helpful.

You follow my advice, and put in a pdb break and run your test. And it whooshes on by and fails again, with no break at all. Leave your breakpoint in, and run a test already in your test suite that does something very similar to the broken test. If you have a decent test suite, you should be able to find a test that is hitting the same code you think your failed test should hit. Run that test, and when it gets to your breakpoint, do a `w` and look at the stack. If you have no idea by looking at the stack how/where the other call may have gone haywire, then go about halfway up the stack, find some code that belongs to you, and put a breakpoint in that file, one line above the one in the stack trace. Try again with the new test. Keep going back and forth, moving up the stack to figure out where your call went off the rails. If you get all the way up to the top of the trace without hitting a breakpoint, then congratulations, you have found the issue: Your app was spelled wrong. No experience here, nope, none at all.

### 4. Change things

If you still feel lost, try making a new test where you vary something slightly. Can you get the new test to work? What is different? What is the same? Try changing something else. Once you have your test, and maybe additional tests in place, it is safe to start changing things in the code to see if you can narrow down the problem. Remember to start troubleshooting with a fresh commit so you can easily back out changes that do not help. (This is a reference to version control, if you aren't using version control, it will change your life. Well, maybe it will just make coding easier. See "[A Visual Guide to Version Control][2]" for a nice introduction.)

### 5. Take a break

In all seriousness, when it stops feeling like a fun challenge or game and starts becoming really frustrating, your best course of action is to walk away from the problem. Take a break. I highly recommend going for a walk and trying to think about something else.

### 6. Write everything down

When you come back, if you aren't suddenly inspired to try something, write down any information you have about the problem. This should include:

  * Exactly the call that is causing the problem
  * Exactly what happened, including any error messages or related log messages
  * Exactly what you were expecting to happen
  * What you have done so far to find the problem and any clues that you have discovered while troubleshooting



Sometimes this is a lot of information, but trust me, it is really annoying trying to pry information out of someone piecemeal. Try to be concise, but complete.

### 7. Ask for help

I often find that just writing down all the information triggers a thought about something I have not tried yet. Sometimes, of course, I realize what the problem is immediately after hitting the submit button. At any rate, if you still have not thought of anything after writing everything down, try sending an email to someone. First, try colleagues or other people involved in your project, then move on to project email lists. Don't be afraid to ask for help. Most people are kind and helpful, and I have found that to be especially true in the Python community.

Maria McKinley will present [Hunting the Bugs][3] at [PyCascades 2019][4], February 23-24 in Seattle.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/steps-hunting-code-python-bugs

作者：[Maria Mckinley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/parody
[b]: https://github.com/lujun9972
[1]: http://www.pythontutor.com/
[2]: https://betterexplained.com/articles/a-visual-guide-to-version-control/
[3]: https://2019.pycascades.com/talks/hunting-the-bugs
[4]: https://2019.pycascades.com/
