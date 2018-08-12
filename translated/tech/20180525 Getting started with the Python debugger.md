开始使用Python调试器
======

![](https://fedoramagazine.org/wp-content/uploads/2018/05/pdb-816x345.jpg)

Python生态系统包含丰富的工具和库，可以改善开发人员的生活。 例如，杂志之前已经介绍了如何[使用交互式shell增强Python][1]。 本文重点介绍另一种可以节省时间并提高Python技能的工具：Python调试器。

### Python调试器

Python标准库提供了一个名为pdb的调试器。 此调试器提供了调试所需的大多数功能，如断点，单行步进，堆栈帧的检查等等。

pdb的基本知识很有用，因为它是标准库的一部分。 你可以在无法安装其他增强的调试器的环境中使用它。

#### 运行pdb

运行pdb的最简单方法是从命令行，将程序作为参数传递给debug。 考虑以下脚本：

```
# pdb_test.py
#!/usr/bin/python3

from time import sleep

def countdown(number):
    for i in range(number, 0, -1):
        print(i)
        sleep(1)


if __name__ == "__main__":
    seconds = 10
    countdown(seconds)
```

你可以从命令行运行pdb，如下所示：

```
$ python3 -m pdb pdb_test.py
> /tmp/pdb_test.py(1)<module>()
-> from time import sleep
(Pdb)
```

使用pdb的另一种方法是在程序中设置断点。 为此，请导入pdb模块并使用set_trace函数：

```
# pdb_test.py
#!/usr/bin/python3

from time import sleep


def countdown(number):
    for i in range(number, 0, -1):
        import pdb; pdb.set_trace()
        print(i)
        sleep(1)


if __name__ == "__main__":
    seconds = 10
    countdown(seconds)

$ python3 pdb_test.py
> /tmp/pdb_test.py(6)countdown()
-> print(i)
(Pdb)
```

脚本在断点处停止，pdb显示脚本中的下一行。 你也可以在失败后执行调试器。 这称为*事后调试（postmortem debugging）*。

#### 导航执行堆栈

调试中的一个常见用例是导航执行堆栈。 Python调试器运行后，以下命令很有用：

+ w(here) : 显示当前执行的行以及执行堆栈的位置。


```
$ python3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) w
/tmp/test_pdb.py(16)<module>()
-> countdown(seconds)
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb)
```

+ l(ist) : 显示当前位置周围更多的上下文（代码）。


```
$ python3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) l
  5
  6
  7  	def countdown(number):
  8  	    for i in range(number, 0, -1):
  9  	        import pdb; pdb.set_trace()
 10  ->	        print(i)
 11  	        sleep(1)
 12
 13
 14  	if __name__ == "__main__":
 15  	    seconds = 10
```

+ u(p)/d(own) : 向上或向下导航调用堆栈。


```
$ py3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) up
> /tmp/test_pdb.py(16)<module>()
-> countdown(seconds)
(Pdb) down
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb)
```

#### 单步执行程序

pdb提供以下命令来执行和单步执行代码：

+ n(ext): 继续执行，直到达到当前函数中的下一行，否则返回
+ s(tep): 执行当前行并在第一个可能的场合停止（在被调用的函数或当前函数中）
+ c(ontinue): 继续执行，仅在断点处停止。


```
$ py3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) n
10
> /tmp/test_pdb.py(11)countdown()
-> sleep(1)
(Pdb) n
> /tmp/test_pdb.py(8)countdown()
-> for i in range(number, 0, -1):
(Pdb) n
> /tmp/test_pdb.py(9)countdown()
-> import pdb; pdb.set_trace()
(Pdb) s
--Call--
> /usr/lib64/python3.6/pdb.py(1584)set_trace()
-> def set_trace():
(Pdb) c
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) c
9
> /tmp/test_pdb.py(9)countdown()
-> import pdb; pdb.set_trace()
(Pdb)
```

该示例显示了next和step之间的区别。 实际上，当使用step时，调试器会进入pdb模块源代码，而接下来就会执行set_trace函数。

#### 检查变量内容

pdb非常有用的地方是检查执行堆栈中存储的变量的内容。 例如，a(rgs)命令打印当前函数的变量，如下所示：

```
py3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) where
/tmp/test_pdb.py(16)<module>()
-> countdown(seconds)
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) args
number = 10
(Pdb)
```

pdb打印变量的值，在本例中是10。

可用于打印变量值的另一个命令是p(rint)。

```
$ py3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) list
  5
  6
  7  	def countdown(number):
  8  	    for i in range(number, 0, -1):
  9  	        import pdb; pdb.set_trace()
 10  ->	        print(i)
 11  	        sleep(1)
 12
 13
 14  	if __name__ == "__main__":
 15  	    seconds = 10
(Pdb) print(seconds)
10
(Pdb) p i
10
(Pdb) p number - i
0
(Pdb)
```

如示例中最后的命令所示，print可以在显示结果之前计算表达式。

[Python文档][2]包含每个pdb命令的参考和示例。 对于开始使用Python调试器人来说，这是一个有用的读物。

### 增强的调试器

一些增强的调试器提供了更好的用户体验。 大多数为pdb添加了有用的额外功能，例如语法突出高亮，更好的回溯和自我检查。 流行的增强调试器包括[IPython的ipdb][3]和[pdb ++][4]。

这些示例显示如何在虚拟环境中安装这两个调试器。 这些示例使用新的虚拟环境，但在调试应用程序的情况下，应使用应用程序的虚拟环境。

#### 安装IPython的ipdb

要安装IPython ipdb，请在虚拟环境中使用pip：

```
$ python3 -m venv .test_pdb
$ source .test_pdb/bin/activate
(test_pdb)$ pip install ipdb
```

要在脚本中调用ipdb，必须使用以下命令。 请注意，该模块称为ipdb而不是pdb：

```
import ipdb; ipdb.set_trace()
```

IPython的ipdb也可以在Fedora包中使用，所以你可以使用Fedora的包管理器dnf来安装它：

```
$ sudo dnf install python3-ipdb
```

#### 安装pdb++

你可以类似地安装pdb++：

```
$ python3 -m venv .test_pdb
$ source .test_pdb/bin/activate
(test_pdb)$ pip install pdbp
```

pdb++重写了pdb模块，因此你可以使用相同的语法在程序中添加断点：

```
import pdb; pdb.set_trace()
```

### Conclusion

学习如何使用Python调试器可以节省你在排查应用程序问题时的时间。 对于了解应用程序或某些库的复杂部分如何工作也是有用的，从而提高Python开发人员的技能。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-python-debugger/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://fedoramagazine.org/enhance-python-interactive-shell
[2]:https://docs.python.org/3/library/pdb.html
[3]:https://github.com/gotcha/ipdb
[4]:https://github.com/antocuni/pdb
