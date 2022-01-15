[#]: subject: "Parsing command options in Lua"
[#]: via: "https://opensource.com/article/21/8/parsing-commands-lua"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Parsing command options in Lua
======
My favorite way to solve the problem of parsing in Lua is alt-getopt.
![Woman sitting in front of her laptop][1]

When you enter a command into your terminal, there are usually [options][2], also called _switches_ or _flags_, that you can use to modify how the command runs. This is a useful convention defined by the [POSIX specification][3], so as a programmer, it's helpful to know how to detect and parse options.

As with most languages, there are several ways to solve the problem of parsing options in Lua. My favorite is [alt-getopt][4].

### Installing

The easiest way to obtain and use **alt-getopt** in your code is to [install it with LuaRocks][5]. For most use-cases, you probably want to install it into your local project directory:


```
$ mkdir local
$ luarocks --tree=local install alt-getopt 
Installing <https://luarocks.org/alt-getopt-0.X.Y-1.src.rock>
[...]
alt-getopt 0.X.Y-1 is now installed in /tux/myproject/local (license: MIT/X11)
```

Alternately, you can download the code from [GitHub][6].

### Adding a library to your Lua code

Assuming you've installed the library locally, then you can define your Lua package path and then `require` the **alt-getopt** package:


```
package.path = package.path .. ';local/share/lua/5.1/?.lua'

local alt_getopt = require("alt_getopt")
```

If you've installed it to a known system location, you can omit the `package.path` line (because Lua already knows to look for system-wide libraries.)

Now you're set to parse options in Lua.

### Option parsing in Lua

The first thing you must do to parse options is to define the valid options your application can accept. The **alt_getopt** library sees all options primarily as short options, meaning that you define options as single letters. You can add long versions later.

When you define valid options, you create a list delimited by colons (`:`), which is interpreted by the `get_opts` function provided by **alt-getopts**.

First, create some variables to represent the options. The variables `short_opt` and `optarg` represent the short option and the option argument. These are arbitrary variable names, so you can call them anything (as long as it's a valid name for a variable).

The table `long_opts` must exist, but I find it easiest to define the values of the long options after you've decided on the short options, so leave it empty for now.


```
local long_opts = {}

local short_opt
local optarg
```

With those variables declared, you can iterate over the arguments provided by the user, checking to see whether any argument matches your approved list of valid short options.

If a valid option is found, you use the `pairs` function in Lua to extract the value of the option.

To create an option that accepts no argument of its own but is either _on_ or _off_ (often called a _switch_), you place the short option you want to define to the right of a colon (`:`) character.

In this example, I've created a loop to check for the short option `-a`, which is a switch:


```
short_opt,optarg = alt_getopt.get_opts (arg, ":a", long_opts)
local optvalues = {}
for k,v in pairs (short_opt) do
   table.insert (optvalues, "value of " .. k .. " is " .. v .. "\n")
end

table.sort (optvalues)
io.write (table.concat (optvalues))

for i = optarg,#arg do
   io.write (string.format ("ARGV [%s] = %s\n", i, arg [i]))
end
```

At the end of this sample code, I included a for-loop to iterate over any remaining arguments in the command because anything not detected as a valid option must be an argument (probably a file name, URI, or whatever it is that your application operates upon).

Test the code:


```
$ lua test.lua -a 
value of a is 1
```

The test script has successfully detected the option `-a`, and has assigned it a value of **1** to represent that it does exist.

Try it again with an extra argument:


```
$ lua test.lua -a hello
value of a is 1
ARGV [2] = hello
```

### Options with arguments

Some options require an argument all their own. For instance, you might want to allow the user to point your application to a custom configuration file, set an attribute to a color, or set the resolution of a graphic. In **alt_getopt**, options that accept arguments are placed on the left of the colon (`:`) in the short options list.


```
`short_opt,optarg = alt_getopt.get_opts (arg, "c:a", long_opts)`
```

Test the code:


```
$ lua test.lua -a -c my.config
value of a is 1
value of c is my.config
```

Try it again, this time with a spare argument:


```
$ lua test.lua -a -c my.config hello
value of a is 1
value of c is my.config
ARGV [4] = hello
```

### Long options

Short options are great for power users, but they don't tend to be very memorable. You can create a table of long options that point to short options so users can learn long options before abbreviating their commands with single-letter options.


```
local long_opts = {
   alpha = "a",
   config = "c"
}
```

Users now have the choice between long and short options:


```
$ lua test.lua --config my.config --alpha hello
value of a is 1
value of c is my.config
ARGV [4] = hello
```

### Option parsing

Here's the full demonstration code for your reference:


```
#!/usr/bin/env lua
package.path = package.path .. ';local/share/lua/5.1/?.lua'

local alt_getopt = require("alt_getopt")

local long_opts = {
   alpha = "a",
   config = "c"
}

local short_opt
local optarg

short_opt,optarg = alt_getopt.get_opts (arg, "c:a", long_opts)
local optvalues = {}
for k,v in pairs (short_opt) do
   table.insert (optvalues, "value of " .. k .. " is " .. v .. "\n")
end

table.sort (optvalues)
io.write (table.concat (optvalues))

for i = optarg,#arg do
   io.write (string.format ("ARGV [%s] = %s\n", i, arg [i]))
end
```

There are further examples in the project's Git repository. Including options for your users is an important feature for any application, and Lua makes it easy to do. There are other libraries aside from **alt_getopt**, but I find this one easy and quick to use.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/parsing-commands-lua

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: https://opensource.com/article/21/7/linux-terminal-basics#options
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://luarocks.org/modules/mpeterv/alt-getopt
[5]: https://opensource.com/article/19/11/getting-started-luarocks
[6]: https://github.com/cheusov/lua-alt-getopt
