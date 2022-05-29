[#]: subject: "Compile GNOME Shell and Apps From Source [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/2022/05/compile-gnome-source/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Compile GNOME Shell and Apps From Source [Beginner’s Guide]
======
Here’s a quick guide for you on how to compile GNOME from its source, including the shell, mutter and some native apps.

Before you compile, you need to make sure certain things because the following compilation is directly from the master branch in GitLab, which contains some development packages.

In general, you can compile in any Linux distribution of your choice. But I would recommend using Fedora Rawhide which is the development branch of Fedora, for future releases.

Also, do not try this in a stable system. Because things may go wrong, you may end up with a broken system.

To summarize, you need the following to compile GNOME from the source.

* A test setup ([Virtual machine][1] or a test system)
* Fedora Rawhide Distro (recommended. [Download from here][2])
* Make sure your distro is up to date.
* And you are logged in to an X.Org session.

I would not recommend compiling in the Wayland session because you will run into problems.

### Compile GNOME from the Source

The GNOME desktop is a collection of packages based on their functions. The desktop component of a Linux distribution works under a window manager and shell.

So for GNOME, I will first compile mutter – the window manager for GNOME Shell. And then followed by the compilation of GNOME Shell. Finally, I will compile some native apps.

I will use the meson build system for compilation. The meson is a beautiful build system which is fast and user friendly.

#### Compile Mutter

Open a terminal and install the required packages for GNOME Shell and mutter.

```
sudo dnf build-dep mutter gnome-shell
```

Create a demo directory in your home drive (or anywhere you want).

```
cd ~
```

```
mkdir demo
```

```
cd demo
```

Clone the mutter master branch from GitLab.

git clone https://gitlab.gnome.org/GNOME/mutter

Go to the cloning directory and use the below meson command to prepare the build files. By default, meson uses `/usr/local` for building files. However, you can also use prefix switch to redirect the output to a specific folder (shown below).

```
cd mutter
```

```
meson _build --prefix=/usr
```

![Compile Mutter for GNOME][3]

Install mutter in your system when the build is complete using the below command.

```
sudo ninja install -C _build
```

#### Compile GNOME Shell

The compilation of GNOME Shell and other packages are similar. First, clone the GNOME Shell master repository from GitLab, then build and install. You can follow the below commands in sequence.

There are two dependencies which you need for GNOME Shell. They are [asciidoc][4] and [sassc][5]. Install them before you build GNOME Shell.

```
sudo dnf install asciidoc
```

```
sudo dnf install sassc
```

After installing these dependencies, follow the below commands to build and install GNOME Shell. Make sure you go back to the `demo` folder (which I created in the first step) before running this command.

```
git clone https://gitlab.gnome.org/GNOME/gnome-shellcd gnome-shellmeson _build --prefix=/usrsudo ninja install -C _build
```

### Running the GNOME Shell

After you finish compiling, you can try restarting the GNOME Shell to see the changes from the master branch.

Before you restart, as I mentioned earlier, make sure you are in the X.Org session. Press `ALT+F2` and type `r`. Then press enter. This command will restart GNOME Shell.

![Restart GNOME Shell (X11)][6]

And congratulations! You have successfully compiled GNOME Shell and Mutter.

Now, it’s time to compile some sample GNOME native applications.

### Compile GNOME Native Applications

The steps are the same for all sources of GNOME or any applications. You need to change the repo name. So, here are some sample commands to compile necessary GNOME native apps.

#### Files (Nautilus)

```
git clone https://gitlab.gnome.org/GNOME/nautilus/cd gnome-shellmeson _build --prefix=/usrsudo ninja install -C _build
```

#### GNOME Software

```
git clone https://gitlab.gnome.org/GNOME/gnome-software/cd gnome-shellmeson _build --prefix=/usrsudo ninja install -C _build
```

#### GNOME Control Center

```
git clone https://gitlab.gnome.org/GNOME/gnome-control-center/cd gnome-shellmeson _build --prefix=/usrsudo ninja install -C _build
```

### FAQ

1. Using the above steps, you can compile any source branch. Not only GNOME.
2. The GitLab server is sometimes slow, and it may take a longer time to clone a repo. If the `git clone` fails, I would recommend you to try again.

### Closing Notes

I hope this little advanced tutorial helps you try out new GNOME features before they land in GNOME nightly OS. Since you compiled, you may also contribute to testing new GNOME features and report any bugs or problems on the GitLab Issues page for specific packages.

This article is the first instalment of the open-source app compilation series. Stay tuned for more compilation articles of more open-source apps.

Also, do let me know your comments, suggestions, or any error you faced using these instructions in the comment box.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/compile-gnome-source/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/virtual-machine
[2]: https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Workstation/x86_64/iso/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/05/Compile-Mutter-for-GNOME.jpg
[4]: https://asciidoc.org/
[5]: https://github.com/sass/sassc
[6]: https://www.debugpoint.com/wp-content/uploads/2022/05/Restart-GNOME-Shell-X11.jpg
