Linux常见问题解答--如何修复"tar：由于前一个错误导致于失败状态中退出"
================================================================================
> **问题**: 当我想试着用tar命令来创建一个压缩文件时，总在执行过程中失败，并且抛出一个错误说明"tar：由于前一个错误导致于失败状态中退出"("Exiting with failure status due to previous errors"). 什么导致这个错误的发生，要如何解决？

![](https://farm9.staticflickr.com/8863/17631029953_1140fe2dd3_b.jpg)

如果当你执行tar命令时，遇到了下面的错误，那么最有可能的原因是对于你想用tar命令压缩的某个文件中，你并不具备其读权限。

    tar: Exiting with failure status due to previous errors

那么我们要如何确定引起错误的这个（些）文件呢？或者如何确定其它的错误根源？

事实上tar命令应该会打印出所谓的“上一个错误”("previous errors")到底是什么错误，但是如果你让tar运行在详细模式（即verbose mode，例如, -cvf)，那么你会很容易错失这些信息。要找到这些信息，你可以像下面那样，把tar的标准输出（stdout)信息过滤掉。

    $ tar cvzfz backup.tgz my_program/ > /dev/null

然后你会看到tar输出的标准错误(stderr)信息。（LCTT 译注：自然，不用 v 参数也可以。）

    tar: my_program/src/lib/.conf.db.~lock~: Cannot open: Permission denied
    tar: Exiting with failure status due to previous errors

你可以从上面的例子中看到，引起错误的原因的确是“读权限不允许”（denied read permission.)要解决这个问题，只要简单地更改(或移除)问题文件的权限，然后重新执行tar命令即可。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/tar-exiting-with-failure-status-due-to-previous-errors.html

作者：[Dan Nanni][a]
译者：[XLCYun(袖里藏云)](https://github.com/XLCYun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
