[#]: subject: (Manipulate data in files with Lua)
[#]: via: (https://opensource.com/article/21/3/lua-files)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Manipulate data in files with Lua
======
Understand how Lua handles reading and writing data.
![Person standing in front of a giant computer screen with numbers, data][1]

Some data is ephemeral, stored in RAM, and only significant while an application is running. But some data is meant to be persistent, stored on a hard drive for later use. When you program, whether you're working on a simple script or a complex suite of tools, it's common to need to read and write files. Sometimes a file may contain configuration options, and other times the file is the data that your user is creating with your application. Every language handles this task a little differently, and this article demonstrates how to handle data files with Lua.

### Installing Lua

If you're on Linux, you can install Lua from your distribution's software repository. On macOS, you can install Lua from [MacPorts][2] or [Homebrew][3]. On Windows, you can install Lua from [Chocolatey][4].

Once you have Lua installed, open your favorite text editor and get ready to code.

### Reading a file with Lua

Lua uses the `io` library for data input and output. The following example creates a function called `ingest` to read data from a file and then parses it with the `:read` function. When opening a file in Lua, there are several modes you can enable. Because I just need to read data from this file, I use the `r` (for "read") mode:


```
function ingest(file)
   local f = io.open(file, "r")
   local lines = f:read("*all")
   f:close()
   return(lines)
end

myfile=ingest("example.txt")
print(myfile)
```

In the code, notice that the variable `myfile` is created to trigger the `ingest` function, and therefore, it receives whatever that function returns. The `ingest` function returns the lines (from a variable intuitively called `lines`) of the file. When the contents of the `myfile` variable are printed in the final step, the lines of the file appear in the terminal.

If the file `example.txt` contains configuration options, then I would write some additional code to parse that data, probably using another Lua library depending on whether the configuration was stored as an INI file or YAML file or some other format. If the data were an SVG graphic, I'd write extra code to parse XML, probably using an SVG library for Lua. In other words, the data your code reads can be manipulated once it's loaded into memory, but all that's required to load it is the `io` library.

### Writing data to a file with Lua

Whether you're storing data your user is creating with your application or just metadata about what the user is doing in an application (for instance, game saves or recent songs played), there are many good reasons to store data for later use. In Lua, this is achieved through the `io` library by opening a file, writing data into it, and closing the file:


```
function exgest(file)
   local f = io.open(file, "a")
   io.output(f)
   io.write("hello world\n")
   io.close(f)
end

exgest("example.txt")
```

To read data from the file, I open the file in `r` mode, but this time I use `a` (for "append") to write data to the end of the file. Because I'm writing plain text into a file, I added my own newline character (`\n`). Often, you're not writing raw text into a file, and you'll probably use an additional library to write a specific format instead. For instance, you might use an INI or YAML library to help write configuration files, an XML library to write XML, and so on.

### File modes

When opening files in Lua, there are some safeguards and parameters to define how a file should be handled. The default is `r`, which permits you to read data only:

  * **r** for read only
  * **w** to overwrite or create a new file if it doesn't already exist
  * **r+** to read and overwrite
  * **a** to append data to a file or make a new file if it doesn't already exist
  * **a+** to read data, append data to a file, or make a new file if it doesn't already exist



There are a few others (`b` for binary formats, for instance), but those are the most common. For the full documentation, refer to the excellent Lua documentation on [Lua.org/manual][5].

### Lua and files

Like other programming languages, Lua has plenty of library support to access a filesystem to read and write data. Because Lua has a consistent and simple syntax, it's easy to perform complex processing on data in files of any format. Try using Lua for your next software project, or as an API for your C or C++ project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/lua-files

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://opensource.com/article/20/11/macports
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/3/chocolatey
[5]: http://lua.org/manual
