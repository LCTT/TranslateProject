为什么说 Python 和 Pygame 最适合初学者
============================================================

### 我们有三个理由来说明 Pygame 对初学编程者是最好的选择。


![What's the best game platform for beginning programmers?](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 "What's the best game platform for beginning programmers?")
 图片来源: [opensource.com](https://opensource.com)

上个月，[Scott Nesbitt][10] 发表了一篇标题为[ Mozilla 支出 50 万美元来支持开源项目][11]的文章。其中 Phaser，一个基于 HTML/JavaScript 的游戏平台项目，获得了 50,000 美元的奖励。整整一年里，我都在使用 Phaser 平台来教我的小女儿，用来学习的话，它是最简单也是最好的 HTML 游戏开发平台。然而，对于初学者来说，使用[ Pygame ][13]也许效果更好。原因如下：

### 1\. 小段代码块

Pygame，基于 Python，[在介绍计算机课程中最流行的语言][14]。Python 非常适合用一小段代码来实现我们的想法,孩子们可以从单个文件和单个代码块起开始学习，在掌握函数 (function) 或类 (class) 对象之前，就可以写出意大利面条似的代码。 很像手指画，所想即所得。

更多 Python 资源链接

*   [Python 是什么?][1]

*   [最热门 Python IDEs][2]

*   [最热门 Python GUI 框架][3]

*   [最新 Python 话题][4]

*   [更多开发资源][5]

以这样的方式来学习，当编写的代码越来越难于管理的时候，孩子们很自然就的就会把代码分解成函数模块和类模块。在学习函数之前就学习了 Python 语言的语法，学生将掌握基本的编程知识，对了解全局作用域和局部作用域起到更好的作用。

大多数 HTML 游戏在一定程度上会将结构、样式和编程逻辑分为 HTML、CSS和JavaScript，并且需要 CSS 和 HTML 的知识。从长远来看，虽然拆分更好，但对初学者来说是个障碍。一旦孩子们发现他们可以用 HTML 和 CSS 快速构建网页，很有可能就会被颜色、字体和图形的视觉刺激分散注意力。即使有仅仅只专注于 JavaScript 代码的，也需要学习基本的文档结构模型，以使 JavaScript 代码能够嵌入进去。

### 2\. 全局变量更清晰

Python 和 JavaScript 都使用动态类型变量，这意味着变量只有在赋值才能确定其类型为一个字符串、一个整数或一个浮点数，其中 JavaScript 更容易出错。类似于类型变量，JavaScript 和 Python 都有全局变量和局部变量之分。Python 中，如果在函数块内要使用全局变量，就会以 `global` 关键字区分出来。

要理解在 Phaser 上教授编程初学者所面临的挑战的话，让我们以基本的[制作您的第一个 Phaser 游戏教程][15]为例子，它是由 Alvin Ourrad 和 Richard Davey 开发制作的。在 JavaScript 中，程序中任何地方都可以访问的全局变量很难追踪调试，常常引起 Bug 且很难解决。因为 Richard 和 Alvin 是专业程序员，所以在这儿特意使用全局变量以使程序简洁。

```
var game = new Phaser.Game(800, 600, Phaser.AUTO, '', { preload: preload, create: create, update: update });

function preload() {

    game.load.image('sky', 'assets/sky.png');

}

var player;
var platforms;

function create() {
    game.physics.startSystem(Phaser.Physics.ARCADE);
…
```

在他们的 Phaser 编程手册 [《Interphase》][16] 中，Richard Davey 和 Ilija Melentijevic 解释说：在很多 Phaser 项目中通常都会使用全局变量，原因是使用它们完成任务更容易、更快捷。

> “如果您开发过游戏，只要代码量到一定规模，那么（使用全局变量）这种做法会使您陷入困境的，可是我们为什么还要这样做？原因很简单，仅仅只是要使我们的 Phaser 项目容易完成，更简单而已。”

针对一个 Phaser 应用程序，虽然可以使用局部变量和拆分代码块来达到关注点隔离这些手段来重构代码，但要使第一次学习编程的小孩能理解,显然很有难度的。

如果您想教你的孩子学习 JavaScript，或者如果他们已经知道怎样使用像 Python 来编程的话，有个好的 Phaser 课程推荐: [完整的手机游戏开发课程] [17]，是由 [ Pablo Farias Navarro ] [18] 开发制作的。虽然标题看着是移动游戏，但实际是关于 JavaScript 和 Phaser 的。JavaScript 和 Phaser 移动应用开发已经转移到 [PhoneGap][19] 话题去了。

### 3\. Pygame 无依赖要求

由于 [Python Wheels][20] 的出现，Pygame 超级[容易安装][21]。在 Fedora/Red Hat 系统下也可使用 **yum** 包管理器来安装：

```
sudo yum install python3-pygame
```

更多消息请参考官网[Pygame 安装说明文档][22]。

相比来说，虽然 Phaser 本身更容易安装，但需要掌握更多的知识。前面提到的，学生需要在 HTML 文档中组装他们的 JavaScript 代码，同时还需要些 CSS。除了这三种语言（HTML、CSS、JavaScript），还需要使用火狐或谷歌开发工具和编辑器。JavaScript 最常用的编辑器有 Sublime、Atom、VS Code（按使用多少排序）等。

由于[浏览器同源策略][23]的原因，如果您直接在浏览器中打开 HTML 文件的话，Phaser 应用是不会运行的。您必须运行 Web 服务，并通过服务访问这些文件。还好，对于大多数工程项目，可以不用在本地运行 Apache 服务，只需要运行一些轻量级的服务就可以，比如 [httpster][24]。

### Phaser 和 JavaScript 的优势

JavaScript 和 Phaser 有着种种的不好，为什么我还继续教授他们？老实说，我考虑了很长一段时间，我在担心着学生学习变量申明提升和变量作用域的揪心。所有我开发出基于 Pygame 和 Python 的课程，随后也开发出一涛基于 Phaser 的。最终，我决定使用 Pablo 预先制定的课程作为起点。

我转用 JavaScript 有两个原因。首先，JavaScript 已经成为正式应用的正式语言。除了 Web 应用外，也可使用于移动和服务应用方面。JavaScript 无处不在，其广泛应用于孩子们每天都能看到的应用中。如果他们的朋友使用 Javascript 来编程，他们很可能也会受影响而使用之。正如我看到了 JavaScript 背后的动力，所以深入研究了可编译成 JavaScript 的替代语言，主要是 Dart 和 TypeScript 两种。虽然我不介意额外的转换步骤，但还是最喜欢 JavaScript。

最后，我选择使用 Phaser 和 JavaScript 的组合，是因为我意识到上面那些问题在 JavaScript 可以被解决，仅仅只是一些工作量而已。高质量的调试工具和一些大牛们的人的工作使得 JavaScript 成为教育孩子编码的可用和有用的语言。

### 最后话题: Python 对垒 JavaScript

当家长问我使用的什么语言作为孩子的入门语言时，我会立即推荐 Python 和 Pygame。因为有成千上万的课程可选，而且大多数都是免费的。我为我的儿子选择了 Al Sweigart 的 [使用 Python 和 Pygame 开发游戏][25] 课程，同时也在使用 Allen B. Downey 的 [Python 编程思想：如何像计算机科学家一样思考][7]。在 Android 手机上可以使用 [ Tom Rothame ][27]的[ PAPT Pyame][26] 来安装 Pygame 游戏。

那是好事。JavaScript 是一门成熟的编程语言，有很多很多辅助工具。但有多年的帮助大儿子使用 Python 创建炫酷游戏经历的我，依然钟情于 Python 和 Pygame。

### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/craig-head-crop.png?itok=LlMnIq8m)][28]
 
 Craig Oda - First elected president and co-founder of Tokyo Linux Users Group. Co-author of "Linux Japanese Environment" book published by O'Reilly Japan. Part of core team that established first ISP in Asia. Former VP of product management and product marketing for major Linux company. Partner at Oppkey, developer relations consulting firm in Silicon Valley.[More about me][8]

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/pygame

作者：[Craig Oda  ][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/codetricity
[1]:https://opensource.com/resources/python?intcmp=7016000000127cYAAQ
[2]:https://opensource.com/resources/python/ides?intcmp=7016000000127cYAAQ
[3]:https://opensource.com/resources/python/gui-frameworks?intcmp=7016000000127cYAAQ
[4]:https://opensource.com/tags/python?intcmp=7016000000127cYAAQ
[5]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ
[6]:https://opensource.com/article/17/11/pygame?rate=PV7Af00S0QwicZT2iv8xSjJrmJPdpfK1Kcm7LXxl_Xc
[7]:http://greenteapress.com/thinkpython/html/index.html
[8]:https://opensource.com/users/codetricity
[9]:https://opensource.com/user/46031/feed
[10]:https://opensource.com/users/scottnesbitt
[11]:https://opensource.com/article/17/10/news-october-14
[12]:https://www.patreon.com/photonstorm/posts
[13]:https://www.pygame.org/news
[14]:https://cacm.acm.org/blogs/blog-cacm/176450-python-is-now-the-most-popular-introductory-teaching-language-at-top-u-s-universities/fulltext
[15]:http://phaser.io/tutorials/making-your-first-phaser-game
[16]:https://phaser.io/interphase
[17]:https://academy.zenva.com/product/the-complete-mobile-game-development-course-platinum-edition/
[18]:https://gamedevacademy.org/author/fariazz/
[19]:https://phonegap.com/
[20]:https://pythonwheels.com/
[21]:https://pypi.python.org/pypi/Pygame
[22]:http://www.pygame.org/wiki/GettingStarted#Pygame%20Installation
[23]:https://blog.chromium.org/2008/12/security-in-depth-local-web-pages.html
[24]:https://simbco.github.io/httpster/
[25]:https://inventwithpython.com/makinggames.pdf
[26]:https://github.com/renpytom/rapt-pygame-example
[27]:https://github.com/renpytom
[28]:https://opensource.com/users/codetricity
[29]:https://opensource.com/users/codetricity
[30]:https://opensource.com/users/codetricity
[31]:https://opensource.com/article/17/11/pygame#comments
[32]:https://opensource.com/tags/python
[33]:https://opensource.com/tags/programming
