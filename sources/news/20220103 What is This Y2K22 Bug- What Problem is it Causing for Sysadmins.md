[#]: subject: "What is This Y2K22 Bug? What Problem is it Causing for Sysadmins?"
[#]: via: "https://news.itsfoss.com/y2k22-bug/"
[#]: author: "Rafael Ulloa https://news.itsfoss.com/author/rafael/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is This Y2K22 Bug? What Problem is it Causing for Sysadmins?
======

The turn of the new year has triggered errors in Microsoft Exchange mail servers, causing thousands, possibly millions, of emails around the world to not get sent and staying stuck on email transport queues, in some cases even causing entire servers to crash.

The server administration community has dubbed this bug “Y2K22” due to its similarity to the infamous Y2K bug, a date-related bug which was feared to cause many computer systems and potentially the world economy itself to collapse at the turn of this century.

### What exactly is this Y2K22 bug?

Microsoft Exchange 2016 and 2019 servers have an integrated malware-scanning engine called FIP-FS. This engine uses a signature file which stores dates in a 32-bit integer format. The largest possible number that can be stored in 32 bits is 2147483647.

Things were fine for the dates in the year 2021 because it was stamped as 211231XXXX (for 31st December). In case you are still wondering, it is in YYMMDDhhmm format.

However, with the turn of the new year, January 1st, 2022, it is converted to 2201010001. When trying to be formatted in 32 bits which, as you can see, is larger than the maximum number allowed. This would cause date/time validations on the server software to fail, thus ending up with emails not being sent and piling up on servers.

![Image credit][1]

### What can be done about it if you manage Exchange servers?

One quick fix that was discovered by Exchange administrators was to simply disable FIP-FS, though this is highly discouraged, since it obviously leaves servers vulnerable and open to attacks, unless the servers have another external antivirus software running.

Fortunately, [Microsoft has already caught wind of the issue and has provided a fix][2]. This fix, however, is not an automatic update and does require some action from its customers. In a nutshell, Microsoft has provided a script file to be executed from Microsoft PowerShell. This script must be executed on _each and every_ Exchange server. Microsoft has also provided instructions on performing the update manually, as it is not unusual for servers to have PowerShell disabled as a security measure.

Microsoft has stated that this is only a short-term fix which sets the date on the signature file as 2112330001 (December 33rd, 2021), which is supported and lets the server continue to operate normally, despite it not being a real date, while Microsoft develops a longer-term solution.

If you manage a Microsoft Exchange 2016 or 2019 server and have been affected by the bug, you can find Microsoft’s officially-provided solution [here][3].

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/y2k22-bug/

作者：[Rafael Ulloa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rafael/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ5OSIgd2lkdGg9IjY1MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[2]: https://www.theverge.com/2022/1/2/22863950/microsoft-exchange-y2k22-bug
[3]: https://techcommunity.microsoft.com/t5/exchange-team-blog/email-stuck-in-exchange-on-premises-transport-queues/ba-p/3049447
