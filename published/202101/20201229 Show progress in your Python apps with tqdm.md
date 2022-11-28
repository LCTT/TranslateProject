[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12990-1.html)
[#]: subject: (Show progress in your Python apps with tqdm)
[#]: via: (https://opensource.com/article/20/12/tqdm-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

使用 tqdm 在 Python 应用中显示进度
======

> 如果你的程序需要一段时间才能显示结果，可通过显示它的进度来避免让用户感到沮丧。

![](https://img.linux.net.cn/data/attachment/album/202101/06/230842thi8skahe68dqa3m.jpg)

阿拉米语，希伯来语和阿拉伯语中的闪米特语根 _q-d-m_ 通常与前进或进度有关。阿拉伯语 _taqaddum_ （تقدّم）的意思是“进度”。进度是很重要的。正如每部感觉良好的电影都会告诉你，旅程和目的地同样重要。

大多数程序都有一个明确的目标，一个期望的最终状态。有时，计算这个最终状态可能需要很长的时间。虽然计算机没有感情不在乎，但人却在乎。人类并不乐意坐在原地等待，而看不到任何明显的进展迹象。疑问不断蔓延。程序崩溃了吗？磁盘性能是否抖动？操作系统是否把所有的计算资源都分配给了其他任务？

就像正义一样，进度必须被看到，而不仅仅是完成。Python 库 [tqdm][2] 有助于使进度变得明确。

`tqdm` 模块可在控制台下工作，但它也专门支持了我最喜欢的环境之一 Jupyter。要在 Jupyter 中使用 `tqdm`，你需要导入 `notebook` 子模块并安装 [ipywidgets][3]。`notebook` 子模块与 `tqdm` 接口兼容。

这意味着你可以做一些导入时操作来导入正确的模块，同时保持 `tqdm` 的用法不变。诀窍是检查 `__main__` 模块是否具有全局变量 `get_ipython`。虽然这只是一个启发式的方法，但却是一个相当准确的方法：

```
import sys
if hasattr(sys.modules["__main__"], "get_ipython"):
    from tqdm import notebook as tqdm
else:
    import tqdm
```

最简单的情况是，某件事情需要运行一定的迭代次数（事先已知），而每一次迭代的时间都差不多。例如，有一个计算任何数字的平方根的算法，通过从 1 作为猜测值开始，然后计算出一个改进后的猜测值：

```
def improve_guess(rt, n):
    return (rt + n/rt) / 2
```

一点点的改进可以让你更加接近该平方根。例如，你可以计算 2 的平方根：

```
guess = 1
target = 2
for i in tqdm.trange(10):
    guess = improve_guess(guess, target)
```

![tqdm output][4]

精确了到小数点后 10 位！

```
round(2 - guess*guess, 10)
```

```
0.0
```

一个稍微复杂一点的例子是，当元素的数量是已知的，而处理每个元素需要类似的时间。例如，你可以计算一些数字的乘积。为此，你需要一些随机数：

```
import random
numbers = [random.uniform(0, 2.8) for i in range(100)]
numbers[:5]
```

```
[2.6575636572230916,
0.1286674965830302,
1.0634250104041332,
1.1760969844376505,
0.45192978568125486]
```

现在有了这些数字，可以将它们相乘了。使用 `tqdm` 最简单的方法是包装一个 Python 迭代函数。数值是一样的，但是 `tqdm` 会显示一个进度条：

```
result = 1
for num in tqdm.tqdm(numbers):
    result *= num
result
```

```
2.4081854901728303
```

![tqdm output][6]

然而，并不是所有的事情都可以预测。最不容易预测的事情之一就是网络速度。当你下载一个大文件时，衡量进度的唯一方法就是检查已经下载了多少：

```
url = "https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz"
import httpx
with httpx.stream("GET", url) as response:
    total = int(response.headers["Content-Length"])
    with tqdm.tqdm(total=total) as progress:
        for chunk in response.iter_bytes():
            progress.update(len(chunk))
```

![tqdm output][7]

有时，“嵌套”进度条是有意义的。例如，如果你要下载一个目录，你就需要一个进度条来跟踪文件，并为每个文件设置一个进度条。

下面是一个例子（但没有实际下载一个目录）：

```
files = [f"vid-{i}.mp4" for i in range(4)]
for fname in tqdm.tqdm(files, desc="files"):
    total = random.randrange(10**9, 2 * 10**9)
    with tqdm.tqdm(total=total, desc=fname) as progress:
        current = 0
        while current &lt; total:
            chunk_size = min(random.randrange(10**3, 10**5), total - current)
            current += chunk_size
            if random.uniform(0, 1) &lt; 0.01:
                time.sleep(0.1)
            progress.update(chunk_size)
```

![tqdm output][8]

所以，如果你的程序需要一段时间才能显示最终结果，为避免让你的用户感到沮丧。请显示它的进度！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/tqdm-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: https://pypi.org/project/tqdm/
[3]: https://opensource.com/article/20/11/daily-journal-jupyter
[4]: https://opensource.com/sites/default/files/uploads/output_8_0.png (tqdm output)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/output_15_0.png (tqdm output)
[7]: https://opensource.com/sites/default/files/uploads/output_18_0.png (tqdm output)
[8]: https://opensource.com/sites/default/files/uploads/output_21_0.png (tqdm output)
