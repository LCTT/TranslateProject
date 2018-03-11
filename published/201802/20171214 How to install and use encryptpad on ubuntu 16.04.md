如何在 Ubuntu 16.04 上安装和使用 Encryptpad
==============

EncryptPad 是一个自由开源软件，它通过简单方便的图形界面和命令行接口来查看和修改加密的文本，它使用 OpenPGP RFC 4880 文件格式。通过 EncryptPad，你可以很容易的加密或者解密文件。你能够像保存密码、信用卡信息等私人信息，并使用密码或者密钥文件来访问。

### 特性

- 支持 windows、Linux 和 Max OS。
- 可定制的密码生成器，可生成健壮的密码。
- 随机的密钥文件和密码生成器。
- 支持 GPG 和 EPD 文件格式。
- 能够通过 CURL 自动从远程远程仓库下载密钥。
- 密钥文件的路径能够存储在加密的文件中。如果这样做的话，你不需要每次打开文件都指定密钥文件。
- 提供只读模式来防止文件被修改。
- 可加密二进制文件，例如图片、视频、归档等。


在这份教程中，我们将学习如何在 Ubuntu 16.04 中安装和使用 EncryptPad。

### 环境要求

- 在系统上安装了 Ubuntu 16.04 桌面版本。
- 在系统上有 `sudo` 的权限的普通用户。

### 安装 EncryptPad 

在默认情况下，EncryPad 在 Ubuntu 16.04 的默认仓库是不存在的。你需要安装一个额外的仓库。你能够通过下面的命令来添加它 ：

```
sudo apt-add-repository ppa:nilaimogard/webupd8
```

下一步，用下面的命令来更新仓库：

```
sudo apt-get update -y
```

最后一步，通过下面命令安装 EncryptPad：

```
sudo apt-get install encryptpad encryptcli -y
```

当 EncryptPad 安装完成后，你可以在 Ubuntu 的 Dash 上找到它。

### 使用 EncryptPad 生成密钥和密码

现在，在 Ubunntu Dash 上输入 `encryptpad`，你能够在你的屏幕上看到下面的图片 ：

[![Ubuntu DeskTop][1]][2]

下一步，点击 EncryptPad 的图标。你能够看到 EncryptPad 的界面，它是一个简单的文本编辑器，带有顶部菜单栏。

[![EncryptPad screen][3]][4]

首先，你需要生成一个密钥文件和密码用于加密/解密任务。点击顶部菜单栏中的 “Encryption->Generate Key”，你会看见下面的界面：

[![Generate key][5]][6]

选择文件保存的路径，点击 “OK” 按钮，你将看到下面的界面：

[![select path][7]][8]

输入密钥文件的密码，点击 “OK” 按钮 ，你将看到下面的界面：

[![last step][9]][10]

点击 “yes” 按钮来完成该过程。

### 加密和解密文件

现在，密钥文件和密码都已经生成了。可以执行加密和解密操作了。在这个文件编辑器中打开一个文件文件，点击 “encryption” 图标 ，你会看见下面的界面：

[![Encry operation][11]][12]

提供需要加密的文件和指定输出的文件，提供密码和前面产生的密钥文件。点击 “Start” 按钮来开始加密的进程。当文件被成功的加密，会出现下面的界面：

[![Success Encrypt][13]][14]

文件已经被该密码和密钥文件加密了。

如果你想解密被加密后的文件，打开 EncryptPad ，点击 “File Encryption” ，选择 “Decryption” 操作，提供加密文件的位置和你要保存输出的解密文件的位置，然后提供密钥文件地址，点击 “Start” 按钮，它将要求你输入密码，输入你先前加密使用的密码，点击 “OK” 按钮开始解密过程。当该过程成功完成，你会看到 “File has been decrypted successfully” 的消息 。


[![decrypt ][16]][17]
[![][18]][18]
[![][13]]


**注意：**

如果你遗忘了你的密码或者丢失了密钥文件，就没有其他的方法可以打开你的加密信息了。对于 EncrypePad 所支持的格式是没有后门的。

--------------------------------------------------------------------------------
via: https://www.howtoforge.com/tutorial/how-to-install-and-use-encryptpad-on-ubuntu-1604/

作者：[Hitesh Jethva][a]
译者：[singledo](https://github.com/singledo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出


[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-dash.png
[2]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-dash.png
[3]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-dashboard.png
[4]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-dashboard.png
[5]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-generate-key.png
[6]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-generate-key.png
[7]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-generate-passphrase.png
[8]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-generate-passphrase.png
[9]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-use-key-file.png
[10]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-use-key-file.png
[11]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-start-encryption.png
[12]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-start-encryption.png
[13]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-file-encrypted-successfully.png
[14]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-file-encrypted-successfully.png
[15]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-decryption-page.png
[16]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-decryption-page.png
[17]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-decryption-passphrase.png
[18]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-decryption-passphrase.png
[19]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/Screenshot-of-encryptpad-decryption-successfully.png
[20]:https://www.howtoforge.com/images/how_to_install_and_use_encryptpad_on_ubuntu_1604/big/Screenshot-of-encryptpad-decryption-successfully.png