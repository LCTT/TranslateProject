[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11884-1.html)
[#]: subject: (Best Open Source eCommerce Platforms to Build Online Shopping Websites)
[#]: via: (https://itsfoss.com/open-source-ecommerce/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

7 个可用于自建电商站点的开源解决方案
======

在[之前的文章][1]中，我介绍过一些开源<ruby>内容管理系统<rt>Content Management System</rt></ruby>（CMS），顾名思义，这些 CMS 平台更适用于以内容为主的站点。

那如果想要建立自己的线上购物站点呢？我们正好还有一些优秀的开源电商解决方案，可以自行部署在自己的 Linux 服务器上。

这些电商解决方案是专为搭建线上购物站点设计的，因此都集成了库存管理、商品列表、购物车、下单、愿望清单以及支付这些必需的基础功能。

但请注意，这篇文章并不会进行深入介绍。因此，我建议最好广泛试用其中的多个产品，以便进一步的了解和比较。

### 优秀的开源电商解决方案

![][2]

开源电商解决方案种类繁多，一些缺乏维护的都会被我们忽略掉，以免搭建出来的站点因维护不及时而受到影响。

另外，以下的列表排名不分先后。

#### 1、nopCommerce

![][3]

nopCommerce 是基于 [ASP.NET Core][4] 的自由开源的电商解决方案。如果你要找的是基于 PHP 的解决方案，可以跳过这一节了。

nopCommerce 的管理面板界面具有简洁易用的特点，如果你还使用过 OpenCart，就可能会感到似曾相识（我不是在抱怨）。在默认情况下，它就已经自带了很多基本的功能，同时还为移动端用户提供了响应式的设计。

你可以在其[官方商店][5]中获取到一些兼容的界面主题和应用扩展，还可以选择付费的支持服务。

在开始使用前，你可以从 nopCommerce 的[官方网站][6]下载源代码包，然后进行自定义配置和部署；也可以直接下载完整的软件包快速安装到 web 服务器上。详细信息可以查阅 nopCommerce 的 [GitHub 页面][7]或官方网站。

- [nopCommerce][8]

#### 2、OpenCart

![][9]

OpenCart 是一个基于 PHP 的非常流行的电商解决方案，就我个人而言，我曾为一个项目用过它，并且体验非常好，如果不是最好的话。

或许你会觉得它维护得不是很频繁，但实际上使用 OpenCart 的开发者并不在少数。你可以获得许多受支持的扩展并将它们的功能加入到 OpenCart 中。

OpenCart 不一定是适合所有人的“现代”电商解决方案，但如果你需要的只是一个基于 PHP 的开源解决方案，OpenCart 是个值得一试的选择。在大多数具有一键式应用程序安装支持的网络托管平台中，应该可以安装 OpenCart。想要了解更多，可以查阅 OpenCart 的官方网站或 [GitHub 页面][10]。

- [OpenCart][11]

#### 3、PrestaShop

![][12]

PrestaShop 也是一个可以尝试的开源电商解决方案。

PrestaShop 是一个积极维护下的开源解决方案，它的官方商店中也有额外提供主题和扩展。与 OpenCart 不同，在托管服务平台上，你可能找不到一键安装的 PrestaShop。但不需要担心，从官方网站下载下来之后，它的部署过程也并不复杂。如果你需要帮助，也可以参考 PrestaShop 的[安装指南][15]。

PrestaShop 的特点就是配置丰富和易于使用，我发现很多其它用户也在用它，你也不妨试用一下。

你也可以在 PrestaShop 的 [GitHub 页面][16]查阅到更多相关内容。

- [PrestaShop][17]

#### 4、WooCommerce

![][18]

如果你想用 [WordPress][19] 来搭建电商站点，不妨使用 WooCommerce。

从技术上来说，这种方式其实是搭建一个 WordPress 应用，然后把 WooCommerce 作为一个插件或扩展以实现电商站点所需要的功能。很多 web 开发者都知道如何使用 WordPress，因此 WooCommerce 的学习成本不会很高。

WordPress 作为目前最好的开源站点项目之一，对大部分人来说都不会有太高的门槛。它具有易用、稳定的特点，同时还支持大量的扩展插件。

WooCommerce 的灵活性也是一大亮点，在它的线上商店提供了许多设计和扩展可供选择。你也可以到它的 [GitHub 页面][20]查看相关介绍。

- [WooCommerce][21]

#### 5、Zen Cart

![][22]

这或许是一个稍显古老的电商解决方案，但同时也是最好的开源解决方案之一。如果你喜欢老式风格的模板（主要基于 HTML），而且只需要一些基础性的扩展，那你也可以尝试使用 Zen Cart。

就我个人而言，我不建议把 Zen Cart 用在一个新项目当中。但考虑到它仍然是一个活跃更新中的解决方案，如果你喜欢的话，也不妨用它来进行试验。

你也可以在 [SourceForge][23] 找到 Zen Cart 这个项目。

- [Zen Cart][24]

#### 6、Magento

![Image Credits: Magestore][25]

Magento 是 Abode 旗下的开源电商解决方案，从某种角度来说，可能比 WordPress 表现得更为优秀。

Magento 完全是作为电商应用程序而生的，因此你会发现它的很多基础功能都非常好用，甚至还提供了高级的定制。

但如果你使用的是 Magento 的开源版，可能会接触不到托管版的一些高级功能，两个版本的差异，可以在[官方文档][26]中查看到。如果你使用托管版，还可以选择相关的托管支持服务。

想要了解更多，可以查看 Magento 的 [GitHub 页面][27]。

- [Magento][28]

#### 7、Drupal

![Drupal][29]

Drupal 是一个适用于创建电商站点的开源 CMS 解决方案。

我没有使用过 Drupal，因此我不太确定它用起来是否足够灵活。但从它的官方网站上来看，它提供的扩展模块和主题列表，足以让你轻松完成一个电商站点需要做的任何事情。

跟 WordPress 类似，Drupal 在服务器上的部署并不复杂，不妨看看它的使用效果。在它的[下载页面][30]可以查看这个项目以及下载最新的版本。

- [Drupal][31]

#### 8、Odoo eCommerce

![Odoo Ecommerce Platform][32]

如果你还不知道，Odoo 提供了一套开源商务应用程序。他们还提供了[开源会计软件][33]和 CRM 解决方案，我们将会在单独的列表中进行介绍。

对于电子商务门户，你可以根据需要使用其在线拖放生成器自定义网站。你也可以推广该网站。除了简单的主题安装和自定义选项之外，你还可以利用 HTML/CSS 在一定程度上手动自定义外观。

你也可以查看其 [GitHub][34] 页面以进一步了解它。

- [Odoo eCommerce][35]

### 总结

我敢肯定还有更多的开源电子商务平台，但是，我现在还没有遇到比我上面列出的更好的东西。

如果你还有其它值得一提的产品，可以在评论区发表。也欢迎在评论区分享你对开源电商解决方案的经验和想法。 

--------------------------------------------------------------------------------

via: https://itsfoss.com/open-source-ecommerce/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-cms/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/02/open-source-eCommerce.png?ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/nopCommerce.png?ssl=1
[4]: https://en.wikipedia.org/wiki/ASP.NET_Core
[5]: https://www.nopcommerce.com/marketplace
[6]: https://www.nopcommerce.com/download-nopcommerce
[7]: https://github.com/nopSolutions/nopCommerce
[8]: https://www.nopcommerce.com/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/opencart.jpg?ssl=1
[10]: https://github.com/opencart/opencart
[11]: https://www.opencart.com/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/prestashop.jpg?ssl=1
[13]: https://addons.prestashop.com/en/3-templates-prestashop
[14]: https://addons.prestashop.com/en/
[15]: http://doc.prestashop.com/display/PS17/Installing+PrestaShop
[16]: https://github.com/PrestaShop/PrestaShop
[17]: https://www.prestashop.com/en
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/woocommerce.jpg?ssl=1
[19]: https://wordpress.org/
[20]: https://github.com/woocommerce/woocommerce
[21]: https://woocommerce.com/
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/Zen-cart.jpg?ssl=1
[23]: https://sourceforge.net/projects/zencart/
[24]: https://www.zen-cart.com/
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/magento.jpg?ssl=1
[26]: https://magento.com/compare-open-source-and-magento-commerce
[27]: https://github.com/magento
[28]: https://magento.com/
[29]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/drupal.png?ssl=1
[30]: https://www.drupal.org/project/drupal
[31]: https://www.drupal.org/industries/ecommerce
[32]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/02/odoo-ecommerce-platform.jpg?w=800&ssl=1
[33]: https://itsfoss.com/open-source-accounting-software/
[34]: https://github.com/odoo/odoo
[35]: https://www.odoo.com/page/open-source-ecommerce
