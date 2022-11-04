[#]: subject: (Parsing config files with Lua)
[#]: via: (https://opensource.com/article/21/6/parsing-config-files-lua)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( hadisi1993)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Parsing config files with Lua
======
Configure persistent application settings with the Lua programming
language.
![Woman sitting in front of her computer][1]

Not all applications need configuration files; many applications benefit from starting fresh each time they are launched. Simple utilities, for instance, rarely require preferences or settings that persist across uses. However, when you write a complex application, it's nice for users to be able to configure how they interact with it and how it interacts with their system. That's what configuration files are for, and this article discusses some of the ways you can implement persistent settings with the Lua programming language.

### Choose a format

The important thing about configuration files is that they are consistent and predictable. You do not want to dump information into a file under the auspices of saving user preferences and then spend days writing code to reverse-engineer the random bits of information that have ended up in the file.

There are several popular [formats for configuration files][2]. Lua has libraries for most of the common configuration formats; in this article, I'll use the INI format.

### Installing the library

The central hub for Lua libraries is [Luarocks.org][3]. You can search for libraries on the website, or you can install and use the `luarocks` terminal command.

On Linux, you can install it from your distribution's software repository. For example:


```
`$ sudo dnf install luarocks`
```

On macOS, use [MacPorts][4] or [Homebrew][5]. On Windows, use [Chocolatey][6].

Once `luarocks` is installed, you can use the `search` subcommand to search for an appropriate library. If you don't know the name of a library, you can search for a keyword, like `ini` or `xml` or `json`, depending on what's relevant to what you're trying to do. In this case, you can just search for `inifile`, which is the library I use to parse text files in the INI format:


```
$ luarocks search inifile
Search results:
inifile
 1.0-2 (rockspec) - <https://luarocks.org>
 1.0-2 (src) - <https://luarocks.org>
 1.0-1 (rockspec) - <https://luarocks.org>
 [...]
```

A common trap programmers fall into is installing a library on their system and forgetting to bundle it with their application. This can create problems for users who don't have the library installed. To avoid this, use the `--tree` option to install the library to a local folder within your project directory. If you don't have a project directory, create one first, and then install:


```
$ mkdir demo
$ cd demo
$ luarocks install --tree=local inifile
```

The `--tree` option tells `luarocks` to create a new directory, called `local` in this case, and install your library into it. With this simple trick, you can install all the dependency code your project uses directly into the project directory.

### Code setup

First, create some INI data in a file called `myconfig.ini`:


```
[example]
name=Tux
species=penguin
enabled=false

[demo]
name=Beastie
species=demon
enabled=false
```

Save the file as `myconfig.ini` into your home directory, _not_ into your project directory. You usually want configuration files to exist outside your application so that even when a user uninstalls your application, the data they generate while using the application remains on their system. Users might remove unnecessary config files manually, but many don't. As a result, if they reinstall an application, it will retain all of their preferences.

Config file locations are technically unimportant, but each operating system (OS) has a specification or a tradition of where they ought to be placed. On Linux, this is defined by the [Freedesktop specification][7]. It dictates that configuration files are to be saved in a hidden folder named `~/.config`. For clarity during this exercise, just save the file in your home directory so that it's easy to find and use.

Create a second file named `main.lua` and open it in your favorite text editor.

First, you must tell Lua where you've placed the additional library you want it to use. The `package.path` variable determines where Lua looks for libraries. You can view Lua's default package path in a terminal:


```
$ Lua
&gt; print(package.path)
./?.lua;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;/usr/lib64/lua/5.3/?.lua;/usr/lib64/lua/5.3/?/init.lua
```

In your Lua code, append your local library location to `package.path`:


```
`package.path = package.path .. ';local/share/lua/5.3/?.lua`
```

### Parsing INI files with Lua

With the package location established, the next thing to do is to require the `inifile` library and then handle some OS logistics. Even though this is a simple example application, the code needs to get the user's home directory location from the OS and establish how to communicate filesystem paths back to the OS when necessary:


```
package.path = package.path .. ';local/share/lua/5.3/?.lua
inifile = require('inifile')

\-- find home directory
home = os.getenv('HOME')

\-- detect path separator
\-- returns '/' for Linux and Mac
\-- and '\' for Windows
d = package.config:sub(1,1)
```

Now you can use `inifile` to parse data from the config file into a Lua table. Once the data has been placed into a table, you can query the table as you would any other Lua table:


```
\-- parse the INI file and
\-- put values into a table called conf
conf = inifile.parse(home .. d .. 'myconfig.ini')

\-- print the data for review
print(conf['example']['name'])
print(conf['example']['species'])
print(conf['example']['enabled'])
```

Run the code in a terminal to see the results:


```
$ lua ./main.lua
Tux
penguin
false
```

That looks correct. Try doing the same for the `demo` block.

### Saving data in the INI format

Not all parser libraries read and write data (often called _encoding_ and _decoding_), but the `inifile` library does. That means you can use it to make changes to a configuration file.

To change a value in a configuration file, you set the variable representing the value in the parsed table, and then you write the table back to the configuration file:


```
\-- set enabled to true
conf['example']['enabled'] = true
conf['demo']['enabled'] = true

\-- save the change
inifile.save(home .. d .. 'myconfig.ini', conf)
```

Take a look at the configuration file now:


```
$ cat ~/myconfig.ini
[example]
name=Tux
species=penguin
enabled=true

[demo]
name=Beastie
species=demon
enabled=true
```

### Config files

The ability to save data about how a user wants to use an application is an important part of programming. Fortunately, it's a common task for programmers, so much of the work has probably already been done. Find a good library for encoding and decoding into an open format, and you can provide a persistent and consistent user experience.

Here's the entire demo code for reference:


```
package.path = package.path .. ';local/share/lua/5.3/?.lua'
inifile = require('inifile')

\-- find home directory
home = os.[getenv][8]('HOME')

\-- detect path separator
\-- returns '/' for Linux and Mac
\-- and '\' for Windows
d = package.config:sub(1,1)

\-- parse the INI file and
\-- put values into a table called conf
conf = inifile.parse(home .. d .. 'myconfig.ini')

\-- print the data for review
print(conf['example']['name'])
print(conf['example']['species'])
print(conf['example']['enabled'])

\-- enable Tux
conf['example']['enabled'] = true

\-- save the change
inifile.save(home .. d .. 'myconfig.ini', conf)
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/parsing-config-files-lua

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_2.png?itok=JPlR5aCA (Woman sitting in front of her computer)
[2]: https://opensource.com/article/21/6/config-files-and-their-formats
[3]: https://opensource.com/article/19/11/getting-started-luarocks
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
[7]: https://www.freedesktop.org/wiki/Specifications
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/getenv.html
