为你的 Fedora 系统增添发音功能
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/espeak-945x400.png)

Fedora 工作站默认带有一个小软件，叫做 espeak。它是一个声音合成器 -- 也就是转换文本为声音的软件。

在当今这个世界，发音设备已经非常普遍了。在智能电话、Amazon Alexa，甚至火车站的公告栏中都有声音合成器。而且，现在合成声音已经跟人类的声音很类似了。我们生活在 80bandaid 的科幻电影里！

与前面提到的这些工具相比，espeak 的发音听起来有一点原始。但最终 espeak 可以产生不错的发音效果。而且不管你觉得它有没有用，至少它可以给你带来一些乐趣。

### 运行 espeak

你可以在命令行为 espeak 设置各种参数。包括：

  * 振幅（`-a`）
  * 音高调整 （`-p`）
  * 读句子的速度 （`-s`）
  * 单词间的停顿时间 （`-g`）

每个选项都能产生不同的效果，你可以通过调整它们来让发音更加清晰。

你也可以通过命令行选项来选择不同的变音。比如，`-ven+m3` 表示另一种英式男音，而 `-ven+f1` 表示英式女音。你也可以尝试其他语言的发音。运行下面命令可以查看支持的语言列表：

```
espeak --voices
```

要注意，很多非英语的语言发音现在还处于实验阶段。

若要创建相应的 WAV 文件而不是真的讲出来，则可以使用 `-w` 选项：

```
espeak -w out.wav "Audio file test"
```

espeak 还能读出文件的内容。

```
espeak -f plaintextfile
```

你也可以通过标准输入传递要发音的文本。举个简单的例子，通过这种方式，你可以创建一个发音盒子，当事件发生时使用声音通知你。你的备份完成了？将下面命令添加到脚本的最后试试效果：

```
echo "Backup completed" | espeak -s 160 -a 100 -g 4
```

假如有日志文件中出现错误了：

```
tail -1F /your/log/file | grep --line-buffered 'ERROR' | espeak
```

或者你也可以创建一个报时钟表，每分钟报一次时：

```
while true; do date +%S | grep '00' && date +%H：%M | espeak; sleep 1; done
```

你会发现，espeak 的使用场景仅仅受你的想象所限制。享受你这会发音的 Fedora 系统吧！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/add-speech-fedora-system/

作者：[Alessio Ciregia][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://alciregi.id.fedoraproject.org/
