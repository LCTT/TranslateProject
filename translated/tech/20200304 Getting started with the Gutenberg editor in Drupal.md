[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with the Gutenberg editor in Drupal)
[#]: via: (https://opensource.com/article/20/3/gutenberg-editor-drupal)
[#]: author: (MaciejLukianski https://opensource.com/users/maciejlukianski)

Drupal 中的 Gutenberg 编辑器入门
======
了解如何与 Drupal 一起使用 WordPress 中流行的 WYSIWYG 编辑器。
![Text editor on a browser, in blue][1]

自 2017 年以来，WordPress 的 [Gutenberg][2] 插件中就有非常出色的 WYSIWYG 编辑器。但是，Drupal 社区尚未就内容管理系统 （CMS） 编辑体验的最佳方法达成共识。 但是，在社区的大量努力下，出现了一个强有力的新选择，将 [Gutenberg 与 Drupal 集成在一起][3]。

以前，Drupal 8 中有两种主要的内容创建方法：

 * 在[**基于段落的方法**][4]中，内容是由称为段落的实体组合而成。 目前，大约有 100,000 个网站使用“段落” （Paragraphs）模块（根据 Drupal）。
 * [**Layout-Builder 方法**][5]使用 Drupal 8.5 附带的编辑工具。 它仍然在改进，但是它是下一个强有力的竞争者，因为它确实与 Drupal 内核很好地集成在一起。由于 Layout Builder 是 Drupal 的一部分，因此无法获得使用情况的统计信息。


在 2018 年底，由 Fronkom（一家专注于开源解决方案的挪威数字机构）领导的 Drupal 社区将 WordPress Gutenberg 项目作为贡献模块移植到了 Drupal 中。让我们看一下 Gutenberg 在 Drupal 中的工作方式（包括一些很酷的 Drupal 特定集成）。

### 安装

安装 [Gutenberg 模块][6]与安装任何 Drupal 模块一样简单，并且有良好的[安装文档][7]。

### 配置

Gutenberg 已集成到 Drupal 的默认内容实体创建工作流中。你可以将其用于你选择的任何内容类型，前提是内容类型至少有一个文本区域字段，它是 Gutenberg 编辑器输出的位置。

要在 Drupal 中的内容类型启用 Gutenberg 项目，你必须进入设置：**Structure &gt; Content types**，并且，从要你想使用 Gutenberg 的内容类型旁边的下拉框中单击 **Edit**。

![Drupal settings][8]

在出现的窗口中，向下滚动并选择左侧的 **Gutenberg experience** 选项卡，你可以在其中找到下面描述的设置。选择 **Enable Gutenberg experience**。

![Drupal Gutenberg settings][9]

#### 模板

这是 WordPress 开箱即用的很酷的功能之一。它能让你用 JSON 结构定义新页面模板。它将使用虚拟占位符内容预填充所有新创建的文章，这将有助于编辑者正确地构造内容。在上面的截图中，我添加了一个标题和一个段落。请注意，必须转义任何双引号。

#### 模板锁

此设置允许你定义是否允许用户删除占位符内容，添加新块或仅编辑现有的预填充内容。

#### 允许的 Gutenberg 和 Drupal 块

这是 Gutenberg Drupal 侧的另一个超酷功能。Drupal 允许用户创建各种类型的块来设计页面。例如，你可以创建一个块，其中包含五个最新博客的列表、最新评论或用于收集用户电子邮件的表单。

Gutenberg 与 Drupal 的深度集成允许用户在编辑时选择哪些 Drupal 块可供用户使用（例如，有限嵌入 YouTube），并将块用作内联内容。这是一个非常方便的功能，允许对用户体验进行精细控制。

在全新安装的 Drupal 中，没有太多的选择，但站点通常有许多提供各种功能的块。在下面的截图中，选择了 **Search form** 的 Drupal 块。

![Drupal Gutenberg blocks][10]

完成配置后，点击 **Save content type**。

### 使用 Drupal Gutenberg 发布内容

启用 Gutenberg 内容类型后，它将接管大部分编辑体验。

![Drupal Gutenberg content screen][11]

在主窗口中，你可以看到我在上面的模板配置中添加的虚拟占位符内容。

#### 特定于 Drupal 的选项

在右侧，Drupal 提供了一些字段和设置。例如，“Title” 字段是 Drupal 中所需的单独字段，因此它不在主页面上。

在 **Title** 下面，根据在 Drupal 中安装的模块和设置的选项，其他设置可能有所不同。你可以看到 **Revision log messages**、**Menu settings**、**Comment settings** 以及添加 **URL alias**。

通常，Drupal 内容类型由多个文本字段组成，如标记、类别、复选框、图像字段等。当你启用 Gutenberg 内容类型时，这些附加字段可在 **More settings** 选项卡中提供。

你现在可以添加内容 — 它的工作方式与 WordPress Gutenberg 中的相同，并有额外的添加 Drupal 块的选项。

在下面的截图中，你可以看到当我添加一些文本替换占位符文本、来自 Drupal 的搜索块、标题、标记和自定义 URL 别名后发生的情况。

![Drupal Gutenberg entering text][12]

点击 **Save** 后，你的内容将发布。

![Drupal Gutenberg output][13]

就是这样，它工作良好

### 共同工作以获得更好的软件体验

Drupal 中的 Gutenberg 工作良好。这是一个可供选择的选项，允许编辑者控制网站的外观，直至最细微的细节。采用率正在增长，截至本文撰写时，已有 1,000 多个安装，每月有 50 个新安装。Drupal 集成添加了其他很酷的功能，如细粒度权限、占位符内容，以及内联包含 Drupal 块的功能，这些功能在 WordPress 插件中没有。

很高兴看到两个独立项目的社区共同努力实现为人们提供更好的软件的共同目标。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/gutenberg-editor-drupal

作者：[MaciejLukianski][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/maciejlukianski
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://wordpress.org/plugins/gutenberg/
[3]: https://drupalgutenberg.org/
[4]: https://www.droptica.com/blog/flexible-and-easy-content-creation-drupal-paragraphs-module/
[5]: https://www.droptica.com/blog/layout-builder-building-drupal-8-layouts/
[6]: https://www.drupal.org/project/gutenberg
[7]: https://www.drupal.org/docs/8/extending-drupal-8/installing-drupal-8-modules
[8]: https://opensource.com/sites/default/files/uploads/gutenberg_edit.png (Drupal settings)
[9]: https://opensource.com/sites/default/files/uploads/gutenberg_settings.png (Drupal Gutenberg settings)
[10]: https://opensource.com/sites/default/files/uploads/gutenberg_blocks.png (Drupal Gutenberg blocks)
[11]: https://opensource.com/sites/default/files/uploads/gutenberg_contentwindow.png (Drupal Gutenberg content screen)
[12]: https://opensource.com/sites/default/files/uploads/gutenberg_entry.png (Drupal Gutenberg entering text)
[13]: https://opensource.com/sites/default/files/uploads/gutenberg-demo.png (Drupal Gutenberg output)
