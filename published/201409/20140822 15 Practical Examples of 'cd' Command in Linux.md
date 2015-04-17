15个关于Linux的‘cd’命令的练习例子
===========================

在Linux中，**‘cd‘（改变目录）**命令，是对新手和系统管理员来说，最重要最常用的命令。对管理无图形界面的服务器的管理员，‘**cd**‘是进入目录，检查日志，执行程序/应用软件/脚本和其余每个任务的唯一方法。对新手来说，是他们必须自己动手学习的最初始命令

![15 cd command examples in linux](http://www.tecmint.com/wp-content/uploads/2014/08/cd-command-in-linux.png)

*Linux中15个cd命令举例*

所以，请用心学习，我们在这会带给你**15**个基础的‘**cd**‘命令，它们富有技巧和捷径，学会使用这些了解到的技巧，会大大减少你在终端上花费的努力和时间

### 课程细节 ###

- 命令名称：cd
- 代表：切换目录
- 使用平台：所有Linux发行版本
- 执行方式：命令行
- 权限：访问自己的目录或者其余指定目录
- 级别：基础/初学者

1. 从当前目录切换到/usr/local

		avi@tecmint:~$ cd /usr/local
  		avi@tecmint:/usr/local$

2. 使用绝对路径，从当前目录切换到/usr/local/lib

   		avi@tecmint:/usr/local$ cd /usr/local/lib
	   	avi@tecmint:/usr/local/lib$

3. 使用相对路径，从当前路径切换到/usr/local/lib

   		avi@tecmint:/usr/local$ cd lib
   		avi@tecmint:/usr/local/lib$

4. **（a）**切换当前目录到上级目录

		avi@tecmint:/usr/local/lib$ cd -
   		/usr/local
   		avi@tecmint:/usr/local$

   **（b）**切换当前目录到上级目录

   		avi@tecmint:/usr/local/lib$ cd ..
   		avi@tecmint:/usr/local$

5. 显示我们最后一个离开的工作目录（使用‘-’选项）

   		avi@tecmint:/usr/local$ cd --
   		/home/avi

6. 从当前目录向上级返回两层

   		avi@tecmint:/usr/local$ cd ../../
   		avi@tecmint:/$

7. 从任何目录返回到用户home目录

   		avi@tecmint:/usr/local$ cd ~
   		avi@tecmint:~$

   或

   		avi@tecmint:/usr/local$ cd
   		avi@tecmint:~$

8. 切换工作目录到当前工作目录（LCTT：这有什么意义嘛？！）

   		avi@tecmint:~/Downloads$ cd .
   		avi@tecmint:~/Downloads$

   或

   		avi@tecmint:~/Downloads$ cd ./
   		avi@tecmint:~/Downloads$

9. 你当前目录是“/usr/local/lib/python3.4/dist-packages”，现在要切换到“/home/avi/Desktop/”，要求：一行命令，通过向上一直切换直到‘/’，然后使用绝对路径

		avi@tecmint:/usr/local/lib/python3.4/dist-packages$ cd ../../../../../home/avi/Desktop/
   		avi@tecmint:~/Desktop$

10. 从当前工作目录切换到/var/www/html，要求：不要将命令打完整，使用TAB

    	avi@tecmint:/var/www$ cd /v<TAB>/w<TAB>/h<TAB>
    	avi@tecmint:/var/www/html$

11. 从当前目录切换到/etc/v__ _，啊呀，你竟然忘了目录的名字，但是你又不想用TAB

    	avi@tecmint:~$ cd /etc/v*
    	avi@tecmint:/etc/vbox$

	**请注意：**如果只有一个目录以‘**v**‘开头，这将会移动到‘**vbox**‘。如果有很多目录以‘**v**‘开头，而且命令行中没有提供更多的标准，这将会移动到第一个以‘**v**‘开头的目录（按照他们在标准字典里字母存在的顺序）

12. 你想切换到用户‘**av**‘（不确定是avi还是avt）目录，不用**TAB**

    	avi@tecmint:/etc$ cd /home/av?
    	avi@tecmint:~$

13. Linux下的pushed和poped

	Pushed和poped是Linux bash命令，也是其他几个能够保存当前工作目录位置至内存，并且从内存读取目录作为当前目录的脚本，这些脚本也可以切换目录

		avi@tecmint:~$ pushd /var/www/html
    	/var/www/html ~
    	avi@tecmint:/var/www/html$ 

	上面的命令保存当前目录到内存，然后切换到要求的目录。一旦poped被执行，它会从内存取出保存的目录位置，作为当前目录

		avi@tecmint:/var/www/html$ popd
    	~
    	avi@tecmint:~$

14. 切换到名字带有空格的目录

		avi@tecmint:~$ cd test\ tecmint/
    	avi@tecmint:~/test tecmint$

    或

    	avi@tecmint:~$ cd 'test tecmint'
    	avi@tecmint:~/test tecmint$

    或

    	avi@tecmint:~$ cd "test tecmint"/
    	avi@tecmint:~/test tecmint$

15. 从当前目录切换到下载目录，然后列出它所包含的内容（使用一行命令）

		avi@tecmint:/usr$ cd ~/Downloads && ls
    	...
    	.
    	service_locator_in.xls
    	sources.list
    	teamviewer_linux_x64.deb
    	tor-browser-linux64-3.6.3_en-US.tar.xz
    	.
    	...

我们尝试使用最少的词句和一如既往的友好，来让你了解Linux的工作和执行

这就是所有内容。我很快会带着另一个有趣的主题回来的。

---

via: http://www.tecmint.com/cd-command-in-linux/

作者：[Avishek Kumar][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/

