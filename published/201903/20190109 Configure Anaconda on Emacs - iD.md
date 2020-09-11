[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10604-1.html)
[#]: subject: (Configure Anaconda on Emacs – iD)
[#]: via: (https://idevji.com/configure-anaconda-on-emacs/)
[#]: author: (Devji Chhanga https://idevji.com/author/admin/)

在 Emacs 上配置 Anaconda
======

也许我所追求的究极 IDE 就是 [Emacs][1] 了。我的目标是使 Emacs 成为一款全能的 Python IDE。本文描述了如何在 Emacs 上配置 Anaconda。（LCTT 译注：Anaconda 自称“世界上最流行的 Python/R 的数据分析平台”）

我的配置信息：

- OS：Trisquel 8.0
- Emacs：GNU Emacs 25.3.2

快捷键说明（[参见完全指南][2]）：

```
C-x = Ctrl + x
M-x = Alt + x
RET = ENTER
```

### 1、下载并安装 Anaconda

#### 1.1 下载

[从这儿][3] 下载 Anaconda。你应该下载 Python 3.x 的版本，因为 Python 2 在 2020 年就不再支持了。你无需预先安装 Python 3.x。这个安装脚本会自动安装它。

#### 1.2 安装

```
cd ~/Downloads
bash Anaconda3-2018.12-Linux-x86.sh
```

### 2、将 Anaconda 添加到 Emacs

#### 2.1 将 MELPA 添加到 Emacs

我们需要用到 `anaconda-mode` 这个 Emacs 包。该包位于 MELPA 仓库中。Emacs25 需要手工添加该仓库。

- [注意：点击本文查看如何将 MELPA 添加到 Emacs][4]

#### 2.2 为 Emacs 安装 anaconda-mode 包

```
M-x package-install RET
anaconda-mode RET
```

#### 2.3 为 Emacs 配置 anaconda-mode

```
echo "(add-hook 'python-mode-hook 'anaconda-mode)" > ~/.emacs.d/init.el
```

### 3、在 Emacs 上通过 Anaconda 运行你第一个脚本

#### 3.1 创建新 .py 文件

```
C-x C-f
HelloWorld.py RET
```

#### 3.2 输入下面代码

```
print ("Hello World from Emacs")
```

#### 3.3 运行之

```
C-c C-p
C-c C-c
```

输出为：

```
Python 3.7.1 (default, Dec 14 2018, 19:46:24)
[GCC 7.3.0] :: Anaconda, Inc. on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> python.el: native completion setup loaded
>>> Hello World from Emacs
>>>
```

我是受到 [Codingquark][5] 的影响才开始使用 Emacs 的。

有任何错误和遗漏请在评论中写下。干杯！

--------------------------------------------------------------------------------

via: https://idevji.com/configure-anaconda-on-emacs/

作者：[Devji Chhanga][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://idevji.com/author/admin/
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/emacs/
[2]: https://www.math.uh.edu/~bgb/emacs_keys.html
[3]: https://www.anaconda.com/download/#linux
[4]: https://melpa.org/#/getting-started
[5]: https://codingquark.com
