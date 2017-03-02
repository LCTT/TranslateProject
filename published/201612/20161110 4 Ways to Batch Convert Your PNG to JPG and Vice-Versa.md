在 Linux 下将 PNG 和 JPG 批量互转的四种方法
==============

计算机术语中，批处理指的是用一个非交互式的程序来[执行一序列的任务][11]的方法。这篇教程里，我们会使用 Linux 命令行工具，并提供 4 种简单的处理方式来把一些 `.PNG` 格式的图像批量转换成 `.JPG` 格式的，以及转换回来。

虽然所有示例中我们使用的都是 `convert` 命令行工具，但是您也可以使用 `mogrify` 命令来达到同样的效果。

convert 命令的语法如下：

```
$ convert 输入选项 输入文件 输出选项 输出文件

```

而 mogrify 的为：

```
$ mogrify 选项 输入文件

```

注意：在使用 `mogrify` 命令时，默认情况下源图像文件会被转换后的新文件覆盖掉，您可以使用明确的操作选项来禁止覆盖，具体的选项可以在手册页中查询得到。

下面是把所有 `.PNG` 格式图像批量转换为 `.JPG` 格式的各种实现方式。如果想把 `.JPG` 转换为 `.PNG` 格式，也可使用这些命令，按需修改。

### 1、 使用 `ls` 和 `xargs` 命令来转换 PNG 和 JPG 

[ls 命令](10) 可以列出所有的 png 图像文件， `xargs` 使得可以从标准输入构建和执行 `convert` 命令，从而将所有 `.png` 图像转换为 `.jpg` 图像。

```
----------- 从 PNG 转换到 JPG ----------- 
$ ls -1 *.png | xargs -n 1 bash -c 'convert "$0" "${0%.png}.jpg"'

----------- 从 JPG 转换到 PNG ----------- 
$ ls -1 *.jpg | xargs -n 1 bash -c 'convert "$0" "${0%.jpg}.png"'

```

关于上面命令选项的说明：

1.  `-1` – 告诉 ls 每行列出一个图像名称的选项标识
2.  `-n` – 指定最多参数个数，例子中为 1
3.  `-c` – 指示 bash 运行给定的命令
4.  `${0%.png}.jpg` – 设置新转换的图像文件的名字，`%` 符号用来删除源文件的扩展名

[
 ![Convert PNG to JPG Format in Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-in-Linux.png) 
][9]

*Linux 中 PNG 格式转为 JPG 格式*

我使用  `ls -ltr` 命令按[修改的日期和时间列出所有文件][8]。

类似的，也可以使用上面的命令要把 `.jpg` 图像转换为 `.png` 格式，只需稍微调整就行。

### 2、 使用 GNU 的 `parallel` 命令来转换 PNG 和 JPG 

GNU 的 parallel 使用户能够从标准输入并行构建和执行 shell 命令。确保您的系统上安装了 GNU Parallel，否则请使用以下适当的命令进行安装：

```
$ sudo apt-get install parallel     [在 Debian/Ubuntu 系统中]
$ sudo yum install parallel         [在 RHEL/CentOS 和 Fedora 系统中]

```

安装好 `parallel` 工具后，您就可以运行下面的命令来把所有从标准输入的 `.png` 图像转换成 `.jpg` 格式的图像。

```
----------- 从 PNG 转换到 JPG ----------- 
$ parallel convert '{}' '{.}.jpg' ::: *.png

----------- 从 JPG 转换到 PNG -----------
$ parallel convert '{}' '{.}.png' ::: *.jpg

```

其中：

1.  `{}` – 输入行替代符，代替了从输入源读取的完整行。
2.  `{.}` – 去除扩展名的输入行。
3.  `:::` – 指定输入源的符号，即上面示例的命令行，在这里 *png 或 jpg* 是命令参数。

[
 ![Parallel Command - Converts All PNG Images to JPG Format](http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-Using-Parallel-Command.png) 
][7]

*Parallel 命令 – 把所有 PNG 图像转换为 JPG 格式*

或者，您也可以结合 [ls][6] 和 `parallel` 命令来批量转换所有图像，如图所示：

```
----------- 从 PNG 转换到 JPG ----------- 
$ ls -1 *.png | parallel convert '{}' '{.}.jpg'

----------- 从 JPG 转换到 PNG -----------
$ ls -1 *.jpg | parallel convert '{}' '{.}.png'

```

### 3、 使用 `for` 循环命令来转换 PNG 和 JPG

为了避免编写 shell 脚本的繁琐，你可以从命令行执行 `for` 循环语句，如下所示：

```
----------- 从 PNG 转换到 JPG ----------- 
$ bash -c 'for image in *.png; do convert "$image" "${image%.png}.jpg"; echo “image $image converted to ${image%.png}.jpg ”; done'

----------- 从 JPG 转换到 PNG -----------
$ bash -c 'for image in *.jpg; do convert "$image" "${image%.jpg}.png"; echo “image $image converted to ${image%.jpg}.png ”; done'

```

对上面的命令所使用的选项参数的描述：

1.  `-c` 允许执行包括在单引号中的循环语句。
2.  `image` 变量是目录中的图像名的数量记数器。
3.  对于每个转换操作，在 `$image` 转换为 `${image%.png}.jpg` 这行中，[echo 命令][1]通知用户 png 图像已经转换为 jpg 格式，反之亦然。
4. `${image%.png}.jpg` 语句创建了转换后的图像名字，其中 `%` 表示去除源图像文件的扩展名。

[
 ![for loop - Convert PNG to JPG Format](http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-Using-for-loop-Command.png) 
][5]

*for 循环语句 – 从 PNG 转换到 JPG 格式*

### 4、 使用 Shell 脚本来转换 PNG 和 JPG

如果你不想像前面的例子那样让你的命令行变得邋遢的话，可以写一个小脚本，如下所示：

注意：适当地交换 `.png` 和 `.jpg` 扩展名，如下面的例子所示，从一种格式转换到另一种格式：

```
#!/bin/bash
#convert
for image in *.png; do
        convert  "$image"  "${image%.png}.jpg"
        echo “image $image converted to ${image%.png}.jpg ”
done
exit 0 

```

把上面的脚本保存为 `convert.sh` 文件，然后使此脚本文件可执行，接着从存有图像文件的目录下执行。

```
$ chmod +x convert.sh
$ ./convert.sh

```
[
 ![Batch Image Convert Using Shell Script](http://www.tecmint.com/wp-content/uploads/2016/11/Batch-Image-Convert-Using-Shell-Script.png) 
][4]

*使用 Shell 脚本来批量图像转换*

总之，我们介绍了一些重要的将 .png 图像批量转换为 .jpg 格式的方法，以及再转回来。如果还想对图像进行一些优化的话, 您可以移步到 [ Linux 系统中如何压缩 png 和 jpg 图像][3]这篇指导文章。

您可以给我们分享一些包括 Linux 命令行工具在内的把图像从一种格式转成另一种格式的方式方法，或者在下面的评论部分畅所欲言。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-image-conversion-tools/

作者：[Aaron Kili][a]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/echo-command-in-linux/
[2]:http://www.tecmint.com/tag/linux-tricks/
[3]:http://www.tecmint.com/optimize-and-compress-jpeg-or-png-batch-images-linux-commandline/
[4]:http://www.tecmint.com/wp-content/uploads/2016/11/Batch-Image-Convert-Using-Shell-Script.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-Using-for-loop-Command.png
[6]:http://www.tecmint.com/tag/linux-ls-command/
[7]:http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-Using-Parallel-Command.png
[8]:http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time/
[9]:http://www.tecmint.com/wp-content/uploads/2016/11/Convert-PNG-to-JPG-in-Linux.png
[10]:http://www.tecmint.com/tag/linux-ls-command/
[11]:http://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/
