使用 parallel 利用起你的所有 CPU 资源
======

bash 命令通常单线程运行。这意味着所有的处理工作只在单个 CPU 上执行。随着 CPU 规模的扩大以及核心数目的增加，这意味着只有一小部分的 CPU 资源用于处理你的工作。

当我们的工作受制于 CPU 处理数据的速度时，这些未使用的 CPU 资源能产生很大的效用。这种情况在进行多媒体转换（比如图片和视频转换）以及数据压缩中经常遇到。

本文中，我们将会使用 [parallel][1] 程序。parallel 会接受一个列表作为输入，然后在所有 CPU 核上并行地执行命令来处理该列表。Parallel 甚至会按顺序将结果输出到标准输出中，因此它可以用在管道中作为其他命令的标准输入。

### 如何使用 parallel

parallel 在标准输入中读取一个列表作为输入，然后创建多个指定命令的进程来处理这个列表，其格式为：

```
list | parallel command
```

这里的 list 可以由任何常见的 bash 命令创建，例如：`cat`、`grep`、`find`。这些命令的结果通过管道从它们的标准输出传递到 parallel 的标准输入，像这样：

```
find . -type f -name "*.log" | parallel
```

跟 `find` 中使用 `-exec` 类似，`parallel` 使用 `{}` 来表示输入列表中的每个元素。下面这个例子中，`parallel` 会使用 `gzip` 压缩所有 `find` 命令输出的文件：

```
find . -type f -name "*.log" | parallel gzip {}
```

下面这些实际的使用 `parallel` 的例子可能会更容易理解一些。

### 使用 parallel 来进行 JPEG 压缩

在这个例子中，我收集了一些比较大的 `.jpg` 文件（大约 10MB 大小），要用 [Mozilla][3] 出品的 JPEG 图像压缩工具 [MozJPEG][2] 来进行处理。该工具会在尝试保持图像质量的同时减少 JPEG 图像文件的大小。这对降低网页加载时间很重要。

下面是一个普通的 `find` 命令，用来找出当前目录中的所有 `.jpg` 文件，然后通过 MozJPEG 包中提供的图像压缩工具 （`cjpeg`） 对其进行处理：

```
find . -type f -name "*.jpg" -exec cjpeg -outfile LoRes/{} {} ';'
```

总共耗时 `0m44.114s`。该命令运行时的 `top` 看起来是这样的：

![][4]

你可以看到，虽然有 8 个核可用，但实际只有单个线程在用单个核。

下面用 `parallel` 来运行相同的命令：

```
find . -type f -name "*.jpg" | parallel cjpeg -outfile LoRes/{} {}
```

这次压缩所有图像的时间缩减到了 `0m10.814s`。从 `top` 显示中可以很清楚地看出不同：

![][5]

所有 CPU 核都满负荷运行，有 8 个线程对应使用 8 个 CPU 核。

### parallel 与 gzip 连用

如果你需要压缩多个文件而不是一个大文件，那么 `parallel` 就能用来提高处理速度。如果你需要压缩单个文件而同时又想要利用所有的 CPU 核的话，那么你应该 `gzip` 的多线程替代品 [pigz][6]。

首先，我用随机数据创建了 100 个大约 1GB 的文件：

```
for i in {1..100}; do dd if=/dev/urandom of=file-$i bs=1MB count=10; done
```

然而我用 `find -exec` 命令来进行压缩：

```
find . -type f -name "file*" -exec gzip {} ';'
```

总共耗时 `0m28.028s`，而且也是只利用了单核。

换成 `parallel` 版本：

```
find . -type f -name "file*" | parallel gzip {}
```

耗时减少到了 `0m5.774s`。

parallel 是一款非常好用的工具，应该加入到你的系统管理工具包中，在合适的场合它能帮你节省大量的时间。

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/parallell-bash/

作者：[Elliot Cooper][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net/about
[1]:https://www.gnu.org/software/parallel/
[2]:https://github.com/mozilla/mozjpeg
[3]:https://www.mozilla.org/
[4]:https://bash-prompt.net/images/guides/parallell-bash/top-single-core-100.png
[5]:https://bash-prompt.net/images/guides/parallell-bash/top-all-cores-100.png
[6]:https://zlib.net/pigz/
