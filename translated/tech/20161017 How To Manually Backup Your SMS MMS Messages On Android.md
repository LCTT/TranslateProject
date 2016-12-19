
怎么在 Android 上手动备份你的短信/彩信？
============================================================

 ![Android backup sms](https://iwf1.com/wordpress/wp-content/uploads/2016/10/Android-backup-sms-mms.jpg)

如果你要换一部手机或升级你的系统，备份你的数据就变得至关重要。


我们重要数据的存储位置之一就是我们的短信/彩信，因为其感情及实用价值，备份它们是很有用的。

然而，不像照片，视频或音频文件可以相对容易地传输和备份，备份短信/彩信比较复杂，通常需要使用第三方 app 或服务

### 为什么要手动备份

尽管现在有很多不同的 app 能够帮你备份短信/彩信，你可能因为以下原因，考虑自己动手备份它们：

1. app  **可能不会** 在所有的设备和安卓版本上都有效。
2. app 可能把你的备份数据上传到云端， **破坏你的数据安全** 。
3. 通过手动备份，你可以完全掌握你的数据通过哪里，走向哪里，备份过程中减少被间谍软件窥视的危险。
4. 手动备份相比其他方法 **省时， 省力，更直接**。

### 怎么手动备份短信/彩信？

要手动备份你的短信/彩信，你需要在你的电脑上安装一个叫做  [adb][1] 的安卓工具。

现在，需要重点知道的是，安卓把短信/彩信存储在一个通常叫做 **mmssms.db.**_的数据库里。

因为在不同设备上这个数据库的位置可能不相同，而且，其他短信 app 会创建它们自己的数据库，比如 GO SMS 会创建 gommssms.db 数据库， 所以你需要做的第一件事是搜索这些数据库。

打开命令行工具（我使用了 Linux Terminal， 你也可以使用 Windows CMD 或 PowerShell ）并运行以下命令：

注意： 以下是完成该任务的一系列命令，再后面是每个命令用途的解释。

`
adb root

adb shell

find / -name "*mmssms*"

exit

adb pull /PATH/TO/mmssms.db /PATH/TO/DESTINATION/FOLDER

`

#### 解释：

一开始我们使用 adb root 命令来以 root 模式启动 adb － 这样我们就有了读取系统保护文件的权限。

“adb shell” 用来进入设备的 shell。

然后， “find” 命令用来搜索数据库。（在我的例子中，数据库在/data/data/com.android.providers.telephony/databases/mmssms.db)

* 建议：如果你的终端打印了太多无关的结果，可以试试使用 “find” 的参数。

[
 ![Android SMS&MMS databases](http://iwf1.com/wordpress/wp-content/uploads/2016/10/Android-SMSMMS-databases-730x726.jpg) 
][2]

安卓短信/彩信数据库

然后我们使用 exit 命令回退到我们的本地系统目录。

最后， adb pull 把数据库文件复制到我们电脑的一个文件夹里。

现在，当你想要还原短信/彩信时，不管是还原到新的设备还是新的系统版本， 只要再次搜索新系统短信/彩信位置，并用我们备份的数据库替换它即可。

使用 adb push 来替换它，例如：adb push ~/Downloads/mmssms.db /data/data/com.android.providers.telephony/databases/mmssms.db


--------------------------------------------------------------------------------

via: https://iwf1.com/how-to-manually-backup-your-sms-mms-messages-on-android/

作者：[Liron ][a]
译者：[willcoderwang](http://wangzk.win)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://iwf1.com/tag/android
[1]:http://developer.android.com/tools/help/adb.html
[2]:http://iwf1.com/wordpress/wp-content/uploads/2016/10/Android-SMSMMS-databases.jpg
