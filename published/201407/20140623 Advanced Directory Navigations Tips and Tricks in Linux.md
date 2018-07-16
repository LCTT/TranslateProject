Linux 目录导航技巧
================================================================================

目录当行是命令行系统的基础概念.虽然不是什么难以理解的东西，但是知道一些技巧能够丰富你的经验并且提高工作效率.在这篇文章中,我们会讨论这些小技巧。

### 我们已经知道的东西 ###

在开始高级技巧之前，有一些必须知道的基本命令：

- ‘pwd’显示当前目录
- ‘cd’ 改变当前目录
- ‘cd’ 跟两个点(cd ..)能返回父目录
- ‘cd’ 跟着相对目录就能直接切换当相对目录下
- ‘cd’ 跟着绝对目录就能切换到绝对目录下

### 高阶技巧 ###

这节将介绍几个技巧方便你进行目录的切换

### 从任何地方回到home目录 ###

虽然使用‘cd /home/<你的主目录>’, 不是什么大麻烦, 但是有一种方法直接打‘cd’ 就能回到你的主目录.

例子：

    $ pwd
    /usr/include/netipx
    $ cd
    $ pwd
    /home/himanshu

所以无论你在哪个目录下，都能这么干，然后回到home目录。

**注意**- 如果要切换到某个其它的指定用户的目录下, 就使用 ‘cd ~user_name'

### 用cd - 在目录间切换 ###

假设你的当前工作目录是这样的：

    $ pwd
    /home/himanshu/practice

如果你想切换到 **/usr/bin/X11**， 然后又想回到之前的目录。 你会怎么做? 最直接的 :

    $ cd /usr/bin/X11
    $ cd /home/himanshu/practice/

虽然这样行得通，但是要记住这些复杂的目录就太笨了。这种情况下使用 ‘cd -’ 命令就行.

使用 ‘cd -’的第一步和上面的例子是一样的, 你可以 cd 到你想要切换到的<路径>下，但是回到之前的目录用 ‘cd -’就可以。

    $ cd /usr/bin/X11
    $ cd -
    /home/himanshu/practice
    $ pwd
    /home/himanshu/practice

如果你想再次回到刚刚访问的目录(在这个例子中是/usr/bin/X11)，再使用'cd -'就可以。但是这个命令只会记住上一次访问的目录，这是一个缺点。

### 用 pushd 和 popd 来切换目录 ###

![directory navigation](http://linoxide.com/wp-content/uploads/2014/06/pushd-popd.jpg)

如果你对'cd -'非常了解了的话，你会发现这个命令只能帮助你在两个目录之间移动，但是很多场景下需要在很多目录之间切换。比如你要从A切换到B再到C然后又想回到A。

一般来说，你需要打出A的完整路径，但是如果这个路径非常复杂，将是非常烦人的一件事，特别是在你的切换非常频繁的话。

一些场景下可以使用 ‘pushd’ 还有 ‘popd’ 命令。 ‘pushd’ 将一个目录存到内存中,‘popd’ 将目录从内存中去除，并且转换到那个目录下。

例如：

    $ pushd .
    /usr/include/netipx /usr/include/netipx
    $ cd /etc/hp/
    $ cd /home/himanshu/practice/
    $ cd /media/
    $ popd
    /usr/include/netipx
    $ pwd
    /usr/include/netipx

使用‘pushd’ 命令存储当前的工作目录 (用 .表示)， 然后切换到各种各样的目录去。为了返回之前的目录，只要使用 ‘popd’命令就行了。

（LCTT译注：显然，pushd和popd 是堆栈式操作，你可以push多个目录，然后逐一pop出来，自己试试吧。）
（LCTT译注：我们之前介绍的[autojump][1]，更加智能，不过需要安装一下。）

**注意**- 你也可以使用不带参数的 ‘pushd’ 来切换到之前存储的目录, 但是不会像 ‘popd’ 一样去除这个目录。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/directory-navigations-tips-tricks/

译者：[ggaaooppeenngg](https://github.com/ggaaooppeenngg) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-3401-1.html
