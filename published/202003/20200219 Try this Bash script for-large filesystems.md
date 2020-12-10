[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12025-1.html)
[#]: subject: (Try this Bash script for large filesystems)
[#]: via: (https://opensource.com/article/20/2/script-large-files)
[#]: author: (Nick Clifton https://opensource.com/users/nickclifton)

针对大型文件系统可以试试此 Bash 脚本
======

> 一个可以列出文件、目录、可执行文件和链接的简单脚本。

![bash logo on green background][1]

你是否曾经想列出目录中的所有文件，但仅列出文件，而不列出其它的。仅列出目录呢？如果有这种需求的话，那么下面的脚本可能正是你一直在寻找的，它在 GPLv3 下开源。

当然，你可以使用 `find` 命令：

```
find . -maxdepth 1 -type f -print
```

但这键入起来很麻烦，输出也不友好，并且缺少 `ls` 命令拥有的一些改进。你还可以结合使用 `ls` 和 `grep` 来达到相同的结果：

```
ls -F . | grep -v /
```

但是，这又有点笨拙。下面这个脚本提供了一种简单的替代方法。

### 用法

该脚本提供了四个主要功能，具体取决于你调用它的名称：`lsf` 列出文件，`lsd` 列出目录，`lsx` 列出可执行文件以及 `lsl` 列出链接。

通过符号链接无需安装该脚本的多个副本。这样可以节省空间并使脚本更新更容易。

该脚本通过使用 `find` 命令进行搜索，然后在找到的每个项目上运行 `ls`。这样做的好处是，任何给脚本的参数都将传递给 `ls` 命令。因此，例如，这可以列出所有文件，甚至包括以点开头的文件：

```
lsf -a
```

要以长格式列出目录，请使用 `lsd` 命令：

```
lsd -l
```

你可以提供多个参数，以及文件和目录路径。

下面提供了当前目录的父目录和 `/usr/bin` 目录中所有文件的长分类列表：

```
lsf -F -l .. /usr/bin
```

目前该脚本不处理递归，仅列出当前目录中的文件。

```
lsf -R
```

该脚本不会深入子目录，这个不足有一天可能会进行修复。

### 内部

该脚本采用自上而下的方式编写，其初始化功能位于脚本的开头，而工作主体则接近结尾。脚本中只有两个真正重要的功能。函数 `parse_args()` 会仔细分析命令行，将选项与路径名分开，并处理脚本中的 `ls` 命令行选项中的特定选项。

`list_things_in_dir()` 函数以目录名作为参数并在其上运行 `find` 命令。找到的每个项目都传递给 `ls` 命令进行显示。

### 总结

这是一个可以完成简单功能的简单脚本。它节省了时间，并且在使用大型文件系统时可能会非常有用。

### 脚本

```
#!/bin/bash

# Script to list:
#      directories (if called "lsd")
#      files       (if called "lsf")
#      links       (if called "lsl")
#  or  executables (if called "lsx")
# but not any other type of filesystem object.
# FIXME: add lsp   (list pipes)
#
# Usage:
#   <command_name> [switches valid for ls command] [dirname...]
#
# Works with names that includes spaces and that start with a hyphen.
#
# Created by Nick Clifton.
# Version 1.4
# Copyright (c) 2006, 2007 Red Hat.
#
# This is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published
# by the Free Software Foundation; either version 3, or (at your
# option) any later version.

# It is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# ToDo:
#  Handle recursion, eg:  lsl -R
#  Handle switches that take arguments, eg --block-size
#  Handle --almost-all, --ignore-backups, --format and --ignore

main ()
{
  init
 
  parse_args ${1+"$@"}

  list_objects

  exit 0
}

report ()
{
  echo $prog": " ${1+"$@"}
}

fail ()
{
  report " Internal error: " ${1+"$@"}
  exit 1
}

# Initialise global variables.
init ()
{
  # Default to listing things in the current directory.
  dirs[0]=".";
 
  # num_dirs is the number of directories to be listed minus one.
  # This is because we are indexing the dirs[] array from zero.
  num_dirs=0;
 
  # Default to ignoring things that start with a period.
  no_dots=1
 
  # Note - the global variables 'type' and 'opts' are initialised in
  # parse_args function.
}

# Parse our command line
parse_args ()
{
  local no_more_args

  no_more_args=0 ;

  prog=`basename $0` ;

  # Decide if we are listing files or directories.
  case $prog in
    lsf | lsf.sh)
      type=f
      opts="";
      ;;
    lsd | lsd.sh)
      type=d
      # The -d switch to "ls" is presumed when listing directories.
      opts="-d";
      ;;
    lsl | lsl.sh)
      type=l
      # Use -d to prevent the listed links from being followed.
      opts="-d";
      ;;
    lsx | lsx.sh)
      type=f
      find_extras="-perm /111"
      ;;    
    *)
      fail "Unrecognised program name: '$prog', expected either 'lsd', 'lsf', 'lsl' or 'lsx'"
      ;;
  esac

  # Locate any additional command line switches for ls and accumulate them.
  # Likewise accumulate non-switches to the directories list.
  while [ $# -gt 0 ]
  do
    case "$1" in
      # FIXME: Handle switches that take arguments, eg --block-size
      # FIXME: Properly handle --almost-all, --ignore-backups, --format
      # FIXME:   and --ignore
      # FIXME: Properly handle --recursive
      -a | -A | --all | --almost-all)
        no_dots=0;
        ;;
      --version)
        report "version 1.2"
        exit 0
        ;;
      --help)
        case $type in
          d) report "a version of 'ls' that lists only directories" ;;
          l) report "a version of 'ls' that lists only links" ;;
          f) if [ "x$find_extras" = "x" ] ; then
               report "a version of 'ls' that lists only files" ;
             else
              report "a version of 'ls' that lists only executables";
             fi ;;
        esac
        exit 0
        ;;
      --)
        # A switch to say that all further items on the command line are
        # arguments and not switches.
        no_more_args=1 ;
        ;;
      -*)
        if [ "x$no_more_args" = "x1" ] ;
        then
          dirs[$num_dirs]="$1";
          let "num_dirs++"
        else
          # Check for a switch that just uses a single dash, not a double
          # dash.  This could actually be multiple switches combined into
          # one word, eg "lsd -alF".  In this case, scan for the -a switch.
          # XXX: FIXME: The use of =~ requires bash v3.0+.
          if [[ "x${1:1:1}" != "x-" && "x$1" =~ "x-.*a.*" ]] ;
          then
            no_dots=0;
          fi
          opts="$opts $1";
        fi
        ;;
      *)
        dirs[$num_dirs]="$1";
        let "num_dirs++"
        ;;
    esac
    shift
  done

  # Remember that we are counting from zero not one.
  if [ $num_dirs -gt 0 ] ;
  then
    let "num_dirs--"
  fi
}

list_things_in_dir ()
{
  local dir

  # Paranoia checks - the user should never encounter these.
  if test "x$1" = "x" ;
  then
    fail "list_things_in_dir called without an argument"
  fi

  if test "x$2" != "x" ;
  then
    fail "list_things_in_dir called with too many arguments"
  fi

  # Use quotes when accessing $dir in order to preserve
  # any spaces that might be in the directory name.
  dir="${dirs[$1]}";

  # Catch directory names that start with a dash - they
  # confuse pushd.
  if test "x${dir:0:1}" = "x-" ;
  then
    dir="./$dir"
  fi
 
  if [ -d "$dir" ]
  then
    if [ $num_dirs -gt 0 ]
    then
      echo "  $dir:"
    fi

    # Use pushd rather passing the directory name to find so that the
    # names that find passes on to xargs do not have any paths prepended.
    pushd "$dir" > /dev/null
    if [ $no_dots -ne 0 ] ; then
      find . -maxdepth 1 -type $type $find_extras -not -name ".*" -printf "%f\000" \
        | xargs --null --no-run-if-empty ls $opts -- ;
    else
      find . -maxdepth 1 -type $type $find_extras -printf "%f\000" \
        | xargs --null --no-run-if-empty ls $opts -- ;
    fi
    popd > /dev/null
  else
    report "directory '$dir' could not be found"
  fi
}

list_objects ()
{
  local i

  i=0;
  while [ $i -le $num_dirs ]
  do
    list_things_in_dir i
    let "i++"
  done
}

# Invoke main
main ${1+"$@"}
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/script-large-files

作者：[Nick Clifton][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nickclifton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
