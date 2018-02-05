What a GNU C Compiler Bug looks like
======
Back in December a Linux Mint user sent a [strange bug report][1] to the darktable mailing list. Apparently the GNU C Compiler (GCC) on his system exited with the following error message, breaking the build process:
```
cc1: error: unrecognized command line option '-Wno-format-truncation' [-Werror]
cc1: all warnings being treated as errors
src/iop/CMakeFiles/colortransfer.dir/build.make:67: recipe for target 'src/iop/CMakeFiles/colortransfer.dir/introspection_colortransfer.c.o' failed make[2]: 0_sync_master.sh 1_add_new_article_manual.sh 1_add_new_article_newspaper.sh 2_start_translating.sh 3_continue_the_work.sh 4_finish.sh 5_pause.sh base.sh env format.test lctt.cfg parse_url_by_manual.sh parse_url_by_newspaper.py parse_url_by_newspaper.sh README.org reformat.sh [src/iop/CMakeFiles/colortransfer.dir/introspection_colortransfer.c.o] Error 1 CMakeFiles/Makefile2:6323: recipe for target 'src/iop/CMakeFiles/colortransfer.dir/all' failed

make[1]: 0_sync_master.sh 1_add_new_article_manual.sh 1_add_new_article_newspaper.sh 2_start_translating.sh 3_continue_the_work.sh 4_finish.sh 5_pause.sh base.sh env format.test lctt.cfg parse_url_by_manual.sh parse_url_by_newspaper.py parse_url_by_newspaper.sh README.org reformat.sh [src/iop/CMakeFiles/colortransfer.dir/all] Error 2

```

`-Wno-format-truncation` is a rather new GCC feature which instructs the compiler to issue a warning if it can already deduce at compile time that calls to formatted I/O functions like `snprintf()` or `vsnprintf()` might result in truncated output.

That's definitely neat, but Linux Mint 18.3 (just like Ubuntu 16.04 LTS) uses GCC 5.4.0, which doesn't support this feature. And darktable relies on a chain of CMake macros to make sure it doesn't use any flags the compiler doesn't know about:
```
CHECK_COMPILER_FLAG_AND_ENABLE_IT(-Wno-format-truncation)

```

So why did this even happen? I logged into one of my Ubuntu 16.04 installations and tried to reproduce the problem. Which wasn't hard, I just had to check out the git tree in question and build it. Boom, same error.

### The solution

It turns out that while `-Wformat-truncation` isn't a valid option for GCC 5.4.0 (it's not documented), this version silently accepts the negation under some circumstances (!):
```

sturmflut@hogsmeade:/tmp$ gcc -Wformat-truncation -o test test.c
gcc: error: unrecognized command line option '-Wformat-truncation'
sturmflut@hogsmeade:/tmp$ gcc -Wno-format-truncation -o test test.c
sturmflut@hogsmeade:/tmp$

```

(test.c just contains an empty main() method).

Because darktable uses `CHECK_COMPILER_FLAG_AND_ENABLE_IT(-Wno-format-truncation)`, it is fooled into thinking this compiler version actually supports `-Wno-format-truncation` at all times. The simple test case used by the CMake macro doesn't fail, but the compiler later decides to no longer silently accept the invalid command line option for some reason.

One of the cases which triggered this was when the source file under compilation had already generated some other warnings before. If I forced a serialized build using `make -j1` on a clean darktable checkout on this machine, `./src/iop/colortransfer.c` actually was the first file which caused any
compiler warnings at all, so this is why the process failed exactly there.

The minimum test case to trigger this behavior in GCC 5.4.0 is a C file with a `main()` function with a parameter which has the wrong type, like this one:
```

int main(int argc, int argv)
{
}

```

Then add `-Wall` to make sure the compiler will treat this as a warning, and it fails:
```

sturmflut@hogsmeade:/tmp$ gcc -Wall -Wno-format-truncation -o test test.c
test.c:1:5: warning: second argument of 'main' should be 'char **' [-Wmain]
 int main(int argc, int argv)
 ^
cc1: warning: unrecognized command line option '-Wno-format-truncation'

```

If you omit `-Wall`, the compiler will not generate the first warning and also not complain about `-Wno-format-truncation`.

I've never run into this before, but I guess Ubuntu 16.04 is going to stay with us for a while since it is the current LTS release until May 2018, and even after that it will still be supported until 2021. So this buggy GCC version will most likely also stay alive for quite a while. Which is why the check for this flag has been removed from the

--------------------------------------------------------------------------------

via: http://www.lieberbiber.de/2018/01/14/what-a-gnu-compiler-bug-looks-like/

作者：[sturmflut][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.lieberbiber.de/author/sturmflut/
[1]:https://www.mail-archive.com/darktable-dev@lists.darktable.org/msg02760.html
