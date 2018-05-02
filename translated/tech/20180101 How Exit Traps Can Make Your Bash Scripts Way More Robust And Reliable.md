"Exit Traps" 让你的 Bash 脚本更稳固可靠
============================================================

有个简单实用的方针可以让你的 bash 脚本更稳健 -- 确保总是执行必要的收尾工作，哪怕是在发生异常的时候。要做到这一点，秘诀就是 bash 提供的一个叫做 EXIT 的伪信号，你可以 trap 它，当脚本因为任何原因退出时，相应的命令或函数就会执行。我们来看看它是如何工作的。

基本的代码结构看起来像这样：

```
#!/bin/bash
function finish {
  # 你的收尾代码
}
trap finish EXIT
```

你可以把任何你觉得务必要运行的代码放在这个 "finish" 函数里。一个很好的例子是：创建一个临时目录，事后再删除它。

```
#!/bin/bash
scratch=$(mktemp -d -t tmp.XXXXXXXXXX)
function finish {
  rm -rf "$scratch"
}
trap finish EXIT
```

这样，在你的核心代码中，你就可以在这个 `$scratch` 目录里下载、生成、操作中间或临时数据了。[[1]][2]

```
# 下载所有版本的 linux 内核…… 为了科学！
for major in {1..4}; do
  for minor in {0..99}; do
    for patchlevel in {0..99}; do
      tarball="linux-${major}-${minor}-${patchlevel}.tar.bz2"
      curl -q "http://kernel.org/path/to/$tarball" -o "$scratch/$tarball" || true
      if [ -f "$scratch/$tarball" ]; then
        tar jxf "$scratch/$tarball"
      fi
    done
  done
done
# 整合成单个文件
# 复制到目标位置
cp "$scratch/frankenstein-linux.tar.bz2" "$1"
# 脚本结束， scratch 目录自动被删除
```

比较一下如果不用 trap ，你是怎么删除 scratch 目录的：

```
#!/bin/bash
# 别这样做！

scratch=$(mktemp -d -t tmp.XXXXXXXXXX)

# 在这里插入你的几十上百行代码

# 都搞定了，退出之前把目录删除
rm -rf "$scratch"
```

这有什么问题么？很多：

*   如果运行出错导致脚本提前退出， scratch 目录及里面的内容不会被删除。这会导致资料泄漏，可能引发安全问题。

*   如果这个脚本的设计初衷就是在末尾以前退出，那么你必须手动复制粘贴 rm 命令到每一个出口。

*   这也给维护带来了麻烦。如果今后在脚本某处添加了一个 exit ，你很可能就忘了加上删除操作 -- 从而制造潜在的安全漏洞。

### 无论如何，服务要在线

另外一个场景： 想象一下你正在运行一些自动化系统运维任务，要临时关闭一项服务，最后这项服务需要重启，而且要万无一失，即使脚本运行出错。那么你可以这样做：

```
function finish {
    # 重启服务
    sudo /etc/init.d/something start
}
trap finish EXIT
sudo /etc/init.d/something stop
# 主要任务代码

# 脚本结束，执行 finish 函数重启服务
```

一个具体的实例：比如 Ubuntu 服务器上运行着 MongoDB ，你要为 crond 写一个脚本来临时关闭服务并做一些日常维护工作。你应该这样写：

```
function finish {
    # 重启服务
    sudo service mongdb start
}
trap finish EXIT
# 关闭 mongod 服务
sudo service mongdb stop
# (如果 mongod 配置了 fork ，比如 replica set ，你可能需要执行 "sudo killall --wait /usr/bin/mongod")
```

### 控制开销

有一种情况特别能体现 EXIT trap 的价值：你要在脚本运行过程中创建一些临时的付费资源，结束时要确保把它们释放掉。比如你在 AWS (Amazon Web Services) 上工作，要在脚本中创建一个镜像。

(名词解释: 在亚马逊云上的运行的服务器叫实例。实例从镜像创建而来，镜像通常被称为 "AMIs" 或 "images" 。AMI 相当于某个特殊时间点的服务器快照。)

我们可以这样创建一个自定义的 AMI ：

1.  基于一个基准 AMI 运行(创建)一个实例。

2.  在实例中手动或运行脚本来做一些修改。

3.  用修改后的实例创建一个镜像。

4.  如果不再需要这个实例，可以将其删除。

最后一步**相当重要**。如果你的脚本没有把实例删除掉，它会一直运行并计费。（到月底你的账单让你大跌眼镜时，恐怕哭都来不及了！）

如果把 AMI 的创建封装在脚本里，我们就可以利用 trap EXIT 来删除实例了。我们还可以用上 EC2 的命令行工具：

```
#!/bin/bash
# 定义基准 AMI 的 ID
ami=$1
# 保存临时实例的 ID
instance=''
# 作为 IT 人，让我们看看 scratch 目录的另类用法
scratch=$(mktemp -d -t tmp.XXXXXXXXXX)
function finish {
    if [ -n "$instance" ]; then
        ec2-terminate-instances "$instance"
    fi
    rm -rf "$scratch"
}
trap finish EXIT
# 创建实例，将输出(包含实例 ID )保存到 scratch 目录下的文件里
ec2-run-instances "$ami" > "$scratch/run-instance"
# 提取实例 ID
instance=$(grep '^INSTANCE' "$scratch/run-instance" | cut -f 2)
```

脚本执行到这里，实例（EC2 服务器）已经开始运行 [[2]][4]。接下来你可以做任何事情：在实例中安装软件，修改配置文件等，然后为最终版本创建一个镜像。实例会在脚本结束时被删除 -- 即使脚本因错误而提前退出。（请确保实例创建成功后再运行业务代码。）

### 更多应用

这篇文章只讲了些皮毛。我已经使用这个 bash 技巧很多年了，现在还能不时发现一些有趣的用法。你也可以把这个方法应用到你自己的场景中，从而提升你的 bash 脚本的可靠性。

### 尾注

1.  mktemp 的选项 "-t" 在 Linux 上可选，在 OS X 上必需。带上此选项可以让你的脚本有更好的可移植性。

2.  如果只是为了获取实例 ID ，我们不用创建文件，直接写成 `instance=$(ec2-run-instances "$ami" | grep '^INSTANCE' | cut -f 2)` 就可以。但把输出写入文件可以记录更多有用信息，便于 debug ，代码可读性也更强。

--------------------------------------------------------------------------------

作者简介：

美国加利福尼亚旧金山的作家，软件工程师，企业家

Author of [Powerful Python][5] and its [blog][6].
via: http://redsymbol.net/articles/bash-exit-traps/

作者：[aaron maxwell ][a]
译者：[Dotcra](https://github.com/Dotcra)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://redsymbol.net/
[1]:http://www.gnu.org/software/bash/manual/bashref.html#index-trap
[2]:http://redsymbol.net/articles/bash-exit-traps/#footnote-1
[3]:http://aws.amazon.com/ec2/
[4]:http://redsymbol.net/articles/bash-exit-traps/#footnote-2
[5]:https://www.amazon.com/d/0692878971
[6]:https://powerfulpython.com/blog/
