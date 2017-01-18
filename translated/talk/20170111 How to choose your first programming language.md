如何挑选你的第一门编程语言
============================================================[

][1]
 ![How to choose your first programming language](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/EDU_OSDC_IntroOS_520x292_FINAL.png?itok=va-tdc8j "How to choose your first programming language") 


opensource.com 供图

人们有着各种各样的原因想学编程。你也许想要做一个程序，或者你只是想投入其中。所以，在选择你的第一门编程语言之前，问问你自己：你想要程序运行在哪里？你想要程序做什么？

你选择编程的原因决定第一门编程语言的选择。

_在这篇文章里，我会交换着使用“编程”（code , program）、“开发”（develop） 等动词，“代码”（code）、“程序”（program）、“应用”（application/app）等名词。这是考虑到你可能听过的语言用法_

### 了解你的设备

在你编程语言的选择上，你的程序将运行在何处是个决定性因素。

桌面应用是运行在台式机或者笔记本电脑上的传统软件程序。这样你将会编写同一时间内只能在一台电脑上运行的代码。移动应用，也就是熟知的“ APP ”，运行在使用 IOS Android 或者其他操作系统上的移动设备上。网页应用是功能像应用的网页。

按网络的 客户-服务器 架构分，网页开发者经常被分为两类：

*   前端开发，就是编写运行在浏览器自身的代码。这是个面对用户的部分，或者说是程序的前端。有时候被称为客户端编程，因为浏览器是网络的客户-服务器架构的半壁江山。浏览器运行在你本地的电脑或者设备上。

*   后台开发，也就是大家所熟知的服务器端开发，编写的代码运行在你不能实际接触的服务器电脑上。

### 创造什么

编程是一门广泛的学科，能应用在不同的领域。常见的应用有：

*   数据科学
*   网页开发
*   游戏开发
*   不同类型的工作自动化

现在我们已经讨论了为什么你要编程，你要为运行在哪里而编程，让我们看一下两门对于新手来说不错的编程语言吧。

### Python

[Python][2] 是对于第一次编程的人来说是最为流行的编程语言之一，而且这不是巧合。Python 是一门通用的编程语言。这意味着它能应用在广泛的编程任务上。你能用 Python 完成几乎_所有_事情。这一点使得很多新手能实际应用这门编程语言。另外， Python 有两个重要的设计特征，使得其对于新手更友好：清晰、类似于英语的[语法][3]和强调代码的[可读性][4]。

从本质上讲，一门编程语言的语法就是你所输入的能让这编程语言生效的内容。这包括单词，特殊字符（例如“ ; ”、“ $ ”、“ % ” 或者 “ {} ”），空格或者以上任意的组合。Python 尽可能地使用英语，不像其他编程语言那样经常使用标点符号或者特殊的字符。所以，Python 阅读起来更自然、更像是人类语言。这一点帮助新的编程人员聚焦于解决问题，而且他们能花费更少的时间挣扎在语言自身的特性上。

清晰语法的同时注重于可读性。在编写代码的时候，你将会创造代码的逻辑“块”，就是一些为了相关联目标而共同工作的代码。在许多编程语言里，这些块用特殊字符所标记（或限定）。他们或许被“ {} ”或者其他字符所包住。块分割字符和你写代码的能力，这两者的任意组合都能增加可读性。让我们来看一个例子。

这有个被称为 “ fun ”的简短函数。它要求输入一个数字，“ x ”就是它的输入。如果“ x ” 等于 ** 0 **，它将会运行另一个被称为“ no_fun ”的函数（这功能做了些很无趣的事情）。新函数不需要输入。反之，简短函数将会运行一个使用输入 “ x ” 的名为 “ big_fun ”的函数。

这个函数用[ C 语言 ][5]将会是这样写的：

```
void fun(int x)
{
    if (x == 0) {
        no_fun();
    } else {
        big_fun(x);
    }
}
```

或者，像是这样：

```
void fun(int x) { if (x == 0) {no_fun(); } else {big_fun(x); }}
```

功能上两者等价，而且都能运行。" {} " 和 “ ;”  告诉我们哪里是代码块的不同部分。然而，第一个对于人们来说_明显_更容易阅读。相比之下完成相同功能的 Python 是这样的：

```
def fun(x):
    if x == 0:
        no_fun()
    else:
        big_fun(x)
```

在这里，只有一个选择。如果代码不是这样排列的，它将不能工作。如果你编写了可以工作的代码，你就有了可阅读的代码。同样也留意一下在语法上的差异。不同的是“ def ” ，在 Python 代码中这个词是英语单词，大家都很熟悉这单词的含义（译者注：def 是 definition 的缩写，定义的意思）。在 C 语言的例子中 “ void ”  和 “ int ” 就没有那么直接。

Python 也有个优秀的生态系统。这有两层意思，第一，你有一个使用该语言的庞大、活跃的社区，当你需要帮助指导的时候，你能向他们求助。第二，它有大量早已存在的库，库是指完成特定功能的代码集合。从高级数学运算、图形到计算机视觉，甚至是你能想象到的任何事情。

Python 成为你第一门编程语言有两个缺点。第一是它有时候安装起来很复杂，特别是在运行着 Windows 的电脑上。（如果你有一台 Mac 或者 Linux 的电脑，Python 已经安装好了。）虽然这问题不是不能克服，而且情况总在改善，但是这对于一些人来说还是个阻碍。第二个缺点是，对于那些明确想要建设网站的人来讲，虽然有很多用 Python 写的项目（例如 [Django][6] 和[Flask][7] ），但是编写运行在浏览器上的 Python 代码却没有多少选择。它主要是后台或者服务器端语言。

### JavaScript

如果你知道你学习编程的主要原因是建设网站的话，[JavaScript][8]或许是你的最佳选择。 JavaScript 是关于网页的编程语言。除了是网页的默认编程语言之外， JavaScript 作为初学的语言有几点优点。

第一，无须安装任何东西。你可以打开文本编辑器（例如 Windows 上的记事本，但不是一个文字处理软件例如 Microsoft Word）然后开始输入 JavaScript 。代码将在你的浏览器中运行。最顶尖的浏览器内置了JavaScript 引擎，所以你的代码将会运行在几乎所有的电脑和很多的移动设备上。事实是，能马上在浏览器中运行代码提供了一个非常_快_的反馈，这对于新手来说是很好的。你能尝试一些事情然后很快地看到结果。

当 JavaScript 开始作为前端语言时，一个名为[Node.js][9] 的环境能让你编写运行在浏览器或者服务器上的代码。现在 JavaScript 能当作前端或者后台语言使用。这增加了它的使用人数。JavaScript 也有很多能提供除核心功能外的额外功能的包，这使得它能当作一门通用语言来使用。JavaScript 不只是网页开发语言，就像 Python 那样，它也有个充满生气的、活跃的生态系统。

尽管有这些优点，但是 JavaScript 对于新手来说并非十全十美。JavaScript 的语法并不像 Python 那样清晰，也不怎么像英语。更像是之前例子里提到的 C 语言。它并不是把可读性当作主要的设计特性。

### 做出选择

选 Python 或者  JavaScript 作为入门语言都很难出错。关键是你打算做什么。为什么你要学习编程？你的回答很大程度上影响你的决定。如果你是想为开源做贡献，你将会找到_大量_用这两门语言编写的项目。另外，许多原本不是用 JavaScript 写的项目仍能被用作前端部件。当你做决定时，别忘了你本地的社区。你有在使用其中一门语言的朋友或者同事吗?对于一个新手来说，有实时的帮助是非常重要的。

祝好运，开心编程。

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/kojo_headshot_pro_square.jpg?itok=jv1kT8T0)

Kojo Idrissa - 我是一个新晋的软件开发者（1 年），从会计和大学教学转型而来。自从有开源软件以来，我就是它的一个粉丝。但是在我之前的事业中并不需要做很多的编程工作。技术上，我专注于 Python ，自动化测试和学习 Django 。我希望我能尽快地学更多的 JavaScript 。话题上，我专注于帮助刚开始学习编程或想参与为开源项目做贡献的人们。我也关注在技术领域的包容文化。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/choosing-your-first-programming-language

作者：[Kojo Idrissa][a]
译者：[ypingcn](https://github.com/ypingcn)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/transitionkojo
[1]: https://opensource.com/article/17/1/choosing-your-first-programming-language?rate=fWoYXudAZ59IkAKZ8n5lQpsa4bErlSzDEo512Al6Onk
[2]: https://www.python.org/about/
[3]: https://en.wikipedia.org/wiki/Python_syntax_and_semantics
[4]: https://en.wikipedia.org/wiki/Python_syntax_and_semantics#Indentation
[5]: https://en.wikipedia.org/wiki/C_(programming_language
[6]: https://www.djangoproject.com/
[7]: http://flask.pocoo.org/
[8]: https://en.wikipedia.org/wiki/JavaScript
[9]: https://nodejs.org/en/
[10]: https://en.wikipedia.org/wiki/JavaScript_syntax#Basics5
