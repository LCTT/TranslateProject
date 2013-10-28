Linux系统上用encfs创建和管理加密文件夹
================================================================================
如果你想使你计算机上的某些信息免于被窥视的话，这儿正是所到之地。保护信息的一种方法就是加密你的home目录，但是一旦你登陆系统后，你的home目录下的信息将暴露于外。过去，我已经写过关于怎样[在你的系统上使用Cryptkeeper来创建加密的文件夹][1]。Cryptkeeper是一个图形前端，后端是**encfs**。encfs允许你创建一个加密的文件夹，然后把它当作使用[FUSE][2]来实现的用户文件系统来挂载。在这篇教程里，我会教你怎么在Linux系统上的命令行下面使用encfs工具来创建和管理一个加密的文件夹。

![](http://tuxtweaks.com/wp-content/uploads/2013/10/encfs.png)

### 安装encfs ###

如果你使用的是Ubuntu或者它的衍生版本中的一种如Linux Mint的话，在软件源库当中应该能找到encfs。这种情况，可以用下面的命令来安装

    sudo apt-get install encfs

### 用encfs创建加密文件夹 ###

一旦在系统中安装好了encfs后，你就能在home目录下创建一个加密的文件夹。在这个示例当中，我将会创建一个叫做tuxtweaks的加密文件夹，这通过终端窗口就可以实现。当创建一个新的文件夹的时候，你需要指定全路径名，当然也可以使用如下所示的标准快捷方式。

    encfs ~/.tuxtweaks ~/tuxtweaks

这会创建两个文件夹。第一个.**tuxtweaks**,它包含被加密的信息；第二个tuxtweaks,当你想要访问信息的时候，解密的版本信息将会挂载到下面。如果这些文件夹都不存在，系统将会提示询问是否创建它们。在提示下面键入‘**y**’以允许创建文件夹，然后你应该能看到如下所示的一些信息：

    Creating new encrypted volume.
    Please choose from one of the following options:
     enter "x" for expert configuration mode,
     enter "p" for pre-configured paranoia mode,
     anything else, or an empty line will select standard mode.

If you want the strongest encryption, enter '**p**' at the prompt. Otherwise, just hit **[Enter]** and your new encrypted folder will be created with the standard options.

After that you'll see several messages listing the parameters of your new encrypted volume along with some warnings, and then a prompt to create a password for encryption. Make sure to use a password you will remember because there is no password recovery mechanism. After entering and verifying your password, the new folder will be created and mounted, ready to use.

### Using Your Encrypted Folder ###

With your new encrypted folder mounted, you can use it just like any other folder on your system with the exception that hard links will not work if you set it up in paranoia mode. I expect this won't be an issue for most users. Let's go ahead and create a simple text file in the new folder to test it out.

    echo "GNU/Linux is my favorite computer operating system." >~/tuxtweaks/test.txt

Using the terminal or the file manager, you can see that you now have a new file called **test.txt** in the **tuxtweaks** folder. Upon opening this file you can see that it is a perfectly readable text file. Now navigate to your **~/.tuxtweaks** folder. This is the encrypted version of your folder. You can see that the file names don't match and if you try to view the contents of the files you'll find that they are scrambled.

### Unmounting an encfs Encrypted Folder ###

Once you are done accessing or creating data in your encrypted folder, it's best to unmount it so that your information is safely hidden away. encfs doesn't have its own command to do this. Since it created a user file system it takes advantage of the FUSE packages to handle unmounting. We'll use the fusermount command to unmount our encrypted folder.

    fusermount -u ~/tuxtweaks

Navigating your home directory you can see that the tuxtweaks directory is still there. If you enter that folder though you'll find that it is empty.

### Mount an Encrypted Folder with encfs ###

The next time you want to access your encrypted data, you'll need to mount it again to decrypt it. You can just use the same command you used to create the folder in the first place.

    encfs ~/.tuxtweaks ~/tuxtweaks

### Uses ###

I find that using **encfs** encrypted folders is a handy way to securely store financial information such as tax returns as well as for storing lists of log-in credentials. This way I only need to remember the password for my encrypted folder, then I can access my list of other log-in ID's and passwords.

What will you use encfs for? Let me know in the comments.

--------------------------------------------------------------------------------

via: http://tuxtweaks.com/2013/10/encrypted-folders-linux-encfs/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://tuxtweaks.com/2009/03/create-an-encrypted-folder-in-ubuntu-with-cryptkeeper/
[2]:http://fuse.sourceforge.net/