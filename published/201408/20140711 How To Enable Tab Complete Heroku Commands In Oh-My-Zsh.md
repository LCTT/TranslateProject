如何在Oh-My-Zsh中启用Heroku命令补全功能
================================================================================
**Heroku**客户端是创建和管理Heroku应用的命令行界面工具。

需求:

- Heroku toolbelt
- Oh-My-Zsh ([如何安装][1])

本文不是讲关于heroku的知识，也不是讲关于heroku的使用细节，而是仅仅展示给用户他们怎样可以使用oh-my-zsh来方便地敲入heroku命令。此外你还应该安装[heroku toolbelt][2]来进行本文的相应的操作。对于Ubuntu和Debian发行版，你可以通过运行下面的命令来安装：

    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

打开终端，用你在[这里]创建的用户登陆heroku：

	heroku login
	Enter your Heroku credentials.
	Email: enockseth@unixmen.com
	Password (输入是隐藏的): 
	Authentication successful.

这显示heroku正在运行。

用你惯用的文本编辑器打开**.zshrc**：

    vim .zshrc

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/zsh_git.png)

这里，git是唯一默认启用的插件。

在下图显示的插件选择区添加**heroku**：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/zsh_heroku.png)

重启终端，输入**heroku**，按下tab键，到此就搞定啦：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/heroku_tab_complete.png)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/enable-tab-complete-heroku-commands-oh-zsh/

译者：[JonathanKang](https://github.com/JonathanKang) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.unixmen.com/install-oh-zsh-ubuntu-arch-linux-fedora/
[2]:https://toolbelt.heroku.com/
[3]:https://www.heroku.com/
