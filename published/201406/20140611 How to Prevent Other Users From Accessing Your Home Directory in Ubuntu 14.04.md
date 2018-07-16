[小白技巧]如何在Linux中阻止其它用户访问你的家目录
================================================================================
![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/00_lead_image_home_directory.png)

如果你和其他人共享Ubuntu机器，那么你可能要设置多个用户，希望其他用户登录到他们自己的帐号，并只能访问他们自己的家目录。但是，默认情况下，任何一个用户都可以访问任何一个家目录。

当你在Ubuntu中添加一个新用户时，adduser工具为新的帐号添加了一个新的家目录。默认情况下，该目录位于根下面的/home/目录下，并以该帐号的用户名命名。例如，/home/lori。Ubuntu中创建的用户家目录具有其它人可读/执行权限，这就给系统中所有其他用户可以读另外外一些用户的家目录中的内容的权利。具体请阅读我们的[文件权限在Linux中是如何工作的][1]一文。

**注**：当我们在文中提到输入什么时，输入的文字内容是在引号中的，不要输入引号，除非我们另外指定。

你可以很容易地修改你的家目录的权限来保护你的私人文件。要检查你家目录的权限，输入Ctrl + Alt + T打开终端窗口，并在提示符后输入以下命令，然后按回车。使用你自己的用户名来替换下面的“用户名”。

    ls -ld /home/lori

**注**：该命令仅包含小写的L，而不是数字1。（LCTT译注：这是给完全小白的提示，绝大部分人可以无视这个备注了）

在该行的开头，列出了该文件的权限。就像我们在[文章][1]中关于Linux权限部分讲的那样。

> r表示“读”，w表示“写”，而x表示“执行”。目录权限以“d”开头，而不是“-”。你也会注意到权限值占了10个位置。你可以忽略第一个，后面是3个一组，分为3组。第一组是属主（owner）权限，第二组是属组（group）权限，最后一组是其它人（other或world）权限。

因此，下面列出的家目录的属主具有读、写和执行权限，而属组和其它人具有读和执行权限。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/01_permissions_for_home_folder.png)

要修改这些权限，在提示符下输入以下行并回车

    sudo chmod 0750 /home/lori

当提示你输入密码时，请输入并回车。

**注**：chmod命令使用八进制数作为一种指定权限的方式。我们讲Linux权限的[文章][1]中使用了一种不同的方法，它需要几个步骤，但是可能更易于理解。使用八进制数来指定权限，是一种更快的方法。不管使用什么方法，只要你用着舒服就好。要学习使用八进制数设置权限，请阅读此[文章][2]。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/02_changing_permissions_for_home_folder.png)

按上箭头两次，再次调用“ls -ld /home/用户名”命令来检查权限。注意，其它人权限现在都是破折号（-），这就意味着其它人将无法读、写或执行你家目录中的任何东西了。

然而，和你同组的用户可以读和执行你家目录中的文件和文件夹。如果你不想除你之外的任何人访问你的家目录，可以在chmod命令中输入“0700”。

**注**：要获取关于Linux中用户和组管理的更多信息，请查看我们的[文章][3]

要关闭终端窗口，在提示符下输入“exit”并回车。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/03_new_permissions.png)

现在，当其系统中的其他用户试着要访问你的家目录时，下面的对话框就会弹出来了。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/04_location_could_not_be_displayed.png)

甚至你也可以在创建新用户时让Ubuntu使用指定的权限。要完成此项任务，你需要编辑adduser配置文件。要编辑该文件，在提示符下输入以下命令并回车。

    gksudo gedit /etc/adduser.conf

我们使用gedit来编辑该文件，你也可以使用你想要的其它文本编辑器。

注：gksudo命令看似和sudo命令一样，但是它是用来以root身份运行图形化程序的，而sudo命令用来以root身份运行命令行程序。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/05_opening_gedit_as_root.png)

在弹出对话框中的密码编辑框内输入你的密码并按回车或点击确定（OK）。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/06_entering_password.png)

在adduser.conf文件中向下滚动到DIR_MODE命令处，这里的默认值是“0755”。修改该值来反映你想要授权给各种用户类型（属主，属组，其它人）的不同权限（r，w，x），如我们先前讨论过的“0750”或“0700”。点击保存（Save）。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/07_changing_dir_mode.png)

从gedit的文件（File）菜单选择退出（Quit）来关闭gedit，你也可以点击窗口左上角的X按钮来关闭它。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/08_closing_gedit.png)

点击窗口左上角的X来关闭终端窗口。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/05/09_closing_terminal_window_with_x.png)

现在，你家目录中文件会保持私有。切记，如果有其他用户和你处于同一组中，你也许要为你的家目录权限剔除组和大众权限。

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/190084/how-to-prevent-other-users-from-accessing-your-home-directory-in-ubuntu-14.04/

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/67987/htg-explains-how-do-linux-file-permissions-work/
[2]:http://www.linux.org/threads/file-permissions-chmod.4094/
[3]:http://www.howtogeek.com/howto/36845/the-beginners-guide-to-managing-users-and-groups-in-linux/
