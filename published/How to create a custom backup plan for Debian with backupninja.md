使用backupninja为Debian定制备份计划
============

backupninja是Debian系统（以及基于Debian的发行版）中一个强大的、高度可配置的备份软件。在[前一篇文章][1]中，我们探讨了如何安装backupninja以及如何设置两个备份操作并执行。然而，那些只是冰山一角。这一次，我们要讨论如何定制 Handler 和 Helper ，使用这些功能定制策略以完成任何备份需要。

###回顾 backupninja

backupninja的一个独特的地方是它可以完全抛弃/etc/backup.d中的纯文本配置文件和操作文件，软件自己会搞定。另外，我们可以编写自定义脚本（又叫 “handler”）放在/usr/share/backupninja 目录下来完成不同类型的备份操作。此外，可以通过ninjahelper的基于ncurses的交互式菜单（又叫“helper”）来指导我们创建一些配置文件，使得人工错误降到最低。

###创建定制的Handler与Helper

这一节的目标是创建一个脚本，将home目录以**gzip**或**bzip2**压缩包的形式备份起来，不包括音乐与视频文件。我们将这个文件命名为home，将它放在/usr/backup/ninja目录下。

尽管你可以使用默认的tar handler（参考 /usr/share/backupninja/tar 与 /usr/share/backupninja/tar.helper）来达到这个效果，但是我们使用这种方法来展示如何创建实用的 handler 脚本与基于 ncurses 的 helper。你可以根据你的需求来决定如何运用这里的方法。

由于 handlers 来源于主脚本，所以无需以#!/bin/bash开始的释伴行（shebang line）。

我们编写的 handler （/usr/share/backupninja/home）如下所示。已经详细注释了。getconf 函数用来读取备份操作的配置文件。如果你指定了一个变量的值，那么它会覆盖配置文件中对应变量的值：

    #/home 目录 handler 脚本
     
    # 每个备份文件会通过 FQDN 来鉴别主机
    getconf backupname
     
    # 备份文件的保存目录
    getconf backupdir
     
    # 默认压缩
    getconf compress
     
    # 包含 /home 目录
    getconf includes
     
    #不包含 *.mp3 与 *.mp4 文件
    getconf excludes
     
    # 要打包备份文件的默认扩展名
    getconf EXTENSION
     
    # tar 程序的绝对路径
    getconf TAR `which tar`
     
    # date 程序的绝对路径
    getconf DATE    `which date`
     
    # 日期格式
    DATEFORMAT="%Y-%m-%d"
     
    # 如果备份目录不存在，以致命错误退出
    if [ ! -d "$backupdir" ]
    then
       mkdir -p "$backupdir" || fatal "Can not make directory $backupdir"
    fi
     
    # 如果备份目录不可写，同样以致命错误退出
    if [ ! -w "$backupdir" ]
    then
       fatal "Directory $backupdir is not writable"
    fi
     
    # 根据压缩格式选择对应的tar选项
    case $compress in
       "gzip")
        compress_option="-z"
        EXTENSION="tar.gz"
        ;;
       "bzip")
        compress_option="-j"
        EXTENSION="tar.bz2"
        ;;
       "none")
        compress_option=""
        ;;
       *)
        warning "Unknown compress filter ($tar_compress)"
        compress_option=""
        EXTENSION="tar.gz"
        ;;
    esac
     
    # 不包含一些文件类型/目录
    exclude_options=""
    for i in $excludes
    do
       exclude_options="$exclude_options --exclude $i"
    done
     
    # 调试信息，执行备份操作
    debug "Running backup: " $TAR -c -p -v $compress_option $exclude_options \
       -f "$backupdir/$backupname-"`$DATE "+$DATEFORMAT"`".$EXTENSION" \
       $includes
     
    # 将标准输出重定向到以.list为扩展的文件  
    # 将标准错误输出重定向到以.err为扩展的文件
    $TAR -c -p -v $compress_option $exclude_options \
       -f "$backupdir/$backupname-"`$DATE "+$DATEFORMAT"`".$EXTENSION" \
       $includes \
       > "$backupdir/$backupname-"`$DATE "+$DATEFORMAT"`.list \
       2> "$backupdir/$backupname-"`$DATE "+$DATEFORMAT"`.err
     
    [ $? -ne 0 ] && fatal "Tar backup failed"

接下来我们将要创建helper文件（/usr/share/backupninja/home.helper）。这样，hendlers将会以菜单的形式在**ninjahelper**中显示：

    # 备份操作描述，以下划线分割单词
    HELPERS="$HELPERS home:backup_of_home_directories"
     
    home_wizard() {
       home_title="Home action wizard"
     
       backupname=`hostname --fqdn`
     
    # 指定备份操作的时间
       inputBox "$home_title" "When to run this action?" "everyday at 01"
       [ $? = 1 ] && return
       home_when_run="when = $REPLY"
     
    # 指定备份文件名
       inputBox "$home_title" "\"Name\" of backups" "$backupname"
       [ $? = 1 ] && return
       home_backupname="backupname = $REPLY"
       backupname="$REPLY"
     
    # 指定保存备份文件的默认路径
       inputBox "$home_title" "Directory where to store the backups" "/var/backups/home"
       [ $? = 1 ] && return
       home_backupdir="backupdir = $REPLY"
     
    # 指定复选框的默认值
       radioBox "$home_title" "Compression" \
        "none"  "No compression" off \
        "gzip"  "Compress with gzip" on \
        "bzip"  "Compress with bzip" off
       [ $? = 1 ] && return;
       result="$REPLY"
       home_compress="compress = $REPLY "
     
       REPLY=
       while [ -z "$REPLY" ]; do
        formBegin "$home_title: Includes"
            formItem "Include:" /home/gacanepa
        formDisplay
        [ $? = 0 ] || return 1
        home_includes="includes = "
        for i in $REPLY; do
            [ -n "$i" ] && home_includes="$home_includes $i"
        done
       done
     
       REPLY=
       while [ -z "$REPLY" ]; do
        formBegin "$home_title: Excludes"
            formItem "Exclude:" *.mp3
            formItem "Exclude:" *.mp4
            # 按需增加多个“Exclude”文本框指定其他不须包含的内容
    formItem "Exclude:"
            formItem "Exclude:"
        formDisplay
        [ $? = 0 ] || return 1
        home_excludes="excludes = "
        for i in $REPLY; do
            [ -n "$i" ] && home_excludes="$home_excludes $i"
        done
       done
     
    # 保存配置
       get_next_filename $configdirectory/10.home
       cat > $next_filename <<EOF
    $home_when_run
    $home_backupname
    $home_backupdir
    $home_compress
    $home_includes
    $home_excludes
     
    # tar 程序的路径，必须为GNU tar
    TAR    `which tar`
    DATE    `which date`
    DATEFORMAT  "%Y-%m-%d"
    EXTENSION    tar
     
    EOF
    # 将配置文件的权限改为600
       chmod 600 $next_filename
    }

###运行 ninjahelper###

当创建了名为home的handler脚本以及对应的home.helper后，运行ninjahelper命令创建一个新的备份操作。

	#ninjahelper

选择 create a new backup action（创建一个新的备份操作）。

![](https://farm8.staticflickr.com/7467/15322605273_90edaa5bc1_z.jpg)

接下来将看到可选的操作类型，这里选择“backup of home directories"（备份home目录）：

![](https://farm9.staticflickr.com/8636/15754955450_f3ef82217b_z.jpg)

然后会显示在helper中设置的默认值（这里只显示了3个）。可以编辑文本框中的值。注意，关于“when”变量的语法，参考文档的日程安排章节。

![](https://farm8.staticflickr.com/7508/15941578982_24b680e1c3_z.jpg)

![](https://farm8.staticflickr.com/7562/15916429476_6e84b307aa_z.jpg)

![](https://farm8.staticflickr.com/7528/15319968994_41705b7283_z.jpg)

当完成备份操作的创建后，它会显示在ninjahelper的初始化菜单中：

![](https://farm8.staticflickr.com/7534/15942239225_bb66dbdb63.jpg)

按回车键显示这个备份操作的选项。因为它非常简单，所以我们可以随便对它进行一些实验。

注意，“run this action now"（立即运行）选项会不顾日程表安排的时间而立即进行备份操作：

![](https://farm8.staticflickr.com/7508/15754955470_9af6251096_z.jpg)

备份操作会发生一些错误，debug会提供一些有用的信息以帮助你定位错误并纠正。例如，当备份操作有错误并且没有被纠正，那么当它运行时将会打印出如下所示的错误信息。

![](https://farm9.staticflickr.com/8662/15754955480_487d040fcd_z.jpg)

上面的图片告诉我们，用于完成备份操作的连接没有建立，因为它所需要链接的远程主机似乎宕机了。另外，在helper文件中指定的目标目录不存在。当纠正这些问题后，重新开始备份操作。

需要牢记的事情：

 - 当你在/usr/share/backupninja 下新建了一个自定义脚本（如foobar）来处理特殊的备份操作时，那么你还需要编写与之对应的helper（foobar.helper）文件，ninjahelper 将通过它生成名为10.foobar（下一个操作为11，以此类推）的文件，保存在/etc/backup.d目录下，而这个文件才是备份操作的真正的配置文件。
 - 可以通过ninjahelper设定好备份操作的执行时间，或按照“when”变量中设置的频率来执行。

###总结###

在这篇文章中，我们探讨了如何从头创建我们自己的备份操作，以及如何向ninjahelper添加相关的菜单以生成对应的配置文件。通过[上一篇][1]与这一篇文章，我希望我已经给出了足够好的理由让你继续研究，或者至少应该尝试一下。

------------------------------

via: http://xmodulo.com/create-custom-backup-plan-debian.html

作者：[Gabriel Cánepa][a]
译者：[SPccman](https://github.com/SPccman)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:http://linux.cn/article-5096-1.html
