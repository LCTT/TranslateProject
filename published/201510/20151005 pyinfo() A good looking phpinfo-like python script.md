pyinfo()：一个像 phpinfo 一样的 Python 脚本
================================================================================
作为一个热衷于 php 的家伙，我已经习惯了使用 `phpinfo()` 函数来让我轻松访问 php.ini 里的配置和加载的模块等信息。当然我也想要使用一个不存在的 `pyinfo()` 函数，但没有成功。按下 CTRL-E，google 一下是否有人实现了它？

是的，有人已经实现了。但是，对我来说它非常难看。荒谬！因为我无法忍受丑陋的布局，*咳咳*，我不得不亲自动手来改改。我用找到的代码，并重新进行布局使之更好看点。Python 官方网站的布局看起来不错，那么何不借用他们的颜色和背景图片呢？是的，这听起来像一个计划。

- [Gist 代码地址][1]
- [下载地址][2]
- [例子][3]

提醒你下，我仅仅在 Python 2.6.4 上运行过它，所以在别的版本上可能有风险（将它移植到任何其他版本它应该是没有问题的）。要使用它，只需要导入该文件， 并调用`pyinfo()`函数得到它的返回值打印到屏幕上。好嘞！

如果你在使用 [mod_wsgi][4] 时没有得到正确的返回结果，你可以如下运行它（当然得替换路径）：

```
def application(environ, start_response):
    import sys
    path = 'YOUR_WWW_ROOT_DIRECTORY'
    if path not in sys.path:
        sys.path.append(path)
    from pyinfo import pyinfo
    output = pyinfo()
    start_response('200 OK', [('Content-type', 'text/html')])
    return [output]
```
---

via：http://bran.name/articles/pyinfo-a-good-looking-phpinfo-like-python-script/

作者：[Bran van der Meer][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，
[Linux中国](https://linux.cn/) 荣誉推出


[a]:http://bran.name/resume/
[1]:https://gist.github.com/951825#file_pyinfo.py
[2]:http://bran.name/dump/pyinfo.zip
[3]:http://bran.name/dump/pyinfo/index.py
[4]:http://code.google.com/p/modwsgi/
