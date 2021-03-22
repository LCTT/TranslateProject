[#]: subject: (Why I use exa instead of ls on Linux)
[#]: via: (https://opensource.com/article/21/3/replace-ls-exa)
[#]: author: (Sudeshna Sur https://opensource.com/users/sudeshna-sur)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Why I use exa instead of ls on Linux
======
Exa is a modern-day replacement for the Linux ls command.
![bash logo on green background][1]

We live in a busy world and can save time and effort by using the ls command when we need to look for files and data. But without a lot of tweaking, the default ls output isn't quite soothing to the eyes. Why spend your time squinting at black and white text when you have an alternative in exa?

[Exa][2] is a modern-day replacement for the regular ls command, and it makes life easier. The tool is written in [Rust][3], which is known for its parallelism and safety.

### Install exa

To install exa, run:


```
`$ dnf install exa`
```

### Explore exa's features

Exa improves upon the ls file list with more features and better defaults. It uses colors to distinguish file types and metadata. It knows about symlinks, extended attributes, and Git. And it's small, fast, and has just a single binary.

#### Track files

You can use exa to track a new file added in a given Git repo.

![Tracking Git files with exa][4]

(Sudeshna Sur, [CC BY-SA 4.0][5])

#### Tree structure

This is exa's basic tree structure. The level determines the depth of the listing; this is set to two. If you want to list more subdirectories and files, increase the level's value.

![exa's default tree structure][6]

(Sudeshna Sur, [CC BY-SA 4.0][5])

This tree includes a lot of metadata about each file.

![Metadata in exa's tree structure][7]

(Sudeshna Sur, [CC BY-SA 4.0][5])

#### Color schemes

By default, exa segregates different file types according to [built-in color schemes][8]. It not only color-codes files and directories, but also Cargo.toml, CMakeLists.txt, Gruntfile.coffee, Gruntfile.js, Makefile, and many other file types.

#### Extended file attributes

When you're exploring xattrs (extended file attributes) in exa, `--extended` will show up in all the xattrs.

![xattrs in exa][9]

(Sudeshna Sur, [CC BY-SA 4.0][5])

#### Symlinks

Exa understands symlinks and also points out the actual file.

![symlinks in exa][10]

(Sudeshna Sur, [CC BY-SA 4.0][5])

#### Recurse

When you want to loop listings for all directories under the current directory, exa brings in recurse.

![recurse in exa][11]

(Sudeshna Sur, [CC BY-SA 4.0][5])

### Conclusion

I believe exa is one of the easiest, most adaptable tools. It helps me track a lot of Git and Maven files. Its color-coding makes it easier for me to search through multiple subdirectories, and it helps me to understand the current xattrs.

Have you replaced ls with exa? Please share your feedback in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/replace-ls-exa

作者：[Sudeshna Sur][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sudeshna-sur
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://the.exa.website/docs
[3]: https://opensource.com/tags/rust
[4]: https://opensource.com/sites/default/files/uploads/exa_trackingfiles.png (Tracking Git files with exa)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/exa_treestructure.png (exa's default tree structure)
[7]: https://opensource.com/sites/default/files/uploads/exa_metadata.png (Metadata in exa's tree structure)
[8]: https://the.exa.website/features/colours
[9]: https://opensource.com/sites/default/files/uploads/exa_xattrs.png (xattrs in exa)
[10]: https://opensource.com/sites/default/files/uploads/exa_symlinks.png (symlinks in exa)
[11]: https://opensource.com/sites/default/files/uploads/exa_recurse.png (recurse in exa)
