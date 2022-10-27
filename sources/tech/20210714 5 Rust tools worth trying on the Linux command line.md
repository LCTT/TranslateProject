[#]: subject: (5 Rust tools worth trying on the Linux command line)
[#]: via: (https://opensource.com/article/21/7/rust-tools-linux)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 Rust tools worth trying on the Linux command line
======
Try some new commands for common tasks.
![Terminal command prompt on orange background][1]

Linux inherited a lot from Unix, which has been around for a half-century. This means most of the tools you use in your Linux terminal probably either have a very long history or were written to emulate those historical commands. It's a point of pride in the POSIX world that tools don't _need_ constant reinvention. In fact, there's a subset of Linux users today who could run a version of Linux from [before they were born][2] without having to learn anything new. It's tried, true, and reliable.

That doesn't mean there hasn't been evolution, though. All the commands Linux users know and love have been improved over the years. Some have even been replaced entirely and are so common now that few people still care to remember the old ones. Can you imagine Linux without SSH? Well, believe it or not, the `ssh` command replaced one called `rsh`.

I'm often on the lookout for new commands because I'm always intrigued by the possibility of getting things done more efficiently. If there's a better, faster, or more robust command out there for doing a common task, I want to know about it. And while there's equal opportunity for any language to invent new Linux commands, Rust developers have been delivering an impressive collection of useful general-purpose utilities.

### Replace man with tealdeer

Tealdeer provides the `tldr` command, which displays an abbreviated, no-nonsense summary of how a command is used. It's not that manual and info pages aren't useful, because they are, but sometimes they can be a little verbose and a little obtuse. Tealdeer keeps its hints clear and concise, with examples of how to use the command you're struggling to recall.


```
$ tldr tar

  Archiving utility.
  Often combined with a compression method, such as gzip or bzip2.
  More information: &lt;[https://www.gnu.org/software/tar\&gt;][3].

  [c]reate an archive and write it to a [f]ile:

      tar cf target.tar file1 file2 file3

  [c]reate a g[z]ipped archive and write it to a [f]ile:

      tar czf target.tar.gz file1 file2 file3

  [c]reate a g[z]ipped archive from a directory using relative paths:

      tar czf target.tar.gz --directory=path/to/directory .
[...]
```

Read the full article [about tldr][4].

### Replace du with dust

The `du` command gives feedback about disk usage. It's a relatively simple task; likewise, the command is pretty simple, too. The `dust` command is `du` written in Rust, and it uses color-coding and bar graphs for users who prefer added visual context.


```
$ dust
 5.7M   ┌── exa                                   │                                   ██ │   2%
 5.9M   ├── tokei                                 │                                   ██ │   2%
 6.1M   ├── dust                                  │                                   ██ │   2%
 6.2M   ├── tldr                                  │                                   ██ │   2%
 9.4M   ├── fd                                    │                                   ██ │   4%
 2.9M   │ ┌── exa                                 │                                 ░░░█ │   1%
  15M   │ ├── rustdoc                             │                                 ░███ │   6%
  18M   ├─┴ bin                                   │                                 ████ │   7%
  27M   ├── rg                                    │                               ██████ │  11%
 1.3M   │     ┌── libz-sys-1.1.3.crate            │  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   0%
 1.4M   │     ├── libgit2-sys-0.12.19+1.1.0.crate │  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   1%
 4.5M   │   ┌─┴ github.com-1ecc6299db9ec823       │  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█ │   2%
 4.5M   │ ┌─┴ cache                               │  ░░░░░░░░░░░░░░░░░░░░░░░░
[...]
```

Read the full article [about dust][5].

### Replace find with fd

The `find` command is a useful tool for finding files on your computer, but its syntax can be difficult to master. Not only are there a lot of options, but the order of those options can be significant, depending on what you're doing. Some people have [written scripts][6] to abstract the task away from the command. Other people just write a new tool altogether, like `fd`.

Syntax doesn't get any easier than this:


```
$ fd example
Documents/example.txt
Documents/example-java
Downloads/example.com/index.html
```

Read the full article [about fd][7].

### Replace ls with exa

You might not think that the `ls` command would have much room for improvement. But `exa` proves that even the most mundane utility can benefit from small adjustments. For instance, why not have a list command with built-in Git awareness? Why not get extra metadata in your file lists? 

Read the full [article about exa][8].

### Try Tokei

Unlike the other tools on this list, the `tokei` utility doesn't replace one command, but it does demonstrate how the Linux terminal is—as always—an environment very much in constant growth. The terminal may contain lots of legacy commands, but there are new and exciting commands surfacing all the time.

When I'm looking at a project in my local file system, and I need to know what languages it contains, I rely on a tool like Tokei. It's a program that displays statistics about a codebase, with wide support for 150 programming languages. I don't need to remember what languages have been used, or how many lines of code there are, or how many blanks or spaces or comments are there. It's a complete code-analysis tool, making my entry into and navigation of the code easy.


```
$ tokei ~/exa/src ~/Work/wildfly/jaxrs
==================
Language   Files Lines Code Comments Blank
Java        46    6135  4324  945     632
XML         23    5211  4839  473     224
\---------------------------------
Rust
Markdown
\-----------------------------------
Total
```

Read the full [article about tokei][9].

### Find your favorite

Open source users never have to settle for just a small set of commands, or even just one version of a command. Find the commands you love, whether they're new ideas for emerging workflows, or reimplementations of old tools, or timeless classics that are just as good today as they were decades ago. Find the commands that make your life better and enjoy!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/rust-tools-linux

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://opensource.com/article/16/12/yearbook-linux-test-driving-distros
[3]: https://www.gnu.org/software/tar\>
[4]: https://opensource.com/article/21/6/tealdeer
[5]: https://opensource.com/article/21/6/dust
[6]: https://opensource.com/article/20/2/find-file-script
[7]: https://opensource.com/article/21/6/fd
[8]: https://opensource.com/article/21/3/replace-ls-exa
[9]: https://opensource.com/article/21/6/tokei
