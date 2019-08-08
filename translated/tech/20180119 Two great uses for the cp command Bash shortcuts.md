两种cp 命令的绝佳用法：Bash 捷径
============================================================

### 这篇文章是关于如何在使用cp 命令进行备份以及同步时提高效率

![Two great uses for the cp command: Bash shortcuts ](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC)

>图片来自： [Internet Archive Book Images][6]. 由Opensource.com 修改. CC BY-SA 4.0

去年七月，我写了一篇[关于cp 命令的两种绝佳用法][7]的文章：备份一个文件，同步一个文件夹的备份

虽然这些工具确实很好用，但同时，输入这些命令太过于累赘了。为了解决这个问题，我创建了一些Bash 的捷径在我的Bash 启动文件里。现在，我想把这些捷径分享给你们，以便于你们需要的时候可以拿来用，或者是给那些还不知道怎么使用Bash 的别名以及函数功能的用户提供一些思路。

### 使用Bash 别名来更新一个文件夹的副本

如果要使用cp 来更新一个文件夹的副本，通常会使用到的命令是：

```
cp -r -u -v SOURCE-FOLDER DESTINATION-DIRECTORY
```

因为我经常使用cp 命令来复制文件夹，我会很自然地想起使用-r 选项。也许再想地更深入一些，我还可以想起用-v 选项，如果再想得再深一层，我会想起用选项-u （不知道这个选项是代表“更新”还是“同步”还是一些什么其它的）。

或者，还可以使用[Bash 的别名功能][8]来将cp 命令以及其后的选项转换成一个更容易记忆的单词，就像这样：

```
alias sync='cp -r -u -v'
```

```
sync Pictures /media/me/4388-E5FE
```

不清楚sync 是否已经被使用了？你可以在终端里输入alias 这个单词来列出所有正在使用的命令别名。

喜欢吗？想要现在就立即使用吗？那就现在打开终端，输入：

```
echo "alias sync='cp -r -u -v'" >> ~/.bash_aliases
```

```
me@mymachine~$ alias

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias egrep='egrep --color=auto'

alias fgrep='fgrep --color=auto'

alias grep='grep --color=auto'

alias gvm='sdk'

alias l='ls -CF'

alias la='ls -A'

alias ll='ls -alF'

alias ls='ls --color=auto'

alias sync='cp -r -u -v'

me@mymachine:~$
```

### 使用Bash 的函数功能来为备份编号

若要使用cp 来备份一个文件，通常使用的命令是：

```
cp --force --backup=numbered WORKING-FILE BACKED-UP-FILE
```

我们不仅需要记得所有cp 的选项，我们还需要记得去重复输入 WORKING-FILE 的名字。但为什么我们还要不断地重复这个过程当[Bash 的函数功能][9]已经可以帮我们做这一切了呢？就像这样：

再一次提醒，你可将下列内容保存入你在家目录下的.bash_aliases 文件里

```
function backup {

    if [ $# -ne 1 ]; then

        echo "Usage: $0 filename"

    elif [ -f $1 ] ; then

        echo "cp --force --backup=numbered $1 $1"

        cp --force --backup=numbered $1 $1

    else

        echo "$0: $1 is not a file"

    fi

}
```

第一个if 语句是用于检查是否提供有且只有一个参数，否则，它会用echo 命令来打印出正确的用法。

elif 语句是用于检查提供的参数所指向的是一个文件，如果是的话，它会用第二个echo 命令来打印所需的cp 的命令（所有的选项都是用全称来表示）并且执行它。

如果所提供的参数不是一个文件，文件中的第三个echo 用于打印错误信息。

在我的家目录下，如果我执行backup 这个命令，我可以发现目录下多了一个文件名为checkCounts.sql.~1~ 的文件，如果我再执行一次，便又多了另一个名为checkCounts.sql.~2~ 的文件。

成功了！就像所想的一样，我可以继续编辑checkCounts.sql ，但如果我可以经常地用这个命令来为文件制作快照的话，我可以在我遇到问题的时候回退到最近的版本。

也许在未来的某个时间，使用git 作为版本控制系统会是一个好主意。但像上文所介绍的backup 这个简单而又好用的工具，是你在需要使用快照的功能时却还未准备好使用git 的最好工具。

### 结论

在我未来的文章里，我保证我会通过使用脚本，shell 里的函数功能以及别名功能来简化一些机械性的动作来提高生产效率。

在这篇文章里，我已经展示了如何在使用cp 命令同步或者备份文件时运用shell 的函数以及别名功能来简化操作。如果你想要了解更多，可以读一下这两篇文章：[怎样通过使用命令别名功能来减少敲击键盘的次数][10] 以及由我的同事Greg 和Seth 写的[Shell 编程：shift 方法和自定义函数介绍][11]

### 关于作者

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/clh_portrait2.jpg?itok=V1V-YAtY)][13] Chris Hermansen 

从1978年于不列颠哥伦比亚大学毕业后，一直从事计算机方面的工作。自从2005 年开始，就一直是一名完全只使用Linux 的用户，在之前还是一名Solaris，SunOS 以及 UNIX System V 的用户。技术方面，在我的职业生涯中，我花费了大量的时间进行数据分析，特别是空间数据分析（LCTT译注：原文为 spatial data analysis）。同时，我也在使用编程语言像awk, Python, PostgreSQL, PostGIS 和最近的 Groovy 来进行数据分析有着丰富的经验。我还创建了一些其它的东西。[关于Chris Hermansen的更多信息][14]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/two-great-uses-cp-command-update

作者：[Chris Hermansen][a]
译者：[zyk2290](https://github.com/zyk2290)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/clhermansen
[1]:https://opensource.com/users/clhermansen
[2]:https://opensource.com/users/clhermansen
[3]:https://opensource.com/user/37806/feed
[4]:https://opensource.com/article/18/1/two-great-uses-cp-command-update?rate=J_7R7wSPbukG9y8jrqZt3EqANfYtVAwZzzpopYiH3C8
[5]:https://opensource.com/article/18/1/two-great-uses-cp-command-update#comments
[6]:https://www.flickr.com/photos/internetarchivebookimages/14803082483/in/photolist-oy6EG4-pZR3NZ-i6r3NW-e1tJSX-boBtf7-oeYc7U-o6jFKK-9jNtc3-idt2G9-i7NG1m-ouKjXe-owqviF-92xFBg-ow9e4s-gVVXJN-i1K8Pw-4jybMo-i1rsBr-ouo58Y-ouPRzz-8cGJHK-85Evdk-cru4Ly-rcDWiP-gnaC5B-pAFsuf-hRFPcZ-odvBMz-hRCE7b-mZN3Kt-odHU5a-73dpPp-hUaaAi-owvUMK-otbp7Q-ouySkB-hYAgmJ-owo4UZ-giHgqu-giHpNc-idd9uQ-osAhcf-7vxk63-7vwN65-fQejmk-pTcLgA-otZcmj-fj1aSX-hRzHQk-oyeZfR
[7]:https://opensource.com/article/17/7/two-great-uses-cp-command
[8]:https://opensource.com/article/17/5/introduction-alias-command-line-tool
[9]:https://opensource.com/article/17/1/shell-scripting-shift-method-custom-functions
[10]:https://opensource.com/article/17/5/introduction-alias-command-line-tool
[11]:https://opensource.com/article/17/1/shell-scripting-shift-method-custom-functions
[12]:https://opensource.com/tags/linux
[13]:https://opensource.com/users/clhermansen
[14]:https://opensource.com/users/clhermansen
