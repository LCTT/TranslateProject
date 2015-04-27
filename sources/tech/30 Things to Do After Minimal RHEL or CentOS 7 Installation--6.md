Translating by ictlyh
30 Things to Do After Minimal RHEL/CentOS 7 Installation--6
================================================================================
### 30. Password Protect GRUB ###

Password protect your boot loader so that you get an additional level of security right at the booting time. Also you get a protection layer of protection at physical level. Protect your Server by locking GRUB at boot to avoid any unauthorized access.

First make backup of two files, so that if anything goes bad, you have the option to revert back. Create a backup of ‘/etc/grub2/grub.cfg‘ as ‘/etc/grub2/grub.cfg.old‘.

    # cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.old

Also, Create a backup of ‘/etc/grub.d/10_linux‘ as ‘/etc/grub.d/10_linux.old‘.

    # cp /etc/grub.d/10_linux /etc/grub.d/10_linux.old

Now open ‘/etc/grub.d/10_linux‘ and add the below line at the end of the file.

    cat <<EOF
    set superusers=”tecmint”
    Password tecmint avi@123
    EOF

![Password Protect Grub](http://www.tecmint.com/wp-content/uploads/2015/04/Password-Protect-Grub.png)
Password Protect Grub

Notice in the above file, replace “tecmint” as username and “avi@123” as password with your username and password.

Now generate the new grub.cfg file by issuing following command.

    # grub2-mkconfig --output=/boot/grub2/grub.cfg

![Generate Grub File](http://www.tecmint.com/wp-content/uploads/2015/04/Generate-Grub-File.jpeg)
Generate Grub File

After creating new grub.cfg file, reboot the machine and press ‘e‘ to edit. You will find that it requires you to enter ‘valid credentials‘ in order to edit boot menu.

![Password Protected Boot Menu](http://www.tecmint.com/wp-content/uploads/2015/04/Edit-Boot-Menu.jpeg)
Password Protected Boot Menu

After entering login credentials, you will able to edit grub boot menu.

![Grub Menu File](http://www.tecmint.com/wp-content/uploads/2015/04/Grub-Menu-Edit.jpeg)
Grub Menu File

Also you can generate encrypted password in place of plain password as shown in the above step. First generate an encrypted password as suggested below.

    # grub2-mkpasswd-pbkdf2

    [Enter Normal password twice]

![Generate Encrypted Grub Password](http://www.tecmint.com/wp-content/uploads/2015/04/Generate-Encrypted-Grub-Password.jpeg)
Generate Encrypted Grub Password

Now open ‘/etc/grub.d/10_linux‘ file and add the below line at the end of the file.

    cat <<EOF
    set superusers=”tecmint”
    Password_pbkdf2 tecmint
    grub.pbkdf2.sha512**************************************************
    EOF

![Encrypted Grub Password](http://www.tecmint.com/wp-content/uploads/2015/04/Encrypted-Grub-Password.jpeg)
Encrypted Grub Password

Replace the password with the one generated on your system. Don’t forget to cross check the password.

Also note you need to generate grub.cfg in this case as well, as described above. Reboot and next time you press ‘e‘ to edit, you will be prompted for username and password.

We’ve tried to cover most of the necessary post-installation points of industry standard distributions RHEL 7 and CentOS 7. If you find that we’ve missed certain points or you need to extend this post with a new post-install things, you may share with us, we will include your point in this article by extending it.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/6/

作者：[vishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/