Translating by GOLinux!
Fix Various Update Errors In Ubuntu 14.04
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Fix_Ubuntu_Update_Error.jpeg)

Who hasn’t come across an error while doing an update in Ubuntu? Update errors are common and plenty in Ubuntu and other Linux distributions based on Ubuntu. These errors occur for various reasons and can be fixed easily. In this article, we shall see various types of frequently occurring update errors in Ubuntu and how to fix them.

### Problem With MergeList ###

When you run update in terminal, you may encounter an error “[problem with MergeList][1]” like below:

> E:Encountered a section with no Package: header,
> 
> E:Problem with MergeList /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_precise_universe_binary-i386_Packages,
> 
> E:The package lists or status file could not be parsed or opened.’

To fix this error, use the following commands:

    sudo rm -r /var/lib/apt/lists/*
    sudo apt-get clean && sudo apt-get update

### Failed to download repository information -1 ###

There are actually two types of [failed to download repository information errors][2]. If your error read like this:

> W:Failed to fetch bzip2:/var/lib/apt/lists/partial/in.archive.ubuntu.com_ubuntu_dists_oneiric_restricted_binary-i386_Packages Hash Sum mismatch,
> 
> W:Failed to fetch bzip2:/var/lib/apt/lists/partial/in.archive.ubuntu.com_ubuntu_dists_oneiric_multiverse_binary-i386_Packages Hash Sum mismatch,
> 
> E:Some index files failed to download. They have been ignored, or old ones used instead

Then you can use the following commands to fix it:

    sudo rm -rf /var/lib/apt/lists/*
    sudo apt-get update

### Failed to download repository information -2 ###

Th other type of failed to download repository information error is because of outdated PPA. Usually, when you run Update Manager and see an error like this:

![](Th other type of failed to download repository information error is because of outdated PPA. Usually, when you run Update Manager and see an error like this:)

You can run sudo apt-get update to see what PPAs are failing. And you can remove it from the sources list. You can follow this screenshot guide to [fix failed to download repository information error][3].

### Failed to download package files error ###

A similar error is [failed to download package files error][4] like this:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Ubuntu_Update_error.jpeg)

This can be easily fixed by changing the software sources to Main server. Go to Software & Updates and in there changed the download server to Main server:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Change_server_Ubuntu.jpeg)

### Partial upgrade error ###

Running updates in terminal may throw this [partial upgrade error][5]:

> Not all updates can be installed
> 
> Run a partial upgrade, to install as many updates as possible

Run the following command in terminal to fix this error:

    sudo apt-get install -f

### error while loading shared libraries ###

This is more of an installation error than update error. If you try to install a program from source code, you may encounter this error:

> error while loading shared libraries:
> 
> cannot open shared object file: No such file or directory

This error can be fixed by running the following command in terminal:

    sudo /sbin/ldconfig -v

You can find more details on this [error while loading shared libraries][6].

### Could not get lock /var/cache/apt/archives/lock ###

This error happens when another program is using APT. Suppose you are installing some thing in Ubuntu Software Center and trying to run apt in terminal.

> E: Could not get lock /var/cache/apt/archives/lock – open (11: Resource temporarily unavailable)
> 
> E: Unable to lock directory /var/cache/apt/archives/

Normally, this should be fine if you close all other programs using apt but if the problem persists, use the following command:

    sudo rm /var/lib/apt/lists/lock

If the above command doesn’t work, try this command:

    sudo killall apt-get

More details about this error can be found [here][7].

### GPG error: The following signatures couldn’t be verified ###

Adding a PPA may result in the following [GPG error: The following signatures couldn’t be verified][8] when you try to run an update in terminal:

> W: GPG error: http://repo.mate-desktop.org saucy InRelease: The following signatures couldn’t be verified because the public key is not available: NO_PUBKEY 68980A0EA10B4DE8

All we need to do is to fetch this public key in the system. Get the key number from the message. In the above message, the key is 68980A0EA10B4DE8. This key can be used in the following manner:

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68980A0EA10B4DE8

Once the key has been added, run an update again and it will be fine.

### BADSIG error ###

Another signature related Ubuntu update error is [BADSIG error][9] which looks something like this:

> W: A error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://extras.ubuntu.com precise Release: The following signatures were invalid: BADSIG 16126D3A3E5C1192 Ubuntu Extras Archive Automatic Signing Key
> 
> W: GPG error: http://ppa.launchpad.net precise Release:
> 
> The following signatures were invalid: BADSIG 4C1CBC1B69B0E2F4 Launchpad PPA for Jonathan French W: Failed to fetch http://extras.ubuntu.com/ubuntu/dists/precise/Release

To fix this BADSIG error, use the following commands in terminal:

    sudo apt-get clean
    cd /var/lib/apt
    sudo mv lists oldlist
    sudo mkdir -p lists/partial
    sudo apt-get clean
    sudo apt-get update

That compiles the list of frequent **Ubuntu update errors** you may encounter. I hope this helps you to get rid of these errors. Have you encountered any other update error in Ubuntu as well? Do mention it in comments and I’ll try to do a quick tutorial on it.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-update-errors-ubuntu-1404/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/how-to-fix-problem-with-mergelist/
[2]:http://itsfoss.com/solve-ubuntu-error-failed-to-download-repository-information-check-your-internet-connection/
[3]:http://itsfoss.com/failed-to-download-repository-information-ubuntu-13-04/
[4]:http://itsfoss.com/fix-failed-download-package-files-error-ubuntu/
[5]:http://itsfoss.com/fix-partial-upgrade-error-elementary-os-luna-quick-tip/
[6]:http://itsfoss.com/solve-open-shared-object-file-quick-tip/
[7]:http://itsfoss.com/fix-ubuntu-install-error/
[8]:http://itsfoss.com/solve-gpg-error-signatures-verified-ubuntu/
[9]:http://itsfoss.com/solve-badsig-error-quick-tip/
