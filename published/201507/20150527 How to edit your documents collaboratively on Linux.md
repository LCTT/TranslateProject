如何在 Linux 上 使用 ONLYOFFICE 协同编辑文档
================================================================================
> “多年前由一些紧张兮兮的、带有强迫症的助理开发的 Bulletin，只是一个放在共享文件夹中只有 Emily 和我可以访问的 Word 文档而已。同一时间我们只有一个人可以打开它并添加消息、想法，或者给条目列表上增加问题。然后我们再打印出更新后的版本并放到我桌子架上的剪贴板，并在完成时删除旧的内容。”（——《穿普拉达的女王》，劳伦·魏丝伯格著 ）

直到今天人们仍然在使用这样的“协同编辑”，只有一个人可以打开共享文件，对其进行更改，然后告诉其它人什么时候修改了什么。

ONLYOFFICE 是一款集成了文档、电子邮件、事件、任务和客户关系管理工具的开源在线办公套件。

使用 ONLYOFFICE 办公套件，一组人可以同时编辑文本、电子表格或者在浏览器上进行展示。可以直接在他们的文档上留下评论并用其中集成的聊天工具和其他人沟通。最后，可以保存文档为 PDF 文件并打印。作为额外的增强功能，它还能浏览文档历史并在如果需要时恢复到之前的修订/版本。

在这篇教程中，我会介绍如何使用 [免费版 ONLYOFFICE][1] 部署你自己的在线办公套件，免费版 ONLYOFFICE 是 ONLYOFFICE 在 GNU AGPL v3 协议下发布的自托管版本。

### 在 Linux 上安装 ONLYOFFICE ###

安装 ONLYOFFICE 要求在你的 Linux 系统上要有 mono（4.0.0 或更高版本）、nodejs、libstdc++6、nginx 和 mysql-server。为了简化安装过程并避免依赖错误，我使用 Docker 安装 ONLYOFFICE。在这种情况下只需要安装一种依赖 - [Docker][2]。 

提醒一下，Docker 是一个在软件容器中自动部署应用的开源项目。如果在你的 Linux 系统上 Docker 不可用，首先根据 [基于 Debian][3] 或 [基于 Red-Hat][4] 系统的 Docker 安装指令安装它。

注意，你需要 Docker 1.4.1 或更高版本。要检查安装的 Docker 版本，可以使用下面的命令。

    $ docker version 

在一个 Docker 容器中试用 ONLYOFFICE，只需要执行下面的命令：

    $ sudo docker run -i -t -d --name onlyoffice-document-server onlyoffice/documentserver
    $ sudo docker run -i -t -d -p 80:80 -p 443:443 --link onlyoffice-document-server:document_server onlyoffice/communityserver

这些命令会下载为了能正常运行带有所有所需依赖的 [官方 ONLYOFFICE Docker 镜像][5]。

也可以在 Linux 服务器上单独安装 [ONLYOFFICE 在线编辑器][6]，并通过提供的 API 轻松地集成到你的站点或云应用。

### 运行自行托管的在线 Office ###

要打开你的在线 office，在你浏览器的地址栏输入 localhost（http://IP地址/）。会打开欢迎页面：

![](https://farm9.staticflickr.com/8815/18116525656_795821c73b_c.jpg)

输入一个密码并指定下次访问你的 office 所使用的电子邮件地址。 

### 在线编辑文档 ###

首先点击 Document 链接打开 **the My Documents** 文件夹。

![](https://farm8.staticflickr.com/7781/17956640089_d3df0b18cd_c.jpg)

#### STEP 1. 选择需要编辑的文档 ####

要在这里新建一个新文档，点击左上角的 “Create” 按钮，从下拉列表中选择文件类型。要编辑保存在你硬盘中的文件，点击 **Create** 按钮旁边的 **Upload** 按钮上传文件到 **Document**。

![](https://farm9.staticflickr.com/8836/17956640109_ed8be735df_c.jpg)

#### STEP 2. 共享文档 ####

如果你在 **My Documents** 文件夹中，用右边的 **Share** 按钮，或者如果你在文档中，用 **File >> Document Info ... >> Change Access Rights**。

在打开的 **Sharing Settings** 窗口，点击左边的 **People outside portal** 链接，打开到文档的访问，并通过启用 **Full Access** 单选按钮给予完全访问权限。

最后，选择一种方式共享到你文档的链接，通过 email 或者你可用的一种社交网络：Google+、Facebook 或 Twitter 发送。

![](https://farm8.staticflickr.com/7766/17522306273_c8a9022c75_c.jpg)

#### STEP 3. 开始协同编辑 ####

邀请的人只需要根据提供的链接就可以开始协同编辑文档。

它会自动用不用颜色的虚线将你的合作者编辑的文本段落标记出来。

![](https://farm8.staticflickr.com/7790/18139370292_7ef57aae8f_c.jpg)

只要你的其中一个协作者保存了他/她的更改，你会看到在顶部工具栏左上角出现了一个提示标签，表示这里有更新。

![](https://farm8.staticflickr.com/7778/18143984831_3dd42a9672_c.jpg)

点击 **Save** 图标保存更改并更新。然后会高亮所有的更新。

![](https://farm8.staticflickr.com/7796/17955172970_e53460b8a6_c.jpg)

#### STEP 4. 和协作者互动 ####

要写评论，用鼠标选择一个文本段落，右击并从上下文菜单中选择 **Add comment** 选项。

![](https://farm8.staticflickr.com/7771/17956640359_c4e2858dc8_c.jpg)

要和协作者实时互动，可以使用集成的聊天工具。**Chat** 面板会列出所有正在编辑文档的用户。点击左侧边栏的 **Chat** 图标打开它。在 **Chat** 面板的合适区域输入你的信息开始讨论。

![](https://farm8.staticflickr.com/7794/18116394026_d93b00e4f8_c.jpg)

### 有用的提示 ###

最后，这里有一些你充分利用 ONLYOFFICE 的有用提示。

#### Tip #1. 在云存储服务例如 ownCloud 上编辑文档 ####

如果你将文档存储在其它网络资源上，例如 Box、Dropbox、Google Drive、OneDrive、SharePoint 或 ownCloud，你可以轻松地和 ONLYOFFICE 同步。

在打开的 ‘Documents’ 模块，点击 **Add the account** 下面的其中一个图标：Google、Box、DropBox、OneDrive、ownCloud 或 ‘Add account’，并输入所需数据。

#### Tip #2. 在 iPad 上编辑文档 ####

要随时随地对文件进行修改，我使用 iPad 的 ONLYOFFICE Documents 应用。你可以从 [iTune][7] 下载并安装它，然后你需要输入你的 ONLYOFFICE 地址、email 和密码来访问你的文档。功能设置几乎一样。

为了评估 ONLYOFFICE 在线编辑器的功能，你可以使用供个人使用的 [云版本][8]。 

--------------------------------------------------------------------------------

via: http://xmodulo.com/edit-documents-collaboratively-linux.html

作者：[Tatiana Kochedykova][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/tatiana
[1]:http://www.onlyoffice.org/
[2]:http://xmodulo.com/recommend/dockerbook
[3]:http://xmodulo.com/manage-linux-containers-docker-ubuntu.html
[4]:http://xmodulo.com/docker-containers-centos-fedora.html
[5]:https://registry.hub.docker.com/u/onlyoffice/communityserver/
[6]:http://onlyoffice.org/sources#document
[7]:https://itunes.apple.com/us/app/onlyoffice-documents/id944896972
[8]:https://personal.onlyoffice.com/