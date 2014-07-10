周二命令行 - 第四章
Geekos的爱好者们，你们好!本周，我们将开启新的冒险！
今天，我们将学习4个简单的命令才操作文件。
在我们开始之前，让我们快速浏览下通配符。
### …wildcards: ###


也许使用图形化工具来进行复制、粘贴、创建目录等操作是比较简单的，但是当我们有一些比较复杂任务的时候，比如只拷贝后缀名为.html的文件到另一个目录，或者只拷贝在目标目录中不存在的文件，在这种时候用命令行处理起来便是得心应手。让我们回到上面的通配符，它是Shell的一大特点，它是一个特殊的字符集，可以让你基于一定简单的规则下选出需要的文件集合（如关键字、文件名的长度、大/小写等），这里是表格，点击放大：
![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-125946.png)
 
下表是肖茨先生的几个使用列子，点击放大：
![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-125959.png)

如果要运行的命令参数中包含文件名，也可以使用通配符。
### cp ###

cp 是用来拷贝文件或目录的。它的使用非常简单：指定源目录和目的目录来拷贝文件或者目录，或者直接 `cp file1 file2`来拷贝单文件。
还有`cp file1 file2 … directory` 这种方式可以把当期目录的文件拷贝到你指定的目的目录。这里是肖茨先生整理的表格，包含一些使用的方法：

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-134248.png)

### mv ###

mv是我们今天要学习的第二个命令。我们可以使用mv命令来重命名文件或目录，也可以用来移动文件或目录。我们可以这样使用mv：
`mv filename1 filename2` - 当你希望把filename1重命名为filename2
`mv file directory` - 当你想把file文件移动到目录directory中去。
下表是一些mv的使用方法和它的一些参数的功能：
![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-133515.png)

### rm ###

rm 命令用来删除文件和目录，它的使用十分直截了当：
    rm file

和

    rm -r directory

下表是rm命令的几个使用方式：
![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-133529.png)

请注意：一定要小心谨慎的使用rm命令，因为rm操作是不可恢复的！所以一定要小心使用，不要对系统造成伤害！
### mkdir ###

mkdir是用来创建目录的。这是今天最简单的一个命令了：
    mkdir directory

OK，目录已经创建了。
好了，这就是今天的内容，Geekos的爱好者们，期待下周二与您相见！再见！
--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/07/08/command-line-tuesdays-part-four/

译者：[nd0104](https://github.com/nd0104) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出