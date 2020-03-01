[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11938-1.html)
[#]: subject: (Some Advice for How to Make Emacs Tetris Harder)
[#]: via: (https://nickdrozd.github.io/2019/01/14/tetris.html)
[#]: author: (nickdrozd https://nickdrozd.github.io)

如何让 Emacs 俄罗斯方块变得更难
======

你知道吗，Emacs 捆绑了一个俄罗斯方块的实现？只需要输入 `M-x tetris` 就行了。

![](https://nickdrozd.github.io/assets/2019-01-14-tetris/tetris-normal.png)

在对文本编辑器的讨论中，Emacs 鼓吹者经常提到这一点。“没错，但是你那个编辑器能运行俄罗斯方块吗？”我很好奇，这会让大家相信 Emacs 更优秀吗？比如，为什么有人会关心他们是否可以在文本编辑器中玩游戏呢？“没错，但是你那台吸尘器能播放 mp3 吗？”

有人说，俄罗斯方块总是很有趣的。像 Emacs 中的所有东西一样，它的源代码是开放的，易于检查和修改，因此 **我们可以使它变得更加有趣**。所谓更加有趣，我的意思是更难。

让游戏变得更难的一个最简单的方法就是“隐藏下一个块预览”。你无法在知道下一个块会填满空间的情况下有意地将 S/Z 块放在一个危险的位置——你必须碰碰运气，希望出现最好的情况。下面是没有预览的情况（如你所见，没有预览，我做出的某些选择带来了“可怕的后果”）:

![](https://nickdrozd.github.io/assets/2019-01-14-tetris/tetris-no-preview.png)

预览框由一个名为 `tetris-draw-next-shape` [^1] 的函数设置：

```
(defun tetris-draw-next-shape ()
  (dotimes (x 4)
    (dotimes (y 4)
      (gamegrid-set-cell (+ tetris-next-x x)
                         (+ tetris-next-y y)
                         tetris-blank)))
  (dotimes (i 4)
    (let ((tetris-shape tetris-next-shape)
          (tetris-rot 0))
      (gamegrid-set-cell (+ tetris-next-x
                            (aref (tetris-get-shape-cell i) 0))
                         (+ tetris-next-y
                            (aref (tetris-get-shape-cell i) 1))
                         tetris-shape))))
```

首先，我们引入一个标志，决定是否允许显示下一个预览块 [^2]：

```
(defvar tetris-preview-next-shape nil
  "When non-nil, show the next block the preview box.")
```

现在的问题是，我们如何才能让 `tetris-draw-next-shape` 遵从这个标志？最明显的方法是重新定义它：

```
(defun tetris-draw-next-shape ()
  (when tetris-preview-next-shape
    ;; existing tetris-draw-next-shape logic
    ))
```

但这不是理想的解决方案。同一个函数有两个定义，这很容易引起混淆，如果上游版本发生变化，我们必须维护修改后的定义。

一个更好的方法是使用 **advice**。Emacs 的 advice 类似于 **Python 装饰器**，但是更加灵活，因为 advice 可以从任何地方添加到函数中。这意味着我们可以修改函数而不影响原始的源文件。

有很多不同的方法使用 Emacs advice（[查看手册][4]），但是这里我们只使用 `advice-add` 函数和 `:around` 标志。advice 函数将原始函数作为参数，原始函数可能执行也可能不执行。我们这里，我们让原始函数只有在预览标志是非空的情况下才能执行：

```
(defun tetris-maybe-draw-next-shape (tetris-draw-next-shape)
  (when tetris-preview-next-shape
    (funcall tetris-draw-next-shape)))

(advice-add 'tetris-draw-next-shape :around #'tetris-maybe-draw-next-shape)
```

这段代码将修改 `tetris-draw-next-shape` 的行为，而且它可以存储在配置文件中，与实际的俄罗斯方块代码分离。

去掉预览框是一个简单的改变。一个更激烈的变化是，**让块随机停止在空中**：

![](https://nickdrozd.github.io/assets/2019-01-14-tetris/tetris-air.png)

本图中，红色的 I 和绿色的 T 部分没有掉下来，它们被固定下来了。这会让游戏变得 **极其困难**，但却很容易实现。

和前面一样，我们首先定义一个标志：

```
(defvar tetris-stop-midair t
  "If non-nil, pieces will sometimes stop in the air.")
```

目前，**Emacs 俄罗斯方块的工作方式** 类似这样子：活动部件有 x 和 y 坐标。在每个时钟滴答声中，y 坐标递增（块向下移动一行），然后检查是否有与现存的块重叠。如果检测到重叠，则将该块回退（其 y 坐标递减）并设置该活动块到位。为了让一个块在半空中停下来，我们所要做的就是破解检测函数 `tetris-test-shape`。

**这个函数内部做什么并不重要** —— 重要的是它是一个返回布尔值的无参数函数。我们需要它在正常情况下返回布尔值 true（否则我们将出现奇怪的重叠情况），但在其他时候也需要它返回 true。我相信有很多方法可以做到这一点，以下是我的方法的：

```
(defun tetris-test-shape-random (tetris-test-shape)
  (or (and
       tetris-stop-midair
       ;; Don't stop on the first shape.
       (< 1 tetris-n-shapes )
       ;; Stop every INTERVAL pieces.
       (let ((interval 7))
         (zerop (mod tetris-n-shapes interval)))
       ;; Don't stop too early (it makes the game unplayable).
       (let ((upper-limit 8))
         (< upper-limit tetris-pos-y))
       ;; Don't stop at the same place every time.
       (zerop (mod (random 7) 10)))
      (funcall tetris-test-shape)))

(advice-add 'tetris-test-shape :around #'tetris-test-shape-random)
```

这里的硬编码参数使游戏变得更困难，但仍然可玩。当时我在飞机上喝醉了，所以它们可能需要进一步调整。

顺便说一下，根据我的 `tetris-scores` 文件，我的 **最高分** 是：

```
01389	Wed Dec  5 15:32:19 2018
```

该文件中列出的分数默认最多为五位数，因此这个分数看起来不是很好。

### 给读者的练习

1. 使用 advice 修改 Emacs 俄罗斯方块，使得每当方块下移动时就闪烁显示讯息 “OH SHIT”。消息的大小与块堆的高度成比例（当没有块时，消息应该很小的或不存在的，当最高块接近天花板时，消息应该很大）。
2. 在这里给出的 `tetris-test-shape-random` 版本中，每隔七格就有一个半空中停止。一个玩家有可能能计算出时间间隔，并利用它来获得优势。修改它，使间隔随机在一些合理的范围内（例如，每 5 到 10 格）。
3. 另一个对使用 Tetris 使用 advise 的场景，你可以试试 [autotetris-mode][1]。
4. 想出一个有趣的方法来打乱块的旋转机制，然后使用 advice 来实现它。

[^1]: Emacs 只有一个巨大的全局命名空间，因此函数和变量名一般以包名做前缀以避免冲突。
[^2]: 很多人会说你不应该使用已有的命名空间前缀而且应该将自己定义的所有东西都放在一个预留的命名空间中，比如像这样 `my/tetris-preview-next-shape`，然而这样很难看而且没什么意义，因此我不会这么干。

--------------------------------------------------------------------------------

via: https://nickdrozd.github.io/2019/01/14/tetris.html

作者：[nickdrozd][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://nickdrozd.github.io
[b]: https://github.com/lujun9972
[1]: https://nullprogram.com/blog/2014/10/19/
[2]: https://nickdrozd.github.io/2019/01/14/tetris.html#fn.1
[3]: https://nickdrozd.github.io/2019/01/14/tetris.html#fn.2
[4]: https://www.gnu.org/software/emacs/manual/html_node/elisp/Advising-Functions.html
[5]: https://nickdrozd.github.io/2019/01/14/tetris.html#fnr.1
[6]: https://nickdrozd.github.io/2019/01/14/tetris.html#fnr.2
