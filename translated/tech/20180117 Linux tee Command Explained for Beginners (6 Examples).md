为初学者介绍的 Linux tee 命令（6 个例子）
======

有时候，你会想手动跟踪命令的输出内容，同时又想将输出的内容写入文件，确保之后可以用来参考。如果你想寻找这相关的工具，那么恭喜你，Linux 已经有了一个叫做 **tee** 的命令可以帮助你。

本教程中，我们将基于 tee 命令，用一些简单的例子开始讨论。但是在此之前，值得一提的是，本文我们所有的测试实例都基于 Ubuntu 16.04 LTS。  

### Linux tee 命令

tee 命令基于标准输入读取数据，标准输出或文件写入数据。感受下这个命令的语法：

```
tee [OPTION]... [FILE]...
```

这里是帮助文档的说明：
```
从标准输入中复制到每一个文件，并输出到标准输出。
```

让 Q&A（问&答）风格的实例给我们带来更多灵感，深入了解这个命令。

### Q1. 如何在 Linux 上使用这个命令？

假设因为某些原因，你正在使用 ping 命令。

```
ping google.com
```

[![如何在 Linux 上使用 tee 命令][1]][2]

然后同时，你想要输出的信息也同时能写入文件。这个时候，tee 命令就有其用武之地了。

```
ping google.com | tee output.txt
```

下面的截图展示了这个输出内容不仅被写入 ‘output.txt’ 文件，也被显示在标准输出中。

[![tee command 输出][3]][4]

如此应当明确了 tee 的基础用法。

### Q2. 如何确保 tee 命令追加信息到文件中？

默认情况下，在同一个文件下再次使用 tee 命令会覆盖之前的信息。如果你想的话，可以通过 -a 命令选项改变默认设置。

```
[command] | tee -a [file]
```

基本上，-a 选项强制 tee 命令追加信息到文件。

### Q3. 如何让 tee 写入多个文件？

这非常之简单。你仅仅只需要写明文件名即可。

```
[command] | tee [file1] [file2] [file3]
```

比如：

```
ping google.com | tee output1.txt output2.txt output3.txt
```

[![如何让 tee 写入多个文件][5]][6]

### Q4. 如何让 tee 命令的输出内容直接作为另一个命令的输入内容？

使用 tee 命令，你不仅可以将输出内容写入文件，还可以把输出内容作为另一个命令的输入内容。比如说，下面的命令不仅会将文件名存入‘output.txt’文件中，还会通过 wc 命令让你知道输入到 output.txt 中的文件数目。

```
ls file* | tee output.txt | wc -l
```

[![如何让 tee 命令的输出内容直接作为另一个命令的输入内容][7]][8]

### Q5. 如何使用 tee 命令提升文件写入权限？

假如你使用 [Vim editor][9] 打开文件，并且做了很多更改，然后当你尝试保存修改时，你得到一个报错，让你意识到那是一个 root 所拥有的文件，这意味着你需要使用 sudo 权限保存修改。

[![如何使用 tee 命令提升文件写入权限][10]][11]

如此情况下，你可以使用 tee 命令来提高权限。

```
:w !sudo tee %
```

上述命令会向你索要 root 密码，然后就能让你保存修改了。

### Q6. 如何让 tee 命令忽视中断？

-i 命令行选项使 tee 命令忽视通常由 crl+c 组合键发起的中断信号（`SIGINT`）。

```
[command] | tee -i [file]
```

当你想要使用 crl+c 中断命令的同时，让 tee 命令优雅的退出，这个选项尤为实用。

### 总结

现在你可能已经认同 tee 是一个非常实用的命令。基于 tee 命令的用法，我们已经介绍了其绝大多数的命令行选项。这个工具并没有什么陡峭的学习曲线，所以，只需跟随这几个例子练习，你就可以运用自如了。更多信息，请查看 [帮助文档][12].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-tee-command/

作者：[Himanshu Arora][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/ping-example.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/ping-example.png
[3]:https://www.howtoforge.com/images/command-tutorial/ping-with-tee.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/ping-with-tee.png
[5]:https://www.howtoforge.com/images/command-tutorial/tee-mult-files1.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/tee-mult-files1.png
[7]:https://www.howtoforge.com/images/command-tutorial/tee-redirect-output.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/tee-redirect-output.png
[9]:https://www.howtoforge.com/vim-basics
[10]:https://www.howtoforge.com/images/command-tutorial/vim-write-error.png
[11]:https://www.howtoforge.com/images/command-tutorial/big/vim-write-error.png
[12]:https://linux.die.net/man/1/tee
