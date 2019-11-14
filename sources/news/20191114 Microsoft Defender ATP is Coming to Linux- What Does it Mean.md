[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Microsoft Defender ATP is Coming to Linux! What Does it Mean?)
[#]: via: (https://itsfoss.com/microsoft-defender-atp-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Microsoft Defender ATP is Coming to Linux! What Does it Mean?
======

_**Microsoft has announced that it is bringing its enterprise security product Microsoft Defender Advanced Threat Protection (ATP) to Linux in 2020.**_

Microsoft’s annual developer conference Microsoft Ignite has just been concluded and there are a few important announcements that relate to Linux. You probably already read about [Microsoft bringing its Edge web browser to Linux][1]. The next big news is that Microsoft is bringing Microsoft Defender ATP to Linux.

Let’s get into some details what it is and why Microsoft is bothering itself to develop something for Linux.

### What is Microsoft Defender ATP?

If you have used Windows in past few years, you must have come across Windows Defender. It is basically an antivirus product by Microsoft that brings some level of security by detecting viruses and malware.

Microsoft improved this functionality for its enterprise users by introducing Windows Defender ATP (Advanced Threat Protection). Defender ATP works on behavioral analysis. It collects usage data and store them on the same system. However, when it notices an inconsistent behavior, it sends the data to Azure service (Microsoft’s cloud service). In here, it will have a collection of behavioral data and the anomalies.

For example, if you got a PDF attachment in the email, you open it and it opened a command prompt, Defender ATP will notice this abnormal behavior. I recommend reading this article to [learn more about the difference between Defender and Defender ATP][2].

Now this is entirely an enterprise product. In a big enterprise with hundreds or thousands of end points (computers), Defender ATP provides a good layer of protection. The IT admins will have a centralized view of the end-points on their Azure instance and the threats can be analyzed and actions can be taken accordingly.

### Microsoft Defender ATP for Linux (and Mac)

Normally, enterprises have Windows on their computer but Mac and Linux are also getting popular specially among the developers. In an environment where there is a mix of Mac and Linux machines among Windows, Defender ATP has to extends its services to these operating systems so that it can provide a holistic defense to all the devices on the network.

Keeping that in mind, Microsoft first [changed Windows Defender ATP to Microsoft Defender ATP in March 201][3][9][3], signaling that the product is not limited to just Windows operating system.

Soon after it [announced Defender ATP for Mac][4].

And now to cover all the major operating systems in an enterprise environment, [Microsoft is bringing Defender ATP to Linux][5] in 2020.

### How Microsoft Defender ATP on Linux impacts you, a Linux user?

Since Defender ATP is an enterprise product, I don’t think you need to be bothered with this. Organizations need to secure their end-points against threats so it makes sense that Microsoft is improving its product to cover Linux as well.

For normal Linux users like you and me, it won’t make any difference. I am not going to use it ‘secure’ my three Linux systems and pay Microsoft for that.

Please feel free to share your opinion on Microsoft bringing Defender ATP to Linux in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/microsoft-defender-atp-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/microsoft-edge-linux/
[2]: https://www.concurrency.com/blog/november-2017/windows-defender-vs-windows-defender-atp
[3]: https://www.theregister.co.uk/2019/03/21/microsoft_defender_atp/
[4]: https://techcommunity.microsoft.com/t5/Microsoft-Defender-ATP/Announcing-Microsoft-Defender-ATP-for-Mac/ba-p/378010
[5]: https://www.zdnet.com/article/microsoft-defender-atp-is-coming-to-linux-in-2020/
