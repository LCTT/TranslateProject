[#]: subject: (Drop Autotools for CMake)
[#]: via: (https://opensource.com/article/21/5/cmake)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Drop Autotools for CMake
======
CMake is a cross-platform suite for building, testing, and packaging
software that's easy to use, even if you've never used a build system
before.
![Someone wearing a hardhat and carrying code ][1]

In my [introduction to Autotools][2], I demonstrated how to manage building and packaging code with GNU Autotools. It's a robust and common platform that integrates easily into many packaging systems, including RPM, APT, [pkgsrc][3], and more. Its syntax and structure can be confusing, but luckily there are alternatives, including the open source [CMake][4] framework.

CMake is a cross-platform suite for building, testing, and packaging software. It uses simple and clearly documented syntax, so it's easy to start using even if you've never used a build system before.

### Install CMake

CMake may already be installed on your Linux system. If not, you can install it with your distribution's package manager:


```
`$ sudo dnf install cmake`
```

On Debian or similar:


```
`$ sudo apt install cmake`
```

For Mac, you can use [MacPorts][5] or [Homebrew][6]:


```
`$ sudo port install cmake`
```

On Windows, you can use [Chocolatey][7] or download a binary directly from the [CMake website][8].

### CMake at work

For developers or users who want to build software from source code, CMake is a quick and easy way to compile and install it. CMake works in stages:

  1. First, during the `cmake` step, CMake scans the host system (the computer it's being run on) to discover the default settings. Default settings include where support libraries are located and where new software should be placed on the system.
  2. Next, you use your system's `make` command (usually GNU Make on Linux, NetBSD Make on [NetBSD][9], and so on) to build the application, usually by converting human-readable source code into machine language.
  3. Finally, during the `make install` step, the built files are copied to the appropriate locations (as detected during the `cmake` stage) on your computer.



It seems simple, and it is when you use CMake.

### CMake portability

CMake is designed with portability in mind. While it can't make your project work across all POSIX platforms (that's up to you, as the coder), it can ensure that the files you've marked for installation get installed to the most sensible locations on a known platform. And because of tools like CMake, it's trivial for power users to customize and override any non-optimal value according to their system's needs.

With CMake, all you have to know is which files need to be installed to what general location. It takes care of everything else. No more custom install scripts that break on any untested operating system.

### Packaging

Like Autotools, CMake is well-supported. Hand a project with CMake over to a distro packager, whether they're packaging an RPM or a DEB or a TGZ (or anything else), and their job is simple and direct. Packaging tools know CMake, so it's likely there will not be any patching, hacking, or adjustments required. In many cases, incorporating a CMake project into a pipeline can be automated.

### How to use CMake

To start using CMake with your project, you need only to create a `CMakeLists.txt` file in your project directory. First, declare the minimum required version of CMake and a project title and version. CMake strives to retain compatibility for as long as possible, but the more you use it and follow its development, the better you'll know what features you rely upon.


```
cmake_minimum_required(VERSION 3.10)

project(Hello VERSION 1.0)
```

As you may already be detecting, the syntax of CMake is a command followed by parameters in parentheses. The capitalized `VERSION` strings aren't arbitrary or just for style; they're valid parameters for the `project` command.

Before continuing, generate a sample `hello world` application in C or C++. For simplicity, I wrote six lines of C code and saved it as `hello.c` (to match the executable I list in `CMakeLists.txt`):


```
#include &lt;stdio.h&gt;

int main() {
   [printf][10]("Hello open source\n");
   return 0;
}
```

Make no mistake, though, CMake is useful beyond just C and C++. It can handle arbitrary files and has lots of commands available to it, so it can help you maintain projects in many different forms.

The CMake website documents all valid built-in commands and their available parameters, so it's easy to uncover the functions you need, no matter what you're trying to do. This is a simple example, though, so the next command you need is essential—you must define for CMake what code you're building:


```
`add_executable(Hello hello.c)`
```

This sets the name of your compiled binary to `Hello`, so functionally, it's the same as running `gcc` with `-o Hello` in your terminal.

In a complex project, you likely have libraries as well as executables. You can add libraries with the `add_library` command.

After you've set what files you want built and marked for installation, you must tell CMake where the finished product should end up once a user installs your application.

In this simple example, only one thing is marked for installation, so you only have to add one `install` line to your `CMakeLists`. The `install` command accepts a few parameters, but in this case, all that's necessary is the `TARGETS` parameter followed by the name of the file to install:


```
`install(TARGETS Hello)`
```

#### Adding files to a CMake project

A software project rarely just delivers code to its users. There's usually some additional data, such as manual or info pages, example projects, or configuration files. You can include arbitrary data in a CMake project using a similar workflow to when you include compiled files: first, add the file to `CMakeLists.txt` and then describe how it is to be installed.

For example, to include a directory called `assets` with your sample application, you use the `file` command, followed by the `COPY` and `DESTINATION` parameters to tell CMake to copy your additional files into your distributable package:


```
`file(COPY assets DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")`
```

The `${CMAKE_CURRENT_BINARY_DIR}` is a special built-in CMake variable representing the path to the directory currently being processed by CMake. In other words, your arbitrary data gets copied to the build directory (this becomes even clearer after you run `cmake`, so watch for this to come up again later).

Because data directories tend to be crowded places (take a look in `/usr/share` if you don't believe me), it's to everyone's benefit for you to create a subdirectory for your own project, preferably with versioning. You can do this by specifying a new directory within `CMAKE_CURRENT_BINARY_DIR` using your chosen project name followed by a special variable named for your project and the `VERSION` you set for it in your project declaration:


```
`file(COPY assets DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/Hello-${Hello_VERSION}")`
```

### Defining install locations

You've defined the file for the build process, so now you must tell CMake where to put it during the install process. Like your main executable, this uses the `install` command:


```
`install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/Hello-${Hello_VERSION}" TYPE DATA)`
```

There are some new parameters here. The `DIRECTORY` parameter identifies the data source as a directory (rather than `FILE` or `SCRIPT`, for instance). You're using the same variables as you used when copying the data files into the build location. Additionally, either a `TYPE` or a `DESTINATION` must be provided for `install` (not both). The `TYPE` argument specifies a generic file type, which is placed into a location appropriate to the target system. On Linux, a `TYPE DATA` directory usually gets placed into `/usr/local/share` or `/usr/share`, unless the user or packager has defined a different data location.

That's one of the powerful things about a good build system like CMake. You don't have to worry about exactly where files end up because you know that the user can alert CMake of their preferred defaults and that CMake will build the code to make that work.

### Running CMake

CMake has several interfaces. You can use it from your terminal as a command or an interactive application, or you can use its graphical user interface (GUI) front end. I tend to use the terminal command, but I enjoy the other user experiences just as much (they definitely beat scrubbing through Makefiles in search of obscure variables to redefine).

The first step, familiar to anyone who's built their fair share of open source C++ projects, is to create a `build` directory, change to it, and then run the `cmake ..` command. I'm a lazy typist, so I name my build directory `b`, but you can use whatever makes the most sense to you:


```
$ mkdir b
$ cd b
$ cmake ..
\-- The C compiler identification is GNU 11.1.1
\-- The CXX compiler identification is GNU 11.1.1
\-- Detecting C compiler ABI info
\-- Detecting C compiler ABI info - done
\-- Check for working C compiler: /usr/bin/cc - skipped
\-- Detecting C compile features
\-- Detecting C compile features - done
\-- Detecting CXX compiler ABI info
\-- Detecting CXX compiler ABI info - done
\-- Check for working CXX compiler: /usr/bin/c++ - skipped
\-- Detecting CXX compile features
\-- Detecting CXX compile features - done
\-- Configuring done
\-- Generating done
\-- Build files have been written to: /var/home/seth/demo-hello/b
$
```

This is, more or less, the equivalent of `./configure` in the classic `./configure; make; make install` incantation. A look into your build directory reveals that CMake has generated several new files to help your project come together. There's some CMake data, a regular Makefile (that's 247 lines of code for free, but quite a lot more for complex projects), and the `Hello-1.0` data directory containing the arbitrary non-compiled data distributed with this example application:


```
$ ls
CMakeCache.txt
CMakeFiles
Makefile
Hello-1.0
cmake_install.cmake
```

Next, run the `make` command. This reads the `Makefile` generated by CMake. In this example, the default action for Make is to compile its target, `hello.c`:


```
$ make
Scanning dependencies of target Hello
[ 50%] Building C object CMakeFiles/Hello.dir/hello.c.o
[100%] Linking C executable Hello
[100%] Built target Hello
$
```

As you might expect, the `Hello` binary executable now exists in your current build directory. Because it's a simple self-contained application, you can run it for testing purposes:


```
$ ./Hello
Hello open source
$
```

Finally, run `make install` to invoke the install actions of the Makefile. Because I don't want my simple "hello world" application to be installed on my system, I set the `DESTDIR` variable to redirect CMake's target from the root directory (`/`) to a subdirectory in `/tmp`:


```
$ mkdir /tmp/dist-hello
$ make install DESTDIR=/tmp/dist-hello
[100%] Built target Hello
Install the project...
\-- Install configuration: ""
\-- Installing: /tmp/dist-hello/usr/local/bin/Hello
\-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0
\-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0/assets/file0
\-- Installing: /tmp/dist-hello/usr/local/share/Hello-1.0/assets/file1
```

The output confirms its actions, and the application is installed.

### Quick customization

CMake's install prefix (the `CMAKE_INSTALL_PREFIX` variable) defaults to `/usr/local`, but any CMake variable can be customized when you run `cmake` with the `-D` option:


```
$ cmake -DCMAKE_INSTALL_PREFIX=/usr ..
$ make install DESTDIR=/tmp/dist-hello
$ make install DESTDIR=/tmp/dist-hello
[100%] Built target Hello
Install the project...
\-- Install configuration: ""
\-- Installing: /tmp/dist-hello/usr/bin/Hello
\-- Installing: /tmp/dist-hello/usr/share/Hello-1.0
\-- Installing: /tmp/dist-hello/usr/share/Hello-1.0/assets/file0
\-- Installing: /tmp/dist-hello/usr/share/Hello-1.0/assets/file1
```

Any variable used by CMake can be customized in this way.

### Interactive CMake

CMake's interactive mode is a friendly and useful method to configure an installation environment. It's a lot to ask your users to know all the possible CMake variables your project uses, so the CMake interactive interface is an easy way for them to discover customization options without looking at Makefiles and CMakeLists.

To invoke an interactive CMake session, use the `ccmake` command. There's not much to see for this simple example project, but a big project like the digital audio workstation [Rosegarden][11] makes the user interface invaluable.

![Rosegarden][12]

(Seth Kenlon, [CC BY-SA 4.0][13])

### More CMake

There's much, much more to CMake. As a developer, I enjoy CMake for its simple syntax and extensive [documentation][14], extensibility, and expediency. As a user, I appreciate CMake for its friendly and helpful error messages and user interfaces. If you're not using a build system for your project, take a look at CMake. You, and anyone trying to package your application later, won't be sorry.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/cmake

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag (Someone wearing a hardhat and carrying code )
[2]: https://opensource.com/article/19/7/introduction-gnu-autotools
[3]: https://opensource.com/article/19/11/pkgsrc-netbsd-linux
[4]: http://cmake.org
[5]: https://opensource.com/article/20/11/macports
[6]: https://opensource.com/article/20/6/homebrew-linux
[7]: https://opensource.com/article/20/3/chocolatey
[8]: https://cmake.org/download
[9]: https://opensource.com/article/19/3/netbsd-raspberry-pi
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[11]: https://opensource.com/article/18/3/make-sweet-music-digital-audio-workstation-rosegarden
[12]: https://opensource.com/sites/default/files/uploads/rosegarden-ccmake.jpg (Rosegarden)
[13]: https://creativecommons.org/licenses/by-sa/4.0/
[14]: https://cmake.org/cmake/help/latest/
