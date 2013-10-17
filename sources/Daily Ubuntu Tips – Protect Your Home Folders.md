Daily Ubuntu Tips – Protect Your Home Folders
================================================================================
Few days ago we [showed][1] you how to change your home folder in Ubuntu so that only authorized users may see your content. We said that the adduser utility creates user’s directories in such a way that make them world readable. This means that any all users who have accounts on the machine will be able to browse and view content in your home directory by default,

To read our previous post on this, [please click here][2]. In that post, we also showed you which permission settings to apply to your home folder to that it isn’t browseable by anyone.

In this blog post, you can accomplish the same by encrypting your home folder. When encrypt your home folder, unauthorized users will also not be able to browse or access your home directories.

Encrypting your home folder may not be suitable for everyone in every environment so make sure you’re absolutely certain that you want to use this feature in Ubuntu before actually using it.

To get started encrypting your home directory, logon to Ubuntu and run the commands below.

    sudo apt-get install ecryptfs-utils

Since your can’t be logged-in while encrypting your exiting home folder, you must create a temporary account and login with it. Then run the commands below to encrypt your home folder. Replace USERNAME with your account name.

    sudo ecryptfs-migrate-home -u USERNAME

When you login as the temporary user, run the **su** command plus your username to run commands as you, since your account has root / admin rights. You’ll be prompted for your password.

    su USERNAME

Replace USERNAME with the username of the account that has root / admin rights.

After that, encrypt your home folder by running the **ecryptfs-migrate-home –u USERNAME** command.

To create a user in Ubuntu, run the commands below.

    sudo adduser USERNAME

To delete user in Ubuntu, run the commands below.

    sudo deluser USERNAME

When you login, you’ll see the screen shot below giving you more information about your encrypted home folder.

![](http://www.liberiangeek.net/wp-content/uploads/2013/09/encrypthomedirectory.png)

To create future users with encrypted home directory, run the commands below.

    adduser –encrypt-home USERNAME

Enjoy!
--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tips-protect-home-folders/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.liberiangeek.net/2013/09/daily-ubuntu-tipsprevent-users-browsing-folders/
[2]:http://www.liberiangeek.net/2013/09/daily-ubuntu-tipsprevent-users-browsing-folders/