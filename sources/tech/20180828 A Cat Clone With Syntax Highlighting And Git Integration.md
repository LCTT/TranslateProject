Translating by z52527


A Cat Clone With Syntax Highlighting And Git Integration
======
20180828 A Cat Clone With Syntax Highlighting And Git Integration.md

![](https://www.ostechnix.com/wp-content/uploads/2018/08/Bat-command-720x340.png)

In Unix-like systems, we use **‘cat’** command to print and concatenate files. Using cat command, we can print the contents of a file to the standard output, concatenate several files into the target file, and append several files into the target file. Today, I stumbled upon a similar utility named **“Bat”** , a clone to the cat command, with some additional cool features such as syntax highlighting, git integration and automatic paging etc. In this brief guide, we will how to install and use Bat command in Linux.

### Installation

Bat is available in the default repositories of Arch Linux. So, you can install it using pacman on any arch-based systems.
```
$ sudo pacman -S bat

```

On Debian, Ubuntu, Linux Mint systems, download the **.deb** file from the [**Releases page**][1] and install it as shown below.
```
$ sudo apt install gdebi

$ sudo gdebi bat_0.5.0_amd64.deb

```

For other systems, you may need to compile and install from source. Make sure you have installed Rust 1.26 or higher.



Then, run the following command to install Bat:
```
$ cargo install bat

```

Alternatively, you can install it using [**Linuxbrew**][2] package manager.
```
$ brew install bat

```

### Bat command Usage

The Bat command’s usage is very similar to cat command.

To create a new file using bat command, do:
```
$ bat > file.txt

```

To view the contents of a file using bat command, just do:
```
$ bat file.txt

```

You can also view multiple files at once:
```
$ bat file1.txt file2.txt

```

To append the contents of the multiple files in a single file:
```
$ bat file1.txt file2.txt file3.txt > document.txt

```

Like I already mentioned, apart from viewing and editing files, the Bat command has some additional cool features though.

The bat command supports **syntax highlighting** for large number of programming and markup languages. For instance, look at the following example. I am going to display the contents of the **reverse.py** file using both cat and bat commands.

![](https://www.ostechnix.com/wp-content/uploads/2018/08/bat-and-cat-command-output-comparison.png)

Did you notice the difference? Cat command shows the contents of the file in plain text format, whereas bat command shows output with syntax highlighting, order number in a neat tabular column format. Much better, isn’t it?

If you want to display only the line numbers (not the tabular column), use **-n** flag.
```
$ bat -n reverse.py

```

**Sample output:**
![](https://www.ostechnix.com/wp-content/uploads/2018/08/bat-command-output-3.png)

Another notable feature of Bat command is it supports **automatic paging**. That means if output of a file is too large for one screen, the bat command automatically pipes its own output to **less** command, so you can view the output page by page.

Let me show you an example. When you view the contents of a file which spans multiple pages using cat command, the prompt quickly jumps to the last page of the file, and you do not see the content in the beginning or in the middle.

Have a look at the following output:

![](https://www.ostechnix.com/wp-content/uploads/2018/08/cat-command-output.png)

As you can see, the cat command displays last page of the file.

So, you may need to pipe the output of the cat command to **less** command to view it’s contents page by page from the beginning.
```
$ cat reverse.py | less

```

Now, you can view output page by page by hitting the ENTER key. However, it is not necessary if you use bat command. The bat command will automatically pipe the output of a file which spans multiple pages.
```
$ bat reverse.py

```

**Sample output:**

![](https://www.ostechnix.com/wp-content/uploads/2018/08/bat-command-output-1.png)

Now hit the ENTER key to go to the next page.

The bat command also supports **GIT integration** , so you can view/edit the files in your Git repository without much hassle. It communicates with git to show modifications with respect to the index (see left side bar).

![](https://www.ostechnix.com/wp-content/uploads/2018/08/bat-command-output-2.png)

**Customizing Bat**

If you don’t like the default themes, you can change it too. Bat has option for that too.

To list the available themes, just run:
```
$ bat --list-themes
1337
DarkNeon
Default
GitHub
Monokai Extended
Monokai Extended Bright
Monokai Extended Light
Monokai Extended Origin
TwoDark

```

To use a different theme, for example TwoDark, run:
```
$ bat --theme=TwoDark file.txt

```

If you want to make the theme permanent, use `export BAT_THEME="TwoDark"` in your shells startup file.

Bat also have the option to control the appearance of the output. To do so, use the `--style` option. To show only Git changes and line numbers but no grid and no file header, use `--style=numbers,changes`.

For more details, refer the Bat project GitHub Repository (Link at the end).

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/bat-a-cat-clone-with-syntax-highlighting-and-git-integration/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://github.com/sharkdp/bat/releases
[2]:https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
