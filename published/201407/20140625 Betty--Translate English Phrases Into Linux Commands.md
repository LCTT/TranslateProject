Betty：通过大白话执行Linux命令
================================================================================

**Betty** 是一个将类英语短语翻译成Linux命令的开源工具。这个项目的主要目的是让大家可以通过输入自然语言来使用强大的Linux系统。让我们来看一下它是怎么工作的。

### 安装 ###

Betty的安装非常简单直接。首先确认你已经安装了下面这些依赖包[LCTT译注，需要安装至少Ruby1.9以上版本]。

#### 对于基于Debian的系统：####

    sudo apt-get install git curl ruby

####对于基于RPM的系统：####

    yum install git curl ruby

现在用git工具把Betty库clone到你自定义的任何路径。这里我克隆到我的home目录，**例如 /home/sk/**.

    git clone https://github.com/pickhardt/betty

添加betty的别名到你的bashrc配置文件。

    sudo nano ~/.bashrc

将下列行添加到文件的末尾：

    alias betty="/home/sk/betty/main.rb"

确保你已经正确地设置好了betty的路径。

好了，现在是时候和betty好好地玩耍了。

### 用法 ###

你应该在英语短语之前加上单词“betty” [LCTT译注，你自然可以用你的小甜心的名字来替换这个不是知道是谁的Betty :>]。你也许已经知道，如果我们想知道在系统中我们的用户名，应该运行下面的命令：

    whoami

输出是这样的：

  sk

如你所见，我当前登录的用户名是 **sk**. 现在我也可以通过下面的betty命令获取相同的结果。

    betty whats my username

输出是这样的：

    Betty: Running whoami
    sk

真的好酷，是不是？Betty理解我输入的“whats my username”短语，然后运行“whoami”命令，最后输出结果。

让我们也来看其他命令。

如果你的输入不够准确，Betty也能以多种方式回应你。例如，我们运行下面的命令：

    betty whats my name

Betty不确定她应该查找系统用户名还是用户全名。这种情况下，她会询问你多个问题来找到准确的结果。如你下面所见，Betty问我想要运行哪一条命令（whoami 还是 finger $(whoami) | sed 's/.*:*//;q')[LCTT译注，需要你的系统已经安装finger]。我只想知道我的用户名，所以我选择数字**1**。
 
    Betty: Okay, I have multiple ways to respond.
    Betty: Enter the number of the command you want me to run, or N (no) if you don't want me to run any.
    [1] whoami
    Gets your system username.
    [2] finger $(whoami) | sed 's/.*: *//;q'
    Gets your full name.
    1
    Betty: Running whoami
    sk

### 压缩和解压缩文件夹 ###

如果你想要压缩一个文件或者文件夹，用下面的命令。例如，我想压缩我home目录下的“test”文件夹。

    betty compress test/ test.tar.gz

输出是这样的：

    Betty: Running tar -czvf test.tar.gz test/
    test/
    test/home/
    test/home/sk/
    test/home/sk/test/
    test/home/sk/test/sample

类似的，我们可以用下面的命令来解压缩一个归档文件。

    betty uncompress test.tar.gz

输出是这样的：

    Betty: Running mkdir test &&  tar -zxvf test.tar.gz -C test
    test/
    test/home/
    test/home/sk/
    test/home/sk/test/
    test/home/sk/test/sample

### 完整的Betty命令行列表 ###

Betty工具有一些命令格式。如果你输入“what is my user name”而不是“whats my username”，它是不能识别的。所以，你只能输入Betty支持的英语短语。

下面给出一个Betty支持的完整的命令行列表。

    Count:
    betty how many words are in this directory
    betty how many characters are in myfile.py
    betty count lines in this folder
    (Note that there's many ways to say more or less the same thing.)
    
    Config:
    betty change your name to Joe
    betty speak to me
    betty stop speaking to me
    
    Datetime:
    betty what time is it
    betty what is todays date
    betty what month is it
    betty whats today
    
    Find:
    betty find me all files that contain california
    
    Internet:
    betty download http://www.mysite.com/something.tar.gz to something.tar.gz
    betty uncompress something.tar.gz
    betty unarchive something.tar.gz to somedir
    (You can use unzip, unarchive, untar, uncompress, and expand interchangeably.)
    betty compress /path/to/dir
    
    iTunes:
    betty mute itunes
    betty unmute itunes
    betty pause the music
    betty resume itunes
    betty stop my music
    betty next song
    betty prev track
    betty what song is playing
    (Note that the words song, track, music, etc. are interchangeable)
    
    Fun:
    betty go crazy
    betty whats the meaning of life
    ...and more that are left for you to discover!
    
    Map:
    betty show me a map of mountain view
    
    Meta:
    betty what version are you (or just betty version)
    betty whats your github again
    
    Permissions:
    betty give me permission to this directory
    betty give anotheruser ownership of myfile.txt
    
    Process:
    betty show me all processes by root containing grep
    betty show me all my processes containing netbio
    
    Sizes:
    betty show size for myfile.txt
    
    Spotify:
    betty play spotify
    betty pause spotify
    betty next spotify
    betty previous spotify
    
    User:
    betty whats my username
    betty whats my real name
    betty whats my ip address
    betty who else is logged in
    betty whats my version of ruby
    
    Web queries:
    betty turn web on
    betty please tell me what is the weather like in London

对Linux初级使用者来说，Betty似乎是一个非常nice的工具。希望这个工具对你也会非常有用。

Cheers!

源代码：

- [Betty Homepage][1]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/betty-translate-english-phrases-linux-commands/

译者：[love\_daisy\_love](https://github.com/CNprober) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/pickhardt/betty