translating---geekpi

WD My Passport Wireless Linux Hacks
============================================================

While WD My Passport Wireless is a rather useful device in its own right, the fact that it powered by a lightweight yet complete Linux distribution means that its capabilities can be extended even further. Deploy, for example, [rclone][3] on the device, and you can back up the photos and raw files stored on the disk to any supported cloud storage service.

Before you can do this, though, you need to connect the device to a Wi-Fi network and enable SSH (so that you can access the underlying Linux system via SSH). To connect the WD My Passport Wireless to you current Wi-Fi network, power the device and connect to the wireless hotspot it creates from your regular Linux machine. Open a browser, point it to _[http://mypassport.local][1]_, and log in to the device’s web interface. Switch to the Wi-Fi section, and connect to the existing your local Wi-Fi network. Switch then to the Admin section and enable SSH access.

 ![wd-mypassport-wireless-admin](https://scribblesandsnaps.files.wordpress.com/2017/02/wd-mypassport-wireless-admin.png?w=605) 

On your Linux machine, open the terminal and connect to the device using the `ssh root@mypassport.local` command.

Deploying rclone then is a matter of running the following commands:

| 123456789 | `curl -O http:``//downloads``.rclone.org``/rclone-current-linux-arm``.zip``unzip rclone-current-linux-arm.zip``cd` `rclone-*-linux-arm``cp` `rclone` `/usr/sbin/``chown` `root:root` `/usr/sbin/rclone``chmod` `755` `/usr/sbin/rclone``mkdir` `-p` `/usr/local/share/man/man1``sudo` `cp` `rclone.1` `/usr/local/share/man/man1/``sudo` `mandb` |

Once you’ve done that, run the `rclone config` command. Since you are configuring rclone on a headless machine, follow the instructions on the [Remote Setup][4] page. You’ll find detailed information on configuring and using rclone in the [Linux Photography][5] book.

You can put the WD My Passport Wireless to other practical uses, too. Since the device comes with Python, you can run scripts and Python-based web applications on the device. For example, you can deploy the simple [What’s in My Bag][6] application to track your photographic gear.

| 12345 | `curl -LOk https:``//github``.com``/dmpop/wimb/archive/master``.zip``unzip master.zip``mv` `wimb-master/ wimb``cd` `wimb``curl -LOk https:``//github``.com``/bottlepy/bottle/raw/master/bottle``.py` |

Run `./wimb.py` to start the app and point the browser to _[http://mypassport:8080/wimb][2]_ to access and use the application.

--------------------------------------------------------------------------------

via: https://scribblesandsnaps.com/2017/02/10/wd-my-passport-wireless-linux-hacks/

作者：[Dmitri Popov ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://scribblesandsnaps.com/author/dmpop/
[1]:http://mypassport.local/
[2]:http://mypassport:8080/wimb
[3]:http://rclone.org/
[4]:http://rclone.org/remote_setup/
[5]:https://gumroad.com/l/linux-photography
[6]:https://github.com/dmpop/wimb
