[#]: subject: "an even better video wharf"
[#]: via: "https://jao.io/blog/2021-01-11-an-even-better-video-wharf.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: "Drwhooooo"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15711-1.html"

一个更好的视频码头
======

![][0]

之前，[我在写][1] 有关 [embark][2] 的内容，我的第一设备为启动远程视频流设计了一个新的 embark。embark 的作者 Omar Antolín Camarena 不仅阅读了这篇内容，还点评了一下我认为值得跟进的一些重大改进。

首先，你应该记得我们曾定义过一个检测视频 URL 的函数：

```

    (defun jao-video-finder ()
      "Check whether we're looking at a video URL.
    Return (video-url . <URL>) if so."
      (when-let ((url (thing-at-point-url-at-point)))
        (when (string-match-p jao-video-url-rx url)
          (cons 'video-url url))))

```

当我们得到了一个非空的 `url` 值，即便它不是一个视频链接，但它仍然是一个确切的 URL，并且 embark 已有了一个 `url` 类别，所以我们可以借助默认的 URL 寻检器存储一个新的句法分析,语句如下：

```

    (when-let ((url (thing-at-point-url-at-point)))
      (cons (if (string-match-p jao-video-url-rx url) 'video-url 'url) url))

```

这里有一个潜在的缺点就是：我们重写了 embark 的寻检器，`embark-target-url-at-point`，所以我们可能更愿意保留后者。

实际上多亏了 embark 的 _目标转换器_ 我们才能做成。我们可以在 `embark-transformers-alist` 中添加任意一个函数，应用于任何一个给定类别的目标，而 embark 会将其转换后的值应用于它的操作中。Omar 很贴切地把这个过程称为“目标的精化”;我们具体做法如下：

```

    (defun jao-refine-url-type (url)
      "Refine type of URL in case it is a video."
      (cons (if (string-match-p jao-video-url-rx url) 'video-url 'url) url))

    (add-to-list 'embark-transformer-alist '(url . jao-refine-url-type))

```

通过这种策略，我们就不再需要 `jao-video-finder` 了，而且从概念上来说，我们的 `video-url` 应该被定义为一个精化操作而并非是一个目标 [脚注 1]。Omar 的第二个提议也与这个概念相契合：想必我们都希望所有关于 `url` 和我们的 `video-url` 的操作都是可用的，不是吗？
唔，这就是为什么我们用来定义行为的 `embark-define-keymap` 的宏可以通过使用关键字 [脚注 2] `:parent` 继承其他键映射中已经定义的所有操作的原因：

```

    (embark-define-keymap jao-video-url-map
      "Actions on URLs pointing to remote video streams."
      :parent embark-url-map
      ("p" jao-play-video-url))

    (add-to-list 'embark-keymap-alist '(video-url . jao-video-url-map))

```

这种继承键映射的功能并非是 embark 的附属功能：vanilla Emacs 键映射通过标准函数 `set-keymap-parent` 已经搞定它了。你可以完全不用 `embark-define-keymap` 来定义 `jao-video-url-map`，工作原理是一样的。

这样，我们的代码就能够更短，特征更多：谢谢你，Omar！

**脚注 1**：在某些情况下，保留 jao-video-finder 是有意义的，即，如果我们想要改变检测 URL 的功能的话。例如，我在使用 emacs-w3m 的时候，经常有一个 URL 作为文本属性储存了起来(实际文本是个链接文本)。要通过那里检索 URL，就需要调用 `w3m-anchor`，而用 `embark-target-url-at-point` 就会错过它。对于这种情况，我最终编写(并使用)`jao-video-finder` 将其通过下文定义:
  
```

    (when-let ((url (or (w3m-anchor) (thing-at-point-url-at-point))))
      (cons (if (string-match-p jao-video-url-rx url) 'video-url 'url) url))

```

另一种达成同件事情的方式（再次向 Omar 致敬）便是为 w3m 的锚点放置一个特定的巡检器（且继续使用 video-url 的转换器）：

```

    (defun jao-w3m-url-finder ()
      (when-let ((url (w3m-anchor)))
        (cons 'url url)))

    (add-to-list 'embark-target-finders #'jao-w3m-url-finder)

```

这种方法更加模块化，并且取决于你们的喜好，且更加巧妙。这些功能都很小巧并且两种方法之间并没有太大的差别，但是如果其中某一种继续加入更多寻检器的话，前一种方法用起来来反而会让一切变得更糟。

**脚注 2**：在我最开始的例子中，我在视频地图中还添加了 `browse-url` 和 `browse-url-firefox`。前一个已不再重要，因为它已经在 `embark-url-map` 中出现过了，如果我们想让 `browse-url-firefox` 对 _所有_ 的 URLs 可用,我们可以将其加入到 `embark-url-map` （谨记，embark 的键映射只是 Emacs 的键映射）。这是另一种扩展 embark 的简便方法。

*（题图：MJ:emacs video geek wallpaper dark plain background Illustration）*

--------------------------------------------------------------------------------

via: https://jao.io/blog/an-even-better-video-wharf.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[Drwhooooo](https://github.com/Drwhooooo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://jao.io/blog/2021-01-09-embarking-videos.html
[2]: https://github.com/oantolin/embark
[3]: tmp.VUqMT3Yft2#fn.1
[4]: tmp.VUqMT3Yft2#fn.2
[5]: tmp.VUqMT3Yft2#fnr.1
[6]: tmp.VUqMT3Yft2#fnr.2
[7]: https://jao.io/blog/tags.html
[8]: https://jao.io/blog/tag-emacs.html
[0]: https://img.linux.net.cn/data/attachment/album/202304/11/150233vzkt1tute4i4oemg.jpg