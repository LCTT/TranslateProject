供应链管理方面的 5 个开源软件工具
======

> 跟踪您的库存和您需要的材料，用这些供应链管理工具制造产品。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_Maze2.png?itok=EH_L-J6Q)

本文最初发表于 2016 年 1 月 14 日，最后的更新日期为 2018 年 3 月 2 日。

如果你正在管理着处理实体货物的业务，[供应链管理][1] 是你的业务流程中非常重要的一部分。不论你是经营着一个只有几个客户的小商店，还是在世界各地拥有数以百万计客户和成千上万产品的世界财富 500 强的制造商或零售商，很清楚地知道你的库存和制造产品所需要的零部件，对你来说都是非常重要的事情。

保持对货品、供应商、客户的持续跟踪，而且所有与它们相关的变动部分都会受益于这些用来帮助管理工作流的专门软件，而在某些情况下需要完全依赖这些软件。在本文中，我们将去了解一些自由及开源的供应链管理方面的软件，以及它们的其中一些功能。

供应链管理比单纯的库存管理更为强大。它能帮你去跟踪货物流以降低成本，以及为可能发生的各种糟糕的变化来制定应对计划。它能够帮你对出口合规性进行跟踪，不论是否是出于法律要求、最低品质要求、还是社会和环境责任。它能够帮你计划最低供应量，让你能够在订单数量和交付时间之间做出明智的决策。

由于其本质决定了许多供应链管理软件是与类似的软件捆绑在一起的，比如，[客户关系管理][2]（CRM）和 [企业资源计划管理][3] （ERP）。因此，当你选择哪个工具更适合你的组织时，你可能会考虑与其它工具集成作为你的决策依据之一。

### Apache OFBiz

[Apache OFBiz][4] 是一套帮你管理多种业务流程的相关工具。虽然它能管理多种相关问题，比如，分类、电子商务网站、会计和 POS，它在供应链管理方面的主要功能关注于仓库管理、履行、订单和生产管理。它的可定制性很强，但是，对应的它需要大量的规划去设置和集成到你现有的流程中。这就是它适用于中大型业务的原因之一。项目的功能构建于三个层面：展示层、业务层和数据层，它是一个弹性很好的解决方案，但是，再强调一遍，它也很复杂。

Apache OFBiz 的源代码在其 [项目仓库][5] 中可以找到。Apache OFBiz 是用 Java 写的，并且它是按 [Apache 2.0 许可证][6] 授权的。

如果你对它感兴趣，你也可以去查看 [opentaps][7]，它是在 OFBiz 之上构建的。Opentaps 强化了 OFBiz 的用户界面，并且添加了 ERP 和 CRM 的核心功能，包括仓库管理、采购和计划。它是按 [AGPL 3.0][8] 授权使用的，对于不接受开源授权的组织，它也提供了商业授权。

### OpenBoxes

[OpenBoxes][9] 是一个供应链管理和存货管理项目，最初的主要设计目标是为了医疗行业中的药品跟踪管理，但是，它可以通过修改去跟踪任何类型的货品和相关的业务流。它有一个需求预测工具，可以基于历史订单数量、存储跟踪、支持多种场所、过期日期跟踪、销售点支持等进行预测，并且它还有许多其它功能，这使它成为医疗行业的理想选择，但是，它也可以用于其它行业。

它在 [Eclipse 公开许可证][10] 下可用，OpenBoxes 主要是由 Groovy 写的，它的源代码可以在 [GitHub][11] 上看到。

### OpenLMIS

与 OpenBoxes 类似，[OpenLMIS][12] 也是一个医疗行业的供应链管理工具，但是，它专用设计用于在非洲的资源缺乏地区使用，以确保有限的药物和医疗用品能够用到需要的病人上。它是 API 驱动的，这样用户可以去定制和扩展 OpenLMIS，同时还能维护一个与通用基准代码的连接。它是由洛克菲勒基金会开发的，其它的贡献者包括联合国、美国国际开发署、和比尔 & 梅林达·盖茨基金会。

OpenLMIS 是用 Java 和 JavaScript 的 AngularJS 写的。它在 [AGPL 3.0 许可证][13] 下使用，它的源代码在 [GitHub][13] 上可以找到。

### Odoo

你可能在我们以前的 [ERP 项目][3] 榜的文章上见到过 [Odoo][14]。事实上，根据你的需要，一个全功能的 ERP 对你来说是最适合的。Odoo 的供应链管理工具主要围绕存货和采购管理，同时还与电子商务网站和 POS 连接，但是，它也可以与其它的工具连接，比如，与 [frePPLe][15] 连接，它是一个开源的生产计划工具。

Odoo 既有软件即服务（SaaS）的解决方案，也有开源的社区版本。开源的版本是以 [LGPL][16] 版本 3 下发行的，源代码在 [GitHub][17] 上可以找到。Odoo 主要是用 Python 来写的。

### xTuple

[xTuple][18] 标称自己是“为成长中的企业提供供应链管理软件”，它专注于已经超越了其传统的小型企业 ERP 和 CRM 解决方案的企业。它的开源版本称为 Postbooks，添加了一些存货、分销、采购、以及供应商报告的功能，它提供的核心功能是会计、CRM、以及 ERP 功能，而它的商业版本扩展了制造和分销的 [功能][19]。

xTuple 在 [CPAL][20] 下使用，这个项目欢迎开发者去复刻它，为基于存货的制造商去创建其它的业务软件。它的 Web 应用核心是用 JavaScript 写的，它的源代码在 [GitHub][21] 上可以找到。

就这些，当然了，还有其它的可以帮你处理供应链管理的开源软件。如果你知道还有更好的软件，请在下面的评论区告诉我们。

--------------------------------------------------------------------------------

via: https://opensource.com/tools/supply-chain-management

作者：[Jason Baker][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://en.wikipedia.org/wiki/Supply_chain_management
[2]:https://opensource.com/business/14/7/top-5-open-source-crm-tools
[3]:https://linux.cn/article-9785-1.html
[4]:http://ofbiz.apache.org/
[5]:http://ofbiz.apache.org/source-repositories.html
[6]:http://www.apache.org/licenses/LICENSE-2.0
[7]:http://www.opentaps.org/
[8]:http://www.fsf.org/licensing/licenses/agpl-3.0.html
[9]:http://openboxes.com/
[10]:http://opensource.org/licenses/eclipse-1.0.php
[11]:https://github.com/openboxes/openboxes
[12]:http://openlmis.org/
[13]:https://github.com/OpenLMIS/openlmis-ref-distro/blob/master/LICENSE
[14]:https://www.odoo.com/
[15]:https://frepple.com/
[16]:https://github.com/odoo/odoo/blob/9.0/LICENSE
[17]:https://github.com/odoo/odoo
[18]:https://xtuple.com/
[19]:https://xtuple.com/comparison-chart
[20]:https://xtuple.com/products/license-options#cpal
[21]:http://xtuple.github.io/
