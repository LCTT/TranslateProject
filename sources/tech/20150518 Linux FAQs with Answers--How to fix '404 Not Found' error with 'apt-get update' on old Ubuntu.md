Linux FAQs with Answers--How to fix “404 Not Found” error with “apt-get update” on old Ubuntu
================================================================================
> **Question**: I have old Ubuntu 13.04 (Raring Ringtail) installation on my PC. When I run "sudo apt-get update" on it, it throws a bunch of "404 Not Found" errors, and I cannot install or update any package using apt-get or aptitude. Due to this error I cannot even upgrade it to a newer release. How can I fix this problem?

![](https://farm6.staticflickr.com/5460/17634085636_996b2a8ab5_b.jpg)

Every Ubuntu release has its end-of-life (EOL) time; regular Ubuntu releases are supported for 18 months, while LTS (Long Term Support) versions are supported up to 3 years (server edition) and 5 years (desktop edition). Once a Ubuntu release has reached EOL, its repositories will no longer be accessible, and you won't get any maintenance updates and security patches from Canonical. As of this writing, Ubuntu 13.04 (Raring Ringtail) has already reached EOL.

If the Ubuntu system you are using is EOL-ed, you will get the following 404 errors from apt-get or aptitude as its repositories have been deprecated.

    W: Failed to fetch http://us.archive.ubuntu.com/ubuntu/dists/raring-backports/multiverse/binary-i386/Packages  404  Not Found [IP: 91.189.91.13 80]
    
    W: Failed to fetch http://extras.ubuntu.com/ubuntu/dists/raring/main/binary-amd64/Packages  404  Not Found
    
    W: Failed to fetch http://security.ubuntu.com/ubuntu/dists/raring-security/universe/binary-i386/Packages  404  Not Found [IP: 91.189.88.149 80]
    
    E: Some index files failed to download. They have been ignored, or old ones used instead

For those users who are using old versions of Ubuntu, Canonical maintains old-releases.ubuntu.com, which is an archive of EOL-ed repositories. Thus, when Canonical's support for your Ubuntu installation ends, you need to switch to repositories at old-releases.ubuntu.com (unless you want to upgrade it before EOL).

Here is a quick way to fix "404 Not Found" errors on old Ubuntu by switching to old-releases repositories.

First, replace main/security repositories with old-releases versions as follows.

    $ sudo sed -i -r 's/([a-z]{2}\.)?archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
    $ sudo sed -i -r 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

Then open /etc/apt/sources.list with a text editor, and look for extras.ubuntu.com. This repository is also no longer supported for 13.04. So you need to comment out extras.ubuntu.com by prepending '#' sign.

    #deb http://extras.ubuntu.com/ubuntu raring main
    #deb-src http://extras.ubuntu.com/ubuntu raring main

Now you should be able to install or update packages on an old unsupported Ubuntu release.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/404-not-found-error-apt-get-update-ubuntu.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni