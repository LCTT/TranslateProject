translating by lujun9972
A Commandline Fuzzy Search Tool For Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2017/09/search-720x340.jpg)
Today, we will be discussing about an Interesting commandline utility called **" Pick"**. It allows users to select from a set of choices using an ncurses(3X) interface with fuzzy search functionality. The Pick utility can be helpful in certain situations where you wanted to search for a folder or file that contains a non-English characters in their name. You don't have to learn how to type the non-english characters. Using Pick, you can easily search them, select them and view or cd into them easily. You don't even have to type any characters to search a file or folder. It's good for those working with large pile of directories and files.

### Pick - A Commandline Fuzzy Search Tool For Linux

#### Installing Pick

For **Arch Linux** and its derivatives, Pick is available in [**AUR**][1]. So, the Arch users can install it using AUR helper tools such as [**Pacaur**][2], [**Packer**][3], and [**Yaourt**][4] etc.
```
pacaur -S pick
```

Or,
```
packer -S pick
```

Or,
```
yaourt -S pick
```

The **Debian** , **Ubuntu** , **Linux Mint** users run the following command to install Pick.
```
sudo apt-get install pick
```

For other distributions, download the latest release from [**here**][5] and follow the below instructions to install Pick. As of writing this guide, the latest version was 1.9.0.
```
wget https://github.com/calleerlandsson/pick/releases/download/v1.9.0/pick-1.9.0.tar.gz
tar -zxvf pick-1.9.0.tar.gz
cd pick-1.9.0/
```

Configure it using command:
```
./configure
```

Finally, build and install pick:
```
make
sudo make install
```

#### Usage

By combining it with other commands will make your commandline life much easier. I will show some examples, so you can understand how it works.

Let me create a stack of directories.
```
mkdir -p abcd/efgh/ijkl/mnop/qrst/uvwx/yz/
```

Now, you want to go the directory /ijkl/ directory. You have two choice. You can either use **cd** command like below:
```
cd abcd/efgh/ijkl/
```

Or, create a [**shortcut**][6] or an alias to that directory, so you can switch to the directory in no time.

Alternatively, just use "pick" command to switch a particular directory more easily. Have a look at the below example.
```
cd $(find . -type d | pick)
```

This command will list all directories and its sub-directories in the current working directory, so you can just select any directory you'd like to cd into using Up/Down arrows, and hit ENTER key.

**Sample output:**

[![][7]][8]

Also, it will suggest the directories or files that contains a specific letters as you type them. For example, the following output shows the list of suggestions when I type "or".

[![][7]][9]

It's just an example. You can use "pick" command along with other commands as well.

Here is an another example.
```
find -type f | pick | xargs less
```

This command will allow you to select any file in the current directory to view in less.

[![][7]][10]

Care to learn another example? Here you go. The following command will allow you to select individual files or folders in the current directory you want to move to any destination of your choice, for example **/home/sk/ostechnix**.
```
mv "$(find . -maxdepth 1 |pick)" /home/sk/ostechnix/
```

[![][7]][11]

Choose the file(s) by using Up/Down arrows and hit ENTER to move them to /home/sk/ostechnix/ directory.

[![][7]][12]

As you see in the above output, I have moved the folder called "abcd" to "ostechnix" directory.

The use cases are unlimited. There is also a plugin called [**pick.vim**][13] for Vim editor to make your searches much easier inside Vim editor.

For more details, refer man pages.
```
man pick
```

That's all for now folks. Hope this utility helps. If you find our guides useful, please share them on your social, professional networks and recommended OSTechNix blog to all your contacts.



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pick-commandline-fuzzy-search-tool-linux/

作者：[SK][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/pick/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/install-yaourt-arch-linux/
[5]:https://github.com/calleerlandsson/pick/releases/
[6]:https://www.ostechnix.com/create-shortcuts-frequently-used-directories-shell/
[7]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_001-3.png ()
[9]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_002-1.png ()
[10]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_004-1.png ()
[11]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_005.png ()
[12]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_006-1.png ()
[13]:https://github.com/calleerlandsson/pick.vim/
