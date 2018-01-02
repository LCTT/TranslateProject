Glitch：可以让你立即写出有趣的小型网站
============================================================

我刚写了一篇关于 Jupyter Notebooks 的文章，它是一个有趣的交互式写 Python 代码的方式。这让我想起我最近学习了 Glitch，这个我同样喜爱！我构建了一个小的程序来用于[关闭转发 twitter][2]。因此有了这篇文章！

[Glitch][3] 是一个简单的构建 Javascript web 程序的方式（javascript 后端、javascript 前端）。

关于 glitch 有趣的地方有：

1.  你在他们的网站输入 Javascript 代码
2.  只要输入了任何代码，它会自动用你的新代码重载你的网站。你甚至不必保存！它会自动保存。

所以这就像 Heroku，但更神奇！像这样的编码（你输入代码，代码立即在公共网络上运行）对我而言感觉很**有趣**。

这有点像用 ssh 登录服务器，编辑服务器上的 PHP/HTML 代码，它立即就可用了，而这也是我所喜爱的方式。虽然现在我们有了“更好的部署实践”，而不是“编辑代码，让它立即出现在互联网上”，但我们并不是在谈论严肃的开发实践，而是在讨论编写微型程序的乐趣。

### Glitch 有很棒的示例应用程序

Glitch 似乎是学习编程的好方式！

比如，这有一个太空侵略者游戏（由 [Mary Rose Cook][4] 编写）：[https://space-invaders.glitch.me/][5]。我喜欢的是我只需要点击几下。

1.  点击 “remix this”
2.  开始编辑代码使箱子变成橘色而不是黑色
3.  制作我自己太空侵略者游戏！我的在这：[http://julias-space-invaders.glitch.me/][1]。（我只做了很小的更改使其变成橘色，没什么神奇的）

他们有大量的示例程序，你可以从中启动 - 例如[机器人][6]、[游戏][7]等等。

### 实际有用的非常好的程序：tweetstorms

我学习 Glitch 的方式是从这个程序开始的：[https://tweetstorms.glitch.me/][8]，它会向你展示给定用户的推特云。

比如，你可以在 [https://tweetstorms.glitch.me/sarahmei][10] 看到 [@sarahmei][9] 的推特云（她发布了很多好的 tweetstorm！）。

### 我的 Glitch 程序： 关闭转推

当我了解到 Glitch 的时候，我想关闭在 Twitter 上关注的所有人的转推（我知道可以在 Tweetdeck 中做这件事），而且手动做这件事是一件很痛苦的事 - 我一次只能设置一个人。所以我写了一个 Glitch 程序来为我做！

我喜欢我不必设置一个本地开发环境，我可以直接开始输入然后开始！

Glitch 只支持 Javascript，我不是非常了解 Javascript（我之前从没写过一个 Node 程序），所以代码不是很好。但是编写它很愉快 - 能够输入并立即看到我的代码运行是令人愉快的。这是我的项目：[https://turn-off-retweets.glitch.me/][11]。

### 就是这些！

使用 Glitch 感觉真的很有趣和民主。通常情况下，如果我想 fork 某人的 Web 项目，并做出更改，我不会这样做 - 我必须 fork，找一个托管，设置本地开发环境或者 Heroku 或其他，安装依赖项等。我认为像安装 node.js 依赖关系这样的任务在过去很有趣，就像“我正在学习新东西很酷”，但现在我觉得它们很乏味。

所以我喜欢只需点击 “remix this!” 并立即在互联网上能有我的版本。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2017/11/13/glitch--write-small-web-projects-easily/

作者：[Julia Evans][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/
[1]:http://julias-space-invaders.glitch.me/
[2]:https://turn-off-retweets.glitch.me/
[3]:https://glitch.com/
[4]:https://maryrosecook.com/
[5]:https://space-invaders.glitch.me/
[6]:https://glitch.com/handy-bots
[7]:https://glitch.com/games
[8]:https://tweetstorms.glitch.me/
[9]:https://twitter.com/sarahmei
[10]:https://tweetstorms.glitch.me/sarahmei
[11]:https://turn-off-retweets.glitch.me/
