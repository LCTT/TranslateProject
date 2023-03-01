[#]: subject: "My favorite LibreOffice productivity tips"
[#]: via: "https://opensource.com/article/21/9/libreoffice-tips"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "XiaotingHuang22"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15530-1.html"

提高 LibreOffice 生产力的技巧
======

![][0]

> 今天我将和大家分享一些 LibreOffice 的键盘快捷键和排版技巧，希望能够帮你省下宝贵的时间。

LibreOffice 是我首选的生产力应用程序。它是向教育工作者和学生推荐 Linux 发行版的最有力理由之一，无论是 PK-12 还是高等教育。新的学年快到了，我想也是时候推荐一些 LibreOffice 快捷方式和技巧，它们可以为你节省宝贵的时间。

### 使用键盘快捷键让你工作更快捷

我平时经常使用键盘快捷键，以下是适用于所有 LibreOffice 应用程序的最常见的快捷键

  * `Ctrl+N` — 创建新文档
  * `Ctrl+O` — 打开一个文档
  * `Ctrl+S` — 保存文档
  * `Ctrl+Shift+S` — 另存为
  * `Ctrl+P` — 打印文档

这些是仅适用于 LibreOffice Writer 的快捷键：

  * `Home` — 移动到当前行的初始位置
  * `End` — 移动至当前行的结尾位置
  * `Ctrl+Home` — 将光标移动到文档的初始位置
  * `Ctrl+End` — 将光标移动到文档的结尾位置
  * `Ctrl+A` — 全选
  * `Ctrl+D` — 双下划线
  * `Ctrl+E` — 居中
  * `Ctrl+H` — 查找并替换
  * `Ctrl+L` — 左对齐
  * `Ctrl+R` — 右对齐

功能键也大有用处：
  * `F2` — 打开公式栏
  * `F3` — 自动补完
  * `F5` — 打开导航器
  * `F7` — 打开拼写和语法
  * `F11` — 打开格式和排版
  * `Shift+F11` — 创建新样式

### 文档格式

文档格式有很多种，LibreOffice 支持其中很多文档格式。默认情况下，LibreOffice 将文档保存为 <ruby>开放文档格式<rt>Open Document Format</rt></ruby>（ODF），这是一种开源标准，将样式表和数据存储在 ZIP 容器中，文本文档标记为 ODT，电子表格标记为 ODS，演示文稿标记为 ODP。它是一种灵活的格式，由 LibreOffice 社区和文档基金会维护。

ODF 是默认启用的，因此你无需执行任何操作即可让 LibreOffice 使用这种格式。

另一种文档开放规范是微软的 [Office Open XML（OOXML）格式][2]。它是一个 ISO 标准，并得到所有主要办公解决方案的良好支持。

如果你与使用微软 Office 的人一起工作（它本身不是开源的，但它确实使用开放的 OOXML 格式），那么他们肯定习惯于 DOCX、XLSX 和 PPTX 格式，并且可能无法打开 ODT、ODS 或 ODP 文件。你可以通过在 LibreOffice 中将 OOXML 设置为默认格式来避免很多混乱。

将 OOXML 设置为你的首选格式：

   1. 单击 “<ruby>工具<rt>Tools</rt></ruby>” 菜单并选择菜单底部的 “<ruby>选项<rt>Options</rt></ruby>”。
   2. 在 “<ruby>选项<rt>Options</rt></ruby>” 窗口中，单击左侧面板中的 “<ruby>加载/保存<rt>Load/Save</rt></ruby>” 类别，然后选择 “<ruby>常规<rt>General</rt></ruby>”。  
  ![LibreOffice设置面板][3]
   3. 导航到 “<ruby>默认文件格式和 ODF 设置<rt>Default File Format and ODF Settings</rt></ruby>” 部分。
   4. 在 “<ruby>文档类型<rt>Document type</rt></ruby>” 选择 “<ruby>文本文档<rt>Text document</rt></ruby>”，并在 “<ruby>始终另存为<rt>Always save as</rt></ruby>” 下拉列表选择 “Open XML (Transitional) (*.docx) ”。
   5. 点击 “<ruby>应用<rt>Apply</rt></ruby>” 然后点击 “<ruby>确定<rt>OK</rt></ruby>”。
   6. 取消选择 “<ruby>未以 ODF 或默认格式保存时发出警告<rt>Warn when not saving in ODF or default format </rt></ruby>” 以避免在保存时出现确认对话框。
  ![LibreOffice 保存格式][5]

按照相同的逻辑重复，重复相同的过程用于 XLSX 和 PPTX 文档。

### 让办公更自由

LibreOffice 项目由蓬勃发展的用户和开发人员社区与文档基金会共同管理。这包括工程指导委员会、董事会、独立开发人员、设计师和翻译人员等。这些团队始终欢迎各位的贡献，因此如果你渴望参与一个超赞的开源项目，请不要犹豫 [参与进来][6]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/libreoffice-tips

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[XiaotingHuang22](https://github.com/XiaotingHuang22)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://www.iso.org/standard/71691.html
[3]: https://opensource.com/sites/default/files/uploads/libreoffice-panel.jpg (LibreOffice settings panel)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/libreoffice-save-format.jpg (LibreOffice save formats)
[6]: https://www.libreoffice.org/community/get-involved/
[0]: https://img.linux.net.cn/data/attachment/album/202302/11/161923gks1dsldq7dd1z67.jpg