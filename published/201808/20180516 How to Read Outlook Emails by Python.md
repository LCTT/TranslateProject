如何用 Python 读取 Outlook 中的电子邮件
======

![](https://process.filestackapi.com/cache=expiry:max/resize=width:700/compress/OVArLzhmRzOEQZsvGavF)

从事电子邮件营销，<ruby>准入<rt>opt-in</rt></ruby>邮箱列表是必不可少的。你可能已经有了准入列表，同时还使用电子邮件客户端软件。如果你能从电子邮件客户端中导出准入列表，那这份列表想必是极好的。

我使用一些代码来将 outlook 配置中的所有邮件写入一个临时文件中，现在让我来尝试解释一下这些代码。

首先你需要导入 win32com.client，为此你需要安装 pywin32：

```
pip install pywin32
```

我们需要通过 MAPI 协议连接 Outlok：

```
outlook = win32com.client.Dispatch("Outlook.Application").GetNamespace("MAPI")
```

然后从 outlook 配置中获取所有的账户：

```
accounts= win32com.client.Dispatch("Outlook.Application").Session.Accounts;
```

在然后需要从名为 emaileri_al 的收件箱中获取邮件：

```
def emailleri_al(folder):
    messages = folder.Items
    a=len(messages)
    if a>0:
        for message2 in messages:
             try:
                sender = message2.SenderEmailAddress
                if sender != "":
                    print(sender, file=f)
             except:
                print("Ben hatayım")
                print(account.DeliveryStore.DisplayName)
                pass

             try:
                message2.Save
                message2.Close(0)
             except:
                 pass
```

你需要进入所有账户的所有收件箱中获取电子邮件：

```
for account in accounts:
    global inbox
    inbox = outlook.Folders(account.DeliveryStore.DisplayName)
    print("****Account Name**********************************",file=f)
    print(account.DisplayName,file=f)
    print(account.DisplayName)
    print("***************************************************",file=f)
    folders = inbox.Folders

    for folder in folders:
        print("****Folder Name**********************************", file=f)
        print(folder, file=f)
        print("*************************************************", file=f)
        emailleri_al(folder)
        a = len(folder.folders)

        if a>0 :
            global z
            z = outlook.Folders(account.DeliveryStore.DisplayName).Folders(folder.name)
            x = z.Folders
            for y in x:
                emailleri_al(y)
                print("****Folder Name**********************************", file=f)
                print("..."+y.name,file=f)
                print("*************************************************", file=
```

下面是完整的代码：

```
import win32com.client
import win32com
import os
import sys

f = open("testfile.txt","w+")

outlook = win32com.client.Dispatch("Outlook.Application").GetNamespace("MAPI")
accounts= win32com.client.Dispatch("Outlook.Application").Session.Accounts;

def emailleri_al(folder):
    messages = folder.Items
    a=len(messages)
    if a>0:
        for message2 in messages:
             try:
                sender = message2.SenderEmailAddress
                if sender != "":
                    print(sender, file=f)
             except:
                print("Error")
                print(account.DeliveryStore.DisplayName)
                pass

             try:
                message2.Save
                message2.Close(0)
             except:
                 pass



for account in accounts:
    global inbox
    inbox = outlook.Folders(account.DeliveryStore.DisplayName)
    print("****Account Name**********************************",file=f)
    print(account.DisplayName,file=f)
    print(account.DisplayName)
    print("***************************************************",file=f)
    folders = inbox.Folders

    for folder in folders:
        print("****Folder Name**********************************", file=f)
        print(folder, file=f)
        print("*************************************************", file=f)
        emailleri_al(folder)
        a = len(folder.folders)

        if a>0 :
            global z
            z = outlook.Folders(account.DeliveryStore.DisplayName).Folders(folder.name)
            x = z.Folders
            for y in x:
                emailleri_al(y)
                print("****Folder Name**********************************", file=f)
                print("..."+y.name,file=f)
                print("*************************************************", file=f)



print("Finished Succesfully")
```
--------------------------------------------------------------------------------

via: https://www.codementor.io/aliacetrefli/how-to-read-outlook-emails-by-python-jkp2ksk95

作者：[A.A. Cetrefli][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.codementor.io/aliacetrefli
