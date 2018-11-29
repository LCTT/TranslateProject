三周内构建 JavaScript 全栈 web 应用
===========

![](https://cdn-images-1.medium.com/max/2000/1*PgKBpQHRUgqpXcxtyehPZg.png)

*应用 Align 中，用户主页的控制面板*

### 从构思到部署应用程序的简单分步指南

我在 Grace Hopper Program 为期三个月的编码训练营即将结束，实际上这篇文章的标题有些纰漏 —— 现在我已经构建了 _三个_ 全栈应用：[从零开始的电子商店][3]、我个人的 [私人黑客马拉松项目][4]，还有这个“三周的结业项目”。这个项目是迄今为止强度最大的 —— 我和另外两名队友共同花费三周的时光 —— 而它也是我在训练营中最引以为豪的成就。这是我目前所构建和涉及的第一款稳定且复杂的应用。

如大多数开发者所知，即使你“知道怎么编写代码”，但真正要制作第一款全栈的应用却是非常困难的。JavaScript 生态系统出奇的大：有包管理器、模块、构建工具、转译器、数据库、库文件，还要对上述所有东西进行选择，难怪如此多的编程新手除了 Codecademy 的教程外，做不了任何东西。这就是为什么我想让你体验这个决策的分布教程，跟着我们队伍的脚印，构建可用的应用。

* * *

首先，简单的说两句。Align 是一个 web 应用，它使用直观的时间线界面帮助用户管理时间、设定长期目标。我们的技术栈有：用于后端服务的 Firebase 和用于前端的 React。我和我的队友在这个短视频中解释的更详细：

[video](https://youtu.be/YacM6uYP2Jo)

展示 Align @ Demo Day Live // 2017 年 7 月 10 日

从第 1 天（我们组建团队的那天）开始，直到最终应用的完成，我们是如何做的？这里是我们采取的步骤纲要：

* * *

### 第 1 步：构思

第一步是弄清楚我们到底要构建什么东西。过去我在 IBM 中当咨询师的时候，我和合作组长一同带领着构思工作组。从那之后，我一直建议小组使用经典的头脑风暴策略，在会议中我们能够提出尽可能多的想法 —— 即使是 “愚蠢的想法” —— 这样每个人的大脑都在思考，没有人因顾虑而不敢发表意见。

![](https://cdn-images-1.medium.com/max/800/1*-M4xa9_HJylManvLoraqaQ.jpeg)

在产生了好几个关于应用的想法时，我们把这些想法分类记录下来，以便更好的理解我们大家都感兴趣的主题。在我们这个小组中，我们看到实现想法的清晰趋势，需要自我改进、设定目标、情怀，还有个人发展。我们最后从中决定了具体的想法：做一个用于设置和管理长期目标的控制面板，有保存记忆的元素，可以根据时间将数据可视化。

从此，我们创作出了一系列用户故事（从一个终端用户的视角，对我们想要拥有的功能进行描述），阐明我们到底想要应用实现什么功能。

### 第 2 步：UX/UI 示意图

接下来，在一块白板上，我们画出了想象中应用的基本视图。结合了用户故事，以便理解在应用基本框架中这些视图将会如何工作。

![](https://cdn-images-1.medium.com/max/400/1*r5FBoa8JsYOoJihDgrpzhg.jpeg)

![](https://cdn-images-1.medium.com/max/400/1*0O8ZWiyUgWm0b8wEiHhuPw.jpeg)

![](https://cdn-images-1.medium.com/max/400/1*y9Q5v-sF0PWmkhthcW338g.jpeg)

这些骨架确保我们意见统一，提供了可预见的蓝图，让我们向着计划的方向努力。

### 第 3 步：选好数据结构和数据库类型

到了设计数据结构的时候。基于我们的示意图和用户故事，我们在 Google doc 中制作了一个清单，它包含我们将会需要的模型和每个模型应该包含的属性。我们知道需要 “目标（goal）” 模型、“用户（user）”模型、“里程碑（milestone）”模型、“记录（checkin）”模型还有最后的“资源（resource）”模型和“上传（upload）”模型，

![](https://cdn-images-1.medium.com/max/800/1*oA3mzyixVzsvnN_egw1xwg.png)

*最初的数据模型结构*

在正式确定好这些模型后，我们需要选择某种 _类型_ 的数据库：“关系型的”还是“非关系型的”（也就是“SQL”还是“NoSQL”）。由于基于表的 SQL 数据库需要预定义的格式，而基于文档的 NoSQL 数据库却可以用动态格式描述非结构化数据。

对于我们这个情况，用 SQL 型还是 No-SQL 型的数据库没多大影响，由于下列原因，我们最终选择了 Google 的 NoSQL 云数据库 Firebase：

1.  它能够把用户上传的图片保存在云端并存储起来
2.  它包含 WebSocket 功能，能够实时更新
3.  它能够处理用户验证，并且提供简单的 OAuth 功能。

我们确定了数据库后，就要理解数据模型之间的关系了。由于 Firebase 是 NoSQL 类型，我们无法创建联合表或者设置像 _“记录 （Checkins）属于目标（Goals）”_ 的从属关系。因此我们需要弄清楚 JSON 树是什么样的，对象是怎样嵌套的（或者不是嵌套的关系）。最终，我们构建了像这样的模型：

![](https://cdn-images-1.medium.com/max/800/1*py0hQy-XHZWmwff3PM6F1g.png)

*我们最终为目标（Goal）对象确定的 Firebase 数据格式。注意里程碑（Milestones）和记录（Checkins）对象嵌套在 Goals 中。*

_（注意: 出于性能考虑，Firebase 更倾向于简单、常规的数据结构, 但对于我们这种情况，需要在数据中进行嵌套，因为我们不会从数据库中获取目标（Goal）却不获取相应的子对象里程碑（Milestones）和记录（Checkins）。）_ 

### 第 4 步：设置好 Github 和敏捷开发工作流

我们知道，从一开始就保持井然有序、执行敏捷开发对我们有极大好处。我们设置好 Github 上的仓库，我们无法直接将代码合并到主（master）分支，这迫使我们互相审阅代码。

![](https://cdn-images-1.medium.com/max/800/1*5kDNcvJpr2GyZ0YqLauCoQ.png)

我们还在 [Waffle.io][5] 网站上创建了敏捷开发的面板，它是免费的，很容易集成到 Github。我们在 Waffle 面板上罗列出所有用户故事以及需要我们去修复的 bug。之后当我们开始编码时，我们每个人会为自己正在研究的每一个用户故事创建一个 git 分支，在完成工作后合并这一条条的分支。

![](https://cdn-images-1.medium.com/max/800/1*gnWqGwQsdGtpt3WOwe0s_A.gif)

我们还开始保持晨会的习惯，讨论前一天的工作和每一个人遇到的阻碍。会议常常决定了当天的流程 —— 哪些人要结对编程，哪些人要独自处理问题。

我认为这种类型的工作流程非常好，因为它让我们能够清楚地找到自己的定位，不用顾虑人际矛盾地高效执行工作。

### 第 5 步： 选择、下载样板文件

由于 JavaScript 的生态系统过于复杂，我们不打算从最底层开始构建应用。把宝贵的时间花在连通 Webpack 构建脚本和加载器，把符号链接指向项目工程这些事情上感觉很没必要。我的团队选择了 [Firebones][6] 框架，因为它恰好适用于我们这个情况，当然还有很多可供选择的开源框架。

### 第 6 步：编写后端 API 路由（或者 Firebase 监听器）

如果我们没有用基于云的数据库，这时就应该开始编写执行数据库查询的后端高速路由了。但是由于我们用的是 Firebase，它本身就是云端的，可以用不同的方式进行代码交互，因此我们只需要设置好一个可用的数据库监听器。

为了确保监听器在工作，我们用代码做出了用于创建目标（Goal）的基本用户表格，实际上当我们完成表格时，就看到数据库执行可更新。数据库就成功连接了！

### 第 7 步：构建 “概念证明”

接下来是为应用创建 “概念证明”，也可以说是实现起来最复杂的基本功能的原型，证明我们的应用 _可以_ 实现。对我们而言，这意味着要找个前端库来实现时间线的渲染，成功连接到 Firebase，显示数据库中的一些种子数据。

![](https://cdn-images-1.medium.com/max/800/1*d5Wu3fOlX8Xdqix1RPZWSA.png)

*Victory.JS 绘制的简单时间线*

我们找到了基于 D3 构建的响应式库 Victory.JS，花了一天时间阅读文档，用 _VictoryLine_ 和 _VictoryScatter_ 组件实现了非常基础的示例，能够可视化地显示数据库中的数据。实际上，这很有用！我们可以开始构建了。

### 第 8 步：用代码实现功能

最后，是时候构建出应用中那些令人期待的功能了。取决于你要构建的应用，这一重要步骤会有些明显差异。我们根据所用的框架，编码出不同的用户故事并保存在 Waffle 上。常常需要同时接触前端和后端代码（比如，创建一个前端表格同时要连接到数据库）。我们实现了包含以下这些大大小小的功能：

*   能够创建新目标、里程碑和记录
*   能够删除目标，里程碑和记录
*   能够更改时间线的名称，颜色和详细内容
*   能够缩放时间线
*   能够为资源添加链接
*   能够上传视频
*   在达到相关目标的里程碑和记录时弹出资源和视频
*   集成富文本编辑器
*   用户注册、验证、OAuth 验证
*   弹出查看时间线选项
*   加载画面

有各种原因，这一步花了我们很多时间 —— 这一阶段是产生最多优质代码的阶段，每当我们实现了一个功能，就会有更多的事情要完善。

### 第 9 步： 选择并实现设计方案

当我们使用 MVP 架构实现了想要的功能，就可以开始清理，对它进行美化了。像表单，菜单和登陆栏等组件，我的团队用的是 Material-UI，不需要很多深层次的设计知识，它也能确保每个组件看上去都很圆润光滑。

![](https://cdn-images-1.medium.com/max/800/1*PCRFAbsPBNPYhz6cBgWRCw.gif)

*这是我制作的最喜爱功能之一了。它美得令人心旷神怡。*

我们花了一点时间来选择颜色方案和编写 CSS ，这让我们在编程中休息了一段美妙的时间。期间我们还设计了 logo 图标，还上传了网站图标。

### 第 10 步： 找出并减少 bug

我们一开始就应该使用测试驱动开发的模式，但时间有限，我们那点时间只够用来实现功能。这意味着最后的两天时间我们花在了模拟我们能够想到的每一种用户流，并从应用中找出 bug。

![](https://cdn-images-1.medium.com/max/800/1*X8JUwTeCAkIcvhKofcbIDA.png)

这一步是最不具系统性的，但是我们发现了一堆够我们忙乎的 bug，其中一个是在某些情况下加载动画不会结束的 bug，还有一个是资源组件会完全停止运行的 bug。修复 bug 是件令人恼火的事情，但当软件可以运行时，又特别令人满足。

### 第 11 步：应用上线

最后一步是上线应用，这样才可以让用户使用它！由于我们使用 Firebase 存储数据，因此我们使用了 Firebase Hosting，它很直观也很简单。如果你要选择其它的数据库，你可以使用 Heroku 或者 DigitalOcean。一般来讲，可以在主机网站中查看使用说明。

我们还在 Namecheap.com 上购买了一个便宜的域名，这让我们的应用更加完善，很容易被找到。

![](https://cdn-images-1.medium.com/max/800/1*gAuM_vWpv_U53xcV3tQINg.png)

* * *

好了，这就是全部的过程 —— 我们都是这款实用的全栈应用的合作开发者。如果要继续讲，那么第 12 步将会是对用户进行 A/B 测试，这样我们才能更好地理解：实际用户与这款应用交互的方式和他们想在 V2 版本中看到的新功能。

但是，现在我们感到非常开心，不仅是因为成品，还因为我们从这个过程中获得了难以估量的知识和理解。点击 [这里][7] 查看 Align 应用！

![](https://cdn-images-1.medium.com/max/800/1*KbqmSW-PMjgfWYWS_vGIqg.jpeg)

*Align 团队：Sara Kladky（左），Melanie Mohn（中），还有我自己。*

--------------------------------------------------------------------------------

via: https://medium.com/ladies-storm-hackathons/how-we-built-our-first-full-stack-javascript-web-app-in-three-weeks-8a4668dbd67c?imm_mid=0f581a&cmp=em-web-na-na-newsltr_20170816

作者：[Sophia Ciocca][a]
译者：[BriFuture](https://github.com/BriFuture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@sophiaciocca?source=post_header_lockup
[1]:https://medium.com/@sophiaciocca?source=post_header_lockup
[2]:https://medium.com/@sophiaciocca?source=post_header_lockup
[3]:https://github.com/limitless-leggings/limitless-leggings
[4]:https://www.youtube.com/watch?v=qyLoInHNjoc
[5]:http://www.waffle.io/
[6]:https://github.com/FullstackAcademy/firebones
[7]:https://align.fun/
[8]:https://github.com/align-capstone/align
[9]:https://github.com/sophiaciocca
[10]:https://github.com/Kladky
[11]:https://github.com/melaniemohn
