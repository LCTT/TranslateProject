[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 steps for hunting down Python code bugs)
[#]: via: (https://opensource.com/article/19/2/steps-hunting-code-python-bugs)
[#]: author: (Maria Mckinley https://opensource.com/users/parody)

7 步检查 Python 代码错误
======
了解一些技巧来减少你花费在寻找代码失败原因的时间。
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug-insect-butterfly-diversity-inclusion-2.png?itok=TcC9eews)

在周五的下午三点钟。为什么是这个时间？因为事情总会在周五下午三点钟发生。你收到一条通知，客户发现你的软件出现一个错误。在有了初步的怀疑后，你联系运维，查看你的软件日志以了解发生了什么，因为你记得收到过日志已经移动了的通知。

结果这些日志被转移到你获取不到的地方，但他们正在转移到一个网页应用中——所以你将可以用这个漂亮的应用来检索日志，但是，这个应用现在还没完成。它应该会在几天内完成。我知道，这完全不符合实际情况，对吧？然而不，日志或者日志消息似乎经常在错误的时间出现缺少。在我们追踪错误前，一个忠告：经常检查你的日志保证他们在你认为它们该在的地方并记录你认为它们该记的东西。当你不看的时候，这些东西会发生令人惊讶的变化。

好的，所以你寻找了日志或者尝试了呼叫运维，而客户确实发现了一个错误。可能你甚至认为你知道错误在哪儿。

你立即打开你认为可能有问题的文件并开始寻找。

### 1. 不要碰你的代码

阅读代码，你甚至可能会想出一个假设。但是在开始修改你的代码前，请重现导致错误的调用并把它变成一个测试。这将是一个集成测试，因为你可能还有疑问，目前你还没能准确地知道问题在哪儿。

确保这个测试是失败的。这很重要，因为有时你的测试不能重现失败的调用，尤其是你使用了可以混淆测试的 web 或者其他框架。很多东西可能被存储在变量中，但遗憾的是，只通过观察测试，你在测试里调用的东西并不总是明显可见的。当我尝试着重现这个失败的调用时，我不准备说我创建了一个测试，但是，对的，我已经创建了，但我不认为这是特别不寻常的。从自己的错误中吸取教训。

### 2. 编写错误的测试

现在，你有了一个失败的测试或者可能是一个带有错误的测试，那么是时候解决问题了。但是在你开干之前，让我们先检查下调用栈，因为这样可以更轻松地解决问题。

调用栈包括你已经启动但尚未完成地所有任务。所以，比如你正在烤蛋糕并准备往面糊里加面粉，那你的调用栈将是：
* 做蛋糕
* 打面糊
* 加面粉

You have started making your cake, you have started making the batter, and you are adding the flour. Greasing the pan is not on the list since you already finished that, and making the frosting is not on the list because you have not started that.

If you are fuzzy on the stack, I highly recommend playing around on [Python Tutor][1], where you can watch the stack as you execute lines of code.

Now, if something goes wrong with your Python program, the interpreter helpfully prints out the stack for you. This means that whatever the program was doing at the moment it became apparent that something went wrong is on the bottom.

### 3. 始终先检查 stack 的底部

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
