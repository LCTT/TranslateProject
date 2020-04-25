[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage complex Git workspaces with Great Teeming Workspaces)
[#]: via: (https://opensource.com/article/20/2/git-great-teeming-workspaces)
[#]: author: (Daniel Gryniewicz https://opensource.com/users/dang)

使用 Great Teeming Workspaces 管理复杂的 Git 工作空间
======
GTWS 是一系列脚本，这些脚本能让我们在开发环境中管理一个有不同项目和不同版本的工程时变得更简单。
![Coding on a computer][1]

[GTWS][2] 是一个 Git 的复杂工作空间管理工具包，可以让我们在开发环境中管理一个有不同项目和不同版本的工程时变得更简单。

有点像 Python 的 [venv][3]，但不是为 Python 语言准备的。GTWS 用来处理多项目的多个版本的工作空间。你可以很容易地创建、更新、进入和离开工作空间，每个项目或版本的组合（最多）有一个本地的 origin，用来与 upstream 同步 — 其余的所有工作空间都从本地的 origin 更新。

### 部署

```
${GTWS_ORIGIN}/&lt;project&gt;/&lt;repo&gt;[/&lt;version&gt;]
${GTWS_BASE_SRCDIR}/&lt;project&gt;/&lt;version&gt;/&lt;workspacename&gt;/{&lt;repo&gt;[,&lt;repo&gt;...]}
```

源目录的每一级（包括全局的 home 目录）可以包含一个 **.gtwsrc** 文件，这个文件中维护与当前级相关的设置和 bash 代码。每一级的配置会覆盖上一级。

### 安装

用下面的命令检出 GTWS：

```
`git clone https://github.com/dang/gtws.git`
```

配置你的 **${HOME}/.gtwsrc**。它应该包含 **GTWS_ORIGIN**，也可以再包含 **GTWS_SETPROMPT**。

把仓库目录加到环境变量中：

```
`export PATH="${PATH}:/path/to/gtws`
```

### 配置

通过级联 **.gtwsrc** 文件来进行配置。它从根目录向下遍历，会执行在每级目录中找到的 **.gtwsrc** 文件。下级目录的文件会覆盖上一级。

在你最上层的文件 **~/.gtws/.gtwsrc** 中进行如下设置：

  * **GTWS_BASE_SRCDIR:** 所有项目源文件目录树的 base。默认为 **$HOME/src**。
  * **GTWS_ORIGIN:** 指定 origin git 目录树的路径。默认为 **$HOME/origin**。
  * **GTWS_SETPROMPT:** 可选配置。如果配置了这个参数，shell 提示符会有工作空间的名字。
  * **GTWS_DEFAULT_PROJECT:** 不指定项目或项目未知时默认的项目名。如果不指定，使用命令行时必须指明项目。
  * **GTWS_DEFAULT_PROJECT_VERSION:** 检出的默认版本。默认为 **master**。

在每个项目的根目录进行以下设置：

  * **GTWS_PROJECT:** 项目的名字（和 base 目录）。
  * **gtws_project_clone:** 这个函数用于克隆一个项目的指定版本。如果未定义，它会假定项目的 origin 对每一个版本都有一个单独的目录，这样会导致克隆一堆 Git 仓库。
  * **gtws_project_setup:** 在克隆完所有的仓库后，可以选择是否调用这个函数，调用后可以对项目进行必要的配置，如在 IDE 中配置工作空间。

在项目版本级进行以下设置：

  * **GTWS_PROJECT_VERSION:** 项目的版本。用于正确地从 origin 拉取代码。类似 Git 中的分支名字。

下面这些参数可以在目录树的任意地方进行配置，如果能生效，它们可以被重写多次：

  * **GTWS_PATH_EXTRA:** 这些是工作空间中加到路径后的额外的路径元素。
  * **GTWS_FILES_EXTRA:** 这些是不在版本控制内，但应该在工作空间中被检出的额外的文件。这些文件包括 **.git/info/exclude**，每个文件都与仓库的 base 相关联。

### origin 目录

**GTWS_ORIGIN** （大部分脚本中）指向拉取和推送的原始 Git 检出目录。

**${GTWS_ORIGIN}** 部署：

  * **/&lt;project&gt;**
    * 这是一个项目的仓库 base。
    * 如果指定了 **gtws_project_clone**，你可以配置任意的部署路径。
    * 如果没有指定 **gtws_project_clone**，这个路径下必须有个名为 **git** 的子目录，且 **git** 目录下有一系列用来克隆的裸 Git 仓库。

### 工作流示例

假设你有一个项目名为 **Foo**，它的 upstream 为 **github.com/foo/foo.git**。这个仓库有个名为 **bar** 的子模块，它的 upstream 是 **github.com/bar/bar.git**。Foo 项目在 master 分支开发，使用稳定版本的分支。

为了能在 Foo 中使用 GTWS，你首先要配置目录结构。本例中假设你使用默认的目录结构。

  * 配置你最上层的 **.gtwsrc**：
    * **cp ${GTWS_LOC}/examples/gtwsrc.top ~/.gtwsrc**
    * 根据需要修改 **~/.gtwsrc**。
  * 创建顶级目录：
    * **mkdir -p ~/origin ~/src**
  * 创建并配置项目目录：
    * **mkdir -p ~/src/foo**
**cp ${GTWS_LOC}/examples/gtwsrc.project ~/src/foo/.gtwsrc**
    * 根据需要修改 **~/src/foo/.gtwsrc**。
  * 创建并配置 master 版本目录：
    * **mkdir -p ~/src/foo/master**
**cp ${GTWS_LOC}/examples/gtwsrc.version ~/src/foo/master/.gtwsrc**
    * 根据需要修改 **~/src/foo/master/.gtwsrc**。
  * 进入版本目录并创建一个临时工作空间来配置镜像：
    * **mkdir -p ~/src/foo/master/tmp**
**cd ~/src/foo/master/tmp
git clone --recurse-submodules git://github.com/foo/foo.git
cd foo
gtws-mirror -o ~/origin -p foo**（译注：这个地方原文有误，不加 `-s` 参数会报错）
    * 上面命令会创建 **~/origin/foo/git/foo.git** 和 **~/origin/foo/submodule/bar.git**。
    * 以后的克隆操作会从这些 origin 而不是 upstream 克隆。
    * 现在可以删除工作空间了。

到现在为止，Foo 的 master 分支的工作可以结束了。假设你现在想修复一个 bug，名为 **bug1234**。你可以脱离你当前的工作空间为修复这个 bug 单独创建一个工作空间，之后在新创建的工作空间中开发。

  * 进入版本目录，创建一个新的工作空间：
    * **cd ~/src/foo/master
mkws bug1234**
    * 上面的命令创建了 **bug1234/**，在这个目录下检出了 Foo（和它的子模块 **bar**），并创建了 **build/foo** 来构建它。
  * 有两种方式进入工作空间：
    * **cd ~/src/foo/master/bug1234
startws**
或者
**cd ~/src/foo/master/**
**startws bug1234**
    * 上面的命令在 bug1234 工作空间中开启了一个子 shell。这个 shell 有 GTWS 的环境和你在各级 **.gtwsrc** 文件中设置的环境。它也把你工作空间的 base 路径加入到了 CD，因此你可以从 base 路径 **cd** 到相关的目录中。
    * 现在你可以修复 bug1234了，构建、测试、提交你的修改。当你可以把代码推送到 upstream 时，执行下面的命令：
**cd foo
wspush** 
    * **wspush** 会把代码推送到与你工作空间相关的分支 — 先推送到本地的 origin，再推送到 upstream。
    * 当 upstream 有修改时，你可以用下面的命令同步到本地：
**git sync**
    * 上面的命令调用了 GTWS 的 **git-sync** 脚本，会从本地 origin 更新代码。使用下面的命令来更新本地的 origin：
**git sync -o** 
    * 上面的命令会更新你本地的 origin 和子模块的镜像，然后用那些命令来更新你的检出仓库的代码。**git-sync** 也有一些其他的很好的工鞥。
    * 当要结束工作空间中的工作时，直接退出 shell：
**exit**
    * 你可以在任何时间重复进入工作空间，也可以在同一时间在相同的工作空间中开多个 shell。
  * 当你不需要某个工作空间时，你可以使用 **rmws** 来删除它，或者直接删除它的目录树。
  * 还有一个脚本 **tmws** 使用 tmux 进入工作空间，能创建一系列的窗口/窗格，这完美契合我的工作流。你可以根据你自己的需求来修改它。

### 脚本内容

```
#!/bin/bash
# Functions for gtws
#

GTWS_LOC=$(readlink -f $(dirname "${BASH_SOURCE[0]}"))
export GTWS_LOC

# if is_interactive; then echo "interactive" fi
#
# Check for an interactive shell
is_interactive() {
        case $- in
                *i*)
                        # Don't die in interactive shells
                        return 0
                        ;;
                *)
                        return 1
                        ;;
        esac
}

# if can_die; then exit
#
# Check to see if it's legal to exit during die
can_die() {
        if (( BASH_SUBSHELL &gt; 0 )); then
                debug_print "\t\tbaby shell; exiting"
                return 0
        fi
        if ! is_interactive; then
                debug_print "\t\tNot interactive; exiting"
                return 0
        fi
        debug_print "\t\tParent interactive; not exiting"
        return 1
}

# In a function:
# command || die "message" || return 1
# Outside a function:
# command || die "message"
#
# Print a message and exit with failure
die() {
        echo -e "Failed: $1" &gt;&amp;2
        if [ ! -z "$(declare -F | grep "GTWScleanup")" ]; then
                GTWScleanup
        fi
        if can_die; then
                exit 1
        fi
        return 1
}

# Alternativess for using die properly to handle both interactive and script useage:
#
# Version 1:
#
#testfunc() {
#       command1 || die "${FUNCNAME}: command1 failed" || return 1
#       command2 || die "${FUNCNAME}: command2 failed" || return 1
#       command3 || die "${FUNCNAME}: command3 failed" || return 1
#}
#
# Version 2:
#
#testfunc() {
#       (
#               command1 || die "${FUNCNAME}: command1 failed"
#               command2 || die "${FUNCNAME}: command2 failed"
#               command3 || die "${FUNCNAME}: command3 failed"
#       )
#       return $?
#}
#
# Optionally, the return can be replaced with this:
#       local val=$?
#       [[ "${val}" == "0" ]] || die
#       return ${val}
# This will cause the contaning script to abort

# usage "You need to provide a frobnicator"
#
# Print a message and the usage for the current script and exit with failure.
usage() {
        local myusage;
        if [ -n "${USAGE}" ]; then
                myusage=${USAGE}
        else
                myusage="No usage given"
        fi
        local me;
        if [ -n "${ME}" ]; then
                me=${ME}
        else
                me=$(basename $0)
        fi
        if [ -n "$1" ]; then
                echo "$@"
        fi
        echo ""
        if [ -n "${DESCRIPTION}" ]; then
                echo -e "${me}: ${DESCRIPTION}"
                echo ""
        fi
        echo "Usage:"
        echo "${me} ${myusage}"
        if [ -n "${LONGUSAGE}" ]; then
                echo -e "${LONGUSAGE}"
        fi
        exit 1
}

# debug_print "Print debug information"
#
# Print debug information based on GTWS_VERBOSE
debug_print() {
        if [ -n "${GTWS_VERBOSE}" ]; then
                echo -e "${GTWS_INDENT}$@" &gt;&amp;2
        fi
}

# debug_trace_start
#
# Start tracing all commands
debug_trace_start() {
        if [ -n "${GTWS_VERBOSE}" ]; then
                set -x
        fi
}

# debug_trace_stop
#
# Stop tracing all commands
debug_trace_stop() {
        set +x
}

# cmd_exists ${cmd}
#
# Determine if a command exists on the system
function cmd_exists {
        which $1 &gt; /dev/null 2&gt;&amp;1
        if [ "$?" == "1" ]; then
                die "You don't have $1 installed, sorry" || return 1
        fi
}

# is_git_repo ${dir}
#
# return success if ${dir} is in a git repo, or failure otherwise
is_git_repo() {
        debug_print "is_git_repo $1"
        if [[ $1 == *:* ]]; then
                debug_print "    remote; assume good"
                return 0
        elif [ ! -d "$1" ]; then
                debug_print "    fail: not dir"
                return 1
        fi
        cd "$1"
        git rev-parse --git-dir &gt;/dev/null 2&gt;&amp;1
        local ret=$?
        cd - &gt; /dev/null
        debug_print "    retval: $ret"
        return $ret
}

# find_git_repo ${basedir} ${repo_name} repo_dir
#
# Find the git repo for ${repo_name} in ${basedir}.  It's one of ${repo_name}
# or ${repo_name}.git
#
# Result will be in the local variable repo_dir  Or:
#
# repo_dir=$(find_git_repo ${basedir} ${repo_name})
#
function find_git_repo {
        local basedir=$1
        local repo_name=$2
        local __resultvar=$3
        local try="${basedir}/${repo_name}"

        if ! is_git_repo "${try}" ; then
                try=${try}.git
        fi

        is_git_repo "${try}" || die "${repo_name} in ${basedir} is not a git repository" || return 1

        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$try'"
        else
                echo "$try"
        fi
}

# git_top_dir top
#
# Get the top level of the git repo contaning PWD, or return failure;
#
# Result will be in local variable top  Or:
#
# top = $(git_top_dir)
#
# Result will be in local variable top
function git_top_dir {
        local  __resultvar=$1
        local __top="$(git rev-parse --show-toplevel 2&gt;/dev/null)"

        if [ -z "${__top}" ]; then
                die "${PWD} is not a git repo" || return 1
        fi
        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$__top'"
        else
                echo "$__top"
        fi
}

# is_git_rebase
#
# return success if git repo is in a rebase
is_git_rebase() {
        debug_print "is_git_rebase $1"
        (test -d "$(git rev-parse --git-path rebase-merge)" || \
                test -d "$(git rev-parse --git-path rebase-apply)" )
        local ret=$?
        debug_print "    retval: $ret"
        return $ret
}

# is_docker
#
# return success if process is running inside docker
is_docker() {
        debug_print "is_docker"
        grep -q docker /proc/self/cgroup
        return $?
}

# is_gtws
#
# return success if process is running inside a workspace
is_gtws() {
        if [ -n "${GTWS_WS_GUARD}" ]; then
                return 0
        fi
        return 1
}

function gtws_rcp {
        rsync --rsh=ssh -avzS --progress --ignore-missing-args --quiet "$@"
}

function gtws_cpdot {
        local srcdir=$1
        local dstdir=$2

        debug_print "${FUNCNAME} - ${srcdir} to ${dstdir}"
        if [ -d "${srcdir}" ] &amp;&amp; [ -d "${dstdir}" ]; then
                shopt -s dotglob
                cp -a "${srcdir}"/* "${dstdir}"/
                shopt -u dotglob
        fi
}

# gtws_find_dockerfile dockerfile
#
# Result will be in local variable dockerfile  Or:
#
# dockerfile = $(gtws_find_dockerfile)
#
# Result will be in local variable dockerfile
#
# Get the path to the most-specific Dockerfile
function gtws_find_dockerfile {
        local  __resultvar=$1
        local __dir="${GTWS_WSPATH}"
        local __file="Dockerfile"

        debug_print "${FUNCNAME} - trying ${__dir}/${__file}"
        if [ ! -f "${__dir}/${__file}" ]; then
                # Version dir
                __dir=$(dirname "${__dir}")
                debug_print "${FUNCNAME} - trying ${__dir}/${__file}"
        fi
        if [ ! -f "${__dir}/${__file}" ]; then
                # Project dir
                __dir=$(dirname "${__dir}")
                debug_print "${FUNCNAME} - trying ${__dir}/${__file}"
        fi
        if [ ! -f "${__dir}/${__file}" ]; then
                # Top level, flavor
                __dir="${GTWS_LOC}/dockerfiles"
                __file="Dockerfile-${FLAVOR}"
                debug_print "${FUNCNAME} - trying ${__dir}/${__file}"
        fi
        if [ ! -f "${__dir}/${__file}" ]; then
                # Top level, base
                __dir="${GTWS_LOC}/dockerfiles"
                __file="Dockerfile-base"
                debug_print "${FUNCNAME} - trying ${__dir}/${__file}"
        fi
        if [ ! -f "${__dir}/${__file}" ]; then
                die "Could not find a Dockerfile" || return 1
        fi

        debug_print "${FUNCNAME} - found ${__dir}/${__file}"
        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'${__dir}/${__file}'"
        else
                echo "$__dir"
        fi
}

# gtws_smopvn ${GTWS_SUBMODULE_ORIGIN:-${GTWS_ORIGIN}} ${GTWS_PROJECT} ${GTWS_PROJECT_VERSION} ${GTWS_WSNAME} smopvn
#
# Result will be in local variable smopvn.  Or:
#
# smopvn = $(gtws_smopvn ${GTWS_SUBMODULE_ORIGIN:-${GTWS_ORIGIN}} ${GTWS_PROJECT} ${GTWS_PROJECT_VERSION} ${GTWS_WSNAME})
#
# Result will be in local variable smovpn
#
# Get the path to submodules for this workspace
function gtws_smopvn {
        local origin=$1
        local project=$2
        local version=$3
        local name=$4
        local  __resultvar=$5
        local __smopv="${origin}/${project}/submodule"

        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$__smopv'"
        else
                echo "$__smopv"
        fi
}

# gtws_opvn ${GTWS_ORIGIN} ${GTWS_PROJECT} ${GTWS_PROJECT_VERSION} ${GTWS_WSNAME} opvn
#
# Result will be in local variable opvn.  Or:
#
# opvn = $(gtws_opvn ${GTWS_ORIGIN} ${GTWS_PROJECT} ${GTWS_PROJECT_VERSION} ${GTWS_WSNAME})
#
# Result will be in local variable opvn.
#
# Get the path to git repos for this workspace
function gtws_opvn {
        local origin=$1
        local project=$2
        local version=$3
        local name=$4
        local  __resultvar=$5
        local __opv="${origin}/${project}/${version}"

        if [[ $__opv == *:* ]]; then
                __opv="${__opv}/${name}"
                debug_print "remote; using opvn $__opv"
        elif [ ! -d "${__opv}" ]; then
                __opv="${origin}/${project}/git"
                if [ ! -d "${__opv}" ]; then
                        die "No opvn for ${origin} ${project} ${version}" || return 1
                fi
        fi
        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$__opv'"
        else
                echo "$__opv"
        fi
}

# gtws_submodule_url ${submodule} url
#
# Result will be in local variable url  Or:
#
# url = $(gtws_submodule_url ${submodule})
#
# Result will be in local variable url
#
# Get the URL for a submodule
function gtws_submodule_url {
        local sub=$1
        local  __resultvar=$2
        local __url=$(git config --list | grep "submodule.*url" | grep "\&lt;${sub}\&gt;" | cut -d = -f 2)

        if [ -z "${__url}" ]; then
                local rpath=${PWD}
                local subsub=$(basename "${sub}")
                cd "$(dirname "${sub}")"
                debug_print "${FUNCNAME} trying ${PWD}"
                __url=$(git config --list | grep submodule | grep "\&lt;${subsub}\&gt;" | cut -d = -f 2)
                cd "${rpath}"
        fi

        debug_print "${FUNCNAME} $sub url: $__url"
        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$__url'"
        else
                echo "$__url"
        fi
}

# gtws_submodule_mirror ${smopv} ${submodule} ${sub_sub_basename} mloc
#
# Result will be in local variable mloc  Or:
#
# mloc = $(gtws_submodule_mirror ${smopv} ${submodule} ${sub_sub_basename})
#
# Result will be in local variable mloc
#
# Get the path to a local mirror of the submodule, if it exists
function gtws_submodule_mirror {
        local smopv=$1
        local sub=$2
        local sub_sub=$3
        local  __resultvar=$4
        local __mloc=""
        local url=$(gtws_submodule_url ${sub})
        if [ -n "${url}" ]; then
                local urlbase=$(basename ${url})
                # XXX TODO - handle remote repositories
                #if [[ ${smopv} == *:* ]]; then
                ## Remote SMOPV means clone from that checkout; I don't cm
                #refopt="--reference ${smopv}/${name}/${sub}"
                if [ -d "${smopv}/${urlbase}" ]; then
                        __mloc="${smopv}/${urlbase}"
                fi
        fi

        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$__mloc'"
        else
                echo "$__mloc"
        fi
}

# gtws_submodule_paths subpaths
#
# Result will be in local variable subpaths  Or:
#
# subpaths = $(gtws_submodule_paths)
#
# Result will be in local variable subpaths
#
# Get the paths to submodules in a get repo.  Does not recurse
function gtws_submodule_paths {
        local  __resultvar=$1
        local __subpaths=$(git submodule status | sed 's/^ *//' | cut -d ' ' -f 2)

        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$__subpaths'"
        else
                echo "$__subpaths"
        fi
}

# gtws_submodule_clone [&lt;base-submodule-path&gt;] [&lt;sub-sub-basename&gt;]
#
# This will set up all the submodules in a repo.  Should be called from inside
# the parent repo
function gtws_submodule_clone {
        local smopv=$1
        local sub_sub=$2
        local sub_paths=$(gtws_submodule_paths)
        local rpath="${PWD}"

        if [ -z "${smopv}" ]; then
                smopv=$(gtws_smopvn "${GTWS_SUBMODULE_ORIGIN:-${GTWS_ORIGIN}}" "${GTWS_PROJECT}" "${GTWS_PROJECT_VERSION}" "${GTWS_WSNAME}")
        fi
        git submodule init || die "${FUNCNAME}: Failed to init submodules" || return 1
        for sub in ${sub_paths}; do
                local refopt=""
                local mirror=$(gtws_submodule_mirror "${smopv}" "${sub}" "${sub_sub}")
                debug_print "${FUNCNAME} mirror: ${mirror}"
                if [ -n "${mirror}" ]; then
                        refopt="--reference ${mirror}"
                fi
                git submodule update ${refopt} "${sub}"
                # Now see if there are recursive submodules
                cd "${sub}"
                gtws_submodule_clone "${smopv}/${sub}_submodule" "${sub}" || return 1
                cd "${rpath}"
        done
}

# gtws_repo_clone &lt;base-repo-path&gt; &lt;repo&gt; &lt;branch&gt; [&lt;base-submodule-path&gt;] [&lt;target-directory&gt;]
function gtws_repo_clone {
        local baserpath=${1%/}
        local repo=$2
        local branch=$3
        local basesmpath=$4
        local rname=${5:-${repo%.git}}
        local rpath="${baserpath}/${repo}"
        local origpath=${PWD}

        if [[ ${rpath} != *:* ]]; then
                if [ ! -d "${rpath}" ]; then
                        rpath="${rpath}.git"
                fi
        fi
        if [ -z "${basesmpath}" ]; then
                basesmpath="${baserpath}"
        fi
        debug_print "${FUNCNAME}: cloning ${baserpath} - ${repo} : ${branch} into ${GTWS_WSNAME}/${rname} submodules: ${basesmpath}"

        # Main repo
        #git clone --recurse-submodules -b "${branch}" "${rpath}" || die "failed to clone ${rpath}:${branch}" || return 1
        git clone -b "${branch}" "${rpath}" ${rname} || die "${FUNCNAME}: failed to clone ${rpath}:${branch}" || return 1

        # Update submodules
        cd "${rname}" || die "${FUNCNAME}: failed to cd to ${rpath}" || return 1
        gtws_submodule_clone "${basesmpath}" || return 1
        cd "${origpath}" || die "${FUNCNAME}: Failed to cd to ${origpath}" || return 1

        # Copy per-repo settings, if they exist
        gtws_cpdot "${baserpath%/git}/extra/repo/${rname}" "${origpath}/${rname}"

        # Extra files
        for i in ${GTWS_FILES_EXTRA}; do
                local esrc=

                IFS=':' read -ra ARR &lt;&lt;&lt; "$i"
                if [ -n "${ARR[1]}" ]; then
                        dst="${rname}/${ARR[1]}"
                else
                        dst="${rname}/${ARR[0]}"
                fi

                if [ -n "${GTWS_REMOTE_IS_WS}" ]; then
                        esrc="${baserpath}/${dst}"
                else
                        esrc="${baserpath%/git}"
                fi

                gtws_rcp "${esrc}/${ARR[0]}" "${dst}"
        done
}

# gtws_project_clone_default ${GTWS_ORIGIN} ${GTWS_PROJECT} ${GTWS_PROJECT_VERSION} ${GTWS_WSNAME} [${SUBMODULE_BASE}]
#
# Clone a version of a project into ${GTWS_WSPATH} (which is the current working directory).  This is the default version of this that clones &lt;origin&gt;/&lt;project&gt;/&lt;version&gt;/*
function gtws_project_clone_default {
        local origin=$1
        local project=$2
        local version=$3
        local name=$4
        local basesmpath=$5
        local opv=$(gtws_opvn "${origin}" "${project}" "${version}" "${name}")
        local wspath=${PWD}
        local repos=
        local -A branches

        if [ -z "${GTWS_PROJECT_REPOS}" ]; then
                for i in "${opv}"/*; do
                        repos="$(basename $i) $repos"
                        branches[$i]=${version}
                done
        else
                for i in ${GTWS_PROJECT_REPOS}; do
                        IFS=':' read -ra ARR &lt;&lt;&lt; "$i"
                        repos="${ARR[0]} $repos"
                        if [ -n "${ARR[1]}" ]; then
                                branches[${ARR[0]}]=${ARR[1]}
                        else
                                branches[${ARR[0]}]=${version}
                        fi
                done
        fi

        if [ -z "${basesmpath}" ] || [ ! -d "${basesmpath}" ]; then
                basesmpath="${opv}"
        fi

        for repo in ${repos}; do
                gtws_repo_clone "${opv}" "${repo}" "${branches[${repo}]}" "${basesmpath}"
        done

        # Copy per-WS settings, if they exist
        gtws_cpdot "${opv%/git}/extra/ws" "${wspath}"
}

# gtws_repo_setup ${wspath} ${repo_path}
#
# The project can define gtws_repo_setup_local taking the same args to do
# project-specific setup.  It will be called last.
#
# Post-clone setup for an individual repo
function gtws_repo_setup {
        local wspath=$1
        local rpath=$2
        local savedir="${PWD}"

        if [ ! -d "${rpath}" ]; then
                return 0
        fi

        cd "${rpath}/src" 2&gt;/dev/null \
                || cd ${rpath} \
                || die "Couldn't cd to ${rpath}" || return 1

        maketags ${GTWS_MAKETAGS_OPTS} &gt; /dev/null 2&gt; /dev/null &amp;

        cd ${wspath} || die "Couldn't cd to ${wspath}" || return 1

        mkdir -p "${wspath}/build/$(basename ${rpath})"

        cd "${savedir}"

        if [ -n "$(declare -F | grep "\&lt;gtws_repo_setup_local\&gt;")" ]; then
                gtws_repo_setup_local "${wspath}" "${rpath}" \
                        || die "local repo setup failed" || return 1
        fi
}

# gtws_project_setup${GTWS_WSNAME} ${GTWS_ORIGIN} ${GTWS_PROJECT} ${GTWS_PROJECT_VERSION}
#
# The project can define gtws_project_setup_local taking the same args to do
# project-specific setup.  It will be called last.
#
# Post clone setup of a workspace in ${GTWS_WSPATH} (which is PWD)
function gtws_project_setup {
        local wsname=$1
        local origin=$2
        local project=$3
        local version=$4
        local wspath=${PWD}
        local opv=$(gtws_opvn "${origin}" "${project}" "${version}" "placeholder")

        for i in "${wspath}"/*; do
                gtws_repo_setup "${wspath}" "${i}"
        done

        mkdir "${wspath}"/install
        mkdir "${wspath}"/chroots
        mkdir "${wspath}"/patches

        if [ -n "$(declare -F | grep "\&lt;gtws_project_setup_local\&gt;")" ]; then
                gtws_project_setup_local "${wsname}" "${origin}" "${project}" \
                        "${version}" || die "local project setup failed" || return 1
        fi
}

# load_rc /path/to/workspace
#
# This should be in the workspace-level gtwsrc file
# Recursively load all RC files, starting at /
function load_rc {
        local BASE=$(readlink -f "${1}")
        # Load base RC first
        debug_print "load_rc: Enter + Top: ${BASE}"
        source "${HOME}"/.gtwsrc
        while [ "${BASE}" !=  "/" ]; do
                if [ -f "${BASE}"/.gtwsrc ]; then
                        load_rc "$(dirname ${BASE})"
                        debug_print "\tLoading ${BASE}/.gtwsrc"
                        source "${BASE}"/.gtwsrc
                        return 0
                fi
                BASE=$(readlink -f $(dirname "${BASE}"))
        done
        # Stop at /

        return 1
}

# clear_env
#
# Clear the environment of GTWS_* except for the contents of GTWS_SAVEVARS.
# The default values for GTWS_SAVEVARS are below.
function clear_env {
        local savevars=${GTWS_SAVEVARS:-"LOC PROJECT PROJECT_VERSION VERBOSE WSNAME"}
        local verbose="${GTWS_VERBOSE}"
        debug_print "savevars=$savevars"

        # Reset prompt
        if [ -n "${GTWS_SAVEPS1}" ]; then
                PS1="${GTWS_SAVEPS1}"
        fi
        if [ -n "${GTWS_SAVEPATH}" ]; then
                export PATH=${GTWS_SAVEPATH}
        fi
        unset LD_LIBRARY_PATH
        unset PYTHONPATH
        unset PROMPT_COMMAND
        unset CDPATH
        unset SDIRS

        # Save variables
        for i in ${savevars}; do
                SRC=GTWS_${i}
                DST=SAVE_${i}
                debug_print "\t $i: ${DST} = ${!SRC}"
                eval ${DST}=${!SRC}
        done

        # Clear GTWS evironment
        for i in ${!GTWS*} ; do
                if [ -n "${verbose}" ]; then
                        echo -e "unset $i" &gt;&amp;2
                fi
                unset $i
        done

        # Restore variables
        for i in ${savevars}; do
                SRC=SAVE_${i}
                DST=GTWS_${i}
                if [ -n "${verbose}" ]; then
                        echo -e "\t $i: ${DST} = ${!SRC}" &gt;&amp;2
                fi
                if [ -n "${!SRC}" ]; then
                        eval export ${DST}=${!SRC}
                fi
                unset ${SRC}
        done
}

# save_env ${file} ${nukevars}
#
# Save the environment of GTWS_* to the give file, except for the variables
# given to nuke.  The default values to nuke are given below.
function save_env {
        local fname=${1}
        local nukevars=${2:-"SAVEPATH ORIGIN WS_GUARD LOC SAVEPS1"}
        debug_print "nukevars=$nukevars"

        for i in ${!GTWS*} ; do
                for j in ${nukevars}; do
                        if [ "${i}" == "GTWS_${j}" ]; then
                                debug_print "skipping $i"
                                continue 2
                        fi
                done
                debug_print "saving $i"
                echo "export $i=\"${!i}\"" &gt;&gt; "${fname}"
        done
}

# gtws_tmux_session_name ${PROJECT} ${VERSION} ${WSNAME} sesname
#
# Result will be in local variable sesname  Or:
#
# sesname = $(gtws_tmux_session_name ${PROJECT} ${VERSION} ${WSNAME})
#
# Result will be in local variable sesname
#
# Get the tmux session name for a given workspace
function gtws_tmux_session_name {
        local project=$1
        local version=$2
        local wsname=$3
        local  __resultvar=$4
        local sesname="${project//./_}/${version//./_}/${wsname//./_}"

        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$sesname'"
        else
                echo "$sesname"
        fi
}

# gtws_tmux_session_info ${SESSION_NAME} running attached
#
# Determine if a session is running, and if it is attached
#
# Result will be in local variables running and attached
#
# Test with:
# if $running ; then
#       echo "is running"
# fi

function gtws_tmux_session_info {
        local ses_name=$1
        local  __result_running=$2
        local  __result_attached=$3

        local __num_ses=$(tmux ls | grep "^${ses_name}" | wc -l)
        local __attached=$(tmux ls | grep "^${ses_name}" | grep attached)

        echo "$ses_name ses=${__num_ses}"

        if [[ "$__result_running" ]]; then
                if [ "${__num_ses}" != "0" ]; then
                        eval $__result_running="true"
                else
                        eval $__result_running="false"
                fi
        fi
        if [[ "$__result_attached" ]]; then
                if [ -n "${__attached}" ]; then
                        eval $__result_attached="true"
                else
                        eval $__result_attached="false"
                fi
        fi
}

# gtws_tmux_kill ${BASENAME}
#
# Kill all sessiont matching a pattern
function gtws_tmux_kill {
        local basename=$1
        local old_sessions=$(tmux ls 2&gt;/dev/null | fgrep "${basename}" | cut -f 1 -d:)
        for session in ${old_sessions}; do
                tmux kill-session -t "${session}"
        done
}

# gtws_tmux_cleanup
#
# Clean up defunct tmux sessions
function gtws_tmux_cleanup {
        local old_sessions=$(tmux ls 2&gt;/dev/null | egrep "^[0-9]{14}.*[0-9]+\\)$" | cut -f 1 -d:)
        for session in ${old_sessions}; do
                tmux kill-session -t "${session}"
        done
}

# gtws_tmux_attach ${SESSION_NAME}
#
# Attach to a primary session.  It will remain after detaching.
function gtws_tmux_attach {
        local ses_name=$1

        tmux attach-session -t "${ses_name}"
}

# gtws_tmux_slave ${SESSION_NAME}
#
# Create a secondary session attached to the primary session.  It will exit it
# is detached.
function gtws_tmux_slave {
        local ses_name=$1

        # Session is is date and time to prevent conflict
        local session=`date +%Y%m%d%H%M%S`
        # Create a new session (without attaching it) and link to base session
        # to share windows
        tmux new-session -d -t "${ses_name}" -s "${session}"
        # Attach to the new session
        gtws_tmux_attach "${session}"
        # When we detach from it, kill the session
        tmux kill-session -t "${session}"
}

function cdorigin() {
        if [ -n "$(declare -F | grep "gtws_project_cdorigin")" ]; then
                gtws_project_cdorigin $@
        else
                gtws_cdorigin $@
        fi
}

function gtws_get_origin {
        local opv=$1
        local target=$2
        local __origin=
        local  __resultvar=$3

        # If it's a git repo with a local origin, use that.
        __origin=$(git config --get remote.origin.url)
        if [ ! -d "${__origin}" ]; then
                __origin="${__origin}.git"
        fi
        if [ ! -d "${__origin}" ]; then
                # Try to figure it out
                if [ ! -d "${opv}" ]; then
                        die "No opv for $target" || return 1
                fi
                find_git_repo "${opv}" "${target}" __origin || return 1
        fi

        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$__origin'"
        else
                echo "$__origin"
        fi
}

function gtws_cdorigin() {
        local opv=$(gtws_opvn "${GTWS_ORIGIN}" "${GTWS_PROJECT}" "${GTWS_PROJECT_VERSION}" "${GTWS_WSNAME}")
        local gitdir=""
        local target=""
        if [ -n "$1" ]; then
                target="$@"
        else
                git_top_dir gitdir || return 1
                target=$(basename $gitdir)
        fi

        gtws_get_origin $opv $target origin || return 1
        cd "${origin}"
}

# Copy files to another machine in the same workspace
function wsrcp {
        local target="${!#}"
        local length=$(($#-1))
        local base=${PWD}

        if [ -z "${1}" -o -z "${2}" ]; then
                echo "usage: ${FUNCNAME} &lt;path&gt; [&lt;path&gt;...] &lt;target&gt;"
                return 1
        fi

        for path in "${@:1:$length}"; do
                gtws_rcp "${path}" "${target}:${base}/${path}"
        done
}

# Override "cd" inside the workspace to go to GTWS_WSPATH by default
function cd {
        if [ -z "$@" ]; then
                cd "${GTWS_WSPATH}"
        else
                builtin cd $@
        fi
}

# Generate diffs/interdiffs for changes and ship to WS on other boxes
function gtws_interdiff {
        local targets=$@
        local target=
        local savedir=${PWD}
        local topdir=$(git_top_dir)
        local repo=$(basename ${topdir})
        local mainpatch="${GTWS_WSPATH}/patches/${repo}-full.patch"
        local interpatch="${GTWS_WSPATH}/patches/${repo}-incremental.patch"

        if [ -z "${targets}" ]; then
                echo "Usage: ${FUNCNAME} &lt;targethost&gt;"
                die "Must give targethost" || return 1
        fi
        cd "${topdir}"
        if [ -f "${mainpatch}" ]; then
                git diff | interdiff "${mainpatch}" - &gt; "${interpatch}"
        fi
        git diff &gt; "${mainpatch}"
        for target in ${targets}; do
                gtws_rcp "${mainpatch}" "${interpatch}" \
                        "${target}:${GTWS_WSPATH}/patches"
        done
        cd "${savedir}"
}

function gtws_debug {
        local cmd=$1
        if [ -z "${cmd}" ]; then
                echo "Must give a command"
                echo
                die "${FUNCNAME} &lt;cmd-path&gt;" || return 1
        fi
        local cmdbase=$(basename $cmd)
        local pid=$(pgrep "${cmdbase}")

        ASAN_OPTIONS="abort_on_error=1" cgdb ${cmd} ${pid}
}

# remote_cmd "${target}" "${command}" output
#
# Result will be in local variable output  Or:
#
# output = $(remote_cmd "${target}" "${command}")
#
# Result will be in local variable output
#
# Run a command remotely and capture sdtout.  Make sure to quote the command
# appropriately.
remote_cmd() {
        local target=$1
        local cmd=$2
        local  __resultvar=$3
        local output=

        if [ -z "${GTWS_VERBOSE}" ]; then
                output=$(ssh "${target}" "${cmd}" 2&gt;/dev/null)
        else
                output=$(ssh "${target}" "${cmd}")
        fi
        local ret=$?

        if [[ "$__resultvar" ]]; then
                eval $__resultvar="'$output'"
        else
                echo "${output}"
        fi
        return ${ret}
}
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/git-great-teeming-workspaces

作者：[Daniel Gryniewicz][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dang
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://github.com/dang/gtws
[3]: https://docs.python.org/3/library/venv.html
