[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use GNU on Windows with MinGW)
[#]: via: (https://opensource.com/article/20/8/gnu-windows-mingw)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Use GNU on Windows with MinGW
======
Install the GNU Compiler Collection and other GNU components to enable
GNU Autotools on Windows.
![Windows][1]

If you're a hacker running Windows, you don't need a proprietary application to compile code. With the [Minimalist GNU for Windows][2] (MinGW) project, you can download and install the [GNU Compiler Collection][3] (GCC) along with several other essential GNU components to enable [GNU Autotools][4] on your Windows computer.

### Install MinGW

The easiest way to install MinGW is through mingw-get, a graphical user interface (GUI) application that helps you select which components to install and keep them up to date. To run it, [download `mingw-get-setup.exe`][5] from the project's host. Install it as you would any other EXE file by clicking through the installation wizard to completion.

![Installing mingw-get][6]

(Seth Kenlon, [CC BY-SA 4.0][7])

### Install GCC on Windows

So far, you've only installed an installer—or more accurately, a dedicated _package manager_ called mingw-get. Launch mingw-get to select which MinGW project applications you want to install on your computer.

First, select **mingw-get** from your application menu to launch it.

![Installing GCC with MinGW][8]

(Seth Kenlon, [CC BY-SA 4.0][7])

To install GCC, click the GCC and G++ package to mark GNU C and C++ compiler for installation. To complete the process, select **Apply Changes** from the **Installation** menu in the top-left corner of the mingw-get window.

Once GCC is installed, you can run it from [PowerShell][9] using its full path:


```
PS&gt; C:\MinGW\bin\gcc.exe --version
gcc.exe (MinGW.org GCC Build-x) x.y.z
Copyright (C) 2019 Free Software Foundation, Inc.
```

### Run Bash on Windows

While it calls itself "minimalist," MinGW also provides an optional [Bourne shell][10] command-line interpreter called MSYS (which stands for Minimal System). It's an alternative to Microsoft's `cmd.exe` and PowerShell, and it defaults to Bash. Aside from being one of the (justifiably) most popular shells, Bash is useful when porting open source applications to the Windows platform because many open source projects assume a [POSIX][11] environment.

You can install MSYS from the mingw-get GUI or from within PowerShell:


```
`PS> mingw-get install msys`
```

To try out Bash, launch it using its full path:


```
PS&gt; C:\MinGW\msys/1.0/bin/bash.exe
bash.exe-$ echo $0
"C:\MinGW\msys/1.0/bin/bash.exe"
```

### Set the path on Windows

You probably don't want to have to type the full path for every command you want to use. Add the directory containing your new GNU executables to your path in Windows. There are two root directories of executables to add: one for MinGW (including GCC and its related toolchain) and another for MSYS (including Bash and many common tools from the GNU and [BSD][12] projects).

To modify your environment in Windows, click on the application menu and type `env`.

![Edit your env][13]

(Seth Kenlon, [CC BY-SA 4.0][7])

A Preferences window will open; click the **Environment variables** button located near the bottom of the window.

In the **Environment variables** window, double-click the **Path** selection from the bottom panel.

In the **Edit Environment variables** window that appears, click the **New** button on the right. Create a new entry reading **C:\MinCW\msys\1.0\bin** and click **OK**. Create a second new entry the same way, this one reading **C:\MinGW\bin**, and click **OK**.

![Set your env][14]

(Seth Kenlon, [CC BY-SA 4.0][7])

Accept these changes in each Preferences window. You can reboot your computer to ensure the new variables are detected by all applications, or just relaunch your PowerShell window.

From now on, you can call any MinGW command without specifying the full path, because the full path is in the `%PATH%` environment variable of your Windows system, which PowerShell inherits.

### Hello world

You're all set up now, so put your new MinGW system to a small test. If you're a [Vim][15] user, launch it, and enter this obligatory "hello world" code:


```
#include &lt;stdio.h&gt;
#include &lt;iostream&gt;

using namespace std;

int main() {
  cout &lt;&lt; "Hello open source." &lt;&lt; endl;
  return 0;
}
```

Save the file as `hello.cpp`, then compile it with the C++ component of GCC:


```
`PS> gcc hello.cpp --output hello`
```

And, finally, run it:


```
PS&gt; .\a.exe
Hello open source.
PS&gt;
```

There's much more to MinGW than what I can cover here. After all, MinGW opens a whole world of open source and potential for custom code, so take advantage of it. For a wider world of open source, you can also [give Linux a try][16]. You'll be amazed at what's possible when all limits are removed. But in the meantime, give MinGW a try and enjoy the freedom of the GNU.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/gnu-windows-mingw

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/more_windows.jpg?itok=hKk64RcZ (Windows)
[2]: http://mingw.org
[3]: https://gcc.gnu.org/
[4]: https://opensource.com/article/19/7/introduction-gnu-autotools
[5]: https://osdn.net/projects/mingw/releases/
[6]: https://opensource.com/sites/default/files/uploads/mingw-install.jpg (Installing mingw-get)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/mingw-packages.jpg (Installing GCC with MinGW)
[9]: https://opensource.com/article/19/8/variables-powershell
[10]: https://en.wikipedia.org/wiki/Bourne_shell
[11]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[12]: https://opensource.com/article/19/3/netbsd-raspberry-pi
[13]: https://opensource.com/sites/default/files/uploads/mingw-env.jpg (Edit your env)
[14]: https://opensource.com/sites/default/files/uploads/mingw-env-set.jpg (Set your env)
[15]: https://opensource.com/resources/what-vim
[16]: https://opensource.com/article/19/7/ways-get-started-linux
