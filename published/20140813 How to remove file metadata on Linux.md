如何在Linux上移除文件内的隐私数据
================================================================================

典型的数据文件通常关联着“元数据”，其包含这个文件的描述信息，表现为一系列属性-值的集合。元数据一般包括创建者名称、生成文件的工具、文件创建/修改时期、创建位置和编辑历史等等。几种流行的元数据标准有 EXIF（图片）、RDF（web资源）和DOI（数字文档）等。

虽然元数据在数据管理领域有它的优点，但事实上它会[危害][1]你的隐私。相机图片中的EXIF格式数据会泄露出可识别的个人信息，比如相机型号、拍摄相关的GPS坐标和用户偏爱的照片编辑软件等。在文档和电子表格中的元数据包含作者/所属单位信息和相关的编辑历史。不一定这么绝对，但诸如[metagoofil][2]一类的元数据收集工具在信息收集的过程中常最作为入侵测试的一部分被利用。

对那些想要从共享数据中擦除一切个人元数据的用户来说，有一些方法从数据文件中移除元数据。你可以使用已有的文档或图片编辑软件，通常有自带的元数据编辑功能。在这个教程里，我会介绍一种不错的、单独的**元数据清理工具**，其目标只有一个：**匿名一切私有元数据**。

[MAT][3]（元数据匿名工具箱）是一款专业的元数据清理器，使用Python编写。它属于Tor旗下的项目，而且是Live 版的隐私增强操作系统 [Trails][4] 的标配应用。

与诸如[exiftool][5]等只能对有限种类的文件类型进行写入的工具相比，MAT支持从各种各样的文件中消除元数据：图片（png、jpg）、文档（odt、docx、pptx、xlsx和pdf）、归档文件（tar、tar.bz2）和音频（mp3、ogg、flac）等。

### 在Linux上安装MAT ###

在基于Debian的系统（Ubuntu或Linux Mint）上，已经打包好MAT，所以安装很直接：

    $ sudo apt-get install mat

在Fedora上，并没有预先生成的MAT软件包，所以你需要从源码生成。这是我在Fedora上生成MAT的步骤（不成功的话，请查看教程底部）：

    $ sudo yum install python-devel intltool python-pdfrw perl-Image-ExifTool python-mutagen
    $ sudo pip install hachoir-core hachoir-parser
    $ wget https://mat.boum.org/files/mat-0.5.tar.xz
    $ tar xf mat-0.5.tar.xz
    $ cd mat-0.5
    $ python setup.py install 

### 使用MAT-GUI匿名元数据 ###

一旦安装好，通过GUI和命令行都可以使用MAT。输入这个命令启动MAT的GUI：

    $ mat-gui

尝试清理一个包含如下内置元数据的实例文档文件（如private.odt）。

![](https://farm6.staticflickr.com/5588/14694815240_22eced1f94_z.jpg)

点击“添加”按钮来添加需要清理的文件到MAT中。一旦载入文件，点击“确认”按钮对所有隐藏的元数据信息进行扫描。

![](https://farm4.staticflickr.com/3874/14694958067_00694d9d1f_z.jpg)

只要元数据被MAT检测到，“State”状态就会被标记成“Dirty”。双击文件可以查看检测到的元数据。

![](https://farm4.staticflickr.com/3861/14694815160_cda63bb8d8_z.jpg)

点击“清理”按钮来清除文件中的元数据。MAT会自动清空文件中的所有私有元数据字段。

![](https://farm6.staticflickr.com/5554/14694815220_40918f680f_z.jpg)

清除后的状态中不包含任何私有可辨识的痕迹：

![](https://farm6.staticflickr.com/5591/14881486215_83808b6aaf_z.jpg)

### 从命令行匿名元数据 ###

    $ mat -c .

正如前面提到的，另一种调用MAT的方式是从命令行，使用mat命令可达到。

为了检查任何敏感的元数据，先前往文件所在的目录，然后运行：

    $ mat -c .

这样会扫描当前目录和其子目录下的所有文件，并报告它们的状态（已清理或未清理）。

![](https://farm6.staticflickr.com/5564/14878449991_cf9d605e6d_o.png)

你可以使用“-d”选项来查看检测到的真实元数据：
    
    $ mat -d <input_file> 

![](https://farm6.staticflickr.com/5558/14901361173_0e587329f5_z.jpg)

如果不为mat命令提供任何选项，默认操作会移除文件的元数据。如果要在清理的过程中保留原始文件的备份，使用“-b”选项。下面命令会清除所有文件的元数据，并将原始文件存储为“*.bak”文件。

    $ mat -b . 

![](https://farm6.staticflickr.com/5591/14694850169_1cf7562657_z.jpg)

查看所支持的文件类型，请运行：

    $ mat -l 

![](https://farm6.staticflickr.com/5588/14901361153_e59ab7b684_z.jpg)

### 故障排除 ###

当前我在Fedora上使用编译版本的MAT遇到了下列问题。当我尝试在Fedora清除归档/文档文件的元数据时（如*.gz、*.odt、*.docx），MAT因为下列错误失败。如果你知道如何解决这个问题，请在评论里回复我。

      File "/usr/lib64/python2.7/zipfile.py", line 305, in __init__
        raise ValueError('ZIP does not support timestamps before 1980')
    ValueError: ZIP does not support timestamps before 1980

### 总结 ###

MAT是一款简单但非常好用的工具，用来预防从元数据中无意泄露私人数据。请注意如果有必要，文件内容也需要保护。MAT能做的是消除与文件相关的元数据，但并不会对文件本身进行任何操作。简而言之，MAT是一名救生员，因为它可以处理大多数常见的元数据移除，但不应该只指望它来保证你的隐私。[译者注：养成良好的隐私保护意识和习惯才是最好的方法]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/remove-file-metadata-linux.html

作者：[Dan Nanni][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://www.theguardian.com/world/2013/sep/30/nsa-americans-metadata-year-documents
[2]:http://code.google.com/p/metagoofil/
[3]:https://mat.boum.org/
[4]:https://tails.boum.org/
[5]:http://xmodulo.com/2013/08/view-or-edit-pdf-and-image-metadata-from-command-line-on-linux.html