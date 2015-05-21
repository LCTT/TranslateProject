Microsoft Open-Sources The Windows Communication Foundation
================================================================================
Microsoft has today announced they've open-sourced the important WCF (Windows Communication Foundation) code that now targets .NET Core.

As described by [MSDN][1], "Windows Communication Foundation (WCF) is a framework for building service-oriented applications. Using WCF, you can send data as asynchronous messages from one service endpoint to another. A service endpoint can be part of a continuously available service hosted by IIS, or it can be a service hosted in an application. An endpoint can be a client of a service that requests data from a service endpoint. The messages can be as simple as a single character or word sent as XML, or as complex as a stream of binary data." 

The [code on GitHub][2], "contains a subset of the full Windows Communication Foundation product available on the Windows desktop, and it supports the library profiles already available for building WCF apps for the Windows Store. These profiles are primarily client-based, making them suited for mobile devices or on mid-tier servers to communicate with existing WCF services." 

More details on Microsoft opening up the Windows Communication Foundation can be found via the announcement posted this morning to the [dotNETFoundation.org blog][3]. 

Windows Communication Foundation sounds a bit like D-Bus on Linux for inter-process communication between programs/services.

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=news_item&px=Microsoft-Open-Source-WCF

作者：[Michael Larabel][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.michaellarabel.com/
[1]:https://msdn.microsoft.com/en-us/library/ms731082%28v=vs.110%29.aspx
[2]:https://github.com/dotnet/wcf
[3]:http://www.dotnetfoundation.org/blog/wcf-is-open-source