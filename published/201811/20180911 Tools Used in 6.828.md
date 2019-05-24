Caffeinated 6.828：使用的工具
======

在这个课程中你将使用两套工具：一个是 x86 模拟器 QEMU，它用来运行你的内核；另一个是编译器工具链，包括汇编器、链接器、C 编译器，以及调试器，它们用来编译和测试你的内核。本文有你需要去下载和安装你自己的副本相关信息。本课程假定你熟悉所有出现的 Unix 命令的用法。

我们强烈推荐你使用一个 Debathena 机器去做你的实验，比如 athena.dialup.mit.edu。如果你使用运行在 Linux 上的 MIT Athena 机器，那么本课程所需要的所有软件工具都在 6.828 的存储中：只需要输入 `add -f 6.828` 就可以访问它们。

如果你不使用 Debathena 机器，我们建议你使用一台 Linux 虚拟机。如果是这样，你可以在你的 Linux 虚拟机上构建和安装工具。我们将在下面介绍如何在 Linux 和 MacOS 计算上来构建和安装工具。

在 [Cygwin][1] 的帮助下，在 Windows 中运行这个开发环境也是可行的。安装 cygwin，并确保安装了 flex 和 bison 包（它们在开发 header 软件包分类下面）。

对于 6.828 中使用的工具中的有用的命令，请参考[实验工具指南][2]。

### 编译器工具链

“编译器工具链“ 是一套程序，包括一个 C 编译器、汇编器和链接器，使用它们来将代码转换成可运行的二进制文件。你需要一个能够生成在 32 位 Intel 架构（x86 架构）上运行的 ELF 二进制格式程序的编译器工具链。

#### 测试你的编译器工具链

现代的 Linux 和 BSD UNIX 发行版已经为 6.828 提供了一个合适的工具链。去测试你的发行版，可以输入如下的命令：

```
% objdump -i
```

第二行应该是 `elf32-i386`。

```
% gcc -m32 -print-libgcc-file-name
```

这个命令应该会输出如 `/usr/lib/gcc/i486-linux-gnu/version/libgcc.a` 或 `/usr/lib/gcc/x86_64-linux-gnu/version/32/libgcc.a` 这样的东西。

如果这些命令都运行成功，说明你的工具链都已安装，你不需要去编译你自己的工具链。

如果 `gcc` 命令失败，你可能需要去安装一个开发环境。在 Ubuntu Linux 上，输入如下的命令：

```
% sudo apt-get install -y build-essential gdb
```

在 64 位的机器上，你可能需要去安装一个 32 位的支持库。链接失败的表现是有一个类似于 “`__udivdi3` not found” 和 “`__muldi3` not found” 的错误信息。在 Ubuntu Linux 上，输入如下的命令去尝试修复这个问题：

```
% sudo apt-get install gcc-multilib
```

#### 使用一个虚拟机

获得一个兼容的工具链的最容易的另外的方法是，在你的计算机上安装一个现代的 Linux 发行版。使用虚拟化平台，Linux 可以与你正常的计算环境和平共处。安装一个 Linux 虚拟机共有两步。首先，去下载一个虚拟化平台。

  * [VirtualBox][3]（对 Mac、Linux、Windows 免费）— [下载地址][3]
  * [VMware Player][4]（对 Linux 和 Windows 免费，但要求注册）
  * [VMware Fusion][5]（可以从 IS&T 免费下载）。

VirtualBox 有点慢并且灵活性欠佳，但它免费！

虚拟化平台安装完成后，下载一个你选择的 Linux 发行版的引导磁盘镜像。

  * 我们使用的是 [Ubuntu 桌面版][6]。

这将下载一个命名类似于 `ubuntu-10.04.1-desktop-i386.iso` 的文件。启动你的虚拟化平台并创建一个新（32 位）的虚拟机。使用下载的 Ubuntu 镜像作为一个引导磁盘；安装过程在不同的虚拟机上有所不同，但都很简单。就像上面一样输入 `objdump -i`，去验证你的工具是否已安装。你将在虚拟机中完成你的工作。

#### 构建你自己的编译器工具链

你需要花一些时间来设置，但是比起一个虚拟机来说，它的性能要稍好一些，并且让你工作在你熟悉的环境中（Unix/MacOS）。对于 MacOS 命令，你可以快进到文章的末尾部分去看。

##### Linux

通过将下列行添加到 `conf/env.mk` 中去使用你自己的工具链：

```
GCCPREFIX=
```

我们假设你将工具链安装到了 `/usr/local` 中。你将需要大量的空间（大约 1 GB）去编译工具。如果你空间不足，在它的 `make install` 步骤之后删除它们的目录。

下载下列包：

+ ftp://ftp.gmplib.org/pub/gmp-5.0.2/gmp-5.0.2.tar.bz2
+ https://www.mpfr.org/mpfr-3.1.2/mpfr-3.1.2.tar.bz2
+ http://www.multiprecision.org/downloads/mpc-0.9.tar.gz
+ http://ftpmirror.gnu.org/binutils/binutils-2.21.1.tar.bz2
+ http://ftpmirror.gnu.org/gcc/gcc-4.6.4/gcc-core-4.6.4.tar.bz2
+ http://ftpmirror.gnu.org/gdb/gdb-7.3.1.tar.bz2

（你可能也在使用这些包的最新版本。）解包并构建。安装到 `/usr/local` 中，它是我们建议的。要安装到不同的目录，如 `$PFX`，注意相应修改。如果有问题，可以看下面。

```c
export PATH=$PFX/bin:$PATH
export LD_LIBRARY_PATH=$PFX/lib:$LD_LIBRARY_PATH

tar xjf gmp-5.0.2.tar.bz2
cd gmp-5.0.2
./configure --prefix=$PFX
make
make install # This step may require privilege (sudo make install)
cd ..

tar xjf mpfr-3.1.2.tar.bz2
cd mpfr-3.1.2
./configure --prefix=$PFX --with-gmp=$PFX
make
make install # This step may require privilege (sudo make install)
cd ..

tar xzf mpc-0.9.tar.gz
cd mpc-0.9
./configure --prefix=$PFX --with-gmp=$PFX --with-mpfr=$PFX
make
make install # This step may require privilege (sudo make install)
cd ..


tar xjf binutils-2.21.1.tar.bz2
cd binutils-2.21.1
./configure --prefix=$PFX --target=i386-jos-elf --disable-werror
make
make install # This step may require privilege (sudo make install)
cd ..

i386-jos-elf-objdump -i
# Should produce output like:
# BFD header file version (GNU Binutils) 2.21.1
# elf32-i386
# (header little endian, data little endian)
# i386...


tar xjf gcc-core-4.6.4.tar.bz2
cd gcc-4.6.4
mkdir build # GCC will not compile correctly unless you build in a separate directory
cd build
../configure --prefix=$PFX --with-gmp=$PFX --with-mpfr=$PFX --with-mpc=$PFX \
 --target=i386-jos-elf --disable-werror \
 --disable-libssp --disable-libmudflap --with-newlib \
 --without-headers --enable-languages=c MAKEINFO=missing
make all-gcc
make install-gcc # This step may require privilege (sudo make install-gcc)
make all-target-libgcc
make install-target-libgcc # This step may require privilege (sudo make install-target-libgcc)
cd ../..

i386-jos-elf-gcc -v
# Should produce output like:
# Using built-in specs.
# COLLECT_GCC=i386-jos-elf-gcc
# COLLECT_LTO_WRAPPER=/usr/local/libexec/gcc/i386-jos-elf/4.6.4/lto-wrapper
# Target: i386-jos-elf


tar xjf gdb-7.3.1.tar.bz2
cd gdb-7.3.1
./configure --prefix=$PFX --target=i386-jos-elf --program-prefix=i386-jos-elf- \
 --disable-werror
make all
make install # This step may require privilege (sudo make install)
cd ..
```

**Linux 排错：**

Q：我不能运行 `make install`，因为我在这台机器上没有 root 权限。

A：我们的指令假定你是安装到了 `/usr/local` 目录中。但是，在你的环境中可能并不是这样做的。如果你仅能够在你的家目录中安装代码。那么在上面的命令中，使用 `--prefix=$HOME` 去替换 `--prefix=/usr/local`。你也需要修改你的 `PATH` 和 `LD_LIBRARY_PATH` 环境变量，以通知你的 shell 这个工具的位置。例如：

```
export PATH=$HOME/bin:$PATH
export LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH
```

在你的 `~/.bashrc` 文件中输入这些行，以便于你登入后不需要每次都输入它们。

Q：我构建失败了，错误信息是 “library not found”。

A：你需要去设置你的 `LD_LIBRARY_PATH`。环境变量必须包含 `PREFIX/lib` 目录（例如 `/usr/local/lib`）。

##### MacOS

首先从 Mac OSX 上安装开发工具开始：`xcode-select --install` 。

你可以从 homebrew 上安装 qemu 的依赖，但是不能去安装 qemu，因为我们需要安装打了 6.828 补丁的 qemu。

```
brew install $(brew deps qemu)
```

gettext 工具并不能把它已安装的二进制文件添加到路径中，因此你需要去运行：

```
PATH=${PATH}:/usr/local/opt/gettext/bin make install
```

完成后，开始安装 qemu。

### QEMU 模拟器

[QEMU][8] 是一个现代化的、并且速度非常快的 PC 模拟器。QEMU 的 2.3.0 版本是设置在 Athena 上的 6.828 中的 x86 机器存储中的（`add -f 6.828`）。

不幸的是，QEMU 的调试功能虽然很强大，但是有点不成熟，因此我们强烈建议你使用我们打过 6.828 补丁的版本，而不是发行版自带的版本。这个安装在 Athena 上的 QEMU 版本已经打过补丁了。构建你自己的、打 6.828 补丁的 QEMU 版本的过程如下：

1. 克隆 IAP 6.828 QEMU 的 git 仓库：`git clone https://github.com/mit-pdos/6.828-qemu.git qemu`。
2. 在 Linux 上，你或许需要安装几个库。我们成功地在 Debian/Ubuntu 16.04 上构建 6.828 版的 QEMU 需要安装下列的库：libsdl1.2-dev、libtool-bin、libglib2.0-dev、libz-dev 和 libpixman-1-dev。
3. 配置源代码（方括号中是可选参数；用你自己的真实路径替换 `PFX`）
    1. Linux：`./configure --disable-kvm --disable-werror [--prefix=PFX] [--target-list="i386-softmmu x86_64-softmmu"]`。
    2. OS X：`./configure --disable-kvm --disable-werror --disable-sdl [--prefix=PFX] [--target-list="i386-softmmu x86_64-softmmu"]`。`prefix` 参数指定安装 QEMU 的位置；如果不指定，将缺省安装 QEMU 到 `/usr/local` 目录中。`target-list` 参数将简单地简化 QEMU 所支持的架构。
4. 运行 `make && make install`。


--------------------------------------------------------------------------------

via: https://pdos.csail.mit.edu/6.828/2018/tools.html

作者：[csail.mit][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://pdos.csail.mit.edu
[b]: https://github.com/lujun9972
[1]: http://www.cygwin.com
[2]: labguide.html
[3]: http://www.oracle.com/us/technologies/virtualization/oraclevm/
[4]: http://www.vmware.com/products/player/
[5]: http://www.vmware.com/products/fusion/
[6]: http://www.ubuntu.com/download/desktop
[8]: http://www.nongnu.org/qemu/
[9]: mailto:6828-staff@lists.csail.mit.edu
[10]: https://i.creativecommons.org/l/by/3.0/us/88x31.png
[11]: https://creativecommons.org/licenses/by/3.0/us/
[12]: https://pdos.csail.mit.edu/6.828/2018/index.html
