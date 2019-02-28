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

你已经开始做蛋糕，你已经开始打面糊，而你现在正在加面粉。锅底抹油不在这个列表中因为你已经做完了，而做糖霜不在这个列表上因为你还没开始做。

如果你对调用栈不清楚，我强烈建议你使用 [Python Tutor][1]，它能帮你在执行代码时观察调用栈。

现在，如果你的 Python 程序出现了错误，接收器会帮你打印出当前调用栈。这意味着无论那一时刻程序在做什么，很明显调用栈的底部发生了错误。

### 3. 始终先检查 stack 的底部

你不仅能在栈底看到发生了哪个错误，而且通常可以在调用栈的最后一行发现问题。如果栈底对你没有帮助，而你的代码还没有经过代码分析，那么使用代码分析非常有用。我推荐 pylint 或者 flake8。通常情况下，它会指出我一直忽略的错误的地方。

如果对错误看起来很迷惑，你下一步行动可能是用 Google 搜索它。如果你搜索的内容不包含你的代码的相关信息，如变量名、文件等，那你将获得更好的搜索结果。如果你使用的是 Python 3（你应该使用它），那么搜索内容包含 Python 3 是有帮助的，否则 Python 2 的解决方案往往会占据大多数。

很久以前，开发者需要在没有搜索引擎的帮助下解决问题。这是一段黑暗的时光。充分利用你可以使用的所有工具。

不幸的是，有时候问题发生得比较早但只有在调用栈底部执行的地方才变得明显。就像当蛋糕没有膨胀时，忘记加发酵粉的事才被发现。

那就该检查整个调用栈。问题很可能在于你的代码而不算 Python 核心或者第三方包，所以先检查调用栈内你的代码。另外，在你的代码中放置断点通常会更容易检查代码。在调用栈的代码中放置断点然后看看周围是否如你预期。

“但是，玛丽，”我听到你说，“如果我有一个调用栈，那这些都是有帮助的，但我只有一个失败的测试。我该从哪里开始？”

Pdb, 一个 Python 调试器。

找到你代码里会被这个调用命中的地方。你应该能至少找到一个这样的地方。在那里打上一个 pdb 的断点。

#### 一句题外话

为什么不使用 print 语句呢？我曾经依赖于 print 语句。他们有时候仍然派得上用场。但当我开始处理复杂的代码库，尤其是有网络调用的代码库，print 语句就变得太慢了。我最终得到所有打印出来的数据，但我没法追踪他们的位置和原因，而且他们变得复杂了。 But there is a more important reason to mostly use pdb. Let's say you put a print statement in and discover that something is wrong—and must have gone wrong earlier. But looking at the function where you put the print statement, you have no idea how you got there. Looking at code is a great way to see where you are going, but it is terrible for learning where you've been. And yes, I have done a grep of my code base looking for where a function is called, but this can get tedious and doesn't narrow it down much with a popular function. Pdb can be very helpful.

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
