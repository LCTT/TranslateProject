translating---geekpi

8 creepy commands that haunt the terminal | Opensource.com
======

Welcome to the spookier side of Linux.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/halloween_bag_bat_diy.jpg?itok=24M0lX25)

It’s that time of year again: The weather gets chilly, the leaves change colors, and kids everywhere transform into tiny ghosts, goblins, and zombies. But did you know that Unix (and Linux) and its various offshoots are also chock-full of creepy crawly things? Let’s take a quick look at some of the spookier aspects of the operating system we all know and love.

### daemon

Unix just wouldn’t be the same without all the various daemons that haunt the system. A `daemon` is a process that runs in the background and provides useful services to both the user and the operating system itself. Think SSH, FTP, HTTP, etc.

### zombie

Every now and then a zombie, a process that has been killed but refuses to go away, shows up. When this happens, you have no choice but to dispatch it using whatever tools you have available. A zombie usually indicates that something is wrong with the process that spawned it.

### kill

Not only can you use the `kill` command to dispatch a zombie, but you can also use it to kill any process that’s adversely affecting your system. Have a process that’s using too much RAM or CPU cycles? Dispatch it with the `kill` command.

### cat

The `cat` command has nothing to do with felines and everything to do with combining files: `cat` is short for "concatenate." You can even use this handy command to view the contents of a file.


### tail


The `tail` command is useful when you want to see last n number of lines in a file. It’s also great when you want to monitor a file.

### which

No, not that kind of witch, but the command that prints the location of the files associated with any command passed to it. `which python`, for example, will print the locations of every version of Python on your system.

### crypt

The `crypt` command, known these days as `mcrypt`, is handy when you want to scramble (encrypt) the contents of a file so that no one but you can read it. Like most Unix commands, you can use `crypt` standalone or within a system script.

### shred

The `shred` command is handy when you not only want to delete a file but you also want to ensure that no one will ever be able to recover it. Using the `rm` command to delete a file isn’t enough. You also need to overwrite the space that the file previously occupied. That’s where `shred` comes in.

These are just a few of the spooky things you’ll find hiding inside Unix. Do you know more creepy commands? Feel free to let me know.

Happy Halloween!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/spookier-side-unix-linux

作者：[Patrick H.Mullins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
[b]: https://github.com/lujun9972
