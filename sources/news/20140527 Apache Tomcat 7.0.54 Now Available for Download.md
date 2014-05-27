Apache Tomcat 7.0.54 Now Available for Download
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Apache-Tomcat-7-0-54-Now-Available-for-Download-443862-2.jpg)

**Apache Tomcat 7.0.54, an open source software implementation of the Java Servlet and JavaServer Pages technologies, developed under the Java Community Process, is now available for download.**

It's been a while since the latest Apache Tomcat release, but this only means that the devs had more time to get more fixes and changes into the software. This is a source package, so regular users don't really need it.

According to the changelog, the custom UTF-8 decoder has been fixed, more options have been added for managing the FIPS mode in the AprLifecycleListener, an infinite loop has been avoided if an application calls session.invalidate() from the destroyed session, removing an MBean notification listener now reverts all the operations performed when adding an MBean notification listener, and information about finished deployment and its execution time has been added to the log files.

Also, a few additional locations where, theoretically, a memory leak could occur have been patched, the authentication of users when using the JAASMemoryLoginModule has been fixed, and a regression in the handling of back-slash has been corrected.

A complete list of changes, fixes, and new features can be found in the official changelog, inside the source archive. 

### Download Apache Tomcat 7.0.54 (violetagg): ###

- [tar.gz (6.0.39 Stable)][1][binary] [6.70 MB]
- [tar.gz (6.0.39 Stable)][2][sources] [3.40 MB]
- [tar.gz (7.0.52 Development)][3][binary] [8 MB]
- [tar.gz (7.0.52 Development)][4][sources] [4.40 MB]
- [zip (8.0.3 Beta Development)][5][binary] [8.10 MB]
- [tar.gz (8.0.3 Beta Development)][6][sources] [4.40 MB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Apache-Tomcat-7-0-54-Now-Available-for-Download-443862.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-6/v6.0.39/bin/apache-tomcat-6.0.39.tar.gz
[2]:http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-6/v6.0.39/src/apache-tomcat-6.0.39-src.tar.gz
[3]:http://www.apache.org/dist/tomcat/tomcat-7/v7.0.52/bin/apache-tomcat-7.0.52.tar.gz
[4]:http://www.apache.org/dist/tomcat/tomcat-7/v7.0.52/src/apache-tomcat-7.0.52-src.tar.gz
[5]:http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-8/v8.0.3/bin/apache-tomcat-8.0.3.tar.gz
[6]:http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-8/v8.0.3/src/apache-tomcat-8.0.3-src.tar.gz