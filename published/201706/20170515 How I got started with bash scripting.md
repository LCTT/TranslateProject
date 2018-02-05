我是如何开始踏上 bash 脚本编程之路的？
============================================================

> 通过一些简单的 Google 搜索，即使是编程入门者也可以尝试编写代码将以往枯燥和冗长的任务自动化。

![How Google helped me learn bash scripting](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/computer_happy_sad_developer_programming.png?itok=5E3k_t_r "How Google helped me learn bash scripting")


我前几天写了一个脚本。对于一些人来说，这句话听起来没什么了不起的。而对于另一些人来说，这句话意义重大。要知道，我不是一个程序员，而是一个作家。

### 我需要解决什么？

我的问题相当简单：我需要将工程文件进行分类。这些文件可以从一个网站 URL 以 .zip 的格式下载。当我正手工将它们拷贝到我的电脑桌面，并移动到一个已按照我文件分类的需要进行了结构化的目录时，一位作家同事给我提了建议：_“不就是写个脚本的事吗？”_ 

我心想：_“就写个脚本？”_——说得好像这是世界上最容易做的事情一样。

### Google 是如何解救我的？

同事的问题促使我思考，并且经过思考后，我进行了 Google 搜索。

**Linux 上使用的是什么脚本编程语言？**

这是我第一个 Google 搜索的准则。也许很多人心里会想：“她太笨了！”是的，我很笨。不过，这的确使我走上了一条解决问题的道路。最常见的搜索结果是 Bash 。嗯，我听说过 Bash 。呃，我要分类的文件中有一个里面就有 Bash，那无处不在的 `#!/bin/bash` 。我重新看了下那个文件，我知道它的用途，因为我需要将它分类。

这引导我进行了下一个 Google 搜索。

**如何从一个 URL 下载 zip 文件？**

那确实是我的基本任务。我有一个带有 .zip 文件的 URL ，它包含有所有我需要分类的文件，所以我寻求万能的 Google 的帮助。搜索到的精华内容和其它一些结果引导我使用 Curl 。但最重要的是：我不仅找到了 Curl ，其中一条置顶的搜索结果还展示了一个使用 Curl 去下载并解压 .zip 文件的 Bash 脚本。这超出了我本来想寻求的答案，但那也使我意识到在 Google 搜索具体的请求可以得到我写这个脚本需要的信息。所以，在这个收获的推动下，我写了最简单的脚本：

```
#!/bin/sh

curl http://rather.long.url | tar -xz -C my_directory --strip-components=1
```

我迫不及待地运行看看。但我发现一个问题： URL 是会变的，根据我要访问的文件的分组不同而不同。我有新的问题需要解决，这使我进行了下一轮搜索。

**参数如何传递给 Bash 脚本？**

我需要以不同的 URL 和不同的最终目录来运行此脚本。 Google 向我展示了如何使用 `$1`、`$2` 等等来替换我在命令行中运行脚本时输入的内容。比如：

```
bash myscript.sh http://rather.long.url my_directory
```

这就好多了。一切如我所愿，灵活，实用。最重要的是我只要输入一条简短的命令就可以节省 30 分钟无聊的复制、粘贴工作。这个早上的时间花得值得。

然后我发现还有一个问题：我很健忘，并且我知道我几个月才运行一次这个脚本。这留给我两个疑问：

*   我要如何记得运行脚本时输入什么（URL 先，还是目录先）？
*   如果我被货车撞了，其它作家如何知道该怎样运行我的脚本？

我需要一个使用说明 —— 如果我使用不正确，则脚本会提示。比如：

```
usage: bash yaml-fetch.sh <'snapshot_url'> <directory>
```

否则，则直接运行脚本。我的下一个搜索是：

**如何在 Bash 脚本里使用 “if/then/else”?**

幸运的是，我已经知道编程中 `if/then/else` 的存在。我只要找出如何使用它的方法。在这个过程中，我也学到了如何在 Bash 脚本里使用 `echo` 打印。我的最终成果如下：

```
#!/bin/sh

URL=$1
DIRECTORY=$2

if [ $# -eq 0 ];
 then
 echo "usage: bash yaml-fetch.sh <'snapshot_url'> <directory>".
 else

# 如果目录不存在则创建它
 echo 'create directory'

 mkdir $DIRECTORY

 # 下载并解压 yaml 文件
 echo 'fetch and untar the yaml files'

 curl $URL | tar -xz -C $DIRECTORY --strip-components=1
fi
```

### Google 和脚本编程如何颠覆我的世界？

好吧，这稍微有点夸大，不过现在是 21 世纪，学习新东西（特别是稍微简单的东西）比以前简单多了。我所学到的（除了如何写一个简短的、自动分类的 Bash 脚本之外）是如果我有疑问，那么有很大可能性是其它人在之前也有过相同的疑问。当我困惑时，我可以问下一个问题，再下一个问题。最后，我不仅拥有了脚本，还拥有了可以一直拥有并可以简化其它任务的新技能，这是我之前所没有的。

别止步于第一个脚本（或者编程的第一步）。这是一个技能，和其它的技能并无不同，有大量的信息可以在这一路上帮助你。你无需阅读大量的书或参加一个月的课程。你可以像婴儿学步那样简单地开始写脚本，然后掌握技能并建立自信。人们总有写成千上万行代码的需求，并对它进行分支、合并、修复错误。但是，通过简单的脚本或其它方式来自动化、简单化任务的需求也一样强烈。这样的一个小脚本和小小的自信就能够让你启程脚本编程之路。

（题图： opensource.com）

--------------------------------------------------------------------------------

作者简介：

Sandra McCann 是一位 Linux 和开源技术的倡导者。她是一位软件开发者、学习资源内容架构师、内容创作者。Sandra McCann 目前是位于韦斯特福德马萨诸塞州的红帽公司的内容创作者，专注于 OpenStack 和 NFV 技术。

----

via: https://opensource.com/article/17/5/how-i-learned-bash-scripting

作者：[Sandra McCann][a]
译者：[xllc](https://github.com/xllc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sandra-mccann
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:https://opensource.com/article/17/5/how-i-learned-bash-scripting?rate=s_R-jmOxcMvs9bi41yRwenl7GINDvbIFYrUMIJ8OBYk
[6]:https://opensource.com/user/39771/feed
[7]:https://opensource.com/article/17/5/how-i-learned-bash-scripting#comments
[8]:https://opensource.com/users/sandra-mccann
