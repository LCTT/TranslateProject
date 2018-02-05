怎样在 Linux 中用 Vim 对文件进行密码保护
============================================================

[Vim][5] 是一种流行的、功能丰富的和高度可扩展的 [Linux 文本编辑器][6]，它的一个特殊功能便是支持用带密码各种的加密方法来加密文本文件。

本文中，我们将向你介绍一种简单的 Vim 使用技巧：在 Linux 中使用 Vim 对文件进行密码保护。我们将向你展示如何让一个文件在它创建的时侯以及为了修改目的而被打开了之后获得安全防护。  

**建议阅读：** [你应该在 Linux 中使用 Vim 编辑器的 7 个原因][7]

要安装 Vim 完整版，只需运行这些命令：

```
$ sudo apt install vim          #Debian/Ubuntu 系统
$ sudo yum install vim          #RHEL/CentOS 系统 
$ sudo dnf install vim		#Fedora 22+
```
参阅： [十年后 Vim 8.0 发布了][8a] – [在 Linux 上安装][8]

### 怎样在 Linux 中用 Vim 对文件进行密码保护

Vim 有个 `-x` 选项，这个选项能让你在创建文件时用它来加密。一旦你运行下面的 [vim 命令][9]，你会被提示输入一个密钥：

```
$ vim -x file.txt
警告：正在使用弱加密方法；参见 :help 'cm'
输入加密密钥：*******
再次输入相同密钥：*******
```

如果第二次输入的密钥无误，你就能可以修改此文件了。

 [![Vim File Password Protected](https://www.tecmint.com/wp-content/uploads/2017/05/Vim-File-Password-Protected-File.png)][10] 

*被密码保护的 Vim 文件*

等你修改好之后，摁 `Esc` 和键入 `:wq` 来保存及关闭文件。下次你想打开它编辑一下，你就必须像这样去输入密钥：

```
$ vim file.txt
需要 "file.txt" 的加密密钥
警告：正在使用弱加密方法；参见 :help 'cm'
输入密钥：*******
```

假设你输了一个错误的密码（或者没输密码），你会看到一些垃圾字符。

 [![Vim Content Encrypted](https://www.tecmint.com/wp-content/uploads/2017/05/Vim-Content-Encrypted.png)][11] 

*Vim 中的加密内容*

#### 在 Vim 中设置一种强加密方法

注意：警告信息暗示保护文件的是弱加密方法。那么接下来，我们来看看怎么在 Vim 中设置一种强加密方法。

 [![Weak Encryption on Vim File](https://www.tecmint.com/wp-content/uploads/2017/05/Weak-Encryption-on-Vim-File.png)][12] 

*Vim 中文件弱加密*

为了查看加密方式（cm）集，键入如下：

```
:help 'cm'
```

输出样例：

```
                                                *'cryptmethod'* *'cm'*
'cryptmethod' 		string  (默认 "zip")
                            全局或本地到缓冲区 |global-local|
                            {not in Vi}
		当缓冲区写进文件中所用的加密方式：
												*pkzip*
			zip          	PkZip 兼容方式。  一种弱加密方法。
							与 Vim 7.2 及更老版本后向兼容。
												*blowfish*
			blowfish		河豚加密方式。  中级强度加密方法但有实现上
							的瑕疵。需要 Vim 7.3 及以上版本，用它加密的文件不
							能被 Vim 7.2 及更老版本读取。它会添加一个 “种子”，
							每次你当你写入文件时，这个加密字节都不同。
                                                             
```

你可以像如下所示的那样给一个 Vim 文件设置个新的加密方法（本例中我们用 `blowfish2` 加密方法）

```
:setlocal cm=blowfish2
```

然后键入回车和 `:wq` 保存文件。

 [![Set Strong Encryption on Vim File](https://www.tecmint.com/wp-content/uploads/2017/05/Set-Strong-Encryption-on-Vim-File.png)][13] 

*对 Vim 文件设置强加密*

现在你再打开下面的文件时应该就看不到那条警告信息了。

```
$ vim file.txt
需要 "file.txt" 的加密密钥
输入加密密钥：*******
```

你也可以在打开 Vim 文件之后来设置密码，用 `:X` 命令就能像上面所示的那样去设置一个加密密码。

可以看看我们其他的关于 Vim 编辑器的有用的文章。

1.  [在 Linux 中学习有用的 Vim 编辑器的技巧][1]
2.  [给每个 Linux 用户的 8 种有用的 Vim 编辑器技巧][2]
3.  [spf13-vim –  Vim 编辑器的顶级分发版][3]
4.  [怎样在 Linux 种把 Vim 编辑当作 Bash IDE 来用][4]

本文到这里就结束了！文章中我们介绍了怎么通过 Linux 下的 Vim 文本编辑器来给一个文件做加密防护。

永远记住要用强加密方式及密码来适当的保护那些可能包含了诸如用户名及密码、财务账户信息等机密信息的文本文件。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S（Free and Open-Source Software，自由及开放源代码软件）爱好者，未来的 Linux 系统管理员、Web 开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，且崇尚分享知识。

------------------

via: https://www.tecmint.com/password-protect-vim-file-in-linux/

作者：[Aaron Kili][a]
译者：[ch-cn](https://github.com/ch-cn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/learn-vi-and-vim-editor-tips-and-tricks-in-linux/
[2]:https://www.tecmint.com/how-to-use-vi-and-vim-editor-in-linux/
[3]:https://www.tecmint.com/spf13-vim-offers-vim-plugins-vim-editor/
[4]:https://linux.cn/article-8467-1.html
[5]:https://www.tecmint.com/vi-editor-usage/
[6]:https://www.tecmint.com/best-open-source-linux-text-editors/
[7]:https://linux.cn/article-7728-1.html
[8a]:https://linux.cn/article-7766-1.html
[8]:https://linux.cn/article-8094-1.html
[9]:https://www.tecmint.com/linux-command-line-editors/
[10]:https://www.tecmint.com/wp-content/uploads/2017/05/Vim-File-Password-Protected-File.png
[11]:https://www.tecmint.com/wp-content/uploads/2017/05/Vim-Content-Encrypted.png
[12]:https://www.tecmint.com/wp-content/uploads/2017/05/Weak-Encryption-on-Vim-File.png
[13]:https://www.tecmint.com/wp-content/uploads/2017/05/Set-Strong-Encryption-on-Vim-File.png
[14]:https://www.tecmint.com/vi-editor-usage/
[15]:https://www.tecmint.com/author/aaronkili/
[16]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[17]:https://www.tecmint.com/free-linux-shell-scripting-books/
