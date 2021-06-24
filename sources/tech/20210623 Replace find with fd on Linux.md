[#]: subject: (Replace find with fd on Linux)
[#]: via: (https://opensource.com/article/21/6/fd-linux)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Replace find with fd on Linux
======
The fd command is a popular, user-friendly alternative to the find
command.
![Magnifying glass on code][1]

Many Linux programmers use the `find` command every single day of their career. But `find` gives a limited set of filesystem entries, and if you have to do a large set of `find` operations, it's not even very fast. So instead, I prefer to use the Rust `fd` command because it provides sensible defaults that work for most use cases.

As its [README][2] says, "`fd` is a program to find entries in your filesystem. It is a simple, fast, and user-friendly alternative to `find`." It features parallelized directory traversal, so it can search multiple directories at once. It supports regular expressions (regex) and glob-based patterns.

### Install fd

On Linux, you can install `fd` from your software repository (a list of available packages can be found on the [fd page on Repology][3].) For example, on Fedora:


```
`$ sudo dnf install fd-find`
```

On macOS, use [MacPorts][4] or [Homebrew][5].

Alternately, you can use Rust's Cargo package manager:


```
`$ cargo install fd-find`
```

### Use fd

To do a simple search, run `fd` after any argument, such as:


```
$ fd sh
registry/src/github.com-1ecc6299db9ec823/cc-1.0.67/src/bin/gcc-shim.rs
registry/src/github.com-1ecc6299db9ec823/exa-0.10.1/completions/completions.bash
registry/src/github.com-1ecc6299db9ec823/exa-0.10.1/completions/completions.fish
registry/src/github.com-1ecc6299db9ec823/exa-0.10.1/completions/completions.zsh
registry/src/github.com-1ecc6299db9ec823/exa-0.10.1/xtests/run.sh
registry/src/github.com-1ecc6299db9ec823/git2-0.13.18/src/stash.rs
registry/src/github.com-1ecc6299db9ec823/libc-0.2.94/src/unix/solarish
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/cmake/SelectHashes.cmake
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/include/git2/stash.h
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/include/git2/sys/hashsig.h
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/script/backport.sh
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/script/leaks.sh
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/script/valgrind.sh
registry/src/github.com-1ecc6299db9ec823/libgit2-sys-0.12.19+1.1.0/libgit2/src/config_snapshot.c
[...]
```

If you want to search for a specific directory, provide the directory path as a second argument to `fd`, such as:


```
$ fd passwd /etc
/etc/pam.d/passwd
/etc/passwd
/etc/passwd-
/etc/security/opasswd
```

To search for a particular file extension, use `-e` as an option. For example:


```
$ fd . '/home/ssur/exa' -e md
/home/ssur/exa/README.md
/home/ssur/exa/devtools/README.md
/home/ssur/exa/man/exa.1.md
/home/ssur/exa/man/exa_colors.5.md
/home/ssur/exa/xtests/README.md
$
```

You can also execute a command by providing `-x` or `-X`.

  * The `-x/--exec` option runs an external command for each search result (in parallel).
  * The `-X/--exec-batch` option launches the external command once with all search results as arguments.



For example, to recursively find all ZIP archives and unpack them:


```
`$ fd -e zip -x unzip`
```

Or, to list all files under a particular directory that were changed within the last _n_ number of days, use the `--changed-within` option:


```
$ fd . '/home/ssur/Work/' --changed-within 10d
/home/ssur/Work/wildfly/connector/src/main/java/org/jboss/as/connector/subsystems/data_sources/JdbcDriverAdd.java
/home/ssur/Work/wildfly/connector/src/main/java/org/jboss/as/connector/subsystems/data_sources/JdbcExample.java
[...]
```

And to search all files that were changed before a specific number of days, use the `--changed-before` _n_ option:


```
`$ fd . '/home/ssur/Work/' --changed-before 365d`
```

Here, `.` acts as a wildcard entry to instruct `fd` to return all files.

To learn about more the functionalities of `fd`, consult its [documentation][2] on GitHub.

### Conclusion

One thing I especially like about `fd` is that the search pattern is case-insensitive by default, which makes it easier to find things even when you have imprecise knowledge about what you're looking for. Better yet, it _automatically_ switches to case-sensitive if the pattern contains an uppercase character.

Another benefit is that it uses color-coding to highlight different file types.

If you are already using this amazing Rust tool, please let us know your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/fd-linux

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://github.com/sharkdp/fd
[3]: https://repology.org/project/fd-find/versions
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
