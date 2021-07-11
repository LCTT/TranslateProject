[#]: subject: (Replace man pages with Tealdeer on Linux)
[#]: via: (https://opensource.com/article/21/6/tealdeer-linux)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: (ddl-hust )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Replace man pages with Tealdeer on Linux
======
Tealdeer is a Rust implementation of tldr, which provides
easy-to-understand information about common commands.
![computer screen ][1]

Man pages were my go-to resource when I started exploring Linux. Certainly, `man` is the most frequently used command when a beginner starts getting familiar with the world of the command line. But man pages, with their extensive lists of options and arguments, can be hard to decipher, which makes it difficult to understand whatever you wanted to know. If you want an easier solution with example-based output, I think [tldr][2] is the best option.

### What's Tealdeer?

[Tealdeer][3] is a wonderful implementation of tldr in Rust. It's a community-driven man page that gives very simple examples of how commands work. The best part about Tealdeer is that it has virtually every command you would normally use.

### Install Tealdeer

On Linux, you can install Tealdeer from your software repository. For example, on [Fedora][4]:


```
`$ sudo dnf install tealdeer`
```

On macOS, use [MacPorts][5] or [Homebrew][6].

Alternately, you can build and install the tool with Rust's Cargo package manager:


```
`$ cargo install tealdeer`
```

### Use Tealdeer

Entering `tldr --list` returns the list of man pages tldr supports, like `touch`, `tar`, `dnf`, `docker`, `zcat`, `zgrep`, and so on:


```
$ tldr --list
2to3
7z
7za
7zr
[
a2disconf
a2dismod
a2dissite
a2enconf
a2enmod
a2ensite
a2query
[...]
```

Using `tldr` with a specific command (like `tar`) shows example-based man pages that describe all the options that you can do with that command:


```
$ tldr tar

  Archiving utility.
  Often combined with a compression method, such as gzip or bzip2.
  More information: &lt;[https://www.gnu.org/software/tar\&gt;][7].

  [c]reate an archive and write it to a [f]ile:

      tar cf target.tar file1 file2 file3

  [c]reate a g[z]ipped archive and write it to a [f]ile:

      tar czf target.tar.gz file1 file2 file3

  [c]reate a g[z]ipped archive from a directory using relative paths:

      tar czf target.tar.gz --directory=path/to/directory .

  E[x]tract a (compressed) archive [f]ile into the current directory [v]erbosely:

      tar xvf source.tar[.gz|.bz2|.xz]

  E[x]tract a (compressed) archive [f]ile into the target directory:

      tar xf source.tar[.gz|.bz2|.xz] --directory=directory

  [c]reate a compressed archive and write it to a [f]ile, using [a]rchive suffix to determine the compression program:

      tar caf target.tar.xz file1 file2 file3
```

To control the cache:


```
    $ tldr --update
    $ tldr --clear-cache
```

You can give Tealdeer output some color with the `--color` option, setting it to `always`, `auto`, and `never`. The default is `auto`, but I like the added context color provides, so I make mine permanent with this addition to my `~/.bashrc` file:


```
`alias tldr='tldr --color always'`
```

### Conclusion

The beauty of Tealdeer is you don't need a network connection to use it, except when you're updating the cache. So, even if you are offline, you can still search for and learn about your new favorite command. For more information, consult the tool's [documentation][8].

Would you use Tealdeer? Or are you already using it? Let us know what you think in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/tealdeer-linux

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK (computer screen )
[2]: https://github.com/tldr-pages/tldr
[3]: https://github.com/dbrgn/tealdeer
[4]: https://src.fedoraproject.org/rpms/rust-tealdeer
[5]: https://opensource.com/article/20/11/macports
[6]: https://opensource.com/article/20/6/homebrew-mac
[7]: https://www.gnu.org/software/tar\>
[8]: https://dbrgn.github.io/tealdeer/intro.html
