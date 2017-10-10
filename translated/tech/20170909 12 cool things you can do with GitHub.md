12 件可以用 GitHub 完成的很酷的事情
============================================================

我不能为我的人生想出一个引子来，所以...

### #1 在 GitHub.com 上编辑代码

我想我要开始的第一件事是多数人都已经知道的（尽管一周之前的我并不知道）。

当你登录到 GitHub ，查看一个文件时（任何文本文件，任何版本库），右上方会有一只小铅笔。点击它，你就可以编辑文件了。 当你编辑完成后，GitHub 会给出文件变更的建议然后为你 fork 你的仓库并创建一个 pull 请求。

是不是很疯狂？它为你创建了 fork ！

不需要去 fork ，pull ，本地更改，push 然后创建一个 PR。


![](https://cdn-images-1.medium.com/max/1600/1*w3yKOnVwomvK-gc7hlQNow.png)

不是一个真正的 PR

这对于修改错误的拼写以及编辑代码时的一些糟糕的想法是很有用的。

### #2 粘贴图像

在评论和 issue 的描述中并不仅限于使用文字。你知道你可以直接从剪切板粘贴图像吗？ 在你粘贴的时候，你会看到图片被上传 (到云端，这毫无疑问)并转换成 markdown 显示的图片格式。

整洁。

### #3 格式化代码

如果你想写一个代码块的话，你可以用三个反引号作为开始 —— 就像你在浏览 [熟练掌握 Markdown][3] 页面所学的一样 —— 而且 GitHub 会尝试去推测你所写下的语言。

但如果你张贴像是 Vue ，Typescript 或 JSX 这样的代码，你就需要明确指出才能获得高亮显示。

在首行注明 ````jsx`：


![](https://cdn-images-1.medium.com/max/1600/1*xnt83oGWLtJzNzwp-YvSuA.png)

…这意味着代码段已经正确的呈现：

 
![](https://cdn-images-1.medium.com/max/1600/1*FnOcz-bZi3S9Tn3dDGiIbQ.png)

(顺便说一下，这些用法可以扩展到 gists。 如果你在 gist 中给出 `.jsx` 扩展，你的 JSX 语法就会高亮显示。)

这里是[所有被支持的语法][4]的清单。

### #4 用 PRs 中的魔法词来关闭 issues

比方说你已经创建了一个 pull 请求用来修复 issue #234 。那么你就可以把 “fixes #234” 这段文字放在你的 PR 描述中（或者是在 PR 的评论的任何位置）。

接下来，在合并 PR 时会自动关闭与之对应的问题。这是不是很酷？

这里是[更详细的学习帮助][5]。

### #5 链接到评论

是否你曾经想要链接到一个特定的评论但却不知道该怎么做？这是因为你不知道如何去做到这些。但那都将是过去了我的朋友，因为我在这里告诉你，点击紧挨着名字的日期或时间，这就是如何链接到一个评论。



![](https://cdn-images-1.medium.com/max/1600/1*rSq4W-utQGga5GOW-w2QGg.png)

嘿，这里有 gaearon 的照片！

### #6 链接到代码

那么你想要链接到代码的特定行。我明白。

试试这个：在查看文件的时候，点击挨着代码的行号。

哇哦，你看到了么？行号位置更新出了 URL ！如果你按下 Shift 键并点击其他的行号，SHAZAAM ，URL 再一次更新并且现在出现了行范围的高亮。

分享这个 URL 将会链接到这个文件的那些行。但等一下，链接所指向的是当前分支。如果文件发生变更了怎么办？也许一个文件当前状态的永久链接就是你以后需要的。

我比较懒，所以我已经在一张截图中做完了上面所有的步骤：



![](https://cdn-images-1.medium.com/max/1600/1*5Qg2GqTkTKuXLARasZN57A.png)

说起 URLs…

### #7 像命令行一样使用 GitHub URL

使用 UI 来浏览 GitHub 有着很好的体验。但有些时候最快到达你想去的地方的方法就是在地址栏输入。举个例子，如果我想要跳转到一个我正在工作的分支然后查看与 master 分支的 diff，我就可以在我的仓库名称的后边输入 `/compare/branch-name` 。

这样就会登录到指定分支的 diff 页面。

 

![](https://cdn-images-1.medium.com/max/2000/1*DqexM1y398gSaozLNllroA.png)

然而这就是与 master 分支的 diff ，如果我正在 integration 分支工作，我可以输入 `/compare/integration-branch...my-branch`。



![](https://cdn-images-1.medium.com/max/2000/1*roOXDuo_-9QKI5NLKmveGQ.png)

对于键盘上的快捷键，`ctrl`+`L`  或 `cmd`+`L` 将会向上跳转光标进入 URL 那里（至少在 Chrome 中是这样）。这一点 —— 加上你的浏览器会自动补全的事实 —— 能够成为一种在分支间跳转的便捷方式。

小贴士：使用方向键在 Chrome 的自动完成建议中移动同时按 `shift`+`delete` 来删除历史条目（e.g. 一旦分支被合并）。

（我真的好奇如果我把快捷键写成 `shift + delete` 这样的话，是不是读起来会更加容易。但严格来说 ‘+’ 并不是快捷键的一部分，所以我并不觉得这很舒服。这一点让 _我_ 整晚难以入睡，Rhonda。）

### #8 在 issue 中创建列表

你想要在你的 issue 中看到一个复选框列表吗？



![](https://cdn-images-1.medium.com/max/1600/1*QIe-XOKOXTB3hXaLesr0zw.png)

想要在查看列表中的 issue 时候显示为一个漂亮的 “2 of 5” bar（译者注：条形码）吗?



![](https://cdn-images-1.medium.com/max/1600/1*06WdEpxuasda2-lavjjvNw.png)

那很好！你可以使用这些的语法创建交互式的复选框：

```
 - [ ] Screen width (integer)
 - [x] Service worker support
 - [x] Fetch support
 - [ ] CSS flexbox support
 - [ ] Custom elements
```

表示方法是空格，破折号，再空格，左括号，填入空格（或者一个 x ），然后封闭括号 ，接着空格，最后是一些话。

然后其实你可以选中或取消选中这些框！出于一些原因这些对我来说看上去就像是技术的魔法。你可以 _选中_ 这些框! 同时底层的文本会进行更新。

他们接下来会想什么？

噢，如果你在一个 project board 上有这些 issue 的话，它也会在这里显示进度：



![](https://cdn-images-1.medium.com/max/1600/1*x_MzgCJXFp-ygsqFQB5qHA.png)

如果在我提到“在一个 project board 上”时你不知道我在说些什么，那么你会在下面的页面进一步了解。

比如，在页面下 2 厘米的地方。

### #9 GitHub 上的 Project boards

我常常在大项目中使用 Jira 。而对于个人项目我总是会使用 Trello 。我很喜欢他们两个。

当我学会的几周后 GitHub 有它自己的产品，就在我的仓库上的 Project 标签，我想过我会照搬一套我已经在 Trello 上进行的任务。

 

![](https://cdn-images-1.medium.com/max/2000/1*NF7ZnHndZQ2SFUc5PK-Cqw.png)
没有一个是有趣的

这里是在 GitHub project 上相同的内容：



![](https://cdn-images-1.medium.com/max/2000/1*CHsofapb4JtEDmveOvTYVQ.png)

你的眼睛会因为缺乏对比而适应。

出于速度的缘故，我把上面所有的都添加为 “notes” —— 意思是他们不是真正的 GitHub issue 。

但在 GitHub 上，管理任务的权限被集成在版本库的其他地方 —— 所以你可能想要从仓库添加存在的 issue 到 board 上。

你可以点击右上角的 Add Cards 然后找你想要添加的东西。这里特殊的[搜索语法][6]就派上用场了，举个例子，输入 `is:pr is:open` 然后现在你可以拖动任何开启的 PRs 到 board 上，或者要是你想清理一些 bug 的话就输入 `label:bug`



![](https://cdn-images-1.medium.com/max/2000/1*rTVCR92HhIPhrVnOnXRZkQ.png)

或者你可以将现有的 notes 转换为 issues 。



![](https://cdn-images-1.medium.com/max/1600/1*pTm7dygsyLxsOUDkM7CTcg.png)

或者最后，从一个现有的 issue 屏幕，把它添加到在右边面板的一个 project 。



![](https://cdn-images-1.medium.com/max/1600/1*Czs0cSc91tXv411uneEM9A.png)

它们将会进入一个  project board 的分类列表，这样你就能减少候选的列表的数量。

作为实现那些 task 的代码，在同一仓库下你所拥有的 ‘task’ 定义有一个巨大（超大）的好处。这意味着今后的几年你能够用一行代码做一个 git blame 并且找出方法回到最初在这个 task 后面写下那些代码的根据，不需要在 Jira、Trello 或其他地方寻找蛛丝马迹。

#### 缺点

在过去的三周我已经对所有的 tasks 使用 GitHub 取代 Jira 进行了测试（在有点看板风格的较小规模的项目上) ，到目前为止我都很喜欢。

但是我无法想象在 scrum （译者注：迭代式增量软件开发过程）项目上使用，我想要在那里完成正确估算、速度的测算以及所有的好东西。

好消息是，GitHub Projects 只有很少一些“功能”，并不会让你花很长时间去评估它是否值得让你去切换。因此留下一个悬念，看看你是怎么想的。

总的来说，我有 _得知_ [ZenHub][7] 并且打开过 10 分钟，这也是有史以来的第一次。它是对 GitHub 高效的延伸，可以让你估计你的 issue 并创建 epics 和 dependencies。它也有速度和燃尽图功能；这看起来 _可能是_ 这地球上最伟大的事情。

延伸阅读： [GitHub help on Projects][8]。

### #10 GitHub wiki

对于非结构化集合类的页面 —— 就像 Wikipedia —— GitHub Wiki 提供的（下文我会称之为 Gwiki ）就很优秀。 

对于结构化集合类的页面 —— 举个例子，你的文档 —— 并没那么多。这里没办法说“这个页面是那个页面的子页”，或者有像‘下一节’和‘上一节’这样的按钮。Hansel 和 Gretel 将会完蛋，因为这里没有面包屑（译者注：引自童话故事《糖果屋》）。

(边注，你有 _读过_ 那个故事吗? 这是个残酷的故事。两个混蛋小子将饥肠辘辘的老巫婆烧死在 _她自己的火炉_ 里。无疑留下她来收拾残局。我想这就是为什么如今的年轻人是如此的敏感 —— 今天的睡前故事没有太多的暴力内容。)

继续 —— 把 Gwiki 拿出来接着讲，我输入一些 NodeJS 文档中的内容作为 wiki 页面，然后创建一个侧边栏让我能够模拟出一些真实结构。这个侧边栏会一直存在，尽管它无法高亮显示你当前所在的页面。

链接不得不手动维护，但总的来说，我认为这已经很好了。如果你觉得有需要的话可以[看一下][9]。 


![](https://cdn-images-1.medium.com/max/1600/1*BSKQpkLmVQpUML0Je9WsLQ.png)

它将不会与像 GitBook（它使用了[Redux 文档][10]）或一个定制的网站这样的东西去竞争。但它仍然会占据 80% 的页面而且就在你的仓库里。

我是一个粉丝。

我的建议：如果你已经拥有不止一个 `README.md` 文件并且想要一些不同的页面作为用户指南或是更详细的文档，那么下一步你就需要停止使用 Gwiki 了。

如果你开始觉得缺少的结构或导航非常有必要的话，去切换到其他的产品吧。

### #11 GitHub Pages （带有 Jekyll）

你可能已经知道了可以使用 GitHub Pages 来托管静态站点。如果你不知道的话现在就可以去试试。不过这一节确切的说是关于使用 _Jekyll_ 来构建一个站点。

最简单的就是， GitHub Pages + Jekyll 会将你的 `README.md` 呈现在一个漂亮的主题中。举个例子，从 [关于 github][11] 看看我的 readme 页面:



![](https://cdn-images-1.medium.com/max/2000/1*nU-vZfChZ0mZw9zO-6iJow.png)

如果我为我的 GitHub 站点点击 ‘settings’ 标签，开启 GitHub Pages，然后挑选一个 Jekyll 主题…



![](https://cdn-images-1.medium.com/max/1600/1*tT9AS7tNfEjbAcT3mkzgdw.png)

我会得到一个[ Jekyll 主题页面][12]:


![](https://cdn-images-1.medium.com/max/2000/1*pIE2FMyWih7nFAdP-yGXtQ.png)

根据这一点我可以构建一个主要基于易于编辑的 markdown 文件的静态站点，本质上是把 GitHub 变成一个 CMS（译者注：内容管理系统）。

我还没有真正的使用过它，但这就是 React 和 Bootstrap 站点构建的过程，所以并不可怕。

注意，在本地运行需要 Ruby （ Windows 用户就需要交换一下眼色并且转向其他的方向。macOS 用户会像这样 “出什么问题了，你要去哪里？Ruby 是一个通用平台！GEMS！”）。

（这里也有必要加上“暴力或威胁的内容或活动” 在 GitHub Pages 上是不被允许的，因此你不能去部署重启你的 Hansel 和 Gretel 。）

#### 我的意见

我观察的 GitHub Pages + Jekyll 越多（为了这篇文章），整件事情好像越是看起来有一点奇怪。

‘让所有的复杂性远离你所拥有的属于自己的网站’这样的想法是很棒的。但是你仍然需要在本地生成配置。而且可怕的是需要为这样“简单”的东西使用很多 CLI（译者注：命令行界面）命令。

我只是略读了[入门部分][13]的七页，给我的感觉像是 _我是_ 这里仅有的简单的事情。此前我甚至从来没有学习过所谓简单的“Front Matter”的语法或者所谓简单的“Liquid 模板引擎”的来龙去脉。

我宁愿只写一个网站。

老实说我有点惊讶 Facebook 使用它来写 React 文档，因为他们能够用 React 来构件他们的帮助文档并且在一天之内 [pre-render 预渲染到静态的 HTML 文件][14]。

他们所需要的就跟使用 CMS 中已有的 Markdown 文件一样。

我想是这样…

### #12 使用 GitHub 作为 CMS

比如说你有一个带有一些文本的网站，但是你并不想在 HTML 的标记中储存那些文本。

取而代之，你想要存放文本块到一个很容易被非开发者编辑的地方。也许使用一些版本控制的形式。甚至可能是一个审查过程。

这里是我的建议：在你的版本库中使用 markdown 文件存储文本。然后在你的前端使用插件来获取这些文本块并在页面呈现。

我是 React 的支持者，因此这里有一个 `<Markdown>` 插件的示例，给出一些 markdown 的路径，它们将被获取，解析，并以 HTML 的形式呈现。


（我正在使用的是 [marked][1] npm 包来将 markdown 解析为 HTML。）

这里是指向我的示例仓库 [/text-snippets][2]，里边有一些 markdown 文件 。

(你也可以前往[获取内容][15]页面获取 GiHub API 来使用 —— 但我不确定你是否可以。)

你可以使用像这样的插件：

所以现在 GitHub 就是你的 CMS，可以说，不管有多少文本块都可以放进去。

上边的示例只是在浏览器上安装好插件后获取 markdown 。如果你想要一个静态站点那么你需要服务器端渲染（server-render）。

好消息！没什么能阻止你从服务器中获取所有的 markdown 文件 (配上各种为你服务的缓存策略)。如果你沿着这条路继续走下去的话，你可能会想要去看看使用 GitHub API 去获取目录中的所有 markdown 文件的列表。

### Bonus round —— GitHub 工具！

我曾经使用过一段时间的 [Chrome 的扩展 Octotree ][16] 而且现在我推荐它。虽然并非真心诚意，但不管怎样我还是推荐它。

它会在左侧提供一个带有树视图的面板以显示当前你所查看的仓库。


![](https://cdn-images-1.medium.com/max/2000/1*-MgFq3TEjdys1coiF5-dCw.png)

从[这个视频][17]中我学会了 [octobox][18] ，到目前为止看起来还不错。它是一个 GitHub issues 的收件箱。这就是我要说的全部。

说到颜色，在上面所有的截图中我都使用了亮色主题，所以不要吓到你。不过说真的，我看到的其他东西都是在黑色的主题上，为什么我非要忍受 GitHub 这个苍白的主题呐？


![](https://cdn-images-1.medium.com/max/2000/1*SUdLeoaq8AtVQyE-dCw-Tg.png)

这是由 Chrome 扩展 [Stylish][19]（它可以在任何网站使用主题）和 [GitHub Dark][20] 风格的一个组合。同时为了完成这样的外观也需要，黑色主题的 Chrome 开发者工具（这是内建的，在设置中打开） 以及 [Atom One Dark for Chrome 主题][21]。

### Bitbucket

这些并不完全适合这篇文章的所有地方，但是如果我不称赞 Bitbucket 的话，那就不对了。

两年前我开始了一个项目并花了大半天时间评估哪一个 git 托管服务更适合，最终 Bitbucket 赢得了相当不错的成绩。他们的代码审查流程遥遥领先（这甚至比 GitHub 拥有的指派审阅者的概念要早很长时间）。

GitHub 在后来赶上了比赛，这是非常成功的。但不幸的是在过去的一年里我没有机会使用 Bitbucket —— 也许他们依然在某些方面领先。所以，我会力劝每一个选择 git 托管服务的人也要考虑 Bitbucket 。

### 结尾

就是这样！我希望这里至少有三件事是你此前并不知道的，我也希望你拥有愉快的一天。

编辑：在评论中有更多的建议；随便留下你自己喜欢的。真的，我真的希望你能拥有愉快的一天。

--------------------------------------------------------------------------------

via: https://hackernoon.com/12-cool-things-you-can-do-with-github-f3e0424cf2f0

作者：[David Gilbertson][a]
译者：[softpaopao](https://github.com/softpaopao)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@david.gilbertson
[1]:https://www.npmjs.com/package/marked
[2]:https://github.com/davidgilbertson/about-github/tree/master/text-snippets
[3]:https://guides.github.com/features/mastering-markdown/
[4]:https://github.com/github/linguist/blob/fc1404985abb95d5bc33a0eba518724f1c3c252e/vendor/README.md
[5]:https://help.github.com/articles/closing-issues-using-keywords/
[6]:https://help.github.com/articles/searching-issues-and-pull-requests/
[7]:https://www.zenhub.com/
[8]:https://help.github.com/articles/tracking-the-progress-of-your-work-with-project-boards/
[9]:https://github.com/davidgilbertson/about-github/wiki
[10]:http://redux.js.org/
[11]:https://github.com/davidgilbertson/about-github
[12]:https://davidgilbertson.github.io/about-github/
[13]:https://jekyllrb.com/docs/home/
[14]:https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#pre-rendering-into-static-html-files
[15]:https://developer.github.com/v3/repos/contents/#get-contents
[16]:https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc?hl=en-US
[17]:https://www.youtube.com/watch?v=NhlzMcSyQek&index=2&list=PLNYkxOF6rcIB3ci6nwNyLYNU6RDOU3YyL
[18]:https://octobox.io/
[19]:https://chrome.google.com/webstore/detail/stylish-custom-themes-for/fjnbnpbmkenffdnngjfgmeleoegfcffe/related?hl=en
[20]:https://userstyles.org/styles/37035/github-dark
[21]:https://chrome.google.com/webstore/detail/atom-one-dark-theme/obfjhhknlilnfgfakanjeimidgocmkim?hl=en
