[#]: subject: "5 ways to learn C programming on Linux"
[#]: via: "https://opensource.com/article/22/7/learn-c-linux"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lkxed"
[#]: translator: "Donkey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 ways to learn C programming on Linux
======
Download our new eBook for tips and tricks for C programming on Linux and FreeDOS.

![Person using a laptop][1]

There are many theories about why the C programming language has endured for as long as it has. Maybe it's the austerity of its syntax or the simplicity of its vocabulary. Or maybe it's that C is often seen as a utilitarian language, something that's rugged and ready to be used as a building material for something that needs no platform because it's going to be its own foundation. C is clearly a powerful language, and I think its longevity has a little something to do with the way it serves as a springboard for other popular technologies. Here are five of my favorite technologies that utilize and rely upon C, and how they can each help you learn more about C yourself.

### 1. GObject and GTK

C is not an object-oriented programming language. It has no `class` type. Some folks use C++ for object-oriented programming, but others stick with C along with the GObject libraries. The GObject subsystem provides a `class` structure for C, and the GTK project famously provides widgets accessible through C. Without GTK, there would be no GIMP (for which GTK was developed), GNOME, and hundreds of other popular open source applications.)

#### Learn more

GObject and GTK are excellent ways to start using C for GUI programming. They're well-equipped to get you programming graphical applications using C because they do so much of the "heavy lifting" for you. The classes and data types are defined, the widgets have been made, and all you have to do is put everything together.

### 2. Ncurses

If GTK is more than you need, you might decide a terminal user interface (TUI) is more your speed. The ncurses library creates "widgets" in a terminal, creating a kind of graphical application that gets drawn over your terminal window. You can control the interface with your arrow keys, selecting buttons and elements much the same way you might use a GUI application without a mouse.

#### Learn more

Get started by writing a [guessing game in C][3] using the ncurses library as your display.

### 3. Lua and Moonscript

Lua is a scripting language with access to C libraries through a built-in C API. It's a tiny, fast, and simple language with about 30 functions and just a handful of built-in libraries. You can get started with Lua for system automation, game modding and scripting, game development with a frontend like LÖVE, or general application development (like the [Howl text editor][4]) using GTK.

#### Learn more

The nice thing about Lua is that you can start out with it to learn the basic concepts of programming, and then start exploring its C API when you feel brave enough to interface directly with the foundational language. If, on the other hand, you never grow out of Lua, that's OK too. There's a wealth of [extra libraries][5] for Lua to make it a great choice for all manner of development.

### 4. Cython

Lua isn't the only language that interfaces with C. [Cython][6] is a compiler and language designed to make writing C extensions for Python as easy as writing Python code. Essentially, you can write Python and end up with C. The simplest possible example:

```
print("hello world")
```

Create a `setup.py` script:

```
from setuptools import setup
from Cython.Build import cythonize

setup(
    ext_modules = cythonize("hello.pyx")
)
```

Run the setup script:

```
$ python3 ./setup.py
```

And you end up with a `hello.c` and `hello.cpython-39-x86_64-linux-gnu.so` file in the same directory.

#### Learn more

The [Cython][7] language is a superset of Python with support for C functions, and datatypes. It isn't likely to directly help you learn C, but it opens up new possibilities for the Python developer looking to learn and integrate C code into Python.

### 5. FreeDOS

The best way to learn more about C is to write code in C, and there's nothing more exciting than writing code you can actually use. The FreeDOS project is an open source implementation of DOS, the predecessor to Windows. You may have already used FreeDOS, either as a handy open source method of running a BIOS updater, or maybe in an emulator to play a classic computer game. You can do a lot more with FreeDOS than that, though. It makes an ideal platform to learn C with a collection of tools that encourage you to write your own commands and simple (or not-so-simple, if you prefer) applications. Of course you can write C code on any OS, but there's a simplicity to FreeDOS that you might find refreshing. The sky's the limit, but even at ground level, you can do some amazingly fun things with C.

### Download the eBook

You can learn more about C in our **[new eBook][8]**, and more about C on FreeDOS in our eBook. These are collections of programming articles to help you learn C and to demonstrate how you can implement C in useful ways.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/learn-c-linux

作者：[Alan Smithee][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/laptop_screen_desk_work_chat_text.png
[2]: https://opensource.com/downloads/guide-c-programming
[3]: https://opensource.com/article/21/8/guess-number-game-ncurses-linux
[4]: https://opensource.com/article/20/12/howl
[5]: https://opensource.com/article/19/11/getting-started-luarocks
[6]: http://cython.org
[7]: https://opensource.com/article/21/4/cython
[8]: https://opensource.com/downloads/guide-c-programming
