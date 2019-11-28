[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make Lua development easy with Luarocks)
[#]: via: (https://opensource.com/article/19/11/getting-started-luarocks)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Make Lua development easy with Luarocks
======
Luarocks makes it easy to get started with Lua, a lightweight,
efficient, and embeddable scripting language.
![Coding on a computer][1]

Bash too basic? Too much whitespace in Python? Go too corporate?

You should try Lua, a lightweight, efficient, and embeddable scripting language supporting procedural programming, object-oriented programming, functional programming, data-driven programming, and data description. And best of all, it uses explicit syntax for scoping!

Lua is also small. Lua's source code is just 24,000 lines of C, the Lua interpreter (on 64-bit Linux) built with all standard Lua libraries is 247K, and the Lua library is 421K.

You might think that such a small language must be too simplistic to do any real work, but in fact Lua has a vast collection of third-party libraries (including GUI toolkits), it's used extensively in video game and film production for 3D shaders, and is a common scripting language for video game engines. To make it easy to get started with Lua, there's even a package manager called [Luarocks][2].

### What is Luarocks?

Python has PIP, Ruby has Gems, Java has Maven, Node has npm, and Lua has Luarocks. Luarocks is a website and a command. The website is home to open source libraries available for programmers to add to their Lua projects. The command searches the site and installs libraries (defined as "rocks") upon demand.

### What is a programming library?

If you're new to programming, you might think of a "library" as just a place where books are stored. Programming libraries ("lib" or "libs" for short) are a little like a book library in the sense that both of these things contain information that someone else has already worked to discover, and which you can borrow so you have to do less work.

For example, if you were writing code that measures how much stress a special polymer can withstand before breaking, you might think you'd have to be pretty clever with math. But if there was already an open source library specifically designed for exactly that sort of calculation, then you could include that library in your code and let it solve that problem for you (provided you give the library's internal functions the numbers it needs in order to perform an accurate calculation).

In open source programming, you can install libraries freely and use other people's work at will. Luarocks is the mechanism for Lua that makes it quick and easy to find and use a Lua library.

### Installing Luarocks

The **luarocks** command isn't actually _required_ to use packages from the Luarocks website, but it does keep you from having to leave your text editor and venture onto the worldwide web [of potential distractions]. To install Luarocks, you first need to install Lua.

Lua is available from [lua.org][3] or, on Linux, from your distribution's software repository. For example, on Fedora, CentOS, or RHEL:


```
`$ sudo dnf install lua`
```

On Debian and Ubuntu:


```
`$ sudo apt install lua`
```

On Windows and Mac, you can download and install Lua from the website.

Once Lua is installed, install Luarocks. If you're on Linux, the **luarocks** command is available in your distribution's repository.

On Mac, you can install it with [Brew][4] or compile from source:


```
$ wget <https://luarocks.org/releases/luarocks-X.Y.Z.tar.gz>
$ tar zxpf luarocks-X.Y.Z.tar.gz
$ cd luarocks-X.Y.Z
$ ./configure; sudo make bootstrap
```

On Windows, follow the [install instructions][5] on the Luarocks wiki.

### Search for a library with Luarocks

The typical usage of the **luarocks** command, from the perspective of a user rather than a developer, involves searching for a library required by some Lua application you want to run and installing that library.

To search for the Lua package **luasec** (a library providing HTTPS support for **luarocks**), try this command:


```
$ luarocks search luasec
Warning: falling back to curl -
install luasec to get native HTTPS support

Search results:
===============

Rockspecs and source rocks:
\---------------------------

luasec
   0.9-1 (rockspec) - <https://luarocks.org>
   0.9-1 (src) - <https://luarocks.org>
   0.8.2-1 (rockspec) - <https://luarocks.org>
[...]
```

### Install a library with Luarocks

To install the **luasec** library:


```
$ luarocks install --local luasec
[...]
gcc -shared -o ssl.so -L/usr/lib64
src/config.o src/ec.o src/x509.o [...]
-L/usr/lib -Wl,-rpath,/usr/lib: -lssl -lcrypto

luasec 0.9-1 is now installed in
/home/seth/.luarocks (license: MIT)
```

You can install Lua libraries locally or on a systemwide basis. A _local_ install indicates that the Lua library you install is available to you, but no other user of the computer. If you share your computer with someone else, and you each have your own [login account][6], then you probably want to install a library systemwide. However, if you're the only user of your computer, it's a good habit to install libraries locally, if only because that's the appropriate method when you develop with Lua.

If you're _developing_ a Lua application, then you probably want to install a library to a project directory instead. In Luarocks terminology, this is a _tree_. Your default tree when installing libraries locally is **$HOME/.luarocks**, but you can redefine it arbitrarily.


```
$ mkdir local
$ luarocks --tree=./local install cmark
Installing <https://luarocks.org/cmark-0.YY.0-1.src.rock>
gcc -O2 -fPIC -I/usr/include -c cmark_wrap.c [..]
gcc -O2 -fPIC -I/usr/include -c ext/blocks.c -o ext/blocks.o [..]
[...]
No existing manifest. Attempting to rebuild...
cmark 0.29.0-1 is now installed in
/home/seth/downloads/osdc/example-lua/./local
(license: BSD2)
```

The library (in this example, the **cmark** library) is installed to the path specified by the **\--tree** option. You can verify it by listing the contents of the destination:


```
$ find ./local/ -type d -name "cmark"
./local/share/lua/5.1/cmark
./local/lib/luarocks/rocks/cmark
```

You can use the library in your Lua code by defining the **package.path** variable to point to your local rocks directory:


```
package.path = package.path .. ';local/share/lua/5.3/?.lua'

require("cmark")
```

### Getting information about an installed rock

You can see information about an installed rock with the **show** option:


```
$ luarocks show luasec
LuaSec 0.9-1 - A binding for OpenSSL library
to provide TLS/SSL communication over LuaSocket.

This version delegates to LuaSocket the TCP
connection establishment between
the client and server. Then LuaSec uses this
connection to start a secure TLS/SSL session.

License:        MIT
Homepage:       <https://github.com/brunoos/luasec/wiki>
Installed in:   /home/seth/.luarocks
[...]
```

This provides you with a summary of what a library provides from a user's perspective, displays the project homepage in case you want to investigate further, and shows you where the library is installed. In this example, it's installed in my home directory in a **.luarocks** folder. This assures me that it's installed locally, which means that if I migrate my home directory to a different computer, I'll retain my Luarocks configuration and installs.

### Get a list of installed rocks

You can list all installed rocks on your system with the **list** option:


```
$ luarocks list

Installed rocks:
\----------------

luasec
   0.9-1 (installed) - /home/seth/.luarocks/lib/luarocks/rocks

luasocket
   3.0rc1-2 (installed) - /home/seth/.luarocks/lib/luarocks/rocks

luce
   scm-0 (installed) - /home/seth/.luarocks/lib/luarocks/rocks

tekui
   1.07-1 (installed) - /home/seth/.luarocks/lib/luarocks/rocks
```

This displays the rocks you have installed in the default install location. Developers can override this by using the **\--tree** option to redefine the active tree.

### Remove a rock

If you want to remove a rock, you can do that with Luarocks using the **remove** option:


```
`$ luarocks remove --local cmark`
```

This removes a library (in this example, the **cmark** library) from your local tree. Developers can override this by using the **\--tree** option to redefine the active tree.

If you want to remove _all_ the rocks you have installed, use the **purge** option instead.

### Luarocks rocks

Whether you're a user exploring exciting new Lua applications and need to install some dependencies or you're a developer using Lua to create exciting new applications, Luarocks makes your job easy. Lua is a beautiful and simple language, and Luarocks is perfectly suited to be its package manager. Give both a try today!

Discussing Tarantool this year at the Percona Live Data Performance Conference.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/getting-started-luarocks

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://luarocks.org
[3]: http://lua.org
[4]: http://brew.sh
[5]: https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Windows
[6]: https://opensource.com/article/19/11/add-user-gui-linux
