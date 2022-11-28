[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13093-1.html)
[#]: subject: (Write GIMP scripts to make image processing faster)
[#]: via: (https://opensource.com/article/21/1/gimp-scripting)
[#]: author: (Cristiano L. Fontana https://opensource.com/users/cristianofontana)

编写 GIMP 脚本使图像处理更快
======

> 通过向一批图像添加效果来学习 GIMP 的脚本语言 Script-Fu。

![](https://img.linux.net.cn/data/attachment/album/202102/06/231011c0xhvxitxjv899qv.jpg)

前一段时间，我想给方程图片加一个黑板式的外观。我开始是使用 [GIMP][2] 来处理的，我对结果很满意。问题是我必须对图像执行几个操作，当我想再次使用此样式，不想对所有图像重复这些步骤。此外，我确信我会很快忘记这些步骤。

![Fourier transform equations][3]

*傅立叶变换方程式（Cristiano Fontana，[CC BY-SA 4.0] [4]）*

GIMP 是一个很棒的开源图像编辑器。尽管我已经使用了多年，但从未研究过其批处理功能或 [Script-Fu][5] 菜单。这是探索它们的绝好机会。

### 什么是 Script-Fu？

[Script-Fu][6] 是 GIMP 内置的脚本语言。是一种基于 [Scheme][7] 的编程语言。如果你从未使用过 Scheme，请尝试一下，因为它可能非常有用。我认为 Script-Fu 是一个很好的入门方法，因为它对图像处理具有立竿见影的效果，所以你可以很快感觉到自己的工作效率的提高。你也可以使用 [Python][8] 编写脚本，但是 Script-Fu 是默认选项。

为了帮助你熟悉 Scheme，GIMP 的文档提供了深入的 [教程][9]。Scheme 是一种类似于  [Lisp][10] 的语言，因此它的主要特征是使用 [前缀][11] 表示法和 [许多括号][12]。函数和运算符通过前缀应用到操作数列表中：

```
(函数名 操作数 操作数 ...)

(+ 2 3)
↳ 返回 5

(list 1 2 3 5)
↳ 返回一个列表，包含 1、 2、 3 和 5
```

我花了一些时间才找到完整的 GIMP 函数列表文档，但实际上很简单。在 **Help** 菜单中，有一个 **Procedure Browser**，其中包含所有可用的函数的丰富详尽文档。

![GIMP Procedure Browser][13]

### 使用 GIMP 的批处理模式

你可以使用 `-b` 选项以批处理的方式启动 GIMP。`-b` 选项的参数可以是你想要运行的脚本，或者用一个 `-` 来让 GIMP 进入交互模式而不是命令行模式。正常情况下，当你启动 GIMP 的时候，它会启动图形界面，但是你可以使用 `-i` 选项来禁用它。

### 开始编写你的第一个脚本

创建一个名为 `chalk.scm` 的文件，并把它保存在 **Preferences** 窗口中 **Folders** 选项下的 **Script** 中指定的 `script` 文件夹下。就我而言，是在 `$HOME/.config/GIMP/2.10/scripts`。

在 `chalk.scm` 文件中，写入下面的内容：

```
(define (chalk filename grow-pixels spread-amount percentage)
   (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
          (drawable (car (gimp-image-get-active-layer image)))
          (new-filename (string-append "modified_" filename)))
     (gimp-image-select-color image CHANNEL-OP-REPLACE drawable '(0 0 0))
     (gimp-selection-grow image grow-pixels)
     (gimp-context-set-foreground '(0 0 0))
     (gimp-edit-bucket-fill drawable BUCKET-FILL-FG LAYER-MODE-NORMAL 100 255 TRUE 0 0)
     (gimp-selection-none image)
     (plug-in-spread RUN-NONINTERACTIVE image drawable spread-amount spread-amount)
     (gimp-drawable-invert drawable TRUE)
     (plug-in-randomize-hurl RUN-NONINTERACTIVE image drawable percentage 1 TRUE 0)
     (gimp-file-save RUN-NONINTERACTIVE image drawable new-filename new-filename)
     (gimp-image-delete image)))
```

### 定义脚本变量

在脚本中， `(define (chalk filename grow-pixels spread-amound percentage) ...)` 函数定义了一个名叫 `chalk` 的新函数。它的函数参数是 `filename`、`grow-pixels`、`spread-amound` 和 `percentage`。在 `define` 中的所有内容都是 `chalk` 函数的主体。你可能已经注意到，那些名字比较长的变量中间都有一个破折号来分割。这是类 Lisp 语言的惯用风格。

`(let* ...)` 函数是一个特殊<ruby>过程<rt>procedure</rt></ruby>，可以让你定义一些只有在这个函数体中才有效的临时变量。临时变量有 `image`、`drawable` 以及 `new-filename`。它使用 `gimp-file-load` 来载入图片，这会返回它所包含的图片的一个列表。并通过 `car` 函数来选取第一项。然后，它选择第一个活动层并将其引用存储在  `drawable` 变量中。最后，它定义了包含图像新文件名的字符串。 

为了帮助你更好地了解该过程，我将对其进行分解。首先，启动带 GUI 的 GIMP，然后你可以通过依次点击 **Filters → Script-Fu → Console** 来打开 Script-Fu 控制台。 在这种情况下，不能使用 `let *`，因为变量必须是持久的。使用 `define` 函数定义 `image` 变量，并为其提供查找图像的正确路径：

```
(define image (car (gimp-file-load RUN-NONINTERACTIVE "Fourier.png" "Fourier.png")))
```

似乎在 GUI 中什么也没有发生，但是图像已加载。 你需要通过以下方式来让图像显示：

```
(gimp-display-new image)
```

![GUI with the displayed image][14]

现在，获取活动层并将其存储在 `drawable` 变量中：

```
(define drawable (car (gimp-image-get-active-layer image)))
```

最后，定义图像的新文件名：

```
(define new-filename "modified_Fourier.png")
```

运行命令后，你将在 Script-Fu 控制台中看到以下内容：

![Script-Fu console][15]

在对图像执行操作之前，需要定义将在脚本中作为函数参数的变量：

```
(define grow-pixels 2)
(define spread-amount 4)
(define percentage 3)
```

### 处理图片

现在，所有相关变量都已定义，你可以对图像进行操作了。 脚本的操作可以直接在控制台上执行。第一步是在活动层上选择黑色。颜色被写成一个由三个数字组成的列表，即 `(list 0 0 0)`  或者是 `'(0 0 0)`:

```
(gimp-image-select-color image CHANNEL-OP-REPLACE drawable '(0 0 0))
```

![Image with the selected color][16]

扩大选取两个像素：

```
(gimp-selection-grow image grow-pixels)
```

![Image with the selected color][17]

将前景色设置为黑色，并用它填充选区：

```
(gimp-context-set-foreground '(0 0 0))
(gimp-edit-bucket-fill drawable BUCKET-FILL-FG LAYER-MODE-NORMAL 100 255 TRUE 0 0)
```

![Image with the selection filled with black][18]

删除选区：

```
(gimp-selection-none image)
```

![Image with no selection][19]

随机移动像素：

```
(plug-in-spread RUN-NONINTERACTIVE image drawable spread-amount spread-amount)
```

![Image with pixels moved around][20]

反转图像颜色：

```
(gimp-drawable-invert drawable TRUE)
```

![Image with pixels moved around][21]

随机化像素：

```
(plug-in-randomize-hurl RUN-NONINTERACTIVE image drawable percentage 1 TRUE 0)
```

![Image with pixels moved around][22]

将图像保存到新文件：

```
(gimp-file-save RUN-NONINTERACTIVE image drawable new-filename new-filename)
```

![Equations of the Fourier transform and its inverse][23]

*傅立叶变换方程 (Cristiano Fontana, [CC BY-SA 4.0][4])*

### 以批处理模式运行脚本

现在你知道了脚本的功能，可以在批处理模式下运行它：

```
gimp -i -b '(chalk "Fourier.png" 2 4 3)' -b '(gimp-quit 0)'
```

在运行 `chalk` 函数之后，它将使用 `-b` 选项调用第二个函数  `gimp-quit` 来告诉 GIMP 退出。

### 了解更多

本教程向你展示了如何开始使用 GIMP 的内置脚本功能，并介绍了 GIMP 的 Scheme 实现：Script-Fu。如果你想继续前进，建议你查看官方文档及其[入门教程][9]。如果你不熟悉 Scheme 或 Lisp，那么一开始的语法可能有点吓人，但我还是建议你尝试一下。这可能是一个不错的惊喜。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/gimp-scripting

作者：[Cristiano L. Fontana][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cristianofontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/painting_computer_screen_art_design_creative.png?itok=LVAeQx3_ (Painting art on a computer screen)
[2]: https://www.gimp.org/
[3]: https://opensource.com/sites/default/files/uploads/fourier.png (Fourier transform equations)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://docs.gimp.org/en/gimp-filters-script-fu.html
[6]: https://docs.gimp.org/en/gimp-concepts-script-fu.html
[7]: https://en.wikipedia.org/wiki/Scheme_(programming_language)
[8]: https://docs.gimp.org/en/gimp-filters-python-fu.html
[9]: https://docs.gimp.org/en/gimp-using-script-fu-tutorial.html
[10]: https://en.wikipedia.org/wiki/Lisp_%28programming_language%29
[11]: https://en.wikipedia.org/wiki/Polish_notation
[12]: https://xkcd.com/297/
[13]: https://opensource.com/sites/default/files/uploads/procedure_browser.png (GIMP Procedure Browser)
[14]: https://opensource.com/sites/default/files/uploads/gui01_image.png (GUI with the displayed image)
[15]: https://opensource.com/sites/default/files/uploads/console01_variables.png (Script-Fu console)
[16]: https://opensource.com/sites/default/files/uploads/gui02_selected.png (Image with the selected color)
[17]: https://opensource.com/sites/default/files/uploads/gui03_grow.png (Image with the selected color)
[18]: https://opensource.com/sites/default/files/uploads/gui04_fill.png (Image with the selection filled with black)
[19]: https://opensource.com/sites/default/files/uploads/gui05_no_selection.png (Image with no selection)
[20]: https://opensource.com/sites/default/files/uploads/gui06_spread.png (Image with pixels moved around)
[21]: https://opensource.com/sites/default/files/uploads/gui07_invert.png (Image with pixels moved around)
[22]: https://opensource.com/sites/default/files/uploads/gui08_hurl.png (Image with pixels moved around)
[23]: https://opensource.com/sites/default/files/uploads/modified_fourier.png (Equations of the Fourier transform and its inverse)
