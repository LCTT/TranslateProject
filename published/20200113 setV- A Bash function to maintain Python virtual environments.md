[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11800-1.html)
[#]: subject: (setV: A Bash function to maintain Python virtual environments)
[#]: via: (https://opensource.com/article/20/1/setv-bash-function)
[#]: author: (Sachin Patil https://opensource.com/users/psachin)

setV：一个管理 Python 虚拟环境的 Bash 函数
======

> 了解一下 setV，它是一个轻量级的 Python 虚拟环境管理器，是 virtualenvwrapper 的替代产品。

![](https://img.linux.net.cn/data/attachment/album/202001/19/234306tvvg5ffwakrzr5vv.jpg)

这一年多来，我的 [bash_scripts][3] 项目中悄悄隐藏这 [setV][2]，但现在是时候该公开了。setV 是一个 Bash 函数，我可以用它代替 [virtualenvwrapper][4]。它提供了使你能够执行以下操作的基本功能：

* 默认使用 Python 3
* 创建一个新的虚拟环境
* 使用带有 `-p`（或 `--python`）的自定义 Python 路径来创建新的虚拟环境
* 删除现有的虚拟环境
* 列出所有现有的虚拟环境
* 使用制表符补全（以防你忘记虚拟环境名称）

### 安装

要安装 setV，请下载该脚本：

```
curl https://gitlab.com/psachin/setV/raw/master/install.sh
```

审核一下脚本，然后运行它：

```
sh ./install.sh
```

当安装 setV 时，安装脚本会要求你引入（`source`）一下 `~/.bashrc` 或 `~/.bash_profile` 的配置，根据你的喜好选择一个。

### 用法

基本的命令格式是 `setv`。

#### 创建虚拟环境

```
setv --new rango  # setv -n rango

# 或使用定制的 Python 路径
setv --new --python /opt/python/python3 rango  # setv -n -p /opt/python/python3 rango
```

#### 激活已有的虚拟环境

```
setv VIRTUAL_ENVIRONMENT_NAME
```

```
# 示例
setv rango
```

#### 列出所有的虚拟环境

```
setv --list
# 或
setv [TAB] [TAB]
```

#### 删除虚拟环境

```
setv --delete rango
```

#### 切换到另外一个虚拟环境

```
# 假设你现在在 'rango'，切换到 'tango'
setv tango
```

#### 制表符补完

如果你不完全记得虚拟环境的名称，则 Bash 式的制表符补全也可以适用于虚拟环境名称。

### 参与其中

setV 在 GNU [GPLv3][5]下开源，欢迎贡献。要了解更多信息，请访问它的 GitLab 存储库中的 setV 的 [README][6] 的贡献部分。

### setV 脚本

```
#!/usr/bin/env bash
# setV - A Lightweight Python virtual environment manager.
# Author: Sachin (psachin) <iclcoolster@gmail.com>
# Author's URL: https://psachin.gitlab.io/about
#
# License: GNU GPL v3, See LICENSE file
#
# Configure(Optional):
# Set `SETV_VIRTUAL_DIR_PATH` value to your virtual environments
# directory-path. By default it is set to '~/virtualenvs/'
#
# Usage:
# Manual install: Added below line to your .bashrc or any local rc script():
# ---
# source /path/to/virtual.sh
# ---
#
# Now you can 'activate' the virtual environment by typing
# $ setv <YOUR VIRTUAL ENVIRONMENT NAME>
#
# For example:
# $ setv rango
#
# or type:
# setv [TAB] [TAB]  (to list all virtual envs)
#
# To list all your virtual environments:
# $ setv --list
#
# To create new virtual environment:
# $ setv --new new_virtualenv_name
#
# To delete existing virtual environment:
# $ setv --delete existing_virtualenv_name
#
# To deactivate, type:
# $ deactivate

# Path to virtual environment directory
SETV_VIRTUAL_DIR_PATH="$HOME/virtualenvs/"
# Default python version to use. This decides whether to use `virtualenv` or `python3 -m venv`
SETV_PYTHON_VERSION=3  # Defaults to Python3
SETV_PY_PATH=$(which python${SETV_PYTHON_VERSION})

function _setvcomplete_()
{
    # Bash-autocompletion.
    # This ensures Tab-auto-completions work for virtual environment names.
    local cmd="${1##*/}" # to handle command(s).
                         # Not necessary as such. 'setv' is the only command

    local word=${COMP_WORDS[COMP_CWORD]} # Words thats being completed
    local xpat='${word}'                 # Filter pattern. Include
                                         # only words in variable '$names'
    local names=$(ls -l "${SETV_VIRTUAL_DIR_PATH}" | egrep '^d' | awk -F " " '{print $NF}') # Virtual environment names

    COMPREPLY=($(compgen -W "$names" -X "$xpat" -- "$word")) # compgen generates the results
}

function _setv_help_() {
    # Echo help/usage message
    echo "Usage: setv [OPTIONS] [NAME]"
    echo Positional argument:
    echo -e "NAME                       Activate virtual env."
    echo Optional arguments:
    echo -e "-l, --list                 List all Virtual Envs."
    echo -e "-n, --new NAME             Create a new Python Virtual Env."
    echo -e "-d, --delete NAME          Delete existing Python Virtual Env."
    echo -e "-p, --python PATH          Python binary path."
}

function _setv_custom_python_path()
{
    if [ -f "${1}" ];
    then
        if [ "`expr $1 : '.*python\([2,3]\)'`" = "3" ];
        then
            SETV_PYTHON_VERSION=3
        else
            SETV_PYTHON_VERSION=2
        fi
        SETV_PY_PATH=${1}
        _setv_create $2
    else
        echo "Error: Path ${1} does not exist!"
    fi
}

function _setv_create()
{
    # Creates new virtual environment if ran with -n|--new flag
    if [ -z ${1} ];
    then
        echo "You need to pass virtual environment name"
        _setv_help_
    else
        echo "Creating new virtual environment with the name: $1"

        if [ ${SETV_PYTHON_VERSION} -eq 3 ];
        then
            ${SETV_PY_PATH} -m venv ${SETV_VIRTUAL_DIR_PATH}${1}
        else
            virtualenv -p ${SETV_PY_PATH} ${SETV_VIRTUAL_DIR_PATH}${1}
        fi

        echo "You can now activate the Python virtual environment by typing: setv ${1}"
    fi
}

function _setv_delete()
{
    # Deletes virtual environment if ran with -d|--delete flag
    # TODO: Refactor
    if [ -z ${1} ];
    then
        echo "You need to pass virtual environment name"
        _setv_help_
    else
        if [ -d ${SETV_VIRTUAL_DIR_PATH}${1} ];
        then
            read -p "Really delete this virtual environment(Y/N)? " yes_no
            case $yes_no in
                Y|y) rm -rvf ${SETV_VIRTUAL_DIR_PATH}${1};;
                N|n) echo "Leaving the virtual environment as it is.";;
                *) echo "You need to enter either Y/y or N/n"
            esac
        else
            echo "Error: No virtual environment found by the name: ${1}"
        fi
    fi
}

function _setv_list()
{
    # Lists all virtual environments if ran with -l|--list flag
    echo -e "List of virtual environments you have under ${SETV_VIRTUAL_DIR_PATH}:\n"
    for virt in $(ls -l "${SETV_VIRTUAL_DIR_PATH}" | egrep '^d' | awk -F " " '{print $NF}')
    do
        echo ${virt}
    done
}

function setv() {
    # Main function
    if [ $# -eq 0 ];
    then
        _setv_help_
    elif [ $# -le 3 ];
    then
        case "${1}" in
            -n|--new) _setv_create ${2};;
            -d|--delete) _setv_delete ${2};;
            -l|--list) _setv_list;;
            *) if [ -d ${SETV_VIRTUAL_DIR_PATH}${1} ];
               then
                   # Activate the virtual environment
                   source ${SETV_VIRTUAL_DIR_PATH}${1}/bin/activate
               else
                   # Else throw an error message
                   echo "Sorry, you don't have any virtual environment with the name: ${1}"
                   _setv_help_
               fi
               ;;
        esac
    elif [ $# -le 5 ];
    then
        case "${2}" in
            -p|--python) _setv_custom_python_path ${3} ${4};;
            *) _setv_help_;;
        esac
    fi
}

# Calls bash-complete. The compgen command accepts most of the same
# options that complete does but it generates results rather than just
# storing the rules for future use.
complete  -F _setvcomplete_ setv
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/setv-bash-function

作者：[Sachin Patil][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/psachin
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://gitlab.com/psachin/setV
[3]: https://github.com/psachin/bash_scripts
[4]: https://virtualenvwrapper.readthedocs.org/
[5]: https://gitlab.com/psachin/setV/blob/master/LICENSE
[6]: https://gitlab.com/psachin/setV/blob/master/ReadMe.org
[7]: mailto:iclcoolster@gmail.com
