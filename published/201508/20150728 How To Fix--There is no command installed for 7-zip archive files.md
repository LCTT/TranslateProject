如何修复：There is no command installed for 7-zip archive files
================================================================================
### 问题 ###

我试着在Ubuntu中安装Emerald图标主题，而这个主题被打包成了.7z归档包。和以往一样，我试着通过在GUI中右击并选择“提取到这里”来将它解压缩。但是Ubuntu 15.04却并没有解压文件，取而代之的，却是丢给了我一个下面这样的错误信息：

> Could not open this file 
>
> 无法打开该文件
> 
> There is no command installed for 7-zip archive files. Do you want to search for a command to open this file? 
>
> 没有安装用于7-zip归档文件的命令。你是否想要搜索用于来打开该文件的命令？

错误信息看上去是这样的：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Install_7zip_ubuntu_1.png)

### 原因 ###

发生该错误的原因从错误信息本身来看就十分明了。7Z，称之为[7-zip][1]更好，该程序没有安装，因此7Z压缩文件就无法解压缩。这也暗示着Ubuntu默认不支持7-zip文件。

### 解决方案：在Ubuntu中安装 7zip ###

要解决该问题也十分简单，在Ubuntu中安装7-Zip包即可。现在，你也许想知道如何在Ubuntu中安装 7Zip吧？好吧，在前面的错误对话框中，如果你右击“Search Command”搜索命令，它会查找可用的 p7zip 包。只要点击“Install”安装，如下图：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Install_7zip_ubuntu.png)

### 可选方案：在终端中安装 7Zip ###

如果偏好使用终端，你可以使用以下命令在终端中安装 7zip：

    sudo apt-get install p7zip-full

注意：在Ubuntu中，你会发现有3个7zip包：p7zip，p7zip-full 和 p7zip-rar。p7zip和p7zip-full的区别在于，p7zip是一个更轻量化的版本，仅仅提供了对 .7z 和 .7za 文件的支持，而完整版则提供了对更多（用于音频文件等的） 7z 压缩算法的支持。对于 p7zip-rar，它除了对 7z 文件的支持外，也提供了对 .rar 文件的支持。

事实上，相同的错误也会发生在[Ubuntu中的RAR文件][2]身上。解决方案也一样，安装正确的程序即可。

希望这篇快文帮助你解决了**Ubuntu 14.04中如何打开 7zip**的谜团。如有任何问题或建议，我们将无任欢迎。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-there-is-no-command-installed-for-7-zip-archive-files/

作者：[Abhishek][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://www.7-zip.org/
[2]:http://itsfoss.com/fix-there-is-no-command-installed-for-rar-archive-files/
