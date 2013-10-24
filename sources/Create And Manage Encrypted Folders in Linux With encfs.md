Create And Manage Encrypted Folders in Linux With encfs
================================================================================
here are times when you want certain information on your computer protected from prying eyes. One way to protect your information is to encrypt your home directory. However, that does not protect your information when you are logged on to your computer. I've shown in the past how you can [use Cryptkeeper to create an encrypted folder on your system][1]. Cryptkeeper is a graphical front end to **encfs**. encfs allows you to create an encrypted folder and then mount it as a user filesystem using [FUSE][2]. In this tutorial I'll show how to use encfs from the command line to create and manage an encrypted folder on Linux.

![](http://tuxtweaks.com/wp-content/uploads/2013/10/encfs.png)

### Install encfs ###

If you are using Ubuntu or one of its derivatives like Linux Mint, you should be able to find encfs in your software repositories. In this case you can install it with

    sudo apt-get install encfs

### Create an Encrypted Folder with encfs ###

Once encfs is installed on your system, you can create an encrypted folder in your home directory. In this example, I'm going to create an encrypted folder called tuxtweaks. This will be done from a terminal window. You will need to provide full path names when creating a new folder. You can use standard shortcuts though, as I will show.

    encfs ~/.tuxtweaks ~/tuxtweaks

This will create two folders. The first one, .**tuxtweaks**, will contain the encrypted information. The second one, tuxtweaks, is where the decrypted version will be mounted when you want to access your information. If neither of these folders exist already, you will be prompted asking if you want to create them. Enter '**y**' at the prompts to allow the folders to be created. You should then see something like the following:

    Creating new encrypted volume.
    Please choose from one of the following options:
     enter "x" for expert configuration mode,
     enter "p" for pre-configured paranoia mode,
     anything else, or an empty line will select standard mode.

If you want the strongest encryption, enter '**p**' at the prompt. Otherwise, just hit **[Enter]** and your new encrypted folder will be created with the standard options.

After that you'll see several messages listing the parameters of your new encrypted volume along with some warnings, and then a prompt to create a password for encryption. Make sure to use a password you will remember because there is no password recovery mechanism. After entering and verifying your password, the new folder will be created and mounted, ready to use.

### Using Your Encrypted Folder ###

With your new encrypted folder mounted, you can use it just like any other folder on your system with the exception that hard links will not work if you set it up in paranoia mode. I expect this won't be an issue for most users. Let's go ahead and create a simple text file in the new folder to test it out.

    echo "GNU/Linux is my favorite computer operating system." >~/tuxtweaks/test.txt

Using the terminal or the file manager, you can see that you now have a new file called **test.txt** in the **tuxtweaks** folder. Upon opening this file you can see that it is a perfectly readable text file. Now navigate to your **~/.tuxtweaks** folder. This is the encrypted version of your folder. You can see that the file names don't match and if you try to view the contents of the files you'll find that they are scrambled.

### Unmounting an encfs Encrypted Folder ###

Once you are done accessing or creating data in your encrypted folder, it's best to unmount it so that your information is safely hidden away. encfs doesn't have its own command to do this. Since it created a user file system it takes advantage of the FUSE packages to handle unmounting. We'll use the fusermount command to unmount our encrypted folder.

    fusermount -u ~/tuxtweaks

Navigating your home directory you can see that the tuxtweaks directory is still there. If you enter that folder though you'll find that it is empty.

### Mount an Encrypted Folder with encfs ###

The next time you want to access your encrypted data, you'll need to mount it again to decrypt it. You can just use the same command you used to create the folder in the first place.

    encfs ~/.tuxtweaks ~/tuxtweaks

### Uses ###

I find that using **encfs** encrypted folders is a handy way to securely store financial information such as tax returns as well as for storing lists of log-in credentials. This way I only need to remember the password for my encrypted folder, then I can access my list of other log-in ID's and passwords.

What will you use encfs for? Let me know in the comments.

--------------------------------------------------------------------------------

via: http://tuxtweaks.com/2013/10/encrypted-folders-linux-encfs/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://tuxtweaks.com/2009/03/create-an-encrypted-folder-in-ubuntu-with-cryptkeeper/
[2]:http://fuse.sourceforge.net/