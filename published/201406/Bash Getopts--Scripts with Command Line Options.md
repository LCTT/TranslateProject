Bash Getopts - 让你的脚本支持命令行参数
================================================================================

以前我总想知道如何为我的Bash脚本创建命令行参数。经过搜索，我发现了2个函数可以处理这个问题，**getopt** 函数和 **getopts** 函数。我无意争论哪一个函数更好的。**getopts** 是一个shell内建命令，而且似乎比 **getopt** 更容易实现这个功能，所以在这篇文章里我准备讲讲getopts。

### bash getopts ###

开始的时候，我只试着处理传递给脚本的命令行参数。最后，我添加了另外一些有用的功能函数，使得这个脚本可以成为其他任何交互式脚本处理命令行的开始模板。我还添加了一个纯文本格式的帮助函数，让脚本更加容易阅读。

与其来一长段文字解释 **getopts** 在bash中是如何工作的，我认为不如直接来一个能工作的脚本更让人觉得轻松一些。

    #!/bin/bash
    
    ######################################################################
    #This is an example of using getopts in Bash. It also contains some
    #other bits of code I find useful.
    #Author: Linerd
    #Website: http://tuxtweaks.com/
    #Copyright 2014
    #License: Creative Commons Attribution-ShareAlike 4.0
    #http://creativecommons.org/licenses/by-sa/4.0/legalcode
    ######################################################################
        
    #Set Script Name variable
    SCRIPT=`basename ${BASH_SOURCE[0]}`
    
    #Initialize variables to default values.
    OPT_A=A
    OPT_B=B
    OPT_C=C
    OPT_D=D
    
    #Set fonts for Help.[译注: 这里tput用来更改终端文本属性,比如加粗，高亮等]
    NORM=`tput sgr0`
    BOLD=`tput bold`
    REV=`tput smso`
    
    #Help function
    function HELP {
      echo -e \\n"Help documentation for ${BOLD}${SCRIPT}.${NORM}"\\n
      echo -e "${REV}Basic usage:${NORM} ${BOLD}$SCRIPT file.ext${NORM}"\\n
      echo "Command line switches are optional. The following switches are recognized."
      echo "${REV}-a${NORM}  --Sets the value for option ${BOLD}a${NORM}. Default is ${BOLD}A${NORM}."
      echo "${REV}-b${NORM}  --Sets the value for option ${BOLD}b${NORM}. Default is ${BOLD}B${NORM}."
      echo "${REV}-c${NORM}  --Sets the value for option ${BOLD}c${NORM}. Default is ${BOLD}C${NORM}."
      echo "${REV}-d${NORM}  --Sets the value for option ${BOLD}d${NORM}. Default is ${BOLD}D${NORM}."
      echo -e "${REV}-h${NORM}  --Displays this help message. No further functions are performed."\\n
      echo -e "Example: ${BOLD}$SCRIPT -a foo -b man -c chu -d bar file.ext${NORM}"\\n
      exit 1
    }
    
    #Check the number of arguments. If none are passed, print help and exit.
    NUMARGS=$#
    echo -e \\n"Number of arguments: $NUMARGS"
    if [ $NUMARGS -eq 0 ]; then
      HELP
    fi
    
    ### Start getopts code ###
    
    #Parse command line flags
	#如果选项需要后跟参数，在选项后面加":"
	#注意"-h"选项后面没有":"，因为他不需要参数。选项字符串最开始的":"是用来去掉来自getopts本身的报错的，同时获取不能识别的选项。（译注：如果选项字符串不以":"开头，发生错误（非法的选项或者缺少参数）时，getopts会向错误输出打印错误信息；如果以":"开头，则不会打印[在man中叫slient error reporting]，同时将出错的选项赋给OPTARG变量）
    
    while getopts :a:b:c:d:h FLAG; do
      case $FLAG in
        a)  #set option "a"
          OPT_A=$OPTARG
          echo "-a used: $OPTARG"
          echo "OPT_A = $OPT_A"
          ;;
        b)  #set option "b"
          OPT_B=$OPTARG
          echo "-b used: $OPTARG"
          echo "OPT_B = $OPT_B"
          ;;
        c)  #set option "c"
          OPT_C=$OPTARG
          echo "-c used: $OPTARG"
          echo "OPT_C = $OPT_C"
          ;;
        d)  #set option "d"
          OPT_D=$OPTARG
          echo "-d used: $OPTARG"
          echo "OPT_D = $OPT_D"
          ;;
        h)  #show help
          HELP
          ;;
        \?) #unrecognized option - show help
          echo -e \\n"Option -${BOLD}$OPTARG${NORM} not allowed."
          HELP
		  #在这里如果你不想打印完整的帮助信息，只想显示简单的错误信息，去掉上面的两行，同时使用下面的两行。
          #echo -e "Use ${BOLD}$SCRIPT -h${NORM} to see the help documentation."\\n
          #exit 2
          ;;
      esac
    done
    
    shift $((OPTIND-1))  #This tells getopts to move on to the next argument.
    
    ### End getopts code ###
    
    
    ### Main loop to process files ###
    
	#这里你可以用你的脚本处理逻辑来替代。这个例子只是在终端中打印文件的文件名和后缀名。你可以把任意其他的文件处理任务放到这个while-do循环中。   

    while [ $# -ne 0 ]; do
      FILE=$1
      TEMPFILE=`basename $FILE`
      #TEMPFILE="${FILE##*/}"  #另外一种获取不带后缀的文件名的方法。
      FILE_BASE=`echo "${TEMPFILE%.*}"`  #file without extension
      FILE_EXT="${TEMPFILE##*.}"  #file extension
    
    
      echo -e \\n"Input file is: $FILE"
      echo "File withouth extension is: $FILE_BASE"
      echo -e "File extension is: $FILE_EXT"\\n
      shift  #Move on to next input file.
    done
    
    ### End main loop ###
    
    exit 0

将上面的代码复制到你的文本编辑器里，然后保存到你的可执行路径下。我将这个脚本命名为 **options** 并保存到 **/home/linerd/bin** 路径下。保存之后记得给你的脚本添加可执行权限。

    chmod +x ~/bin/options

现在脚本已经可以运行了。试试用 **-h** 参数来打印帮助信息吧。

    options -h

遇到不支持的选项，脚本同样可以给出提示，并打印帮助信息。

    options -z

最后，getopts可以以任意的顺序处理你给的命令行参数。唯一的限制是你要处理的文件必须放在所有参数的最后。

    options -d bar -c chu -b man -a foo example1.txt example2.txt

现在你可以从这些例子里看到如何通过命令行参数给脚本里的变量赋值。这个脚本里除了getopts还有很多其他的东西，但是我认为这些就足以成为一个新脚本的开头模板了。如果你有兴趣更深入地学习bash的getopts，你可以找找深埋在man page的“Builtins”这一节里的文档，也可以从 [Bash Reference Manual][1] 找到信息。

### 接下来呢? ###

你会用getops来干什么呢？在评论里告诉我吧。

--------------------------------------------------------------------------------

via: http://tuxtweaks.com/2014/05/bash-getopts/

译者： CNprober \<travelwithheart@yeah.net, QQ619913541\> 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://tuxtweaks.com/2014/05/bash-getopts/www.gnu.org/software/bash/manual/html_node/Bourne-Shell-Builtins.html
