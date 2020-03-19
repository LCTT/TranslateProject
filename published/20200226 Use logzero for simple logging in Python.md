[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11970-1.html)
[#]: subject: (Use logzero for simple logging in Python)
[#]: via: (https://opensource.com/article/20/2/logzero-python)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

使用 logzero 在 Python 中进行简单日志记录
======

> 快速了解一个方便的日志库，来帮助你掌握这个重要的编程概念。

![](https://img.linux.net.cn/data/attachment/album/202003/07/122445v743hy7ajdyrrda1.jpg)

logzero 库使日志记录就像打印语句一样容易，是简单性的杰出代表。我不确定 logzero 的名称是否要与 pygame-zero、GPIO Zero 和 guizero 这样的 “zero 样板库”契合，但是肯定属于该类别。它是一个 Python 库，可以使日志记录变得简单明了。

你可以使用它基本的记录到标准输出的日志记录，就像你可以使用 print 来获得信息和调试一样，学习它的更高级日志记录（例如记录到文件）的学习曲线也很平滑。

首先，使用 pip 安装 logzero：

```
$ sudo pip3 install logzero
```

在 Python 文件中，导入 logger 并尝试以下一个或所有日志实例：

```
from logzero import logger

logger.debug("hello")
logger.info("info")
logger.warning("warning")
logger.error("error")
```

输出以易于阅读的方式自动着色：

![Python, Raspberry Pi: import logger][2]

因此现在不要再使用 `print` 来了解发生了什么，而应使用有相关日志级别的日志器。

### 在 Python 中将日志写入文件

如果你阅读至此，并会在你写代码时做一点改变，这对我就足够了。如果你要了解更多，请继续阅读！

写到标准输出对于测试新程序不错，但是仅当你登录到运行脚本的计算机时才有用。在很多时候，你需要远程执行代码并在事后查看错误。这种情况下，记录到文件很有帮助。让我们尝试一下：

```
from logzero import logger, logfile

logfile('/home/pi/test.log')
```

现在，你的日志条目将记录到文件 `test.log` 中。记住确保[脚本有权限][3]写入该文件及其目录结构。

你也可以指定更多选项：

```
logfile('/home/pi/test.log', maxBytes=1e6, backupCount=3)
```

现在，当提供给 `test.log` 文件的数据达到 1MB（10^6 字节）时，它将通过 `test.log.1`、`test.log.2` 等文件轮替写入。这种行为可以避免系统打开和关闭大量 I/O 密集的日志文件，以至于系统无法打开和关闭。更专业一点，你或许还要记录到 `/var/log`。假设你使用的是 Linux，那么创建一个目录并将用户设为所有者，以便可以写入该目录：

```
$ sudo mkdir /var/log/test
$ sudo chown pi /var/log/test
```

然后在你的 Python 代码中，更改 `logfile` 路径：

```
logfile('/var/log/test/test.log', maxBytes=1e6, backupCount=3)
```

当要在 `logfile` 中捕获异常时，可以使用 `logging.exception`：

```
try:
    c = a / b
except Exception as e:
    logger.exception(e)
```

这将输出（在 `b` 为零的情况下）：

```
[E 190422 23:41:59 test:9] division by zero
     Traceback (most recent call last):
       File "test.py", line 7, in
         c = a / b
     ZeroDivisionError: division by zero
```

你会得到日志，还有完整回溯。另外，你可以使用 `logging.error` 并隐藏回溯：

```
try:
    c = a / b
except Exception as e:
    logger.error(f"{e.__class__.__name__}: {e}")
```

现在，将产生更简洁的结果：

```
[E 190423 00:04:16 test:9] ZeroDivisionError: division by zero
```

![Logging output][4]

你可以在 [logzero.readthedocs.io] [5] 中阅读更多选项。

### logzero 为教育而生

对于新手程序员来说，日志记录可能是一个具有挑战性的概念。大多数框架依赖于流控制和大量变量操作来生成有意义的日志，但是 logzero 不同。由于它的语法类似于 `print` 语句，因此它在教育上很成功，因为它无需解释其他概念。在你的下个项目中试试它。


此文章最初发布在[我的博客][6]上，经许可重新发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/logzero-python

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl (Snake charmer cartoon with a yellow snake and a blue snake)
[2]: https://opensource.com/sites/default/files/uploads/rpi_ben_1.png (Python, Raspberry Pi: import logger)
[3]: https://opensource.com/article/19/6/understanding-linux-permissions
[4]: https://opensource.com/sites/default/files/uploads/rpi_ben_2.png (Logging output)
[5]: https://logzero.readthedocs.io/en/latest/
[6]: https://tooling.bennuttall.com/logzero/
