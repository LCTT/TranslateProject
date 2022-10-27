[#]: subject: "stow: Your Package Manager When You Can't Use Your Package Manager"
[#]: via: "https://theartofmachinery.com/2021/08/08/stow_as_package_manager.html"
[#]: author: "Simon Arneaud https://theartofmachinery.com"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

stow: Your Package Manager When You Can't Use Your Package Manager
======

[GNU `stow`][1] is an underrated tool. Generically, it helps maintain a unified tree of files that come from different sources. More concretely, I use a bunch of software (D compilers, various tools) that I install manually instead of through my system’s package manager (for various reasons). `stow` makes that maintainable by letting me cleanly add/remove packages and switch between versions. Here’s how it’s done.

### The ~/local/ directory

The idea is simple: you `stow` install all personal software inside a `local/` directory inside your home directory. The resulting directory structure looks the same as if you installed the software normally to the filesystem root, so you’ll end up with `~/local/bin` and `~/local/lib` directories, etc.

Setting up the `local/` directory for use with `stow` is easy. The main thing you need is a `local/` directory in your home directory, with a `stow/` subdirectory to store package archives:

```
$ mkdir -p ~/local/stow
```

If you’re installing programs into your `local/` directory, you probably want to add `local/bin` to your `PATH` so you can easily use programs there like other programs. You can add this to the end of your `~/.profile` file (or whatever init file is used by your shell):

```
PATH="$HOME/local/bin:$PATH"
```

### Downloading and installing tarball packages

I like [`tsv-utils`][2], a handy collection of tools for data analysis on the command line. It’s not in the normal package managers I use, but there are pre-compiled tarball archives available. Here’s how to use them with `stow`.

First, switch to your `stow` archive directory:

```
$ cd ~/local/stow
```

Then download the tarball and extract it:

```
$ wget https://github.com/eBay/tsv-utils/releases/download/v2.2.0/tsv-utils-v2.2.0_linux-x86_64_ldc2.tar.gz
$ tar xf tsv-utils-v2.2.0_linux-x86_64_ldc2.tar.gz
```

You’ll now have a directory containing all the package files:

```
$ tree tsv-utils-v2.2.0_linux-x86_64_ldc2
tsv-utils-v2.2.0_linux-x86_64_ldc2
├── LICENSE.txt
├── ReleasePackageReadme.txt
├── bash_completion
│   └── tsv-utils
├── bin
│   ├── csv2tsv
│   ├── keep-header
│   ├── number-lines
│   ├── tsv-append
│   ├── tsv-filter
│   ├── tsv-join
│   ├── tsv-pretty
│   ├── tsv-sample
│   ├── tsv-select
│   ├── tsv-split
│   ├── tsv-summarize
│   └── tsv-uniq
└── extras
    └── scripts
        ├── tsv-sort
        └── tsv-sort-fast

4 directories, 17 files
```

You can delete the `.tar.gz` archive if you want.

Now you can install the package into `local/` with `stow`:

```
$ stow tsv-utils-v2.2.0_linux-x86_64_ldc2
```

That creates a bunch of symbolic links inside the parent directory (`~/local/`) pointing to files and directories inside the package directory (`~/local/stow/tsv-utils-v2.2.0_linux-x86_64_ldc2`).

If you’ve set your `PATH` (you might need to restart your shell), you’ll now be able to run `tsv-utils` commands normally:

```
$ tsv-summarize --help
Synopsis: tsv-summarize [options] file [file...]

tsv-summarize runs aggregation operations on fields in tab-separated value
files. Operations can be run against the full input data or grouped by key
fields. Fields can be specified either by field number or field name. Use
'--help-verbose' for more detailed help.

Options:

[*snip*]
```

# Removing and upgrading packages

Okay, `stow`’s algorithm for managing symbolic links is neat, but so far there’s no practical benefit over extracting the tarball directly into `local/`. `stow` shines when you’re maintaining your package collection. For example, if you decide to uninstall `tsv-utils` later, you just need to switch to the archive directory and run `stow` again with the `-D` flag:

```
$ cd ~/local/stow
$ stow -D tsv-utils-v2.2.0_linux-x86_64_ldc2
```

That will cleanly remove `tsv-utils` from the `local/` directory without breaking any other installed packages. Try doing that after extracting the tarball directly to `local/`.

The package directory inside the `stow/` directory will remain, but you can delete that too, if you want, of course.

`stow` doesn’t manage versions, so upgrading packages means uninstalling the old package and installing the new package. `stow` detects when packages collide (e.g., they both include a file called `bin/tsv-summarize`), so you can only install one version at a time. However, you can keep as many archive directories as you like in `stow/`, allowing you to easily switch back and forth between versions if you need to.

### Building packages from source

Not all software comes precompiled. Sometimes you’re experimenting with your own custom version. If you want to use source packages with `stow`, you just need to figure out how to make the source package install to a directory in your `stow/` directory, instead of your filesystem root.

Suppose I want to install my own version of the [GraphicsMagick][3] image processing tools. This will be a two-stage process. First I’ll need to download and extract the source somewhere (I keep a `src/` directory for third-party source code).

```
$ cd ~/src
$ wget -O GraphicsMagick-1.3.36.tar.gz https://sourceforge.net/projects/graphicsmagick/files/graphicsmagick/1.3.36/GraphicsMagick-1.3.36.tar.gz/download
$ tar xf GraphicsMagick-1.3.36.tar.gz
$ cd GraphicsMagick-1.3.36
```

GraphicsMagick uses a GNU-style build system using `autotools`. `configure` scripts take a `--prefix` option that sets the installation root.

```
$ ./configure --prefix="$HOME/local/stow/GraphicsMagick-1.3.36"
$ make install
```

The installation step automatically creates the `stow/GraphicsMagick-1.3.36/` directory. Now I just need to install the built package with `stow`.

```
$ cd ~/local/stow
$ stow GraphicsMagick-1.3.36
$ gm version
GraphicsMagick 1.3.36 20201226 Q8 http://www.GraphicsMagick.org/
Copyright (C) 2002-2020 GraphicsMagick Group.
Additional copyrights and licenses apply to this software.
See http://www.GraphicsMagick.org/www/Copyright.html for details.

[*snip*]
```

### Other uses

This is my personal favourite usage of `stow`, but it’s just a generic tool for merging multiple filesystem trees in a maintainable way. Some people use it to manage their `/etc/` configuration files, for example. If you try it out, I’m sure you can find other use cases.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2021/08/08/stow_as_package_manager.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/stow/
[2]: https://github.com/eBay/tsv-utils
[3]: http://www.graphicsmagick.org/
