10 Basic Linux Commands That Every Linux Newbies Should Remember

Linux新手必知必会的10条Linux基本命令
=====================================================================

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/4225072_orig.png)

[Linux][1] has a big impact on our Lives. At least, your android phone has Linux kernel on it. However, getting started with Linux just make you discomfort for the first time.
 Because on Linux, you usually should use terminal commands instead of just clicking the launcher icon (as you did on Windows). But don't worry, We will give you 10 basic Linux commands & important commands that will help you get started.

Linux对我们的生活产生了巨大的冲击。至少你的安卓手机使用的就是Linux核心。尽管如此，在第一次开始使用Linux时你还是会感到难以下手。因为在Linux中，通常需要使用终端命令来取代Windows系统中的启动图标点击。但是不必担心，这里我们会介绍10个Linux基本命令来帮助你开启这段神秘之旅。


### 10 Basic Linux Commands That Help Newbies Get Started
### 帮助新手走出第一步的10个Linux基本命令

When We talk about Linux commands, what we are really talking about is the Linux system itself. These small number of 10 Basic Linux commands will not make you a genius or a Linux expert instead, it'll help you get started with Linux. It'll help Linux newbies to perform daily basic tasks in Linux using these Linux basic commands or I should say Linux top commands(because of their usage)。

当我们谈论Linux命令时，实质上是在谈论Linux系统本身。这短短的10个Linux基本命令不会让你变成天才或者Linux专家，但是能帮助你轻松开始Linux之旅。使用这些基本命令会帮助新手们完成Linux日常任务，由于它们的使用频率如此至高，所以我更乐意称他们为Linux命令之王！

So let's get started with the list of 10 Linux Basic commands -

让我们开始学习这10条Linux基本命令吧。

#### 1. sudo

This SuperUserDo is the most important command Linux newbies will use. Every single command that needs root's permission, need this sudo command. You can use sudo before each command that requires root permissions -

这条命令的意思是“以超级用户的身份执行”，是 SuperUserDo 的简写，它是新手将要用到的最重要的一条Linux命令。当一条单行命令需要root权限的时候，`sudo`命令就派上用场了。你可以在每一条需要root权限的命令前都加上`sudo`。

```
$ sudo su
```

#### 2. ls (list)

Just like the other, you often want to see anything in your directory. With list command, the terminal will show you all the files and folders of the directory that you're working in. Let's say I'm in the /home folder and I want to see the directories & files in /home.

跟其他人一样，你肯定也经常想看看目录下都有些什么东西。使用列表命令，终端会把当前工作目录下所有的文件以及文件夹展示给你。比如说，我当前处在 /home 文件夹中，我想看看 /home文件夹中都有哪些文件和目录。

```
/home$ ls
```

ls in /home returns the following -

在/home中执行ls命令将会返回以下内容

```
imad lost+found
```

#### 3. cd

​Changing directory (cd) is the main command that always be in use in terminal. It's one of the most Linux basic commands. Using this is easy. Just type the name of the folder you want to go in from your current directory. If you want to go up just do it by giving double dots (..) as the parameter.

变更目录（cd）是终端中总会被用到的主要命令。他是最常用到的Linux基本命令之一。此命令使用非常简单，你打算从当前目录跳转至哪个文件夹，只需要将此文件夹键入命令之后即可。如果你想跳转至上层目录，只需要在此命令之后键入两个点(..)就可以了。
​
Let's say I'm in /home directory and I want to move in usr directory which is always in the /home. Here is how I can use cd commands -

举个例子，我现在处在/home目录中，我想移动到/home目录中的usr文件夹下，可以通过以下命令来完成操作。

```
/home $ cd usr

/home/usr $
```

#### 4. mkdir

Just changing directory is still incomplete. Sometimes you want to create a new folder or subfolder. You can use mkdir command to do that. Just give your folder name after mkdir command in your terminal.

只是可以切换目录还是不够完美。有时候你会想要建一个文件夹或子文件夹。你可以使用mkdir命令来完成。使用方法很简单，只需要把新的文件夹名跟在mkdir命令之后就好了。

```
~$ mkdir folderName
```

#### 5. cp

copy-and-paste is the important task we need to do to organize our files. Using cp will help you to copy-and-paste the file from terminal. First, you determine the file you want to copy and type the destination location to paste the file.

拷贝-粘贴（copy-and-paste）是我们组织文件需要用到的重要命令。使用 cp 命令可以帮助你在终端当中完成拷贝-粘贴操作。首先确定你想要拷贝的文件，然后键入打算粘贴次文件的目标位置。

```
$ cp src des
```

Note: If you're copying files into the directory that requires root permission for any new file, then you'll need to use sudo command.

注意：如果目标目录对新建文件需要root权限时，你可以使用sudo命令来完成你的文件拷贝操作。

#### 6. rm

rm is a command to remove your file or even your directory. You can use -f if the file need root permission to be removed. And also you can use -r to do recursive removal to remove your folder.

rm命令可以帮助你移除文件甚至目录。如果文件需要root权限才能移除，可以用-f参数来强制执行。也可以使用-r参数来递归的移除你的文件夹。

```
$ rm myfile.txt
```

#### 7. apt-get

This command differs distro-by-distro. In Debian based Linux distributions, to install, remove and upgrade any package we've Advanced Packaging Tool (APT) package manager. The apt-get command will help you installing the software you need to run in your Linux. It is a powerful command-line tool which can perform installation, upgrade, and even removing your software.

​In other distributions, such as Fedora, Centos there are different package managers. Fedora used to have yum but now it has dnf. 

```
$ sudo apt-get update

$ sudo dnf update
```

#### 8. grep

You need to find a file but you don't remember its exact location or the path. grep will help you to solve this problem. You can use the grep command to help finding the file based on given keywords.

```
$ grep user /etc/passwd
```

#### 9. cat

As a user, you often need to view some of text or code from your script. Again, one of the Linux basic commands is cat command. It will show you the text inside your file.

```
$ cat CMakeLists.txt
```

#### 10. poweroff

And the last one is poweroff. Sometimes you need to poweroff directly from your terminal. This command will do the task. Don't forget to add sudo at the beginning of the command since it needs root permission to execute poweroff.

```
$ sudo poweroff
```

### Conclusion

As I mentioned when I started off the article that these 10 basic Linux commands will not make you a Linux geek immediately. It'll help you to start using Linux at this early stage. With these basic Linux commands, start using Linux and set your target to learn 1-3 commands daily. So it's all for this article. I hope it helped you. Share with us interesting and useful commands in the comment section below and don't forget to share this article with your friends.

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/10-basic-linux-commands-that-every-linux-newbies-should-remember

作者：[Commenti][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxandubuntu.com/home/10-basic-linux-commands-that-every-linux-newbies-should-remember#comments
[1]: http://linuxandubuntu.com/home/category/linux
