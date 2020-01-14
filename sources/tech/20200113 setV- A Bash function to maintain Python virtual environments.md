[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (setV: A Bash function to maintain Python virtual environments)
[#]: via: (https://opensource.com/article/20/1/setv-bash-function)
[#]: author: (Sachin Patil https://opensource.com/users/psachin)

setV: A Bash function to maintain Python virtual environments
======
Get to know setV, a lightweight Python virtual environment manager and
alternative to virtualenvwrapper.
![Coding on a computer][1]

For more than a year, [setV][2] has been hidden away within my [bash_scripts][3] project, but it's time for it to become public. setV is a Bash function I use as an alternative to [virtualenvwrapper][4]. It provides basic features that enable you to do things such as:

  * Use Python 3 by default
  * Create a new virtual environment
  * Create a new virtual environment using a custom Python path with **-p** (or **\--python**)
  * Delete an existing virtual environment
  * List all existing virtual environment
  * Use Tab completion (in case you don't remember the virtual environment name)



### Installation

To install setV, download the script:


```
`curl https://gitlab.com/psachin/setV/raw/master/install.sh`
```

Review the script, and then run it:


```
`sh ./install.sh`
```

When you install setV, the installation script asks you to source **~/.bashrc** or **~/.bash_profile**. Be sure to do that.

### Usage

The basic command is **setv**.

#### Create a virtual environment:


```
setv --new rango  # setv -n rango

# Or using a custom Python binary path
setv --new --python /opt/python/python3 rango  # setv -n -p /opt/python/python3 rango
```

#### Activate an existing environment:


```
setv VIRTUAL_ENVIRONMENT_NAME

# For example
setv rango
```

#### List all virtual environments:


```
setv --list
# or
setv [TAB] [TAB]
```

#### Delete a virtual environment:


```
`setv --delete rango`
```

#### Switch to another virtual environment:


```
# Assuming you are in 'rango', switch to 'tango' using
setv tango
```

#### Tab Completion

If you don't fully remember the virtual environment's name, Bash-like Tab completion works for virtual environment names.

### Get involved

setV is open source under the GNU [GPLv3][5], and contributions are welcome. To learn more, visit the Contribute section of setV's [README][6] in its GitLab repository.

### The setV script


```
#!/usr/bin/env bash
# setV - A Lightweight Python virtual environment manager.
# Author: Sachin (psachin) &lt;[iclcoolster@gmail.com][7]&gt;
# Author's URL: <https://psachin.gitlab.io/about>
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
# $ setv &lt;YOUR VIRTUAL ENVIRONMENT NAME&gt;
#
# For example:
# $ setv rango
#
# or type:
# setv [TAB] [TAB]  (to list all virtual envs)
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
SETV_PYTHON_VERSION=3  # Defaults to Python3
SETV_PY_PATH=$(which python${SETV_PYTHON_VERSION})

function _setvcomplete_()
{
    # Bash-autocompletion.
    # This ensures Tab-auto-completions work for virtual environment names.
    local cmd="${1##*/}" # to handle command(s).
                         # Not necessary as such. 'setv' is the only command

    local word=${COMP_WORDS[COMP_CWORD]} # Words thats being completed
    local xpat='${word}'                 # Filter pattern. Include
                                         # only words in variable '$names'
    local names=$(ls -l "${SETV_VIRTUAL_DIR_PATH}" | egrep '^d' | awk -F " " '{print $NF}') # Virtual environment names

    COMPREPLY=($(compgen -W "$names" -X "$xpat" -- "$word")) # compgen generates the results
}

function _setv_help_() {
    # Echo help/usage message
    echo "Usage: setv [OPTIONS] [NAME]"
    echo Positional argument:
    echo -e "NAME                       Activate virtual env."
    echo Optional arguments:
    echo -e "-l, --list                 List all Virtual Envs."
    echo -e "-n, --new NAME             Create a new Python Virtual Env."
    echo -e "-d, --delete NAME          Delete existing Python Virtual Env."
    echo -e "-p, --python PATH          Python binary path."
}

function _setv_custom_python_path()
{
    if [ -f "${1}" ];
    then
        if [ "`expr $1 : '.*python\\([2,3]\\)'`" = "3" ];
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
complete  -F _setvcomplete_ setv
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/setv-bash-function

作者：[Sachin Patil][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
