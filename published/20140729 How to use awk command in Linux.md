如何在Linux中使用awk命令
================================================================================
文本处理是Unix的核心。从管道到/proc子系统，“一切都是文件”的理念贯穿于操作系统和所有基于它构造的工具。正因为如此，轻松地处理文本是一个期望成为Linux系统管理员甚至是资深用户的最重要的技能之一，而 awk是通用编程语言之外最强大的文本处理工具之一。

最简单的awk的任务是从标准输入中选择字段；如果你对awk除了这个用途之外，从来没了解过它的其他用途，你会发现它还是会是你身边一个非常有用的工具。

默认情况下，awk通过空格分隔输入。如果您想选择输入的第一个字段，你只需要告诉awk输出$ 1：

    $ echo 'one two three four' | awk '{print $1}'

> one

（是的，大括号语法是有点古怪，但我保证这是我们这节课一直会遇到。）

你能猜出如何选择第二，第三或第四个字段么？是的，分别用$2，$ 3，$ 4。

    $ echo 'one two three four' | awk '{print $3}'

> three

通常在文本改写时，你需要创建一个特定的数据格式，并且它覆盖不止一个单词。好消息是，awk中可以很容易地打印多个字段，甚至包含静态字符串：

     $ echo 'one two three four' | awk '{print $3,$1}' 

> three one

----------

    $ echo 'one two three four' | awk '{print "foo:",$3,"| bar:",$1}' 

> foo: three | bar: one

好吧，如果你的输入不是由空格分隔怎么办？只需用awk中的'-F'标志指定你的分隔符：

    $ echo 'one mississippi,two mississippi,three mississippi,four mississippi' | awk -F , '{print $4}' 

> four mississippi

偶尔间，你会发现自己正在处理字段数量不同的数据，但你只知道你想要的*最后*字段。 awk中内置的$NF变量代表*字段的数量*，这样你就可以用它来抓取最后一个元素：

    $ echo 'one two three four' | awk '{print $NF}' 

> four

你也可以用$NF做简单的数学，假如你需要倒数第二个字段：

    $ echo 'one two three four' | awk '{print $(NF-1)}' 

> three

甚至是中间的字段：

    $ echo 'one two three four' | awk '{print $((NF/2)+1)}' 

> three

而且这一切都非常有用，同样你可以摆脱强制使用sed，cut，和grep来得到这些结果（尽管要做更多的操作）。

因此，我将最后为你介绍awk的一个特性，维持跨行状态。

     $ echo -e 'one 1\ntwo 2' | awk '{print $2}' 

> 1
> 
> 2

    $ echo -e 'one 1\ntwo 2' | awk '{sum+=$2} END {print sum}' 

> 3

（END代表的是我们在执行完每行的处理**之后**只处理下面的代码块）

这里我使用的例子是统计web服务器请求日志的字节大小。想象一下我们有如下这样的日志：

    $ cat requests.log 

> Jul 23 18:57:12 httpd[31950]: "GET /foo/bar HTTP/1.1" 200 344
> 
> Jul 23 18:57:13 httpd[31950]: "GET / HTTP/1.1" 200 9300
> 
> Jul 23 19:01:27 httpd[31950]: "GET / HTTP/1.1" 200 9300
> 
> Jul 23 19:01:55 httpd[31950]: "GET /foo/baz HTTP/1.1" 200 6401
> 
> Jul 23 19:02:31 httpd[31950]: "GET /foo/baz?page=2 HTTP/1.1" 200 6312

我们知道最后一个字段是响应的字节大小。我们已经学习了如何使用$NF来抽取他们：

    $ < requests.log awk '{print $NF}' 

> 344
> 
> 9300
> 
> 9300
> 
> 6401
> 
> 6312

接着我们可以将它们累加到一个变量中来收集我们的web服务其在日志中这段时间内的响应客户端的字节数量

    $ < requests.log awk '{totalBytes+=$NF} END {print totalBytes}' 

> 31657

如果你正在寻找关于awk的更多资料，你可以在Amazon中花费不到15美元买到[原始awk手册][1]的二手书。你也许还可以看看Eric Pement的[单行awk命令收集][2]这本书。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/use-awk-command-linux.html

作者：[James Pearson][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/james
[1]:http://www.amazon.com/gp/product/020107981X/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=020107981X&linkCode=as2&tag=xmodulo-20&linkId=6NW62B2WBRBXRFJB
[2]:http://www.pement.org/awk/awk1line.txt