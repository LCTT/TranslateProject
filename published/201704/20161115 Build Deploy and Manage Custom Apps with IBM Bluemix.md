使用 IBM Bluemix 构建，部署和管理自定义应用程序
============================================================

 ![IBM Bluemix logo](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/IBM-Blue-mix-logo.jpg?resize=300%2C266) 

IBM Bluemix 为开发人员提供了构建、部署和管理自定义应用程序的机会。Bluemix 建立在 Cloud Foundry 上。它支持多种编程语言，包括 IBM 的 OpenWhisk ，还允许开发人员无需资源管理就调用任何函数。

Bluemix 是由 IBM 实现的基于开放标准的云平台。它具有开放的架构，其允许组织能够在云上创建、开发和管理其应用程序。它基于 Cloud Foundry ，因此可以被视为平台即服务（PaaS）。使用 Bluemix，开发人员不必关心云端配置，可以专注于他们的应用程序。 云端配置将由 Bluemix 自动完成。

Bluemix 还提供了一个仪表板，通过它，开发人员可以创建，管理和查看服务和应用程序，同时还可以监控资源使用情况。

它支持以下编程语言：

*   Java
*   Python
*   Ruby on Rails
*   PHP
*   Node.js

它还支持 OpenWhisk（FaaS），这也是一个 IBM 的产品，其允许开发人员调用任一功能而不需要任何资源管理。

![图1 IBM Bluemix概述](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-1-An-Overview-of-IBM-Bluemix.jpg?resize=296%2C307) 

*图1 IBM Bluemix 概述*

![图2 IBM Bluemix体系结构](http://i0.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-2-The-IBM-Bluemix-architecture.jpg?resize=350%2C239)

*图2 IBM Bluemix 体系结构*

![图3 在IBM Bluemix 中创建组织](http://i0.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-3-Creating-an-organisation-in-IBM-Bluemix.jpg?resize=350%2C280) 

*图3 在 IBM Bluemix 中创建组织*

### IBM Bluemix 如何工作

Bluemix 构建在 IBM 的 SoftLayer IaaS（基础架构即服务）之上。它使用 Cloud Foundry 作为开源 PaaS 平台。一切起于通过 Cloud Foundry 来推送代码，它扮演着将代码和编写应用所使用的编程语言运行时环境整合起来的角色。IBM 服务、第三方服务或社区构建的服务可用于不同的功能。安全连接器可用于将本地系统连接到云。

![图4 在IBM Bluemix中设置空间](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-4-Setting-up-Space-in-IBM-Bluemix.jpg?resize=350%2C267) 

*图4 在 IBM Bluemix 中设置空间*

![图5 应用程序模板](http://i2.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-5-The-app-template.jpg?resize=350%2C135) 

*图5 应用程序模板*

![图6 IBM Bluemix支持的编程语言](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-6-IBM-Bluemix-supported-programming-languages.jpg?resize=350%2C173) 

*图6 IBM Bluemix 支持的编程语言*

### 在 Bluemix 中创建应用程序

在本文中，我们将使用 Liberty for Java 的入门包在 IBM Bluemix 中创建一个示例“Hello World”应用程序，只需几个简单的步骤。

1、 打开 [https：//console.ng.bluemix.net/registration/][2]

2、 注册 Bluemix 帐户

3、 点击邮件中的确认链接完成注册过程

4、 输入您的电子邮件 ID，然后点击 Continue 进行登录

5、 输入密码并点击 Log in

6、 进入 Set up -> Environment 设置特定区域中的资源共享

7、 创建空间方便管理访问控制和在 Bluemix 中回滚操作。 我们可以将空间映射到多个开发阶段，如 dev， test，uat，pre-prod 和 prod

![图7 命名应用程序](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-7-Naming-the-app.jpg?resize=350%2C133) 

*图7 命名应用程序*

![图8 了解应用程序何时准备就绪](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-8-Knowing-when-the-app-is-ready.jpg?resize=350%2C170) 

*图8 了解应用程序何时准备就绪*

![图9 IBM Bluemix Java应用程序](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-9-The-IBM-Bluemix-Java-App.jpg?resize=350%2C151) 

*图9 IBM Bluemix Java 应用程序*

8、 完成初始配置后，单击 I'm ready -> Good to Go ！

9、 成功登录后，此时检查 IBM Bluemix 仪表板，特别是 Cloud Foundry Apps（其中 2GB 可用）和 Virtual Server（其中 0 个实例可用）的部分

10、 点击 Create app，选择应用创建模板。在我们的例子中，我们将使用一个 Web 应用程序

11、 如何开始？单击 Liberty for Java ，然后查看其描述

12、 单击 Continue

13、 为新应用命名。对于本文，让我们使用 osfy-bluemix-tutorial 命名然后单击 Finish

14、 在 Bluemix 上创建资源和托管应用程序需要等待一些时间

15、 几分钟后，应用程式就会开始运作。注意应用程序的URL

16、 访问应用程序的URL http：//osfy-bluemix-tutorial.au-syd.mybluemix.net/, 不错，我们的第一个在 IBM Bluemix 上的 Java 应用程序成功运行

17、 为了检查源代码，请单击 Files 并在门户中导航到不同文件和文件夹

18、 Logs 部分提供包括从应用程序的创建时起的所有活动日志。

19、  Environment Variables 部分提供关于 VCAP\_Services 的所有环境变量以及用户定义的环境变量的详细信息

20、 要检查应用程序的资源消耗，需要到 Liberty for Java 那一部分。

21、 默认情况下，每个应用程序的 Overview 部分包含资源，应用程序的运行状况和活动日志的详细信息

22、 打开 Eclipse，转到帮助菜单，然后单击 _Eclipse Marketplace_

23、 查找 IBM Eclipse tools for Bluemix 并单击 Install

24、 确认所选的功能并将其安装在 Eclipse 中

25、 下载应用程序启动器代码。点击 File Menu，将它导入到 Eclipse 中，选择 Import Existing Projects -> Workspace, 然后开始修改代码

![图10 Java应用程序源文件](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-10-The-Java-app-source-files.jpg?resize=350%2C173) 

*图10 Java 应用程序源文件*

![图11 Java应用程序日志](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-11-The-Java-app-logs.jpg?resize=350%2C133) 

*图11 Java 应用程序日志*

![图12 Java应用程序 - Liberty for Java](http://i0.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-12-Java-app-Liberty-for-Java.jpg?resize=350%2C169) 

*图12 Java 应用程序 - Liberty for Java*

### 为什么选择 IBM Bluemix？

以下是使用 IBM Bluemix 的一些令人信服的理由：

*   支持多种语言和平台
*   免费试用
    1. 简化的注册过程
    2. 不需要信用卡
    3. 30 天试用期 - 配额 2GB 的运行时，支持 20 个服务，500 个 route
    4. 无限制地访问标准支持
    5. 没有生产使用限制
*   仅为每个使用的运行时和服务付费
*   快速设置 - 从而加快上架时间
*   持续交付新功能
*   与本地资源的安全集成
*   用例
    1. Web 应用程序和移动后端
    2. API 和内部集成
*   DevOps 服务可部署在云上的 SaaS ，并支持持续交付：
    1. Web IDE
    2. SCM
    3. 敏捷规划
    4. 交货管道服务

--------------------------------------------------------------------------------

via: http://opensourceforu.com/2016/11/build-deploy-manage-custom-apps-ibm-bluemix/

作者：[MITESH_SONI][a]
译者：[Vic020](http//www.vicyu.net)
校对：[Bestony](https://github.com/Bestony)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensourceforu.com/author/mitesh_soni/
[1]:http://opensourceforu.com/wp-content/uploads/2016/10/Figure-7-Naming-the-app.jpg
[2]:https://console.ng.bluemix.net/registration/
