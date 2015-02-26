墙外香花：Google drive和Ubuntu 14.04 LTS的胶合
================================================================================
Google尚未发布用于从Ubuntu访问其drive的**官方Linux客户端**。然开源社区却业已开发完毕非官方之软件包‘**grive-tools**’。

Grive乃是Google Drive（**在线存储服务**）的GNU/Linux系统客户端，允许你**同步**所选目录到云端，以及上传新文件到Google Drive。

### grive-tools安装步骤 ###

步骤：1 使用下列命令添加grive-tools PPA：

    # sudo add-apt-repository ppa:thefanclub/grive-tools

步骤：2 更新列表

    #sudo apt-get update

步骤：3 安装grive-tools

    # sudo apt-get install grive-tools 

### 访问Google Drive的步骤 ###

**步骤：1** 安装完了，通过输入**Grive**在**Unity Dash**搜索应用，并打开之。

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/access-grive-setup-1.jpg)

**步骤：2** 登入google drive，你将被问及访问google drive的权限。 

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/gdrive.png)

点击**下一步**时，新的浏览器中讲打开**Google登录页**

登入你的Google帐号，并点击**接受**，如下所示：

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/thrid-party-grive.png)

**步骤：3** 下面将提供给你一个 **google代码**，复制并粘贴到**Grive设置框**内。

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/gdrive-code-1.jpg)

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/code-in-grive-1.jpg)

点击下一步后，将会开始同步google drive到你**家目录**下的‘**Google Drive**’文件夹。完成后，将出现如下窗口。

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/grive-installation-completed.png)

Google Drive 文件夹会创建在**用户的主目录**下。

![](http://www.linuxtechi.com/wp-content/uploads/2014/09/google-drive-folder-1.jpg)

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/mount-google-drive-in-ubuntu/

作者：[Pradeep Kumar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
