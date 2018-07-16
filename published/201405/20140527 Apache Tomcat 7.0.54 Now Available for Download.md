Apache Tomcat 7.0.54现已可供下载
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Apache-Tomcat-7-0-54-Now-Available-for-Download-443862-2.jpg)

**Apache Tomcat 7.0.54，一个在JCP规范之下开发的Java Servlet和JSP技术的开源软件实现，现已可供下载。**

自上一个Apache Tomcat版本的发布已经有段时日了， 但这仅仅意味着开发者们有更多的时间来对软件作出修补和更改。这是一个源码软件包，所以普通用户并不一定真的需要它。

通过更新日志得知，定制的UTF-8解码器已经被修复，在AprLifecycleListener的FIPS模式中加入了更多的管理选项，如果一个应用从已销毁的会话中调用session.invalidate()而导致的无限循环已经可被避免，在添加一个Mbean通知监听器时，移除一个Mbean监听器现在将还原所有执行的操作，以及关于完成部署和其执行时间的信息已被添加到日志文件之中。

另外，一些理论上可能会发生内存泄漏的位置上已经做了修补，当使用JAASMemoryLoginModule时的用户认证已被修复，在反斜杠处理时的回溯已得到纠正。

在源代码归档的官方更新日志中可以找到一份完整的变更，修复以及新特性的列表。

### 下载 Apache Tomcat 7.0.54 (violetagg): ###

- [tar.gz (6.0.39 Stable)][1][binary] [6.70 MB]
- [tar.gz (6.0.39 Stable)][2][sources] [3.40 MB]
- [tar.gz (7.0.52 Development)][3][binary] [8 MB]
- [tar.gz (7.0.52 Development)][4][sources] [4.40 MB]
- [zip (8.0.3 Beta Development)][5][binary] [8.10 MB]
- [tar.gz (8.0.3 Beta Development)][6][sources] [4.40 MB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Apache-Tomcat-7-0-54-Now-Available-for-Download-443862.shtml

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-6/v6.0.39/bin/apache-tomcat-6.0.39.tar.gz
[2]:http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-6/v6.0.39/src/apache-tomcat-6.0.39-src.tar.gz
[3]:http://www.apache.org/dist/tomcat/tomcat-7/v7.0.52/bin/apache-tomcat-7.0.52.tar.gz
[4]:http://www.apache.org/dist/tomcat/tomcat-7/v7.0.52/src/apache-tomcat-7.0.52-src.tar.gz
[5]:http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-8/v8.0.3/bin/apache-tomcat-8.0.3.tar.gz
[6]:http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-8/v8.0.3/src/apache-tomcat-8.0.3-src.tar.gz
