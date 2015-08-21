Translating by Ezio

Process of the Linux kernel building
如何构建Linux 内核的
================================================================================
介绍
--------------------------------------------------------------------------------

I will not tell you how to build and install custom Linux kernel on your machine, you can find many many [resources](https://encrypted.google.com/search?q=building+linux+kernel#q=building+linux+kernel+from+source+code) that will help you to do it. Instead, we will know what does occur when you are typed `make` in the directory with Linux kernel source code in this part. When I just started to learn source code of the Linux kernel, the [Makefile](https://github.com/torvalds/linux/blob/master/Makefile) file was a first file that I've opened. And it was scary :) This [makefile](https://en.wikipedia.org/wiki/Make_%28software%29) contains `1591` lines of code at the time when I wrote this part and it was [third](https://github.com/torvalds/linux/commit/52721d9d3334c1cb1f76219a161084094ec634dc) release candidate.

我不会告诉你怎么在自己的电脑上去构建、安装一个定制化的Linux 内核，这样的[资料](https://encrypted.google.com/search?q=building+linux+kernel#q=building+linux+kernel+from+source+code) 太多了，它们会对你有帮助。本文会告诉你当你在内核源码路径里敲下`make` 时会发生什么。当我刚刚开始学习内核代码时，[Makefile](https://github.com/torvalds/linux/blob/master/Makefile) 是我打开的第一个文件，这个文件真令人害怕 :)。那时候这个[Makefile](https://en.wikipedia.org/wiki/Make_%28software%29) 包含了`1591` 行代码，当我开始写本文是，这个[Makefile](https://github.com/torvalds/linux/commit/52721d9d3334c1cb1f76219a161084094ec634dc) 已经是第三个候选版本了。

This makefile is the the top makefile in the Linux kernel source code and kernel build starts here. Yes, it is big, but moreover, if you've read the source code of the Linux kernel you can noted that all directories with a source code has an own makefile. Of course it is not real to describe how each source files compiled and linked. So, we will see compilation only for the standard case. You will not find here building of the kernel's documentation, cleaning of the kernel source code, [tags](https://en.wikipedia.org/wiki/Ctags) generation, [cross-compilation](https://en.wikipedia.org/wiki/Cross_compiler) related stuff and etc. We will start from the `make` execution with the standard kernel configuration file and will finish with the building of the [bzImage](https://en.wikipedia.org/wiki/Vmlinux#bzImage).

It would be good if you're already familiar with the [make](https://en.wikipedia.org/wiki/Make_%28software%29) util, but I will anyway try to describe all code that will be in this part.

So let's start.

这个makefile 是Linux 内核代码的顶端makefile ，内核构件就始于此处。是的，它的内容很多，但是如果你已经读过内核源代码，你就会发现每个包含代码的目录都有一个自己的makefile。当然了，我们不会去描述每个代码文件是怎么编译链接的。所以我们将只会挑选一些通用的例子来说明问题，而你不会在这里找到构建内核的文档，如何整洁内核代码， [tags](https://en.wikipedia.org/wiki/Ctags) 的生成，和[交叉编译](https://en.wikipedia.org/wiki/Cross_compiler)  相关的说明，等等。我们将从`make` 开始，使用标准的内核配置文件，到生成了内核镜像[bzImage](https://en.wikipedia.org/wiki/Vmlinux#bzImage) 结束。

如果你已经很了解[make](https://en.wikipedia.org/wiki/Make_%28software%29) 工具那是最好，但是我也会描述本文出现的相关代码。

让我们开始吧


Preparation before the kernel compilation
编译内核前的准备
---------------------------------------------------------------------------------

There are many things to preparate before the kernel compilation will be started. The main point here is to find and configure 
the type of compilation, to parse command line arguments that are passed to the `make` util and etc. So let's dive into the top `Makefile` of the Linux kernel.

在开始便以前要进行很多准备工作。最主要的就是找到并配置好配置文件，`make` 命令要使用到的参数都需要从这些配置文件获取。

The Linux kernel top `Makefile` is responsible for building two major products: [vmlinux](https://en.wikipedia.org/wiki/Vmlinux) (the resident kernel image) and the modules (any module files). The [Makefile](https://github.com/torvalds/linux/blob/master/Makefile) of the Linux kernel starts from the definition of the following variables:

内核顶端的`Makefile` 负责构建两个主要的产品：[vmlinux](https://en.wikipedia.org/wiki/Vmlinux) （内核镜像可执行文件）和模块文件。内核的 [Makefile](https://github.com/torvalds/linux/blob/master/Makefile)  以次开始：

```Makefile
VERSION = 4
PATCHLEVEL = 2
SUBLEVEL = 0
EXTRAVERSION = -rc3
NAME = Hurr durr I'ma sheep
```

These variables determine the current version of the Linux kernel and are used in the different places, for example in the forming of the `KERNELVERSION` variable:

这些变量决定了当前内核的版本，并且被使用在很多不同的地方，比如`KERNELVERSION` ：

```Makefile
KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
```

After this we can see a couple of the `ifeq` condition that check some of the parameters passed to `make`. The Linux kernel `makefiles` provides a special `make help` target that prints all available targets and some of the command line arguments that can be passed to `make`. For example: `make V=1` - provides verbose builds. The first `ifeq` condition checks if the `V=n` option is passed to make:

接下来我们会看到很多`ifeq` 条件判断语句，它们负责检查传给`make` 的参数。内核的`Makefile` 提供了一个特殊的编译选项`make help` ，这个选项可以生成所有的可用目标和一些能传给`make` 的有效的命令行参数。举个例子，`make V=1` 会在构建过程中输出详细的编译信息，第一个`ifeq` 就是检查传递给make的`V=n` 选项。

```Makefile
ifeq ("$(origin V)", "command line")
  KBUILD_VERBOSE = $(V)
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 0
endif

ifeq ($(KBUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet=quiet_
  Q = @
endif

export quiet Q KBUILD_VERBOSE
```

If this option is passed to `make` we set the `KBUILD_VERBOSE` variable to the value of the `V` option. Otherwise we set the `KBUILD_VERBOSE` variable to zero. After this we check value of the `KBUILD_VERBOSE` variable and set values of the `quiet` and `Q` variables depends on the `KBUILD_VERBOSE` value. The `@` symbols suppress the output of the command and if it will be set before a command we will see something like this: `CC scripts/mod/empty.o` instead of the `Compiling .... scripts/mod/empty.o`. In the end we just export all of these variables. The next `ifeq` statement checks that `O=/dir` option was passed to the `make`. This option allows to locate all output files in the given `dir`:

如果`V=n` 这个选项传给了`make` ，系统就会给变量`KBUILD_VERBOSE` 选项附上`V` 的值，否则的话`KBUILD_VERBOSE` 就会为0。然后系统会检查`KBUILD_VERBOSE` 的值，以此来决定`quiet`  和`Q` 的值。符号`@` 控制命令的输出，如果它被放在一个命令之前，这条命令的执行将会是`CC scripts/mod/empty.o`，而不是`Compiling .... scripts/mod/empty.o`（注：CC 在makefile 中一般都是编译命令）。最后系统仅仅导出所有的变量。下一个`ifeq` 语句检查的是传递给`make` 的选项`O=/dir`，这个选项允许在指定的目录`dir` 输出所有的结果文件：

```Makefile
ifeq ($(KBUILD_SRC),)

ifeq ("$(origin O)", "command line")
  KBUILD_OUTPUT := $(O)
endif

ifneq ($(KBUILD_OUTPUT),)
saved-output := $(KBUILD_OUTPUT)
KBUILD_OUTPUT := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) \
								&& /bin/pwd)
$(if $(KBUILD_OUTPUT),, \
     $(error failed to create output directory "$(saved-output)"))

sub-make: FORCE
	$(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR) \
	-f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))

skip-makefile := 1
endif # ifneq ($(KBUILD_OUTPUT),)
endif # ifeq ($(KBUILD_SRC),)
```

We check the `KBUILD_SRC` that represent top directory of the source code of the linux kernel and if it is empty (it is empty every time while makefile executes first time) and the set the `KBUILD_OUTPUT` variable to the value that passed with the `O` option (if this option was passed). In the next step we check this `KBUILD_OUTPUT` variable and if we set it, we do following things:

* Store value of the `KBUILD_OUTPUT` in the temp `saved-output` variable;
* Try to create given output directory;
* Check that directory created, in other way print error;
* If custom output directory created sucessfully, execute `make` again with the new directory (see `-C` option).

The next `ifeq` statements checks that `C` or `M` options was passed to the make: 
系统会检查变量`KBUILD_SRC`，如果他是空的（第一次执行makefile 时总是空的），并且变量`KBUILD_OUTPUT` 被设成了选项`O` 的值（如果这个选项被传进来了），那么这个值就会用来代表内核源码的顶层目录。下一步会检查变量`KBUILD_OUTPUT` ，如果之前设置过这个变量，那么接下来会做一下几件事：

* 将变量`KBUILD_OUTPUT` 的值保存到临时变量`saved-output`；
* 尝试创建输出目录；
* 检查创建的输出目录，如果失败了就打印错误；
* 如果成功创建了输出目录，那么就在新目录重新执行`make` 命令（参见选项`-C`）。

下一个`ifeq` 语句会检查传递给make 的选项`C` 和`M`：

```Makefile
ifeq ("$(origin C)", "command line")
  KBUILD_CHECKSRC = $(C)
endif
ifndef KBUILD_CHECKSRC
  KBUILD_CHECKSRC = 0
endif

ifeq ("$(origin M)", "command line")
  KBUILD_EXTMOD := $(M)
endif
```

The first `C` option tells to the `makefile` that need to check all `c` source code with a tool provided by the `$CHECK` environment variable, by default it is [sparse](https://en.wikipedia.org/wiki/Sparse). The second `M` option provides build for the external modules (will not see this case in this part). As we set this variables we make a check of the `KBUILD_SRC` variable and if it is not set we set `srctree` variable to `.`:

第一个选项`C` 会告诉`makefile` 需要使用环境变量`$CHECK` 提供的工具来检查全部`c` 代码，默认情况下会使用[sparse](https://en.wikipedia.org/wiki/Sparse)。第二个选项`M` 会用来编译外部模块（本文不做讨论）。因为设置了这两个变量，系统还会检查变量`KBUILD_SRC`，如果`KBUILD_SRC` 没有被设置，系统会设置变量`srctree` 为`.`：

```Makefile
ifeq ($(KBUILD_SRC),)
        srctree := .
endif
		
objtree	:= .
src		:= $(srctree)
obj		:= $(objtree)

export srctree objtree VPATH
```

That tells to `Makefile` that source tree of the Linux kernel will be in the current directory where `make` command was executed. After this we set `objtree` and other variables to this directory and export these variables. The next step is the setting value for the `SUBARCH` variable that will represent what the underlying archicecture is:

这将会告诉`Makefile` 内核的源码树就在执行make 命令的目录。然后要设置`objtree` 和其他变量为执行make 命令的目录，并且将这些变量导出。接着就是要获取`SUBARCH` 的值，这个变量代表了当前的系统架构（注：一般值CPU 架构）：

```Makefile
SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
				  -e s/sun4u/sparc64/ \
				  -e s/arm.*/arm/ -e s/sa110/arm/ \
				  -e s/s390x/s390/ -e s/parisc64/parisc/ \
				  -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
				  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ )
```

As you can see it executes [uname](https://en.wikipedia.org/wiki/Uname) utils that prints information about machine, operating system and architecture. As it will get output of the `uname` util, it will parse it and assign to the `SUBARCH` variable. As we got `SUBARCH`, we set the `SRCARCH` variable that provides directory of the certain architecture and `hfr-arch` that provides directory for the header files:

如你所见，系统执行[uname](https://en.wikipedia.org/wiki/Uname) 得到机器、操作系统和架构的信息。因为我们得到的是`uname` 的输出，所以我们需要做一些处理在赋给变量`SUBARCH` 。获得`SUBARCH` 之后就要设置`SRCARCH` 和`hfr-arch`，`SRCARCH`提供了硬件架构相关代码的目录，`hfr-arch` 提供了相关头文件的目录：

```Makefile
ifeq ($(ARCH),i386)
        SRCARCH := x86
endif
ifeq ($(ARCH),x86_64)
        SRCARCH := x86
endif

hdr-arch  := $(SRCARCH)
```

Note that `ARCH` is the alias for the `SUBARCH`. In the next step we set the `KCONFIG_CONFIG` variable that represents path to the kernel configuration file and if it was not set before, it will be `.config` by default:

注意：`ARCH` 是`SUBARCH` 的别名。如果没有设置过代表内核配置文件路径的变量`KCONFIG_CONFIG`，下一步系统会设置他，默认情况下就是`.config` ：

```Makefile
KCONFIG_CONFIG	?= .config
export KCONFIG_CONFIG
```

and the [shell](https://en.wikipedia.org/wiki/Shell_%28computing%29) that will be used during kernel compilation:

和编译内核过程中要用到的[shell](https://en.wikipedia.org/wiki/Shell_%28computing%29)

```Makefile
CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
	  else if [ -x /bin/bash ]; then echo /bin/bash; \
	  else echo sh; fi ; fi)
```

The next set of variables related to the compiler that will be used during Linux kernel compilation. We set the host compilers for the `c` and `c++` and flags for it:

接下来就要设置一组和编译内核的编译器相关的变量。我们会设置host 的C 和C++ 的编译器及相关配置项：


```Makefile
HOSTCC       = gcc
HOSTCXX      = g++
HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
HOSTCXXFLAGS = -O2
```

Next we will meet the `CC` variable that represent compiler too, so why do we need in the `HOST*` variables? The `CC` is the target compiler that will be used during kernel compilation, but `HOSTCC` will be used during compilation of the set of the `host` programs (we will see it soon). After this we can see definition of the `KBUILD_MODULES` and `KBUILD_BUILTIN` variables that are used for the determination of the what to compile (kernel, modules or both):

然后会去适配代表编译器的变量`CC`,为什么还要`HOST*` 这些选项呢？`CC` 是编译内核过程中要使用的目标架构的编译器，但是`HOSTCC` 是要被用来编译一组`host` 程序的（下面我们就会看到）。然后我们就看看变量`KBUILD_MODULES` 和`KBUILD_BUILTIN` 的定义，这两个变量据欸的那个了我们要编译什么（内核、模块还是其他？）：

```Makefile
KBUILD_MODULES :=
KBUILD_BUILTIN := 1

ifeq ($(MAKECMDGOALS),modules)
  KBUILD_BUILTIN := $(if $(CONFIG_MODVERSIONS),1)
endif
```

Here we can see definition of these variables and the value of the `KBUILD_BUILTIN` will depens on the `CONFIG_MODVERSIONS` kernel configuration parameter if we pass only `modules` to the `make`. The next step is including of the:

在这我们可以看到这些变量的定义，并且，如果们仅仅传递了`modules` 给`make`,变量`KBUILD_BUILTIN` 会依赖于内核配置选项`CONFIG_MODVERSIONS`。下一步操作是引入：

```Makefile
include scripts/Kbuild.include
```

`kbuild` file. The [Kbuild](https://github.com/torvalds/linux/blob/master/Documentation/kbuild/kbuild.txt) or `Kernel Build System` is the special infrastructure to manage building of the kernel and its modules. The `kbuild` files has the same syntax that makefiles. The [scripts/Kbuild.include](https://github.com/torvalds/linux/blob/master/scripts/Kbuild.include) file provides some generic definitions for the `kbuild` system. As we included this `kbuild` files we can see definition of the variables that are related to the different tools that will be used during kernel and modules compilation (like linker, compilers, utils from the [binutils](http://www.gnu.org/software/binutils/) and etc...):

文件`kbuild` ,[Kbuild](https://github.com/torvalds/linux/blob/master/Documentation/kbuild/kbuild.txt) 或者又叫做 `Kernel Build System`是一个用来管理构建内核和模块的特殊框架。`kbuild` 文件的语法与makefile 一样。文件[scripts/Kbuild.include](https://github.com/torvalds/linux/blob/master/scripts/Kbuild.include) 为`kbuild` 系统同提供了一些原生的定义。因为我们包含了这个`kbuild` 文件，我们可以看到和不同工具关联的这些变量的定义，这些工具会在内核和模块编译过程中被使用（比如链接器、编译器、二进制工具包[binutils](http://www.gnu.org/software/binutils/)，等等）：

```Makefile
AS		= $(CROSS_COMPILE)as
LD		= $(CROSS_COMPILE)ld
CC		= $(CROSS_COMPILE)gcc
CPP		= $(CC) -E
AR		= $(CROSS_COMPILE)ar
NM		= $(CROSS_COMPILE)nm
STRIP		= $(CROSS_COMPILE)strip
OBJCOPY		= $(CROSS_COMPILE)objcopy
OBJDUMP		= $(CROSS_COMPILE)objdump
AWK		= awk
...
...
...
```

After definition of these variables we define two variables: `USERINCLUDE` and `LINUXINCLUDE`. They will contain paths of the directories with headers (public for users in the first case and for kernel in the second case):

在这些定义好的变量之后，我们又定义了两个变量：`USERINCLUDE` 和`LINUXINCLUDE`。他们为包含头文件的路径（第一个是给用户用的，第二个是给内核用的）：

```Makefile
USERINCLUDE    := \
		-I$(srctree)/arch/$(hdr-arch)/include/uapi \
		-Iarch/$(hdr-arch)/include/generated/uapi \
		-I$(srctree)/include/uapi \
		-Iinclude/generated/uapi \
        -include $(srctree)/include/linux/kconfig.h

LINUXINCLUDE    := \
		-I$(srctree)/arch/$(hdr-arch)/include \
		...
```

And the standard flags for the C compiler:
以及标准的C 编译器标志：
```Makefile
KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
		   -fno-strict-aliasing -fno-common \
		   -Werror-implicit-function-declaration \
		   -Wno-format-security \
		   -std=gnu89
```

It is the not last compiler flags, they can be updated by the other makefiles (for example kbuilds from `arch/`). After all of these, all variables will be exported to be available in the other makefiles. The following two the `RCS_FIND_IGNORE` and the `RCS_TAR_IGNORE` variables will contain files that will be ignored in the version control system:
这并不是最终确定的编译器标志，他们还可以在其他makefile 里面更新（比如`arch/` 里面的kbuild）。经过所有这些，全部变量会被导出，这样其他makefile 就可以直接使用了。下面的两个变量`RCS_FIND_IGNORE` 和 `RCS_TAR_IGNORE` 包含了被版本控制系统忽略的文件：

```Makefile
export RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o    \
			  -name CVS -o -name .pc -o -name .hg -o -name .git \) \
			  -prune -o
export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn \
			 --exclude CVS --exclude .pc --exclude .hg --exclude .git
```

That's all. We have finished with the all preparations, next point is the building of `vmlinux`.

这就是全部了，我们已经完成了所有的准备工作，下一个点就是如果构建`vmlinux`.

Directly to the kernel build
直面构建内核
--------------------------------------------------------------------------------

As we have finished all preparations, next step in the root makefile is related to the kernel build. Before this moment we will not see in the our terminal after the execution of the `make` command. But now first steps of the compilation are started. In this moment we need to go on the [598](https://github.com/torvalds/linux/blob/master/Makefile#L598) line of the Linux kernel top makefile and we will see `vmlinux` target there:

现在我们已经完成了所有的准备工作，根makefile（注：内核根目录下的makefile）的下一步工作就是和编译内核相关的了。在我们执行`make` 命令之前，我们不会在终端看到任何东西。但是现在编译的第一步开始了，这里我们需要从内核根makefile的的[598](https://github.com/torvalds/linux/blob/master/Makefile#L598) 行开始，这里可以看到目标`vmlinux`：

```Makefile
all: vmlinux
	include arch/$(SRCARCH)/Makefile
```

Don't worry that we have missed many lines in Makefile that are placed after `export RCS_FIND_IGNORE.....` and before `all: vmlinux.....`. This part of the makefile is responsible for the `make *.config` targets and as I wrote in the beginning of this part we will see only building of the kernel in a general way.

不要操心我们略过的从`export RCS_FIND_IGNORE.....` 到`all: vmlinux.....` 这一部分makefile 代码，他们只是负责根据各种配置文件生成不同目标内核的，因为之前我就说了这一部分我们只讨论构建内核的通用途径。

The `all:` target is the default when no target is given on the command line. You can see here that we include architecture specific makefile there (in our case it will be [arch/x86/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile)). From this moment we will continue from this makefile. As we can see `all` target depends on the `vmlinux` target that defined a little lower in the top makefile:

目标`all:` 是在命令行里不指定目标时默认生成的目标。你可以看到这里我们包含了架构相关的makefile（默认情况下会是[arch/x86/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile)）。从这一时刻起，我们会从这个makefile 继续进行下去。如我们所见，目标`all` 依赖于根makefile 后面声明的`vmlinux`： 

```Makefile
vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
```

The `vmlinux` is is the Linux kernel in an statically linked executable file format. The [scripts/link-vmlinux.sh](https://github.com/torvalds/linux/blob/master/scripts/link-vmlinux.sh) script links combines different compiled subsystems into vmlinux. The second target is the `vmlinux-deps` that defined as:

`vmlinux` 是linux 内核的静态链接可执行文件格式。脚本[scripts/link-vmlinux.sh](https://github.com/torvalds/linux/blob/master/scripts/link-vmlinux.sh) 把不同的编译好的子模块链接到一起形成了vmlinux。第二个目标是`vmlinux-deps`，它的定义如下：


```Makefile
vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_INIT) $(KBUILD_VMLINUX_MAIN)
```

and consists from the set of the `built-in.o` from the each top directory of the Linux kernel. Later, when we will go through all directories in the Linux kernel, the `Kbuild` will compile all the `$(obj-y)` files.  It then calls `$(LD) -r` to merge these files into one `built-in.o` file. For this moment we have no `vmlinux-deps`, so the `vmlinux` target will not be executed now. For me `vmlinux-deps` contains following files:

它是由内核代码下的每个顶级目录的`built-in.o` 组成的。之后我们还会检查内核所有的目录，`kbuild` 会编译各个目录下所有的对应`$obj-y` 的源文件。接着调用`$(LD) -r` 把这些文件合并到一个`build-in.o` 文件里。此时我们还没有`vmloinux-deps`, 所以目标`vmlinux` 现在还不会被构建。对我而言`vmlinux-deps` 包含下面的文件

```
arch/x86/kernel/vmlinux.lds arch/x86/kernel/head_64.o
arch/x86/kernel/head64.o    arch/x86/kernel/head.o
init/built-in.o             usr/built-in.o
arch/x86/built-in.o         kernel/built-in.o
mm/built-in.o               fs/built-in.o
ipc/built-in.o              security/built-in.o
crypto/built-in.o           block/built-in.o
lib/lib.a                   arch/x86/lib/lib.a
lib/built-in.o              arch/x86/lib/built-in.o
drivers/built-in.o          sound/built-in.o
firmware/built-in.o         arch/x86/pci/built-in.o
arch/x86/power/built-in.o   arch/x86/video/built-in.o
net/built-in.o
```

The next target that can be executed is following:

下一个可以被执行的目标如下：

```Makefile
$(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
$(vmlinux-dirs): prepare scripts
	$(Q)$(MAKE) $(build)=$@
```

As we can see the `vmlinux-dirs` depends on the two targets: `prepare` and `scripts`. The first `prepare` defined in the top `Makefile` of the Linux kernel and executes three stages of preparations:

就像我们看到的，`vmlinux-dir` 依赖于两部分：`prepare` 和`scripts`。第一个`prepare` 定义在内核的根`makefile` ，准备工作分成三个阶段：

```Makefile
prepare: prepare0
prepare0: archprepare FORCE
	$(Q)$(MAKE) $(build)=.
archprepare: archheaders archscripts prepare1 scripts_basic

prepare1: prepare2 $(version_h) include/generated/utsrelease.h \
                   include/config/auto.conf
	$(cmd_crmodverdir)
prepare2: prepare3 outputmakefile asm-generic
```

The first `prepare0` expands to the `archprepare` that exapnds to the `archheaders` and `archscripts` that defined in the `x86_64` specific [Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile). Let's look on it. The `x86_64` specific makefile starts from the definition of the variables that are related to the archicteture-specific configs ([defconfig](https://github.com/torvalds/linux/tree/master/arch/x86/configs) and etc.). After this it defines flags for the compiling of the [16-bit](https://en.wikipedia.org/wiki/Real_mode) code,calculating of the `BITS` variable that can be `32` for `i386` or `64` for the `x86_64` flags for the assembly source code, flags for the linker and many many more (all definitions you can find in the [arch/x86/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile)). The first target is `archheaders` in the makefile generates syscall table:

第一个`prepare0` 展开到`archprepare` ，后者又展开到`archheader` 和`archscripts`，这两个变量定义在`x86_64` 相关的[Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile)。让我们看看这个文件。`x86_64` 特定的makefile从变量定义开始，这些变量都是和特定架构的配置文件 ([defconfig](https://github.com/torvalds/linux/tree/master/arch/x86/configs)，等等)有关联。变量定义之后，这个makefile 定义了编译[16-bit](https://en.wikipedia.org/wiki/Real_mode)代码的编译选项，根据变量`BITS` 的值，如果是`32` 汇编代码、链接器、以及其它很多东西（全部的定义都可以在[arch/x86/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile)找到）对应的参数就是`i386`,而`64`就对应的是`x86_84`。生成的系统调用列表（syscall table）的makefile 里第一个目标就是`archheaders` ：

```Makefile
archheaders:
	$(Q)$(MAKE) $(build)=arch/x86/entry/syscalls all
```

And the second target is `archscripts` in this makefile is:

这个makefile 里第二个目标就是`archscripts`：

```Makefile
archscripts: scripts_basic
	$(Q)$(MAKE) $(build)=arch/x86/tools relocs
```

We can see that it depends on the `scripts_basic` target from the top [Makefile](https://github.com/torvalds/linux/blob/master/Makefile). At the first we can see the `scripts_basic` target that executes make for the [scripts/basic](https://github.com/torvalds/linux/blob/master/scripts/basic/Makefile) makefile:
 
 我们可以看到`archscripts` 是依赖于根[Makefile](https://github.com/torvalds/linux/blob/master/Makefile)里的`scripts_basic` 。首先我们可以看出`scripts_basic` 是根据[scripts/basic](https://github.com/torvalds/linux/blob/master/scripts/basic/Makefile) 的mekefile 执行的：
 
```Maklefile
scripts_basic:
	$(Q)$(MAKE) $(build)=scripts/basic
```

The `scripts/basic/Makefile` contains targets for compilation of the two host programs: `fixdep` and `bin2`:

`scripts/basic/Makefile`包含了编译两个主机程序`fixdep` 和`bin2` 的目标：

```Makefile
hostprogs-y	:= fixdep
hostprogs-$(CONFIG_BUILD_BIN2C)     += bin2c
always		:= $(hostprogs-y)

$(addprefix $(obj)/,$(filter-out fixdep,$(always))): $(obj)/fixdep
```

First program is `fixdep` - optimizes list of dependencies generated by the [gcc](https://gcc.gnu.org/) that tells make when to remake a source code file. The second program is `bin2c` depends on the value of the `CONFIG_BUILD_BIN2C` kernel configuration option and very little C program that allows to convert a binary on stdin to a C include on stdout. You can note here strange notation: `hostprogs-y` and etc. This notation is used in the all `kbuild` files and more about it you can read in the [documentation](https://github.com/torvalds/linux/blob/master/Documentation/kbuild/makefiles.txt). In our case the `hostprogs-y` tells to the `kbuild` that there is one host program named `fixdep` that will be built from the will be built from `fixdep.c` that located in the same directory that `Makefile`. The first output after we will execute `make` command in our terminal will be result of this `kbuild` file:

第一个工具是`fixdep`：用来优化[gcc](https://gcc.gnu.org/) 生成的依赖列表，然后在重新编译源文件的时候告诉make。第二个工具是`bin2c`,他依赖于内核配置选项`CONFIG_BUILD_BIN2C`,并且它是一个用来将标准输入接口（注：即stdin）收到的二进制流通过标准输出接口（即：stdout）转换成C 头文件的非常小的C 程序。你可以注意到这里有些奇怪的标志，如`hostprogs-y`等。这些标志使用在所有的`kbuild` 文件，更多的信息你可以从[documentation](https://github.com/torvalds/linux/blob/master/Documentation/kbuild/makefiles.txt) 获得。在我们的用例`hostprogs-y` 中，他告诉`kbuild` 这里有个名为`fixed` 的程序，这个程序会通过和`Makefile` 相同目录的`fixdep.c` 编译而来。执行make 之后，终端的第一个输出就是`kbuild` 的结果：

```
$ make
  HOSTCC  scripts/basic/fixdep
```

As `script_basic` target was executed, the `archscripts` target will execute `make` for the [arch/x86/tools](https://github.com/torvalds/linux/blob/master/arch/x86/tools/Makefile) makefile with the `relocs` target:

当目标`script_basic` 被执行，目标`archscripts` 就会make [arch/x86/tools](https://github.com/torvalds/linux/blob/master/arch/x86/tools/Makefile) 下的makefile 和目标`relocs`:

```Makefile
$(Q)$(MAKE) $(build)=arch/x86/tools relocs
```

The `relocs_32.c` and the `relocs_64.c` will be compiled that will contain [relocation](https://en.wikipedia.org/wiki/Relocation_%28computing%29) information and we will see it in the `make` output:

代码`relocs_32.c` 和`relocs_64.c` 包含了[重定位](https://en.wikipedia.org/wiki/Relocation_%28computing%29) 的信息，将会被编译，者可以在`make` 的输出中看到：

```Makefile
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
```

There is checking of the `version.h` after compiling of the `relocs.c`:

在编译完`relocs.c` 之后会检查`version.h`:

```Makefile
$(version_h): $(srctree)/Makefile FORCE
	$(call filechk,version.h)
	$(Q)rm -f $(old_version_h)
```

We can see it in the output:

我们可以在输出看到它：


```
CHK     include/config/kernel.release
```

and the building of the `generic` assembly headers with the `asm-generic` target from the `arch/x86/include/generated/asm` that generated in the top Makefile of the Linux kernel. After the `asm-generic` target the `archprepare` will be done, so the `prepare0` target will be executed. As I wrote above:

以及在内核根Makefiel 使用`arch/x86/include/generated/asm`的目标`asm-generic` 来构建`generic` 汇编头文件。在目标`asm-generic` 之后，`archprepare` 就会被完成，所以目标`prepare0` 会接着被执行，如我上面所写：

```Makefile
prepare0: archprepare FORCE
	$(Q)$(MAKE) $(build)=.
```

Note on the `build`. It defined in the [scripts/Kbuild.include](https://github.com/torvalds/linux/blob/master/scripts/Kbuild.include) and looks like this:

注意`build`，它是定义在文件[scripts/Kbuild.include](https://github.com/torvalds/linux/blob/master/scripts/Kbuild.include)，内容是这样的：

```Makefile
build := -f $(srctree)/scripts/Makefile.build obj
```

or in our case it is current source directory - `.`:

或者在我们的例子中，他就是当前源码目录路径——`.`：
```Makefile
$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.build obj=.
```

The [scripts/Makefile.build](https://github.com/torvalds/linux/blob/master/scripts/Makefile.build) tries to find the `Kbuild` file by the given directory via the `obj` parameter, include this `Kbuild` files:

参数`obj` 会告诉脚本[scripts/Makefile.build](https://github.com/torvalds/linux/blob/master/scripts/Makefile.build) 那些目录包含`kbuild` 文件，脚本以此来寻找各个`kbuild` 文件：

```Makefile
include $(kbuild-file)
```

and build targets from it. In our case `.` contains the [Kbuild](https://github.com/torvalds/linux/blob/master/Kbuild) file that generates the `kernel/bounds.s` and the `arch/x86/kernel/asm-offsets.s`. After this the `prepare` target finished to work. The `vmlinux-dirs` also depends on the second target - `scripts` that compiles following programs: `file2alias`, `mk_elfconfig`, `modpost` and etc... After scripts/host-programs compilation our `vmlinux-dirs` target can be executed. First of all let's try to understand what does `vmlinux-dirs` contain. For my case it contains paths of the following kernel directories:

然后根据这个构建目标。我们这里`.` 包含了[Kbuild](https://github.com/torvalds/linux/blob/master/Kbuild)，就用这个文件来生成`kernel/bounds.s` 和`arch/x86/kernel/asm-offsets.s`。这样目标`prepare` 就完成了它的工作。`vmlinux-dirs` 也依赖于第二个目标——`scripts` ，`scripts`会编译接下来的几个程序：`filealias`，`mk_elfconfig`,`modpost`等等。`scripts/host-programs` 编译完之后，我们的目标`vmlinux-dirs` 就可以开始编译了。第一步，我们先来理解一下`vmlinux-dirs` 都包含了那些东西。在我们的例子中它包含了接下来的内核目录的路径：

```
init usr arch/x86 kernel mm fs ipc security crypto block
drivers sound firmware arch/x86/pci arch/x86/power
arch/x86/video net lib arch/x86/lib
```

We can find definition of the `vmlinux-dirs` in the top [Makefile](https://github.com/torvalds/linux/blob/master/Makefile) of the Linux kernel:

我们可以在内核的根[Makefile](https://github.com/torvalds/linux/blob/master/Makefile) 里找到`vmlinux-dirs` 的定义：

```Makefile
vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
		     $(net-y) $(net-m) $(libs-y) $(libs-m)))

init-y		:= init/
drivers-y	:= drivers/ sound/ firmware/
net-y		:= net/
libs-y		:= lib/
...
...
...
```

Here we remove the `/` symbol from the each directory with the help of the `patsubst` and `filter` functions and put it to the `vmlinux-dirs`. So we have list of directories in the `vmlinux-dirs` and the following code:

这里我们借助函数`patsubst` 和`filter`去掉了每个目录路径里的符号`/`，并且把结果放到`vmlinux-dirs` 里。所以我们就有了`vmlinux-dirs` 里的目录的列表，以及下面的代码：

```Makefile
$(vmlinux-dirs): prepare scripts
	$(Q)$(MAKE) $(build)=$@
```

The `$@` represents `vmlinux-dirs` here that means that it will go recursively over all directories from the `vmlinux-dirs` and its internal directories (depens on configuration) and will execute `make` in there. We can see it in the output:

符号`$@` 在这里代表了`vmlinux-dirs`，这就表明程序会递归遍历从`vmlinux-dirs` 以及它内部的全部目录（依赖于配置），并且在对应的目录下执行`make` 命令。我们可以在输出看到结果：

```
  CC      init/main.o
  CHK     include/generated/compile.h
  CC      init/version.o
  CC      init/do_mounts.o
  ...
  CC      arch/x86/crypto/glue_helper.o
  AS      arch/x86/crypto/aes-x86_64-asm_64.o
  CC      arch/x86/crypto/aes_glue.o
  ...
  AS      arch/x86/entry/entry_64.o
  AS      arch/x86/entry/thunk_64.o
  CC      arch/x86/entry/syscall_64.o
```

Source code in each directory will be compiled and linked to the `built-in.o`:
每个目录下的源代码将会被编译并且链接到`built-io.o` 里：
```
$ find . -name built-in.o
./arch/x86/crypto/built-in.o
./arch/x86/crypto/sha-mb/built-in.o
./arch/x86/net/built-in.o
./init/built-in.o
./usr/built-in.o
...
...
```

Ok, all buint-in.o(s) built, now we can back to the `vmlinux` target. As you remember, the `vmlinux` target is in the top Makefile of the Linux kernel. Before the linking of the `vmlinux` it builds [samples](https://github.com/torvalds/linux/tree/master/samples), [Documentation](https://github.com/torvalds/linux/tree/master/Documentation) and etc., but I will not describe it in this part as I wrote in the beginning of this part.

好了，所有的`built-in.o` 都构建完了，现在我们回到目标`vmlinux` 上。你应该还记得，目标`vmlinux` 是在内核的根makefile 里。在链接`vmlinux` 之前，系统会构建[samples](https://github.com/torvalds/linux/tree/master/samples), [Documentation](https://github.com/torvalds/linux/tree/master/Documentation)等等，但是如上文所述，我不会在本文描述这些。

```Makefile
vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
    ...
    ...
    +$(call if_changed,link-vmlinux)
```

As you can see main purpose of it is a call of the [scripts/link-vmlinux.sh](https://github.com/torvalds/linux/blob/master/scripts/link-vmlinux.sh) script is linking of the all `built-in.o`(s) to the one statically linked executable and creation of the [System.map](https://en.wikipedia.org/wiki/System.map). In the end we will see following output:

你可以看到，`vmlinux` 的调用脚本[scripts/link-vmlinux.sh](https://github.com/torvalds/linux/blob/master/scripts/link-vmlinux.sh) 的主要目的是把所有的`built-in.o` 链接成一个静态可执行文件、生成[System.map](https://en.wikipedia.org/wiki/System.map)。 最后我们来看看下面的输出：

```
  LINK    vmlinux
  LD      vmlinux.o
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  KSYM    .tmp_kallsyms1.o
  KSYM    .tmp_kallsyms2.o
  LD      vmlinux
  SORTEX  vmlinux
  SYSMAP  System.map
```

and `vmlinux` and `System.map` in the root of the Linux kernel source tree:
还有内核源码树根目录下的`vmlinux` 和`System.map` 
```
$ ls vmlinux System.map 
System.map  vmlinux
```

That's all, `vmlinux` is ready. The next step is creation of the [bzImage](https://en.wikipedia.org/wiki/Vmlinux#bzImage).

这就是全部了，`vmlinux` 构建好了，下一步就是创建[bzImage](https://en.wikipedia.org/wiki/Vmlinux#bzImage).

Building bzImage
制作bzImage
--------------------------------------------------------------------------------

The `bzImage` is the compressed Linux kernel image. We can get it with the execution of the `make bzImage` after the `vmlinux` built. In other way we can just execute `make` without arguments and will get `bzImage` anyway because it is default image:

`bzImage` 就是压缩了的linux 内核镜像。我们可以在构建了`vmlinux` 之后通过执行`make bzImage` 获得`bzImage`。同时我们可以仅仅执行`make` 而不带任何参数也可以生成`bzImage` ，因为它是在[arch/x86/kernel/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile) 里定义的、默认会生成的镜像： 

```Makefile
all: bzImage
```

in the [arch/x86/kernel/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile). Let's look on this target, it will help us to understand how this image builds. As I already said the `bzImage` target defined in the [arch/x86/kernel/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile) and looks like this:

让我们看看这个目标，他能帮助我们理解这个镜像是怎么构建的。我已经说过了`bzImage` 师被定义在[arch/x86/kernel/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/Makefile)，定义如下：

```Makefile
bzImage: vmlinux
	$(Q)$(MAKE) $(build)=$(boot) $(KBUILD_IMAGE)
	$(Q)mkdir -p $(objtree)/arch/$(UTS_MACHINE)/boot
	$(Q)ln -fsn ../../x86/boot/bzImage $(objtree)/arch/$(UTS_MACHINE)/boot/$@
```

We can see here, that first of all called `make` for the boot directory, in our case it is:

在这里我们可以看到第一次为boot 目录执行`make`，在我们的例子里是这样的：

```Makefile
boot := arch/x86/boot
```

The main goal now to build source code in the `arch/x86/boot` and `arch/x86/boot/compressed` directories, build `setup.bin` and `vmlinux.bin`, and build the `bzImage` from they in the end. First target in the [arch/x86/boot/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/boot/Makefile) is the `$(obj)/setup.elf`:

现在的主要目标是编译目录`arch/x86/boot` 和`arch/x86/boot/compressed` 的代码，构建`setup.bin` 和`vmlinux.bin`，然后用这两个文件生成`bzImage`。第一个目标是定义在[arch/x86/boot/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/boot/Makefile)  的`$(obj)/setup.elf`:

```Makefile
$(obj)/setup.elf: $(src)/setup.ld $(SETUP_OBJS) FORCE
	$(call if_changed,ld)
```

We already have the `setup.ld` linker script in the `arch/x86/boot` directory and the `SETUP_OBJS` expands to the all source files from the `boot` directory. We can see first output:

我们已经在目录`arch/x86/boot`有了链接脚本`setup.ld`，并且将变量`SETUP_OBJS` 扩展到`boot` 目录下的全部源代码。我们可以看看第一个输出：

```Makefile
  AS      arch/x86/boot/bioscall.o
  CC      arch/x86/boot/cmdline.o
  AS      arch/x86/boot/copy.o
  HOSTCC  arch/x86/boot/mkcpustr
  CPUSTR  arch/x86/boot/cpustr.h
  CC      arch/x86/boot/cpu.o
  CC      arch/x86/boot/cpuflags.o
  CC      arch/x86/boot/cpucheck.o
  CC      arch/x86/boot/early_serial_console.o
  CC      arch/x86/boot/edd.o
```

The next source code file is the [arch/x86/boot/header.S](https://github.com/torvalds/linux/blob/master/arch/x86/boot/header.S), but we can't build it now because this target depends on the following two header files:

下一个源码文件是[arch/x86/boot/header.S](https://github.com/torvalds/linux/blob/master/arch/x86/boot/header.S)，但是我们不能现在就编译他，因为这个目标依赖于下面两个头文件：

```Makefile
$(obj)/header.o: $(obj)/voffset.h $(obj)/zoffset.h
```

The first is `voffset.h` generated by the `sed` script that gets two addresses from the `vmlinux` with the `nm` util:
第一个头文件`voffset.h` 是使用`sed` 脚本生成的，包含用`nm` 工具从`vmlinux` 获取的两个地址：

```C
#define VO__end 0xffffffff82ab0000
#define VO__text 0xffffffff81000000
```

They are start and end of the kernel. The second is `zoffset.h` depens on the `vmlinux` target from the [arch/x86/boot/compressed/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/boot/compressed/Makefile):

这两个地址是内核的起始和结束地址。第二个头文件`zoffset.h` 在[arch/x86/boot/compressed/Makefile](https://github.com/torvalds/linux/blob/master/arch/x86/boot/compressed/Makefile) 可以看出是依赖于目标`vmlinux`的：

```Makefile
$(obj)/zoffset.h: $(obj)/compressed/vmlinux FORCE
	$(call if_changed,zoffset)
```

The `$(obj)/compressed/vmlinux` target depends on the `vmlinux-objs-y` that compiles source code files from the [arch/x86/boot/compressed](https://github.com/torvalds/linux/tree/master/arch/x86/boot/compressed) directory and generates `vmlinux.bin`, `vmlinux.bin.bz2`, and compiles programm - `mkpiggy`. We can see this in the output:

目标`$(obj)/compressed/vmlinux` 依赖于变量`vmlinux-objs-y` —— 表明要编译目录[arch/x86/boot/compressed](https://github.com/torvalds/linux/tree/master/arch/x86/boot/compressed) 下的源代码，然后生成`vmlinux.bin`, `vmlinux.bin.bz2`, 和编译工具 - `mkpiggy`。我们可以在下面的输出看出来：

```Makefile
  LDS     arch/x86/boot/compressed/vmlinux.lds
  AS      arch/x86/boot/compressed/head_64.o
  CC      arch/x86/boot/compressed/misc.o
  CC      arch/x86/boot/compressed/string.o
  CC      arch/x86/boot/compressed/cmdline.o
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin
  BZIP2   arch/x86/boot/compressed/vmlinux.bin.bz2
  HOSTCC  arch/x86/boot/compressed/mkpiggy
```

Where the `vmlinux.bin` is the `vmlinux` with striped debuging information and comments and the `vmlinux.bin.bz2` compressed `vmlinux.bin.all` + `u32` size of `vmlinux.bin.all`. The `vmlinux.bin.all` is `vmlinux.bin + vmlinux.relocs`, where `vmlinux.relocs` is the `vmlinux` that was handled by the `relocs` program (see above). As we got these files, the `piggy.S` assembly files will be generated with the `mkpiggy` program and compiled:

```Makefile
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
```

This assembly files will contain computed offset from a compressed kernel. After this we can see that `zoffset` generated:

```Makefile
  ZOFFSET arch/x86/boot/zoffset.h
```

As the `zoffset.h` and the `voffset.h` are generated, compilation of the source code files from the [arch/x86/boot](https://github.com/torvalds/linux/tree/master/arch/x86/boot/) can be continued:

```Makefile
  AS      arch/x86/boot/header.o
  CC      arch/x86/boot/main.o
  CC      arch/x86/boot/mca.o
  CC      arch/x86/boot/memory.o
  CC      arch/x86/boot/pm.o
  AS      arch/x86/boot/pmjump.o
  CC      arch/x86/boot/printf.o
  CC      arch/x86/boot/regs.o
  CC      arch/x86/boot/string.o
  CC      arch/x86/boot/tty.o
  CC      arch/x86/boot/video.o
  CC      arch/x86/boot/video-mode.o
  CC      arch/x86/boot/video-vga.o
  CC      arch/x86/boot/video-vesa.o
  CC      arch/x86/boot/video-bios.o
```

As all source code files will be compiled, they will be linked to the `setup.elf`:

```Makefile
  LD      arch/x86/boot/setup.elf
```

or:

```
ld -m elf_x86_64   -T arch/x86/boot/setup.ld arch/x86/boot/a20.o arch/x86/boot/bioscall.o arch/x86/boot/cmdline.o arch/x86/boot/copy.o arch/x86/boot/cpu.o arch/x86/boot/cpuflags.o arch/x86/boot/cpucheck.o arch/x86/boot/early_serial_console.o arch/x86/boot/edd.o arch/x86/boot/header.o arch/x86/boot/main.o arch/x86/boot/mca.o arch/x86/boot/memory.o arch/x86/boot/pm.o arch/x86/boot/pmjump.o arch/x86/boot/printf.o arch/x86/boot/regs.o arch/x86/boot/string.o arch/x86/boot/tty.o arch/x86/boot/video.o arch/x86/boot/video-mode.o arch/x86/boot/version.o arch/x86/boot/video-vga.o arch/x86/boot/video-vesa.o arch/x86/boot/video-bios.o -o arch/x86/boot/setup.elf
```

The last two things is the creation of the `setup.bin` that will contain compiled code from the `arch/x86/boot/*` directory:

```
objcopy  -O binary arch/x86/boot/setup.elf arch/x86/boot/setup.bin
```

and the creation of the `vmlinux.bin` from the `vmlinux`:

```
objcopy  -O binary -R .note -R .comment -S arch/x86/boot/compressed/vmlinux arch/x86/boot/vmlinux.bin
```

In the end we compile host program: [arch/x86/boot/tools/build.c](https://github.com/torvalds/linux/blob/master/arch/x86/boot/tools/build.c) that will create our `bzImage` from the `setup.bin` and the `vmlinux.bin`:

```
arch/x86/boot/tools/build arch/x86/boot/setup.bin arch/x86/boot/vmlinux.bin arch/x86/boot/zoffset.h arch/x86/boot/bzImage
```

Actually the `bzImage` is the concatenated `setup.bin` and the `vmlinux.bin`. In the end we will see the output which familiar to all who once build the Linux kernel from source:

```
Setup is 16268 bytes (padded to 16384 bytes).
System is 4704 kB
CRC 94a88f9a
Kernel: arch/x86/boot/bzImage is ready  (#5)
```

That's all. 

Conclusion
================================================================================

It is the end of this part and here we saw all steps from the execution of the `make` command to the generation of the `bzImage`. I know, the Linux kernel makefiles and process of the Linux kernel building may seem confusing at first glance, but it is not so hard. Hope this part will help you to understand process of the Linux kernel building.

Links
================================================================================

* [GNU make util](https://en.wikipedia.org/wiki/Make_%28software%29)
* [Linux kernel top Makefile](https://github.com/torvalds/linux/blob/master/Makefile)
* [cross-compilation](https://en.wikipedia.org/wiki/Cross_compiler)
* [Ctags](https://en.wikipedia.org/wiki/Ctags)
* [sparse](https://en.wikipedia.org/wiki/Sparse)
* [bzImage](https://en.wikipedia.org/wiki/Vmlinux#bzImage)
* [uname](https://en.wikipedia.org/wiki/Uname)
* [shell](https://en.wikipedia.org/wiki/Shell_%28computing%29)
* [Kbuild](https://github.com/torvalds/linux/blob/master/Documentation/kbuild/kbuild.txt)
* [binutils](http://www.gnu.org/software/binutils/)
* [gcc](https://gcc.gnu.org/)
* [Documentation](https://github.com/torvalds/linux/blob/master/Documentation/kbuild/makefiles.txt)
* [System.map](https://en.wikipedia.org/wiki/System.map)
* [Relocation](https://en.wikipedia.org/wiki/Relocation_%28computing%29)

--------------------------------------------------------------------------------

via: https://github.com/0xAX/linux-insides/blob/master/Misc/how_kernel_compiled.md

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
