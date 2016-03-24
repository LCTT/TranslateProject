微软开源了WCF框架
================================================================================
微软于今日（2015/5/20）宣布了针对 .NET Core 重大开源：WCF（Windows Communication Foundation）。

如[MSDN][1]中的描述:“WCF是一个构建面向服务应用的框架。使用WCF，你可以从一个服务终端给另一个发送异步消息。服务终端可以是托管在IIS中连续可用的服务的一部分，也可以是托管在某个程序上的服务。服务终端可以是请求服务端数据的客户端。消息可以是一个字符或者XML，也可以是复杂的二进制流。”

它的[代码放在GitHub][2]，“包含了Window桌面中完整WCF框架的一部分，它支持已经可用于构建Window Store上的WCF应用的库。这些主要是基于客户端，方便移动设备和中间层服务器使用WCF进行通信。”

更多的关于微软开源 WCF 的细节查看[dotNETFoundation.org blog][3]的公告。

WCF听上去有点像Linux中用于进程/服务之间的进程间通讯的D-BUS。

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=Microsoft-Open-Source-WCF

作者：[Michael Larabel][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.michaellarabel.com/
[1]:https://msdn.microsoft.com/en-us/library/ms731082%28v=vs.110%29.aspx
[2]:https://github.com/dotnet/wcf
[3]:http://www.dotnetfoundation.org/blog/wcf-is-open-source