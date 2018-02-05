How to use GNU Stow to manage programs installed from source and dotfiles
======

### Objective

Easily manage programs installed from source and dotfiles using GNU stow

### Requirements

  * Root permissions



### Difficulty

EASY

### Conventions

  * **#** \- requires given command to be executed with root privileges either directly as a root user or by use of `sudo` command
  * **$** \- given command to be executed as a regular non-privileged user



### Introduction

Sometimes we have to install programs from source: maybe they are not available through standard channels, or maybe we want a specific version of a software. GNU stow is a very nice `symlinks factory` program which helps us a lot by keeping files organized in a very clean and easy to maintain way.

### Obtaining stow

Your distribution repositories is very likely to contain `stow`, for example in Fedora, all you have to do to install it is:
```
# dnf install stow
```

or on Ubuntu/Debian you can install stow by executing:
```

# apt install stow

```

In some distributions, stow it's not available in standard repositories, but it can be easily obtained by adding some extra software sources (for example epel in the case of Rhel and CentOS7) or, as a last resort, by compiling it from source: it requires very little dependencies.

### Compiling stow from source

The latest available stow version is the `2.2.2`: the tarball is available for download here: `https://ftp.gnu.org/gnu/stow/`.

Once you have downloaded the sources, you must extract the tarball. Navigate to the directory where you downloaded the package and simply run:
```
$ tar -xvpzf stow-2.2.2.tar.gz
```

After the sources have been extracted, navigate inside the stow-2.2.2 directory, and to compile the program simply run:
```

$ ./configure
$ make

```

Finally, to install the package:
```
# make install
```

By default the package will be installed in the `/usr/local/` directory, but we can change this, specifying the directory via the `--prefix` option of the configure script, or by adding `prefix="/your/dir"` when running the `make install` command.

At this point, if all worked as expected we should have `stow` installed on our system

### How does stow work?

The main concept behind stow it's very well explained in the program manual:
```

The approach used by Stow is to install each package into its own tree,
then use symbolic links to make it appear as though the files are
installed in the common tree.

```

To better understand the working of the package, let's analyze its key concepts:

#### The stow directory

The stow directory is the root directory which contains all the `stow packages`, each with their own private subtree. The typical stow directory is `/usr/local/stow`: inside it, each subdirectory represents a `package`

#### Stow packages

As said above, the stow directory contains "packages", each in its own separate subdirectory, usually named after the program itself. A package is nothing more than a list of files and directories related to a specific software, managed as an entity.

#### The stow target directory

The stow target directory is very a simple concept to explain. It is the directory in which the package files must appear to be installed. By default the stow target directory is considered to be the one above the directory in which stow is invoked from. This behaviour can be easily changed by using the `-t` option (short for --target), which allows us to specify an alternative directory.

### A practical example

I believe a well done example is worth 1000 words, so let's show how stow works. Suppose we want to compile and install `libx264`. Lets clone the git repository containing its sources:
```
$ git clone git://git.videolan.org/x264.git
```

Few seconds after running the command, the "x264" directory will be created, and it will contain the sources, ready to be compiled. We now navigate inside it and run the `configure` script, specifying the /usr/local/stow/libx264 directory as `--prefix`:
```
$ cd x264 && ./configure --prefix=/usr/local/stow/libx264
```

Then we build the program and install it:
```

$ make
# make install

```

The directory x264 should have been created inside of the stow directory: it contains all the stuff that would have been normally installed in the system directly. Now, all we have to do, is to invoke stow. We must run the command either from inside the stow directory, by using the `-d` option to specify manually the path to the stow directory (default is the current directory), or by specifying the target with `-t` as said before. We should also provide the name of the package to be stowed as an argument. In this case we run the program from the stow directory, so all we need to type is:
```
# stow libx264
```

All the files and directories contained in the libx264 package have now been symlinked in the parent directory (/usr/local) of the one from which stow has been invoked, so that, for example, libx264 binaries contained in `/usr/local/stow/x264/bin` are now symlinked in `/usr/local/bin`, files contained in `/usr/local/stow/x264/etc` are now symlinked in `/usr/local/etc` and so on. This way it will appear to the system that the files were installed normally, and we can easily keep track of each program we compile and install. To revert the action, we just use the `-D` option:
```
# stow -d libx264
```

It is done! The symlinks don't exist anymore: we just "uninstalled" a stow package, keeping our system in a clean and consistent state. At this point it should be clear why stow it's also used to manage dotfiles. A common practice is to have all user-specific configuration files inside a git repository, to manage them easily and have them available everywhere, and then using stow to place them where appropriate, in the user home directory.

Stow will also prevent you from overriding files by mistake: it will refuse to create symbolic links if the destination file already exists and doesn't point to a package into the stow directory. This situation is called a conflict in stow terminology.

That's it! For a complete list of options, please consult the stow manpage and don't forget to tell us your opinions about it in the comments.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/how-to-use-gnu-stow-to-manage-programs-installed-from-source-and-dotfiles

作者：[Egidio Docile][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
