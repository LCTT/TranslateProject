[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (32-bit life support: Cross-compiling with GCC)
[#]: via: (https://opensource.com/article/19/7/cross-compiling-gcc)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

32-bit life support: Cross-compiling with GCC
======
Use GCC to cross-compile binaries for different architectures from a
single build machine.
![Wratchet set tools][1]

If you're a developer creating binary packages, like an RPM, DEB, Flatpak, or Snap, you have to compile code for a variety of different target platforms. Typical targets include 32-bit and 64-bit x86 and ARM. You could do your builds on different physical or virtual machines, but that means maintaining several systems. Instead, you can use the GNU Compiler Collection ([GCC][2]) to cross-compile, producing binaries for several different architectures from a single build machine.

Assume you have a simple dice-rolling game that you want to cross-compile. Something written in C is relatively easy on most systems, so to add complexity for the sake of realism, I wrote this example in C++, so the program depends on something not present in C (**iostream**, specifically).


```
#include &lt;iostream&gt;
#include &lt;cstdlib&gt;

using namespace std;

void lose (int c);
void win (int c);
void draw ();

int main() {
  int i;
    do {
      cout &lt;&lt; "Pick a number between 1 and 20: \n";
      cin &gt;&gt; i;
      int c = rand ( ) % 21;
      if (i &gt; 20) lose (c);
      else if (i &lt; c ) lose (c);
      else if (i &gt; c ) win (c);
      else draw ();
      }
      while (1==1);
      }

void lose (int c )
  {
    cout &lt;&lt; "You lose! Computer rolled " &lt;&lt; c &lt;&lt; "\n";
  }

void win (int c )
  {
    cout &lt;&lt; "You win!! Computer rolled " &lt;&lt; c &lt;&lt; "\n";
   }

void draw ( )
   {
     cout &lt;&lt; "What are the chances. You tied. Try again, I dare you! \n";
   }
```

Compile it on your system using the **g++** command:


```
`$ g++ dice.cpp -o dice`
```

Then run it to confirm that it works:


```
$ ./dice
Pick a number between 1 and 20:
[...]
```

You can see what kind of binary you just produced with the **file** command:


```
$ file ./dice
dice: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically
linked (uses shared libs), for GNU/Linux 5.1.15, not stripped
```

And just as important, what libraries it links to with **ldd**:


```
$ ldd dice
linux-vdso.so.1 =&gt; (0x00007ffe0d1dc000)
libstdc++.so.6 =&gt; /usr/lib/x86_64-linux-gnu/libstdc++.so.6
(0x00007fce8410e000)
libc.so.6 =&gt; /lib/x86_64-linux-gnu/libc.so.6
(0x00007fce83d4f000)
libm.so.6 =&gt; /lib/x86_64-linux-gnu/libm.so.6
(0x00007fce83a52000)
/lib64/ld-linux-x86-64.so.2 (0x00007fce84449000)
libgcc_s.so.1 =&gt; /lib/x86_64-linux-gnu/libgcc_s.so.1
(0x00007fce8383c000)
```

You have confirmed two things from these tests: The binary you just ran is 64-bit, and it is linked to 64-bit libraries.

That means that, in order to cross-compile for 32-bit, you must tell **g++** to:

  1. Produce a 32-bit binary
  2. Link to 32-bit libraries instead of the default 64-bit libraries



### Setting up your dev environment

To compile to 32-bit, you need 32-bit libraries and headers installed on your system. If you run a pure 64-bit system, then you have no 32-bit libraries or headers and need to install a base set. At the very least, you need the C and C++ libraries (**glibc** and **libstdc++**) along with 32-bit version of GCC libraries (**libgcc**). The names of these packages may vary from distribution to distribution. On Slackware, a pure 64-bit distribution with 32-bit compatibility is available from the **multilib** packages provided by [Alien BOB][3]. On Fedora, CentOS, and RHEL:


```
$ yum install libstdc++-*.i686
$ yum install glibc-*.i686
$ yum install libgcc.i686
```

Regardless of the system you're using, you also must install any 32-bit libraries your project uses. For instance, if you include **yaml-cpp** in your project, then you must install the 32-bit version of **yaml-cpp** or, on many systems, the development package for **yaml-cpp** (for instance, **yaml-cpp-devel** on Fedora) before compiling it.

Once that's taken care of, the compilation is fairly simple:


```
`$ g++ -m32 dice.cpp -o dice32 -L /usr/lib -march=i686`
```

The **-m32** flag tells GCC to compile in 32-bit mode. The **-march=i686** option further defines what kind of optimizations to use (refer to **info gcc** for a list of options). The **-L** flag sets the path to the libraries you want GCC to link to. This is usually **/usr/lib** for 32-bit, although, depending on how your system is set up, it could be **/usr/lib32** or even **/opt/usr/lib** or any place you know you keep your 32-bit libraries.

After the code compiles, see proof of your build:


```
$ file ./dice32
dice: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
dynamically linked (uses shared libs) [...]
```

And, of course, **ldd ./dice32** points to your 32-bit libraries.

### Different architectures

Compiling 32-bit on 64-bit for the same processor family allows GCC to make many assumptions about how to compile the code. If you need to compile for an entirely different processor, you must install the appropriate cross-build GCC utilities. Which utility you install depends on what you are compiling. This process is a little more complex than compiling for the same CPU family.

When you're cross-compiling for the same family, you can expect to find the same set of 32-bit libraries as 64-bit libraries, because your Linux distribution is maintaining both. When compiling for an entirely different architecture, you may have to hunt down libraries required by your code. The versions you need may not be in your distribution's repositories because your distribution may not provide packages for your target system, or it may not mirror all packages in a convenient location. If the code you're compiling is yours, then you probably have a good idea of what its dependencies are and possibly where to find them. If the code is something you have downloaded and need to compile, then you probably aren't as familiar with its requirements. In that case, investigate what the code requires to build correctly (they're usually listed in the README or INSTALL files, and certainly in the source code itself), then go gather the components.

For example, if you need to compile C code for ARM, you must first install **gcc-arm-linux-gnu** (32-bit) or **gcc-aarch64-linux-gnu** (64-bit) on Fedora or RHEL, or **arm-linux-gnueabi-gcc** and **binutils-arm-linux-gnueabi** on Ubuntu. This provides the commands and libraries you need to build (at least) a simple C program. Additionally, you need whatever libraries your code uses. You can place header files in the usual location (**/usr/include** on most systems), or you can place them in a directory of your choice and point GCC to it with the **-I** option.

When compiling, don't use the standard **gcc** or **g++** command. Instead, use the GCC utility you installed. For example:


```
$ arm-linux-gnu-g++ dice.cpp \
  -I/home/seth/src/crossbuild/arm/cpp \
  -o armdice.bin
```

Verify what you've built:


```
$ file armdice.bin
armdice.bin: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV) [...]
```

### Libraries and deliverables

This was a simple example of how to use cross-compiling. In real life, your source code may produce more than just a single binary. While you can manage this manually, there's probably no good reason to do that. In my next article, I'll demonstrate GNU Autotools, which does most of the work required to make your code portable.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/cross-compiling-gcc

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://gcc.gnu.org/
[3]: http://www.slackware.com/~alien/multilib/
