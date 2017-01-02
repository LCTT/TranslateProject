使用IBM Bluemix构建，部署和管理自定义应用程序
============================================================


 ![IBM Bluemix logo](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/IBM-Blue-mix-logo.jpg?resize=300%2C266) 

IBM Bluemix为开发人员提供了构建，部署和管理自定义应用程序的机会。Bluemix建立在Cloud Foundry上。它支持多种编程语言包括IBM的OpenWhisk，它允许开发人员调用任何函数但不需要资源管理。

Bluemix是由IBM实现的开放标准的基于云的平台。它具有开放的架构，其允许组织能够在云上创建，开发和管理其应用程序。它基于Cloud Foundry，因此可以被视为平台即服务（PaaS）。使用Bluemix，开发人员不必关心云配置，可以专注于他们的应用程序。 云配置将由Bluemix自动完成。

Bluemix还提供了一个仪表板，通过它，开发人员可以创建，管理和查看服务和应用程序，同时还可以监控资源使用情况。
它支持以下编程语言：

*   Java
*   Python
*   Ruby on Rails
*   PHP
*   Node.js

它还支持OpenWhisk（FaaS），这也是一个IBM的产品，其允许开发人员调用任一功能而不需要任何资源管理。

![图1 IBM Bluemix概述](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-1-An-Overview-of-IBM-Bluemix.jpg?resize=296%2C307) 

图1 IBM Bluemix概述

![图2 IBM Bluemix体系结构](http://i0.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-2-The-IBM-Bluemix-architecture.jpg?resize=350%2C239)

图2 IBM Bluemix体系结构

![图3 在IBM Bluemix中创建组织](http://i0.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-3-Creating-an-organisation-in-IBM-Bluemix.jpg?resize=350%2C280) 

图3 在IBM Bluemix中创建组织

**IBM Bluemix如何工作**

Bluemix构建在IBM的SoftLayer IaaS（基础架构即服务）之上。它使用Cloud Foundry作为开源PaaS平台。它通过将代码推送到Cloud Foundry开始，Cloud Foundry通过使用其编写应用程序的编程语言，扮演了组合代码和适当的运行时环境的角色。IBM服务，第三方服务或社区构建的服务可用于不同的功能。安全连接器可用于连接本地系统到云。

![图4 在IBM Bluemix中设置空间](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-4-Setting-up-Space-in-IBM-Bluemix.jpg?resize=350%2C267) 

图4 在IBM Bluemix中设置空间

![图5 应用程序模板](http://i2.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-5-The-app-template.jpg?resize=350%2C135) 

图5 应用程序模板

![图6 IBM Bluemix支持的编程语言](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-6-IBM-Bluemix-supported-programming-languages.jpg?resize=350%2C173) 

图6 IBM Bluemix支持的编程语言

**在Bluemix中创建应用程序**
在本文中，我们将使用Liberty for Java的入门包在IBM Bluemix中创建一个示例“Hello World”应用程序，只需几个简单的步骤。

1. 打开[_https：//console.ng.bluemix.net/registration/_] [2]

2. 注册Bluemix帐户

3. 点击邮件中的确认链接完成注册过程

4. 输入您的电子邮件ID，然后点击_Continue_进行登录

5. 输入密码并点击_Log in_

6. 进入_Set up_->_Environment_设置特定区域中的资源共享

7. 创建空间方便管理访问控制和在Bluemix中回滚操作。 我们可以将空间映射到多个开发阶段，如dev，test，uat，pre-prod和prod

![图7 命名应用程序](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-7-Naming-the-app.jpg?resize=350%2C133) 

图7 命名应用程序

![图8 了解应用程序何时准备就绪](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-8-Knowing-when-the-app-is-ready.jpg?resize=350%2C170) 

图8 了解应用程序何时准备就绪

![图9 IBM Bluemix Java应用程序](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-9-The-IBM-Bluemix-Java-App.jpg?resize=350%2C151) 

图9 IBM Bluemix Java应用程序

8. 完成初始配置后，单击_ I'm ready_ -> _Good to Go_！

9. 成功登录后，此时检查IBM Bluemix仪表板，特别是Cloud Foundry Apps（其中2GB可用）和Virtual Server（其中0个实例可用）的部分

10. 点击_Create app_，选择应用创建模板。在我们的例子中，我们将使用一个Web应用程序

11. 如何开始？单击Liberty for Java，然后检查其描述

12. 单击_Continue_

13. 为新应用命名。对于本文，让我们使用osfy-bluemix-tutorial命名然后单击_Finish_

14. 在Bluemix上创建资源和托管应用程序需要等待一些时间。

15. 几分钟后，应用程式就会开始运作。注意应用程序的URL。

16. 访问应用程序的URL _http：//osfy-bluemix-tutorial.au-syd.mybluemix.net/_, Bingo，我们的第一个在IBM Bluemix上的Java应用程序成功运行。

17. 为了检查源代码，请单击_Files_并在门户中导航到不同文件和文件夹

18. _Logs_部分提供所有活动日志，包括从应用程序的创建时起

19.  _Environment Variables_部分提供关于VCAP_Services的所有环境变量以及用户定义的环境变量的详细信息

20. 要检查应用程序的资源消耗，需要到Liberty for Java部分。

21. 默认情况下，每个应用程序的_Overview_部分包含资源，应用程序的运行状况和活动日志的详细信息

22. 打开Eclipse，转到帮助菜单，然后单击_Eclipse Marketplace_

23. 查找_IBM Eclipse tools for Bluemix_并单击_Install_

24. 确认所选的功能并将其安装在Eclipse中

25. 下载应用程序启动器代码。点击_File Menu_，将它导入到Eclipse中，选择_Import Existing Projects_ -> _Workspace_, 然后开始修改代码

![图10 Java应用程序源文件](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-10-The-Java-app-source-files.jpg?resize=350%2C173) 

图10 Java应用程序源文件

![图11 Java应用程序日志](http://i1.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-11-The-Java-app-logs.jpg?resize=350%2C133) 

图11 Java应用程序日志

![图12 Java应用程序 - Liberty for Java](http://i0.wp.com/opensourceforu.com/wp-content/uploads/2016/10/Figure-12-Java-app-Liberty-for-Java.jpg?resize=350%2C169) 

图12 Java应用程序 - Liberty for Java

**为什么选择IBM Bluemix？**
以下是使用IBM Bluemix的一些令人信服的理由：

*   支持多种语言和平台
*   免费试用

    1. 简化的注册过程
    
    2. 不需要信用卡
    
    3. 30天试用期 - 配额2GB的运行时，支持20个服务，500个route
    
    4. 无限制地访问标准支持
    
    5. 没有生产使用限制
    
*   仅为每个使用的运行时和服务付费
*   快速设置 - 从而加快上市时间
*   持续交付新功能
*   与本地资源的安全集成
*   用例

    1. Web应用程序和移动后端
    
    2. API和内部集成
    
*   DevOps服务可部署在云上的SaaS，并支持持续交付：

    1. Web IDE
    
    2. SCM
    
    3. 敏捷规划
    
    4. 交货管道服务

--------------------------------------------------------------------------------

via: http://opensourceforu.com/2016/11/build-deploy-manage-custom-apps-ibm-bluemix/

作者：[MITESH_SONI][a]
译者：[Vic020](http//www.vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensourceforu.com/author/mitesh_soni/
[1]:http://opensourceforu.com/wp-content/uploads/2016/10/Figure-7-Naming-the-app.jpg
[2]:https://console.ng.bluemix.net/registration/
