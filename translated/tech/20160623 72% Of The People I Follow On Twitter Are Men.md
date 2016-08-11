在推特上我关注的人72%都是男性
===============================================

![](https://emptysqua.re/blog/gender-of-twitter-users-i-follow/abacus.jpg)

至少，这是我的估计。推特并不会询问用户的性别，因此我 [写了一个程序][1] ，根据姓名猜测他们的性别。在我的那些关注者中，性别分布甚至更糟，83%的是男性。据我所知，其他的还不全都是女性。

修正第一个数字并不是什么神秘的事：我注意寻找更多支持我兴趣的女性专家，并且关注他们。

另一方面，第二个数字，我只能只能轻微影响一点，但是我也打算改进下。我在推特上的关系网应该代表的是软件行业的多元化未来，而不是不公平的现状。

### 我应该怎么估算呢

我开始估算我关注的人（推特的上的术语是“朋友”）的性别分布，然后这格外的难。[推特的分析][2]经常显示相反的结果。 一个我的关注者的性别估算结果：

![](https://emptysqua.re/blog/gender-of-twitter-users-i-follow/twitter-analytics.png)

因此，推特的分析将我的关注者分成了三类：男性、女性、未知，并且给我们展示了前面两组的比例。（性别二值化现象在这里并不存在——未知性别的人都集中在组织的推特账号上。）但是我关注的人的性别比例，推特并没有告诉我。 [而这就是可以改进的][3], 然后我开始搜索能够帮我估算这个数字的服务，最终发现了 [FollowerWonk][4] 。

FollowerWonk 估算我关注的人里面有71%的都是男性。这个估算准确吗？ 为了准确性，我把FollowerWonk和Twitter对我关注的人的进行了估算，结果如下：

**推特分析**

|           | 男性   | 女性   |
| --------- | ---- | ---- |
| **我的关注者** | 83%  | 17%  |

**FollowerWonk**

|           | 男性   | 女性   |
| --------- | ---- | ---- |
| **我的关注者** | 81%  | 19%  |
| **我关注的人** | 72%  | 28%  |

FollowerWonk的分析显示我的关注者中81%的人都是男性，很接近推特分析的数字。这个结果还说得过去。如果FollowerWonk 和Twitter 在我的关注者的性别比例上是一致的，这就表明FollowerWonk对我关注的人的性别估算也应当是合理的。使用FollowerWonk我就能养成估算这些数字的爱好，并且做出改进。

然而，使用FollowerWonk 检测我关注的人的性别分布一个月需要30美元，这真是一个昂贵的爱好。我并不需要FollowerWonk 的所有的功能。我能很经济的解决只需要性别分布的问题吗？

因为FollowerWonk 的估算数字看起来比较合理，我试图做一个自己的FollowerWonk 。使用Python和[一些好心的费城人写的Twitter API封装类][5]（LCTT译者注：Twitter API封装类是由Mike Taylor等一批费城人在github上开源的一个项目），我开始下载我所有关注的人和我所有的关注者的简介。我马上就发现推特的比例限制是极少的，因此我随机的采样了一部分用户。

我写了一个初步的程序，在所有我关注的人的简介中搜索一个和性别相关的代词。例如，如果简介中包含了“she”或者“her”这样的字眼，可能这就属于一个女性，如果简介中包含了“they”或者”then“，那么可能这就是性别位置的。但是大多数简介中不会出现这些代词。对于这种简介，和性别关联最紧密的信息就是姓名了。例如：@gvanrossum的姓名那一栏是“Guido van Rossum”，第一姓名是“Guido”，这表明@gvanrossum是一个女的。当找不到代词的时候，我就使用第一姓名来评估性别估算数字。

我的脚本把每个名字的一部分传到性别检测机中去检测性别。[性别检测机][6]也有可预见的失败，比如错误的把“Brooklyn Zen Center”当做一个名叫“Brooklyn”的女性，但是它的评估结果与FollowerWonk和Twitter的相比也是很合理的：

|       | 非男非女 | 男性   | 女性   | 性别未知的 |
| ----- | ---- | ---- | ---- | ----- |
| 我关注的人 | 1    | 168  | 66   | 173   |
|       | 0%   | 72%  | 28%  |       |
| 我的关注者 | 0    | 459  | 108  | 433   |
|       | 0%   | 81%  | 19%  |       |

（数据基于我所有的408个关注的人和1000个关注者。）

### 了解你的数字

我想你们也能检测你们推特关系网的性别分布。所以我每月花费10美元将“Proportional”应用发布到PythonAnywhere这个便利的服务上：

><www.proporti.onl>

这个应用可能会在速率上有限制，否则会失败，因此请温柔的对待它。github上放了源代码[代码][7] ，也有命令行的工具。

是谁代表了你的推特关系网？你还在忍受那些在过去几十年里一直在谈论的软件的不公平的分布组吗？或者你的关系网看起来像软件行业的未来吗？让我们了解我们的数字并且改善他们。



--------------------------------------------------------------------------------

via: https://emptysqua.re/blog/gender-of-twitter-users-i-follow/

作者：[A. Jesse Jiryu Davis][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://disqus.com/by/AJesseJiryuDavis/
[1]: https://www.proporti.onl/
[2]: https://analytics.twitter.com/
[3]: http://english.stackexchange.com/questions/14952/that-which-is-measured-improves
[4]: https://moz.com/followerwonk/
[5]: https://github.com/bear/python-twitter/graphs/contributors
[6]: https://pypi.python.org/pypi/SexMachine/
[7]: https://github.com/ajdavis/twitter-gender-distribution