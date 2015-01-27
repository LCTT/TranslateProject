如何使用Aptik来备份和恢复Ubuntu中的Apps和PPAs
================================================================================
![00_lead_image_aptik](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x300x00_lead_image_aptik.png.pagespeed.ic.n3TJwp8YK_.png)

当你想重装Ubuntu或者仅仅是想安装它的一个新版本的时候，如果有个便捷的方法来重新安装之前的应用并且重置其设置会很方便的。此时 *Aptik* 粉墨登场，它可以帮助你轻松实现。

Aptik（自动包备份和恢复）是一个可以用在Ubuntu，Linux Mint 和其他基于Debian以及Ubuntu的Linux发行版上的应用，它允许你将已经安装过的包括软件库、下载包、安装的应用和主题、用户设置在内的PPAs(个人软件包存档)备份到外部的U盘、网络存储或者类似于Dropbox的云服务上。

注意：当我们在此文章中说到输入某些东西的时候，如果被输入的内容被引号包裹，请不要将引号一起输入进去，除非我们有特殊说明。

想要安装Aptik，需要先添加其PPA。使用Ctrl + Alt + T快捷键打开一个新的终端窗口。输入以下文字，并按回车执行。

    sudo apt-add-repository –y ppa:teejee2008/ppa

当提示输入密码的时候，输入你的密码然后按回车。

![01_command_to_add_repository](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x99x01_command_to_add_repository.png.pagespeed.ic.UfVC9QLj54.png)

在命令行提示符输入下边的命令，来确保资源库已经是最新版本。

    sudo apt-get update

![02_update_command](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x252x02_update_command.png.pagespeed.ic.m9pvd88WNx.png)

更新完毕后，你就完成了安装Aptik的准备工作。接下来输入以下命令并按回车：

    sudo apt-get install aptik

注意：你可能会看到一些有关于获取不到包更新的错误提示。不过别担心，如果这些提示看起来跟下边图片中类似的话，你的Aptik的安装就没有任何问题。

![03_command_to_install_aptik](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x416x03_command_to_install_aptik.png.pagespeed.ic.1jtHysRO9h.png)

安装过程会被显示出来。其中一个被显示出来的消息会提到此次安装会使用掉多少磁盘空间，然后提示你是否要继续，按下“y”再按回车，继续安装。

![04_do_you_want_to_continue](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x416x04_do_you_want_to_continue.png.pagespeed.ic.WQ15_UxK5Z.png)

当安装完成后，输入“Exit”并按回车或者按下左上角的“X”按钮，关闭终端窗口。

![05_closing_terminal_window](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x416x05_closing_terminal_window.png.pagespeed.ic.9QoqwM7Mfr.png)

在正式运行Aptik前，你需要设置好备份目录到一个U盘、网络驱动器或者类似于Dropbox和Google Drive的云帐号上。这儿的例子中，我们使用的是Dropbox。

![06_creating_backup_folder](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x243x06_creating_backup_folder.png.pagespeed.ic.7HzR9KwAfQ.png)

一旦设置好备份目录，点击启动栏上方的“Search”按钮。

![07_opening_search](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x177x07_opening_search.png.pagespeed.ic.qvFiw6_sXa.png)

在搜索框中键入 “aptik”。结果会随着你的输入显示出来。当Aptik图标显示出来的时候，点击它打开应用。

![08_starting_aptik](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x338x08_starting_aptik.png.pagespeed.ic.8fSl4tYR0n.png)

此时一个对话框会显示出来要求你输入密码。输入你的密码并按“OK”按钮。

![09_entering_password](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x337x09_entering_password.png.pagespeed.ic.yanJYFyP1i.png)

Aptik的主窗口显示出来了。从“Backup Directory”下拉列表中选择“Other…”。这个操作允许你选择你已经建立好的备份目录。

注意：在下拉列表的右侧的 “Open” 按钮会在一个文件管理窗口中打开选择目录功能。

![10_selecting_other_for_directory](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x533x10_selecting_other_for_directory.png.pagespeed.ic.dHbmYdAHYx.png)

在 “Backup Directory” 对话窗口中，定位到你的备份目录，然后按“Open”。

注意：如果此时你尚未建立备份目录或者想在备份目录中新建个子目录，你可以点“Create Folder”来新建目录。

![11_choosing_directory](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x470x11_choosing_directory.png.pagespeed.ic.E-56x54cy9.png)

点击“Software Sources (PPAs).”右侧的 “Backup”来备份已安装的PPAs。

![12_clicking_backup_software_sources](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x13_selecting_all_software_sources.png.pagespeed.ic.zDFiDGfnks.png)

然后“Backup Software Sources”对话窗口显示出来。已安装的包和对应的源（PPA）同时也显示出来了。选择你需要备份的源（PPAs），或者点“Select All”按钮选择所有源。

![13_selecting_all_software_sources](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x13_selecting_all_software_sources.png.pagespeed.ic.zDFiDGfnks.png)

点击 “Backup” 开始备份。

![14_clicking_backup_for_all_software_sources](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x14_clicking_backup_for_all_software_sources.png.pagespeed.ic.n5h_KnQVZa.png)

备份完成后，一个提示你备份完成的对话窗口会蹦出来。点击 “OK” 关掉。

一个名为“ppa.list”的文件出现在了备份目录中。

![15_closing_finished_dialog_software_sources](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x15_closing_finished_dialog_software_sources.png.pagespeed.ic.V25-KgSXdY.png)

接下来，“Downloaded Packages (APT Cache)”的项目只对重装同样版本的Ubuntu有用处。它会备份下你系统缓存(/var/cache/apt/archives)中的包。如果你是升级系统的话，可以跳过这个条目，因为针对新系统的包会比现有系统缓存中的包更加新一些。

备份和恢复下载过的包，这可以在重装Ubuntu，并且重装包的时候节省时间和网络带宽。因为一旦你把这些包恢复到系统缓存中之后，他们可以重新被利用起来，这样下载过程就免了，包的安装会更加快捷。

如果你是重装相同版本的Ubuntu系统的话，点击 “Downloaded Packages (APT Cache)” 右侧的 “Backup” 按钮来备份系统缓存中的包。

注意：当你备份下载过的包的时候是没有二级对话框出现的。你系统缓存 (/var/cache/apt/archives) 中的包会被拷贝到备份目录下一个名叫 “archives” 的文件夹中，当整个过程完成后会出现一个对话框来告诉你备份已经完成。

![16_downloaded_packages_backed_up](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x544x16_downloaded_packages_backed_up.png.pagespeed.ic.z8ysuwzQAK.png)

有一些包是你的Ubuntu发行版的一部分。因为安装Ubuntu系统的时候会自动安装它们，所以它们是不会被备份下来的。例如，火狐浏览器在Ubuntu和其他类似Linux发行版上都是默认被安装的，所以默认情况下，它不会被选择备份。

像[package for the Chrome web browser][1]这种系统安装完后才安装的包或者包含 Aptik 的包会默认被选择上。这可以方便你备份这些后安装的包。

按照需要选择想要备份的包。点击 “Software Selections” 右侧的 “Backup” 按钮备份顶层包。

注意：依赖包不会出现在这个备份中。

![18_clicking_backup_for_software_selections](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x18_clicking_backup_for_software_selections.png.pagespeed.ic.QI5D-IgnP_.png)

备份目录中出现了两个名为 “packages.list” 和“packages-installed.list” 的文件，并且会弹出一个通知你备份完成的对话框。点击 ”OK“关闭它。

注意：“packages-installed.list”文件包含了所有的包，而 “packages.list” 在包含了所有包的前提下还指出了那些包被选择上了。

![19_software_selections_backed_up](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x19_software_selections_backed_up.png.pagespeed.ic.LVmgs6MKPL.png)

要备份已安装软件的设置的话，点击 Aptik 主界面 “Application Settings” 右侧的 “Backup” 按钮，选择你要备份的设置，点击“Backup”。

注意：如果你要选择所有设置，点击“Select All”按钮。

![20_backing_up_app_settings](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x20_backing_up_app_settings.png.pagespeed.ic.7_kgU3Dj_m.png)

被选择的配置文件统一被打包到一个名叫 “app-settings.tar.gz” 的文件中。

![21_zipping_settings_files](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x21_zipping_settings_files.png.pagespeed.ic.dgoBj7egqv.png)

当打包完成后，打包后的文件被拷贝到备份目录下，另外一个备份成功的对话框出现。点击“OK”关掉。

![22_app_settings_backed_up](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x22_app_settings_backed_up.png.pagespeed.ic.Mb6utyLJ3W.png)

放在 “/usr/share/themes” 目录的主题和放在 “/usr/share/icons” 目录的图标也可以备份。点击 “Themes and Icons” 右侧的 “Backup” 来进行此操作。“Backup Themes” 对话框默认选择了所有的主题和图标。你可以安装需要的、取消一些不要的，然后点击 “Backup” 进行备份。

![22a_backing_up_themes_and_icons](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x22a_backing_up_themes_and_icons.png.pagespeed.ic.KXa8W3YhyF.png)

主题被打包拷贝到备份目录下的 “themes” 文件夹中，图标被打包拷贝到备份目录下的 “icons” 文件夹中。然后成功提示对话框出现，点击“OK”关闭它。

![22b_themes_and_icons_backed_up](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x530x22b_themes_and_icons_backed_up.png.pagespeed.ic.ejjRaymD39.png)

一旦你完成了需要的备份，点击主界面左上角的“X”关闭 Aptik 。

![23_closing_aptik](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x542x23_closing_aptik.png.pagespeed.ic.pNk9Vt3--l.png)

备份过的文件已存在于你选择的备份目录中，可以随时查看。

![24_backup_files_in_directory](http://cdn5.howtogeek.com/wp-content/uploads/2014/12/650x374x24_backup_files_in_directory.png.pagespeed.ic.vwblOfN915.png)

当你重装Ubuntu或者安装新版本的Ubuntu后，在新的系统中安装 Aptik 并且将备份好的文件置于新系统中使用。运行 Aptik，并使用每个条目的 “Restore” 按钮来恢复你的软件源、应用、包、设置、主题以及图标。

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/206454/how-to-backup-and-restore-your-apps-and-ppas-in-ubuntu-using-aptik/

作者：Lori Kaufman
译者：[Ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/203768
