A friendly alternative to the find tool in Linux
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

[fd][1] is a super fast, [Rust][2]-based alternative to the Unix/Linux `find` command. It does not mirror all of `find`'s powerful functionality; however, it does provide just enough features to cover 80% of the use cases you might run into. Features like a well thought-out and convenient syntax, colorized output, smart case, regular expressions, and parallel command execution make `fd` a more than capable successor.

### Installation

Head over the [fd][1] GitHub page and check out the section on installation. It covers how to install the application on [macOS,][3] [Debian/Ubuntu][4] [Red Hat][5] , and [Arch Linux][6] . Once installed, you can get a complete overview of all available command-line options by runningfor concise help, or `fd -h` for concise help, or `fd --help` for more detailed help.

### Simple search

`fd` is designed to help you easily find files and folders in your operating system's filesystem. The simplest search you can perform is to run `fd` with a single argument, that argument being whatever it is that you're searching for. For example, let's assume that you want to find a Markdown document that has the word `services` as part of the filename:
```
$ fd services

downloads/services.md

```

If called with just a single argument, `fd` searches the current directory recursively for any files and/or directories that match your argument. The equivalent search using the built-in `find` command looks something like this:
```
$ find . -name 'services'

downloads/services.md

```

As you can see, `fd` is much simpler and requires less typing. Getting more done with less typing is always a win in my book.

### Files and folders

You can restrict your search to files or directories by using the `-t` argument, followed by the letter that represents what you want to search for. For example, to find all files in the current directory that have `services` in the filename, you would use:
```
$ fd -tf services

downloads/services.md

```

And to find all directories in the current directory that have `services` in the filename:
```
$ fd -td services

applications/services

library/services

```

How about listing all documents with the `.md` extension in the current folder?
```
$ fd .md

administration/administration.md

development/elixir/elixir_install.md

readme.md

sidebar.md

linux.md

```

As you can see from the output, `fd` not only found and listed files from the current folder, but it also found files in subfolders. Pretty neat. You can even search for hidden files using the `-H` argument:
```
fd -H sessions .

.bash_sessions

```

### Specifying a directory

If you want to search a specific directory, the name of the directory can be given as a second argument to `fd`:
```
$ fd passwd /etc

/etc/default/passwd

/etc/pam.d/passwd

/etc/passwd

```

In this example, we're telling `fd` that we want to search for all instances of the word `passwd` in the `etc` directory.

### Global searches

What if you know part of the filename but not the folder? Let's say you downloaded a book on Linux network administration but you have no idea where it was saved. No problem:
```
fd Administration /

/Users/pmullins/Documents/Books/Linux/Mastering Linux Network Administration.epub

```

### Wrapping up

The `fd` utility is an excellent replacement for the `find` command, and I'm sure you'll find it just as useful as I do. To learn more about the command, simply explore the rather extensive man page.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/friendly-alternative-find

作者：[Patrick H. Mullins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pmullins
[1]:https://github.com/sharkdp/fd
[2]:https://www.rust-lang.org/en-US/
[3]:https://en.wikipedia.org/wiki/MacOS
[4]:https://www.ubuntu.com/community/debian
[5]:https://www.redhat.com/en
[6]:https://www.archlinux.org/
