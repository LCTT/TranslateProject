RHCE 系列（四）： 使用 Shell 脚本自动化 Linux 系统维护任务
================================================================================
之前我听说高效的系统管理员的一个特点是懒惰。一开始看起来很矛盾，但作者接下来解释了其中的原因：

![自动化 Linux 系统维护任务](http://www.tecmint.com/wp-content/uploads/2015/08/Automate-Linux-System-Maintenance-Tasks.png)

*RHCE 系列：第四部分 - 自动化 Linux 系统维护任务*

如果一个系统管理员花费大量的时间解决问题以及做重复的工作，你就应该怀疑他这么做是否正确。换句话说，一个高效的系统管理员/工程师应该制定一个计划使得其尽量花费少的时间去做重复的工作，以及通过使用本系列中第三部分 [使用 Linux 工具集监视系统活动报告][1] 介绍的工具来预见问题。因此，尽管看起来他/她没有做很多的工作，但那是因为 shell 脚本帮助完成了他的/她的大部分任务，这也就是本章我们将要探讨的东西。

### 什么是 shell 脚本？ ###

简单的说，shell 脚本就是一个由 shell 一步一步执行的程序，而 shell 是在 Linux 内核和最终用户之间提供接口的另一个程序。

默认情况下，RHEL 7 中用户使用的 shell 是 bash（/bin/bash）。如果你想知道详细的信息和历史背景，你可以查看这个[维基页面][2]。

关于这个 shell 提供的众多功能的介绍，可以查看 **man 手册**，也可以从 （[Bash 命令][3]）处下载 PDF 格式。除此之外，假设你已经熟悉 Linux 命令（否则我强烈建议你首先看一下 **Tecmint.com** 中的文章 [从新手到系统管理员指南][4] ）。现在让我们开始吧。

### 写一个脚本显示系统信息 ###

为了方便，首先让我们新建一个目录用于保存我们的 shell 脚本：

    # mkdir scripts
    # cd scripts

然后用喜欢的文本编辑器打开新的文本文件 `system_info.sh`。我们首先在头部插入一些注释以及一些命令：

    #!/bin/bash
    
    # RHCE 系列第四部分示例脚本
    # 该脚本会返回以下这些系统信息：
    # -主机名称:
    echo -e "\e[31;43m***** HOSTNAME INFORMATION *****\e[0m"
    hostnamectl
    echo ""
    # -文件系统磁盘空间使用：
    echo -e "\e[31;43m***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
    df -h
    echo ""
    # -系统空闲和使用中的内存：
    echo -e "\e[31;43m ***** FREE AND USED MEMORY *****\e[0m"
    free
    echo ""
    # -系统启动时间：
    echo -e "\e[31;43m***** SYSTEM UPTIME AND LOAD *****\e[0m"
    uptime
    echo ""
    # -登录的用户：
    echo -e "\e[31;43m***** CURRENTLY LOGGED-IN USERS *****\e[0m"
    who
    echo ""
    # -使用内存最多的 5 个进程
    echo -e "\e[31;43m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
    ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
    echo ""
    echo -e "\e[1;32mDone.\e[0m"

然后，给脚本可执行权限：

    # chmod +x system_info.sh

运行脚本：

    ./system_info.sh

注意为了更好的可视化效果各部分标题都用颜色显示：

![服务器监视 Shell 脚本](http://www.tecmint.com/wp-content/uploads/2015/08/Server-Monitoring-Shell-Script.png)

*服务器监视 Shell 脚本*

颜色功能是由以下命令提供的：

    echo -e "\e[COLOR1;COLOR2m<YOUR TEXT HERE>\e[0m"

其中 COLOR1 和 COLOR2 是前景色和背景色（[Arch Linux Wiki][5] 有更多的信息和选项解释），<YOUR TEXT HERE> 是你想用颜色显示的字符串。

### 使任务自动化 ###

你想使其自动化的任务可能因情况而不同。因此，我们不可能在一篇文章中覆盖所有可能的场景，但是我们会介绍使用 shell 脚本可以使其自动化的三种典型任务：

1) 更新本地文件数据库， 2) 查找（或者删除）有 777 权限的文件， 以及 3) 文件系统使用超过定义的阀值时发出警告。

让我们在脚本目录中新建一个名为 `auto_tasks.sh` 的文件并添加以下内容：

    #!/bin/bash
    
    # 自动化任务示例脚本：
    # -更新本地文件数据库：
    echo -e "\e[4;32mUPDATING LOCAL FILE DATABASE\e[0m"
    updatedb
    if [ $? == 0 ]; then
            echo "The local file database was updated correctly."
    else
            echo "The local file database was not updated correctly."
    fi
    echo ""
    
    # -查找 和/或 删除有 777 权限的文件。
    echo -e "\e[4;32mLOOKING FOR FILES WITH 777 PERMISSIONS\e[0m"
    # Enable either option (comment out the other line), but not both.
    # Option 1: Delete files without prompting for confirmation. Assumes GNU version of find.
    #find -type f -perm 0777 -delete
    # Option 2: Ask for confirmation before deleting files. More portable across systems.
    find -type f -perm 0777 -exec rm -i {} +;
    echo ""
    # -文件系统使用率超过定义的阀值时发出警告 
    echo -e "\e[4;32mCHECKING FILE SYSTEM USAGE\e[0m"
    THRESHOLD=30
    while read line; do
            # This variable stores the file system path as a string
            FILESYSTEM=$(echo $line | awk '{print $1}')
            # This variable stores the use percentage (XX%)
            PERCENTAGE=$(echo $line | awk '{print $5}')
            # Use percentage without the % sign.
            USAGE=${PERCENTAGE%?}
            if [ $USAGE -gt $THRESHOLD ]; then
                    echo "The remaining available space in $FILESYSTEM is critically low. Used: $PERCENTAGE"
            fi
    done < <(df -h --total | grep -vi filesystem)

请注意该脚本最后一行两个 `<` 符号之间有个空格。

![查找 777 权限文件的 Shell 脚本](http://www.tecmint.com/wp-content/uploads/2015/08/Shell-Script-to-Find-777-Permissions.png)

*查找 777 权限文件的 Shell 脚本*

### 使用 Cron ###

想更进一步提高效率，你不会想只是坐在你的电脑前手动执行这些脚本。相反，你会使用 cron 来调度这些任务周期性地执行，并把结果通过邮件发动给预先指定的接收者，或者将它们保存到使用 web 浏览器可以查看的文件中。

下面的脚本（filesystem_usage.sh）会运行有名的 **df -h** 命令，格式化输出到 HTML 表格并保存到 **report.html** 文件中：

    #!/bin/bash
    # 演示使用 shell 脚本创建 HTML 报告的示例脚本
    # Web directory
    WEB_DIR=/var/www/html
    # A little CSS and table layout to make the report look a little nicer
    echo "<HTML>
    <HEAD>
    <style>
    .titulo{font-size: 1em; color: white; background:#0863CE; padding: 0.1em 0.2em;}
    table
    {
    border-collapse:collapse;
    }
    table, td, th
    {
    border:1px solid black;
    }
    </style>
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
    </HEAD>
    <BODY>" > $WEB_DIR/report.html
    # View hostname and insert it at the top of the html body
    HOST=$(hostname)
    echo "Filesystem usage for host <strong>$HOST</strong><br>
    Last updated: <strong>$(date)</strong><br><br>
    <table border='1'>
    <tr><th class='titulo'>Filesystem</td>
    <th class='titulo'>Size</td>
    <th class='titulo'>Use %</td>
    </tr>" >> $WEB_DIR/report.html
    # Read the output of df -h line by line
    while read line; do
    echo "<tr><td align='center'>" >> $WEB_DIR/report.html
    echo $line | awk '{print $1}' >> $WEB_DIR/report.html
    echo "</td><td align='center'>" >> $WEB_DIR/report.html
    echo $line | awk '{print $2}' >> $WEB_DIR/report.html
    echo "</td><td align='center'>" >> $WEB_DIR/report.html
    echo $line | awk '{print $5}' >> $WEB_DIR/report.html
    echo "</td></tr>" >> $WEB_DIR/report.html
    done < <(df -h | grep -vi filesystem)
    echo "</table></BODY></HTML>" >> $WEB_DIR/report.html

在我们的 **RHEL 7** 服务器（**192.168.0.18**）中，看起来像下面这样：

![服务器监视报告](http://www.tecmint.com/wp-content/uploads/2015/08/Server-Monitoring-Report.png)

*服务器监视报告*

你可以添加任何你想要的信息到那个报告中。添加下面的 crontab 条目在每天下午的 1：30 运行该脚本：

    30 13 * * * /root/scripts/filesystem_usage.sh

### 总结 ###

你很可能想起各种其他想要自动化的任务；正如你看到的，使用 shell 脚本能极大的简化任务。如果你觉得这篇文章对你有所帮助就告诉我们吧，别犹豫在下面的表格中添加你自己的想法或评论。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/

作者：[Gabriel Cánepa][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://linux.cn/article-6512-1.html
[2]:https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29
[3]:http://www.tecmint.com/wp-content/pdf/bash.pdf
[4]:http://www.tecmint.com/60-commands-of-linux-a-guide-from-newbies-to-system-administrator/
[5]:https://wiki.archlinux.org/index.php/Color_Bash_Prompt