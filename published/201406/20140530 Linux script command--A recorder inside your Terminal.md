Linux script命令 —— 终端里的记录器
================================================================================
当你在终端或者控制台工作时，你可能想要记录在终端中所做的一切。这些记录可以用来当作史料，保存终端所发生的一切。比如说，你和一些Linux管理员们同时管理着相同的机器，或者你让某人远程登陆到了你的服务器上，你可能记录想要终端里发生的一切。要实现这个目标，你可以使用script命令。

### script是什么 ###

scirpt就是一个命令，可以制作一份记录输出到终端的记录。对于那些想要真实记录终端会话的人来说，这很有用。该记录可以保存并在以后再打印出来。

### 怎么用 ###

默认情况下，我们可以通过在终端中输入script来启动scirpt命令。

    pungki@dev-machine:~$ script
    Script started, file is typescript
    pungki@dev-machine:~$

你也可以指定目标文件名来记录打印结果。

    pungki@dev-machine:~$ script myfile

![Define script file](http://linoxide.com/wp-content/uploads/2014/03/start_script.png)

当你再次见到命令提示符，这意味着终端将记录打印到终端的任何东西。

你会看到当前目录，有个名为myscript的文件。（LCTT译注，此处原文有误。这里指定了记录文件名为myfile，而不是默认的 typescript。）

### 为什么我们要用script命令 ###

因为在之前已经提到过，script命令的主要功能是记录所有的东西。下面给出了两个使用该命令的场景。

#### 和同事共事时 ####

当和同事一起工作时，我们可以通过script来记录你的活动。

比如，我们会使用名为**collaborate**的打印文件，来完成打印：

    $ script collaborate

![Create collaborate file](http://linoxide.com/wp-content/uploads/2014/03/collaborate.png)

然后，在完成一些任务后，假如你需要把你干的活发给另外一个工程师，那就把那文件发给他。所以当另外一个工程师需要复查所做的事情，他只要用文本编辑器打开这个文件就行了。

如果他想要更新该文件（以增加他的工作部分），可以使用**-a**选项。

    $ script -a collaborate

![Append the file](http://linoxide.com/wp-content/uploads/2014/03/collaborate_append.png)

#### 记录某人在终端中的所作所为 ####

你可能让你的工程师或者某个人远程访问你的系统，要确保你的工程师正在干正确的事，你可以记录下他在你系统上的所作所为。要让script命令在登录时自动运行，我们可以把它添加进shell环境配置文件中。如果你正在使用**bash** shell，把这一行加进你的bash环境配置文件中。

    $ vi ~/.profile

    # run the script command to record everything
    # use -q for quite and -a option to append the script
    #
    /usr/bin/script -qa /usr/local/script/log_record_script

![Add script to bash profile](http://linoxide.com/wp-content/uploads/2014/03/script_login.png)

然后保存。下次他登录进你的系统时，script命令就会自动运行，并把日志记录进**/usr/local/script/log_record_script**。

![Script without notification](http://linoxide.com/wp-content/uploads/2014/03/remote_script_quite.png)

**-q**选项可以让scirpt命令以静默模式运行，登录进来的用户不会知道script命令已经运行了。而**-a**选项将会让记录附加到文件中，而不会擦除先前的记录。

如果不使用**-q**选项，那么当用户登录进来时，他会收到像下图中这样的通知。

![Script with notification](http://linoxide.com/wp-content/uploads/2014/03/remote_script.png)

### 退出记录 ###

要退出记录活动，我们可以在终端中按下**Ctrl+D**，或者输入**exit**。在退出script前，你会发现记录文件的大小为0 Kb，而在退出之后，文件大小会发生改变。

### 结尾 ###

Script命令在你需要记录或者存档终端活动时可能很有用，记录文件会存储为文本文件，所以可以很方便地用文本编辑器打开。跟平常一样，我们都可以通过输入**man script**或者**scirpt -h**来显示帮助页并查看更多详细用法。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/script-command-recorder/

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
