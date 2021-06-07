[#]: subject: (5 ways to protect your documents with open source software)
[#]: via: (https://opensource.com/article/21/4/secure-documents-open-source)
[#]: author: (Ksenia Fedoruk https://opensource.com/users/ksenia-fedoruk)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13428-1.html)

用开源软件保护你的文件的 5 种方法
======

> 控制你自己的数据，使未经授权的用户无法访问它。

![](https://img.linux.net.cn/data/attachment/album/202105/27/000829h3fcdd9b6p9v9xx9.jpg)

用户完全有权利关心他们数据的安全和保障。当你在计算机上创建数据时，希望对其进行独家控制是合理的。

有许多方法保护你的文件。在文件系统层面，你可以 [加密你的硬盘][2] 或 [只是加密一个文件][3]。不过，一个好的办公套件为你提供了更多的选择，我收集了五种我用开源软件保护文件的方法。

### 5 种保护你的文件的方法

#### 1、将文件保存在安全的云存储服务中

自托管一个开源的内容管理系统（CMS）平台可以让你完全控制你的数据。你的所有数据都留在你的服务器上，你可以控制谁可以访问它。

**选项：** [Nextcloud][4]、[ownCloud][5]、[Pydio][6] 和 [Seafile][7]

所有这些都提供了存储、同步和共享文件和文件夹、管理内容、文件版本等功能。它们可以很容易地取代 Dropbox、Google Drive 和其他专有的云存储，不用将你的数据放在你不拥有、不维护、不管理的服务器上。

上面列出的开源的自托管方式符合 GDPR 和其他保护用户数据的国际法规。它们提供备份和数据恢复选项、审计和监控工具、权限管理和数据加密。

![Pydio 审计控制][8]

*Pydio 细胞中的审计控制。(来源：[Pydio.com][9])*

#### 2、启用静态、传输和端到端的加密功能

我们经常笼统地谈论数据加密，但在加密文件时有几个方面需要考虑：

  * 通过**静态加密**（或磁盘加密），你可以保护存储在你的基础设施内或硬盘上的数据。
  * 在使用 HTTPS 等协议时，**传输加密**会保护流量形式的数据。它可以保护你的数据在从一个地方移动到另一个地方时不被拦截和转换。当你把文件上传到你的云端时，这很重要。
  * **端到端加密**（E2EE）通过在一端加密，在另一端解密来保护数据。除非有解密密钥，否则任何第三方都无法读取你的文件，即使他们干扰了这个过程并获得了这个文件的权限。

**选项：** CryptPad、ownCloud、ONLYOFFICE 工作区、Nextcloud 和 Seafile

ownCloud、ONLYOFFICE 工作区、Nextcloud 和 Seafile 支持所有三层的加密。但它们在实现端到端加密的方式上有所不同。

  * 在 ownCloud 中，有一个 E2EE 插件，允许你对文件夹共享进行加密。
  * 在 Nextcloud 中，桌面客户端有一个文件夹级别的选项。
  * Seafile 通过创建加密库来提供客户端的 E2EE。
  * [ONLYOFFICE 工作区][10] 不仅允许你在存储和共享文件时对其进行加密，而且还允许你在“私人房间”中实时安全地共同编辑文件。加密数据是自动生成和传输的，并且是自己加密的 —— 你不需要保留或记住任何密码。
  * 正如其名称所示，[CryptPad][11] 是完全私有的。所有的内容都是由你的浏览器进行加密和解密的。这意味着文件、聊天记录和文件在你登录的会话之外是无法阅读的。即使是服务管理员也无法得到你的信息。

![加密的 CryptPad 存储][12]

*加密的 CryptPad 存储。(来源：[Cryptpad.fr][13])*

#### 3、使用数字签名

数字签名可以让你验证你是文件内容的原作者，并且没有对其进行过修改。

**选项：** LibreOffice Writer、ONLYOFFICE 桌面编辑器、OpenESignForms 和 SignServer

[LibreOffice][14] 和 [ONLYOFFICE][15] 套件提供了一个对文件数字签名的集成工具。你可以添加一个在文档文本中可见的签名行，并允许你向其他用户请求签名。

一旦你应用了数字签名，任何人都不能编辑该文件。如果有人修改文档，签名就会失效，这样你就会知道内容被修改了。

在 ONLYOFFICE 中，你可以在 LibreOffice 中签名 OOXML 文件（例如，DOCX、XLSX、PPTX）作为 ODF 和 PDF。如果你试图在 LibreOffice 中签名一个 OOXML 文件，该签名将被标记为“只有部分文件被签署”。

![ONLYOFFICE 中的数字签名][16]

*ONLYOFFICE 中的数字签名。 (来源：[ONLYOFFICE帮助中心][17])*

[SignServer][18] 和 [Open eSignForms][19] 是免费的电子签名服务，如果你不需要在编辑器中直接签名文件，你可以使用它们。这两个工具都可以让你处理文档，SignServer 还可以让你签名包括 Java 在内的代码，并应用时间戳。

#### 4、添加水印

水印可避免你的内容在未经授权的情况下被重新分发，并保护你的文件可能包含的任何机密信息。

**选项：**Nextcloud 中的 Collabora Online 或 ONLYOFFICE Docs

当与 Nextcloud 集成时，[ONLYOFFICE Docs][20] 和 [Collabora][21] 允许你在文件、电子表格和演示文稿中嵌入水印。要激活水印功能，必须以管理员身份登录你的 Nextcloud 实例，并在解决方案的设置页面上进入**安全视图设置**。

你可以使用占位符将默认的水印替换成你自己的文本。在打开文件时，水印将针对每个用户单独显示。你也可以定义组来区分将看到水印的用户，并选择必须显示水印的共享类型。

![水印][22]

*水印 (Ksenia Fedoruk, [CC BY-SA 4.0][23])*

你也可以在 LibreOffice 和 ONLYOFFICE 桌面应用程序中的文档中插入水印。然而，在这种情况下，它只是一个放置在主文本层下的文本或图像，任何人都可以轻易地删除它。

#### 5、用密码保护文件

密码保护允许你安全地存储和交换本地文件。如果有人访问你的桌面或通过电子邮件或其他方法得到受保护的文件，他们不知道密码就无法打开它。

**选项：** Apache OpenOffice、LibreOffice 和 ONLYOFFICE 桌面编辑器

所有这三种解决方案都提供了为你的敏感文件设置密码的能力。

如果一个受保护的文档对你很重要，强烈建议你使用密码管理器保存密码或记住它，因为 LibreOffice、ONLYOFFICE 和 [OpenOffice][24] 不提供密码恢复选项。因此，如果你忘记或丢失了密码，就没有办法恢复或重置密码并打开文件。

### 你的数据属于你

使用这些方法中的一种或多种来保护你的文件，以保持更安全的在线活动。现在是 21 世纪，计算机太先进了，不能冒险把你的数据交给你无法控制的服务。使用开源，掌握你的数字生活的所有权。

你最喜欢的安全使用文档的工具是什么？请在评论中分享它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/secure-documents-open-source

作者：[Ksenia Fedoruk][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksenia-fedoruk
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: https://opensource.com/article/21/3/encryption-luks
[3]: https://opensource.com/article/21/3/luks-truecrypt
[4]: https://nextcloud.com/
[5]: https://owncloud.com/
[6]: https://pydio.com/
[7]: https://www.seafile.com/en/home/
[8]: https://opensource.com/sites/default/files/uploads/pydiocells.png (Pydio audit control)
[9]: http://pydio.com
[10]: https://www.onlyoffice.com/workspace.aspx
[11]: https://cryptpad.fr/
[12]: https://opensource.com/sites/default/files/uploads/cryptdrive.png (Encrypted CryptPad storage)
[13]: http://cryptpad.fr
[14]: https://www.libreoffice.org/
[15]: https://www.onlyoffice.com/desktop.aspx
[16]: https://opensource.com/sites/default/files/uploads/onlyoffice_digitalsig.png (Digital signature in ONLYOFFICE)
[17]: http://helpcenter.onlyoffice.com
[18]: https://www.signserver.org/
[19]: https://github.com/OpenESignForms
[20]: https://www.onlyoffice.com/office-for-nextcloud.aspx
[21]: https://www.collaboraoffice.com/
[22]: https://opensource.com/sites/default/files/uploads/onlyoffice_watermark.png (Watermark)
[23]: https://creativecommons.org/licenses/by-sa/4.0/
[24]: https://www.openoffice.org/
