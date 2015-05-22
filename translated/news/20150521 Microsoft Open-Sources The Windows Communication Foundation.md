微软开源了WCF框架
================================================================================
微软今天宣布我们开源的针对.NET核心的WCF（Windows Communication Foundation）。

[MSDN][1]中说:“WCF是一个构建面向服务程序的框架。使用WCF，你可以从服务端给另一个发送异步消息。服务终端可以是托管在IIS中连续可用服务的一部分，也可以是托管在某个程序上的服务。终端可以是请求服务端数据的客户端。消息可以是一个字符或者XML，也可以是复杂的二进制流。”

它的[代码在GitHub][2]，“包含了Window桌面中完整WCF框架的一部分，它支持已经在Window Store中的WCF库。这些档案主要是基于客户端，方便移动设备和中间层服务器使用WCF进行通信。”

More details on Microsoft opening up the Windows Communication Foundation can be found via the announcement posted this morning to the [dotNETFoundation.[dotNETFoundation.org blog][3]中查看。

WCF听上去有点像Linux中进程/服务间通信的D-BUS。

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=Microsoft-Open-Source-WCF

作者：[Michael Larabel][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.michaellarabel.com/
[1]:https://msdn.microsoft.com/en-us/library/ms731082%28v=vs.110%29.aspx
[2]:https://github.com/dotnet/wcf
[3]:http://www.dotnetfoundation.org/blog/wcf-is-open-source