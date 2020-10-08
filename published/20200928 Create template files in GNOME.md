[#]: collector: (lujun9972)
[#]: translator: (rakino)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12699-1.html)
[#]: subject: (Create template files in GNOME)
[#]: via: (https://opensource.com/article/20/9/gnome-templates)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

在 GNOME 中创建文档模板
======

> 制作模板可以让你更快地开始写作新的文档。

![](https://img.linux.net.cn/data/attachment/album/202010/08/215333mgqpiuqufhgidfpz.jpg)

我只是偶然发现了 [GNOME][2] 的一个新功能（对我来说是的）：创建文档模版。<ruby>模版<rt>template</rt></ruby>也被称作<ruby>样版文件<rt>boilerplate</rt></ruby>，一般是有着特定格式的空文档，例如律师事务所的信笺，在其顶部有着律所的名称和地址；另一个例子是银行以及保险公司的保函，在其底部页脚包含着某些免责声明。由于这类信息很少改变，你可以把它们添加到空文档中作为模板使用。

一天，在浏览我的 Linux 系统文件的时候，我点击了<ruby>模板<rt>Templates</rt></ruby>文件夹，然后刚好发现窗口的上方有一条消息写着：“将文件放入此文件夹并用作新文档的模板”，以及一个“获取详情……” 的链接，打开了模板的 [GNOME 帮助页面][3]。

![Message at top of Templates folder in GNOME Desktop][4]

### 创建模板

在 GNOME 中创建模板非常简单。有几种方法可以把文件放进模板文件夹里：你既可以通过图形用户界面（GUI）或是命令行界面（CLI）从另一个位置复制或移动文件，也可以创建一个全新的文件；我选择了后者，实际上，我创建了两个文件。

![My first two GNOME templates][6]

我的第一份模板是为 Opensource.com 的文章准备的，它有一个输入标题的位置以及关于我的名字和文章使用的许可证的几行。我的文章使用 Markdown 格式，所以我将模板创建为了一个新的 Markdown 文档——`Opensource.com Article.md`：

````
# Title    
```
An article for Opensource.com
by: Alan Formy-Duval
Creative Commons BY-SA 4.0
```

````

我将这份文档保存在了 `/home/alan/Templates` 文件夹内，现在 GNOME 就可以将这个文件识别为模板，并在我要创建新文档的时候提供建议了。

### 使用模板

每当我有了新文章的灵感的时候，我只需要在我计划用来组织内容的文件夹里单击右键，然后从<ruby>新建文档<rt>New Document</rt></ruby>列表中选择我想要的模板就可以开始了。

![Select the template by name][7]

你可以为各种文档或文件制作模板。我写这篇文章时使用了我为 Opensource.com 的文章创建的模板。程序员可能会把模板用于软件代码，这样的话也许你想要只包含 `main()` 的模板。

GNOME 桌面环境为 Linux 及相关操作系统的用户提供了一个非常实用、功能丰富的界面。你最喜欢的 GNOME 功能是什么，你又是怎样使用它们的呢？请在评论中分享～

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/gnome-templates

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[rakino](https://github.com/rakino)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://www.gnome.org/
[3]: https://help.gnome.org/users/gnome-help/stable/files-templates.html.en
[4]: https://opensource.com/sites/default/files/uploads/gnome-message_at_top_border.png (Message at top of Templates folder in GNOME Desktop)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/gnome-first_two_templates_border.png (My first two GNOME templates)
[7]: https://opensource.com/sites/default/files/uploads/gnome-new_document_menu_border.png (Select the template by name)
