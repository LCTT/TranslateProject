对西部数据 My Passport Wireless 移动存储进行 Linux 魔改 
============================================================

虽然 WD My Passport Wireless 本身就是一个相当有用的设备，但它有一个轻量级但完整的 Linux 发行版提供支持的事实意味着其功能可以进一步扩展。例如，在设备上部署 [rclone][3]，这样你可以将存储在磁盘上的照片和 RAW 文件备份到任何支持的云存储服务中。

在开始之前，你需要将设备连接到 Wi-Fi 网络并启用 SSH（以便你可以通过 SSH 访问底层 Linux 系统）。要将 WD My Passport Wireless 连接到当前的 Wi-Fi 网络中，请为设备供电并连接到从常规 Linux 计算机创建的无线热点。打开浏览器，进入 [http://mypassport.local][1]，然后登录到设备的 web 界面。切换到 Wi-Fi 一栏，并连接到现有的本地 Wi-Fi 网络。然后切换到管理员部分并启用 SSH 访问。

 ![wd-mypassport-wireless-admin](https://scribblesandsnaps.files.wordpress.com/2017/02/wd-mypassport-wireless-admin.png?w=605) 

在你的 Linux 机器上，打开终端并使用 `ssh root@mypassport.local` 连接到设备。

使用下面的命令部署 rclone：

```
curl -O http://downloads.rclone.org/rclone-current-linux-arm.zip
unzip rclone-current-linux-arm.zip
cd rclone-*-linux-arm
cp rclone /usr/sbin/
chown root:root /usr/sbin/rclone
chmod 755 /usr/sbin/rclone
mkdir -p /usr/local/share/man/man1
sudo cp rclone.1 /usr/local/share/man/man1/
sudo mandb
```

完成后运行 `rclone config` 命令。由于在无外接显示器的机器上配置 rclone，请按照[远程设置][4]页面上的说明进行操作。你可以在 [Linux Photography][5] 这本书中找到有关配置和使用 rclone 的详细信息。

你也可以将 WD My Passport Wireless 用到其他实际用途。由于设备附带了 Python，因此你可以在设备上运行脚本和基于 Python 的 web 应用程序。例如，你可以部署简单的 [What’s in My Bag][6] 程序来跟踪你的照相设备。

```
curl -LOk https://github.com/dmpop/wimb/archive/master.zip
unzip master.zip
mv wimb-master/ wimb
cd wimb
curl -LOk https://github.com/bottlepy/bottle/raw/master/bottle.py
```

运行 `./wimb.py` 启动应用，并在浏览器中打开 [http://mypassport:8080/wimb][2] 访问并使用程序。

--------------------------------------------------------------------------------

via: https://scribblesandsnaps.com/2017/02/10/wd-my-passport-wireless-linux-hacks/

作者：[Dmitri Popov][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://scribblesandsnaps.com/author/dmpop/
[1]:http://mypassport.local/
[2]:http://mypassport:8080/wimb
[3]:http://rclone.org/
[4]:http://rclone.org/remote_setup/
[5]:https://gumroad.com/l/linux-photography
[6]:https://github.com/dmpop/wimb
