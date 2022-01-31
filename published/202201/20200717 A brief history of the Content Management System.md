[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14180-1.html)
[#]: subject: (A brief history of the Content Management System)
[#]: via: (https://opensource.com/article/20/7/history-content-management-system)
[#]: author: (Pierre Burgy https://opensource.com/users/pierreburgy)

内容管理系统（CMS）简史
======

> 从静态页面到 JAM 栈，CMS 的历史就是开源和 Web 变迁的核心。

![](https://img.linux.net.cn/data/attachment/album/202201/15/000116nzhufdu7h9w8wewj.jpg)

<ruby>内容管理系统<rt>Content Management System</rt></ruby>（CMS）是一个多产的软件类别，其涵盖了所有创建和修改数字内容的应用程序。因此，CMS 的历史可以追溯到由 [蒂姆-伯纳斯-李][2] 在 1990 年建立的历史上的第一个网站也就不足为奇了，该网站是以基于互联网的超文本系统 HTML 为模型，只包含了文本和链接。

![CMS 市场演变时间表][3]

万维网（WWW）的雏形是静态网站，无需后端数据库即可提供内容。它们消耗的计算资源很少，所以加载速度很快 —— 因为没有数据库查询、没有模板渲染、也没有客户端-服务器请求的处理。鉴于那时很少有人经常“上网冲浪”，特别是与今天相比，Web 流量也很少。

当然，促进了这种互操作性都是开源软件。事实上，开源在 CMS 的演变中一直扮演着重要的角色。

### CMS 的崛起

快进到九十年代中期，随着万维网的普及和网站对频繁更新的需求的增加 —— 这与它最初托管手册式的静态内容有所不同。这导致了大量的 CMS 产品的出现，如 FileNet、Vignette 的StoryBuilder、Documentum 和其他许多产品。这些都是专有的闭源产品，这在那个时期并不罕见。

然而，在 21 世纪初，开源的 CMS 替代品出现了，这包括 WordPress、Drupal 和 Joomla。WordPress 包含一个可扩展的插件架构，并提供了可用于建立网站的模板，而不要求用户具备 HTML 和 CSS 知识。WordPress CMS 软件安装在 Web 服务器上，通常与 MySQL 或 MariaDB 数据库（当然，两者都是开源的）配合。CMS 是开源的这一事实在一定程度上加速了向 WordPress 的重大转变。

即使在今天，仍有大约三分之一的网站是使用这些第一代内容管理系统建立的。这些传统的 CMS 是单体系统，包括后端用户界面、插件、前端模板、层叠样式表（CSS）、Web 服务器和数据库。每当用户请求一个网站页面时，服务器首先查询数据库，然后将结果与来自页面标记和插件的数据结合起来，在浏览器中生成一个 HTML 文档。

### 趋向于 LAMP 栈

开源 CMS 的出现与建立在 LAMP（Linux、Apache、MySQL 和 PHP/Perl/Python）栈上的基础设施是一致的。这种新的结构代表了单体 Web 开发的开始，它使动态网站的创建能够使用数据库查询，为不同的终端用户提供独特的内容。在这一点上，以前放在服务器上的静态网站模式真正开始消失。（静态网站模式是指由文本和链接组成的单个文件，如 HTML、CSS、JavaScript 等，以同样的方式传递给所有的终端用户。）

### 移动 Web 改变了一切

随着我们逐渐步入 2000 年代的第一个十年，早期的移动设备如 Palm 和黑莓提供了对 Web 内容的访问，然后在 2010 年左右推出的智能手机和平板电脑让越来越多的用户可以通过移动设备访问 Web 。2016 年，天平倾斜，全球 [来自移动设备和平板电脑的 Web 访问量超过了台式机][4]。

单体的 CMS 并不适合为这些不同类型的访问设备提供内容，这就需要不同版本的网站 —— 通常是针对移动用户的精简版网站。新的可以访问 WEB 的设备类型的出现，如智能手表、游戏机和语音助手（如 Alexa）[5]，只是加剧了这个问题，对全渠道内容交付的需求变得很明显。

### 无头 CMS 和 JAM 栈的出现

无头 CMS 将后端（用来存储所有内容、数据库和文件）与前端解耦。通常，无头 CMS 使用 API，这样就可以访问数据库（SQL 和 NoSQL）和文件的内容，以便在网站、智能手机、甚至物联网（IoT）设备上显示。此外，无头 CMS 与前端框架无关，使其与各种静态网站生成器和前端框架（如 Gatsby.js、Next.js、Nuxt.js、Angular、React 和 Vue.js）兼容，这使开发人员可以自由选择他们喜欢的工具。

无头 CMS 特别适用于 JAM（Javascript、API 和 Markup）栈的 Web 开发架构，该架构正在成为一种流行的解决方案，因为它能提供更好的 Web 性能和 SEO 排名，以及强大的安全措施。JAM 栈不依赖于 Web 服务器，当有请求时可以立即提供静态文件。不需要查询数据库，因为文件已经被编译并提供给浏览器。

向无头 CMS 的转变是由新一轮的参与者推动的，他们有的采用 SaaS 方式，如 Contentful，有的采用自托管的开源替代品，如 [Strapi][6]。无头 CMS 也在颠覆电子商务行业，新的软件编辑器，如 Commerce Layer 和 [Saleor][7]（也是开源的）提供了解决方案，以真正的全渠道方式管理多个 SKU、价格和库存数据。

### 总结

在 CMS  的整个演变过程中，由互联网上的信息消费方式驱动，开源软件也沿着同样的趋势发展，新技术不断出现以解决出现的需求。事实上，在内容管理系统、万维网和开源之间似乎存在着一种相互依赖的关系。管理越来越多的内容的需求不会很快消失。我们完全有理由期待在未来更广泛地采用开源软件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/history-content-management-system

作者：[Pierre Burgy][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pierreburgy
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://www.w3.org/People/Berners-Lee/#:~:text=A%20graduate%20of%20Oxford%20University,refined%20as%20Web%20technology%20spread.
[3]: https://opensource.com/sites/default/files/uploads/timeline.market.png (timeline of CMS market evolution)
[4]: https://techcrunch.com/2016/11/01/mobile-internet-use-passes-desktop-for-the-first-time-study-finds/
[5]: https://opensource.com/article/20/6/open-source-voice-assistant
[6]: https://strapi.io/
[7]: https://saleor.io/
