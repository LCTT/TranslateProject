[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11373-1.html)
[#]: subject: (Create an online store with this Java-based framework)
[#]: via: (https://opensource.com/article/19/1/scipio-erp)
[#]: author: (Paul Piper https://opensource.com/users/madppiper)

使用 Java 框架 Scipio ERP 创建一个在线商店
======

> Scipio ERP 具有包罗万象的应用程序和功能。

![](https://img.linux.net.cn/data/attachment/album/201909/22/133258hqvwax5w1zvq5ffa.jpg)

如果，你想在网上销售产品或服务，但要么找不到合适的软件，要么觉得定制成本太高？那么，[Scipio ERP][1] 也许正是你想要的。

Scipio ERP 是一个基于 Java 的开源的电子商务框架，具有包罗万象的应用程序和功能。这个项目于 2014 年从 [Apache OFBiz][2] 分叉而来，侧重于更好的定制和更现代的吸引力。这个电子商务组件非常丰富，可以在多商店环境中工作，同时支持国际化，具有琳琅满目的产品配置，而且它还兼容现代 HTML 框架。该软件还为许多其他业务场景提供标准应用程序，例如会计、仓库管理或销售团队自动化。它都是高度标准化的，因此易于定制，如果你想要的不仅仅是一个虚拟购物车，这是非常棒的。

该系统也使得跟上现代 Web 标准变得非常容易。所有界面都是使用系统的“[模板工具包][3]”构建的，这是一个易于学习的宏集，可以将 HTML 与所有应用程序分开。正因为如此，每个应用程序都已经标准化到核心。听起来令人困惑？它真的不是 HTML——它看起来很像 HTML，但你写的内容少了很多。

### 初始安装

在你开始之前，请确保你已经安装了 Java 1.8（或更高版本）的 SDK 以及一个 Git 客户端。完成了？太棒了！接下来，切换到 Github 上的主分支：

```
git clone https://github.com/ilscipio/scipio-erp.git
cd scipio-erp
git checkout master
```

要安装该系统，只需要运行 `./install.sh` 并从命令行中选择任一选项。在开发过程中，最好一直使用 “installation for development”（选项 1），它还将安装一系列演示数据。对于专业安装，你可以修改初始配置数据（“种子数据”），以便自动为你设置公司和目录数据。默认情况下，系统将使用内部数据库运行，但是它[也可以配置][4]使用各种关系数据库，比如 PostgreSQL 和 MariaDB 等。

![安装向导][6]

*按照安装向导完成初始配置*

通过命令 `./start.sh` 启动系统然后打开链接 <https://localhost:8443/setup/> 完成配置。如果你安装了演示数据, 你可以使用用户名 `admin` 和密码 `scipio` 进行登录。在安装向导中，你可以设置公司简介、会计、仓库、产品目录、在线商店和额外的用户配置信息。暂时在产品商店配置界面上跳过网站实体的配置。系统允许你使用不同的底层代码运行多个在线商店；除非你想这样做，一直选择默认值是最简单的。

祝贺你，你刚刚安装了 Scipio ERP！在界面上操作一两分钟，感受一下它的功能。

### 捷径

在你进入自定义之前，这里有一些方便的命令可以帮助你：

  * 创建一个 shop-override：`./ant create-component-shop-override`
  * 创建一个新组件：`./ant create-component`
  * 创建一个新主题组件：`./ant create-theme`
  * 创建管理员用户：`./ant create-admin-user-login`
  * 各种其他实用功能：`./ant -p`
  * 用于安装和更新插件的实用程序：`./git-addons help`

另外，请记下以下位置：

  * 将 Scipio 作为服务运行的脚本：`/tools/scripts/`
  * 日志输出目录：`/runtime/logs`
  * 管理应用程序：`<https://localhost:8443/admin/>`
  * 电子商务应用程序：`<https://localhost:8443/shop/>`

最后，Scipio ERP 在以下五个主要目录中构建了所有代码：

  * `framework`: 框架相关的源，应用程序服务器，通用界面和配置
  * `applications`: 核心应用程序
  * `addons`: 第三方扩展
  * `themes`: 修改界面外观
  * `hot-deploy`: 你自己的组件

除了一些配置，你将在 `hot-deploy` 和 `themes` 目录中进行开发。

### 在线商店定制

要真正使系统成为你自己的系统，请开始考虑使用[组件][7]。组件是一种模块化方法，可以覆盖、扩展和添加到系统中。你可以将组件视为独立 Web 模块，可以捕获有关数据库（[实体][8]）、功能（[服务][9]）、界面（[视图][10]）、[事件和操作][11]和 Web 应用程序等的信息。由于组件功能，你可以添加自己的代码，同时保持与原始源兼容。

运行命令 `./ant create-component-shop-override` 并按照步骤创建你的在线商店组件。该操作将会在 `hot-deploy` 目录内创建一个新目录，该目录将扩展并覆盖原始的电子商务应用程序。

![组件目录结构][13]

*一个典型的组件目录结构。*

你的组件将具有以下目录结构：

  * `config`: 配置
  * `data`: 种子数据
  * `entitydef`: 数据库表定义
  * `script`: Groovy 脚本的位置
  * `servicedef`: 服务定义
  * `src`: Java 类
  * `webapp`: 你的 web 应用程序
  * `widget`: 界面定义

此外，`ivy.xml` 文件允许你将 Maven 库添加到构建过程中，`ofbiz-component.xml` 文件定义整个组件和 Web 应用程序结构。除了一些在当前目录所能够看到的，你还可以在 Web 应用程序的 `WEB-INF` 目录中找到 `controller.xml` 文件。这允许你定义请求实体并将它们连接到事件和界面。仅对于界面来说，你还可以使用内置的 CMS 功能，但优先要坚持使用核心机制。在引入更改之前，请熟悉 `/applications/shop/`。

#### 添加自定义界面

还记得[模板工具包][3]吗？你会发现它在每个界面都有使用到。你可以将其视为一组易于学习的宏，它用来构建所有内容。下面是一个例子：

```
<@section title="Title">
    <@heading id="slider">Slider</@heading>
    <@row>
        <@cell columns=6>
            <@slider id="" class="" controls=true indicator=true>
                <@slide link="#" image="https://placehold.it/800x300">Just some content…</@slide>
                <@slide title="This is a title" link="#" image="https://placehold.it/800x300"></@slide>
            </@slider>
        </@cell>
        <@cell columns=6>Second column</@cell>
    </@row>
</@section>
```

不是很难，对吧？同时，主题包含 HTML 定义和样式。这将权力交给你的前端开发人员，他们可以定义每个宏的输出，并坚持使用自己的构建工具进行开发。

我们快点试试吧。首先，在你自己的在线商店上定义一个请求。你将修改此代码。一个内置的 CMS 系统也可以通过 <https://localhost:8443/cms/> 进行访问，它允许你以更有效的方式创建新模板和界面。它与模板工具包完全兼容，并附带可根据你的喜好采用的示例模板。但是既然我们试图在这里理解系统，那么首先让我们采用更复杂的方法。

打开你商店 `webapp` 目录中的 [controller.xml][14] 文件。控制器会跟踪请求事件并相应地执行操作。下面的操作将会在 `/shop/test` 下创建一个新的请求:

```
<!-- Request Mappings -->
<request-map uri="test">
     <security https="true" auth="false"/>
      <response name="success" type="view" value="test"/>
</request-map>
```

你可以定义多个响应，如果需要，可以在请求中使用事件或服务调用来确定你可能要使用的响应。我选择了“视图”类型的响应。视图是渲染的响应；其他类型是请求重定向、转发等。系统附带各种渲染器，可让你稍后确定输出；为此，请添加以下内容：

```
<!-- View Mappings -->
<view-map name="test" type="screen" page="component://mycomponent/widget/CommonScreens.xml#test"/>
```

用你自己的组件名称替换 `my-component`。然后，你可以通过在 `widget/CommonScreens.xml` 文件的标签内添加以下内容来定义你的第一个界面：

```
<screen name="test">
        <section>
            <actions>
            </actions>
            <widgets>
                <decorator-screen name="CommonShopAppDecorator" location="component://shop/widget/CommonScreens.xml">
                    <decorator-section name="body">
                        <platform-specific><html><html-template location="component://mycomponent/webapp/mycomponent/test/test.ftl"/></html></platform-specific>
                    </decorator-section>
                </decorator-screen>
            </widgets>
        </section>
    </screen>
```

商店界面实际上非常模块化，由多个元素组成（[小部件、动作和装饰器][15]）。为简单起见，请暂时保留原样，并通过添加第一个模板工具包文件来完成新网页。为此，创建一个新的 `webapp/mycomponent/test/test.ftl` 文件并添加以下内容：

```
<@alert type="info">Success!</@alert>
```

![自定义的界面][17]

*一个自定义的界面。*

打开 <https://localhost:8443/shop/control/test/> 并惊叹于你自己的成就。

#### 自定义主题

通过创建自己的主题来修改商店的界面外观。所有主题都可以作为组件在 `themes` 文件夹中找到。运行命令 `./ant create-theme` 来创建你自己的主题。

![主题组件布局][19]

*一个典型的主题组件布局。*

以下是最重要的目录和文件列表：

  * 主题配置：`data/*ThemeData.xml`
  * 特定主题封装的 HTML：`includes/*.ftl`
  * 模板工具包 HTML 定义：`includes/themeTemplate.ftl`
  * CSS 类定义：`includes/themeStyles.ftl`
  * CSS 框架: `webapp/theme-title/`

快速浏览工具包中的 Metro 主题；它使用 Foundation CSS 框架并且充分利用了这个框架。然后，然后，在新构建的 `webapp/theme-title` 目录中设置自己的主题并开始开发。Foundation-shop 主题是一个非常简单的特定于商店的主题实现，你可以将其用作你自己工作的基础。

瞧！你已经建立了自己的在线商店，准备个性化定制吧！

![搭建完成的 Scipio ERP 在线商店][21]

*一个搭建完成的基于 Scipio ERP的在线商店。*

### 接下来是什么？

Scipio ERP 是一个功能强大的框架，可简化复杂的电子商务应用程序的开发。为了更完整的理解，请查看项目[文档][7]，尝试[在线演示][22]，或者[加入社区][23].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/scipio-erp

作者：[Paul Piper][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/madppiper
[b]: https://github.com/lujun9972
[1]: https://www.scipioerp.com
[2]: https://ofbiz.apache.org/
[3]: https://www.scipioerp.com/community/developer/freemarker-macros/
[4]: https://www.scipioerp.com/community/developer/installation-configuration/configuration/#database-configuration
[5]: /file/419711
[6]: https://opensource.com/sites/default/files/uploads/setup_step5_sm.jpg (Setup wizard)
[7]: https://www.scipioerp.com/community/developer/architecture/components/
[8]: https://www.scipioerp.com/community/developer/entities/
[9]: https://www.scipioerp.com/community/developer/services/
[10]: https://www.scipioerp.com/community/developer/views-requests/
[11]: https://www.scipioerp.com/community/developer/events-actions/
[12]: /file/419716
[13]: https://opensource.com/sites/default/files/uploads/component_structure.jpg (component directory structure)
[14]: https://www.scipioerp.com/community/developer/views-requests/request-controller/
[15]: https://www.scipioerp.com/community/developer/views-requests/screen-widgets-decorators/
[16]: /file/419721
[17]: https://opensource.com/sites/default/files/uploads/success_screen_sm.jpg (Custom screen)
[18]: /file/419726
[19]: https://opensource.com/sites/default/files/uploads/theme_structure.jpg (theme component layout)
[20]: /file/419731
[21]: https://opensource.com/sites/default/files/uploads/finished_shop_1_sm.jpg (Finished Scipio ERP shop)
[22]: https://www.scipioerp.com/demo/
[23]: https://forum.scipioerp.com/
