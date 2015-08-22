translating---geekpi

Linux FAQs with Answers--How to check MariaDB server version
================================================================================
> **Question**: I am on a VPS server where MariaDB server is running. How can I find out which version of MariaDB server it is running?

There are circumstances where you need to know the version of your database server, e.g., when upgrading the database or patching any known server vulnerabilities. There are a few ways to find out what the version of your MariaDB server is.

### Method One ###

The first method to identify MariaDB server version is by logging in to the MariaDB server. Right after you log in, your will see a welcome message where MariaDB server version is indicated.

![](https://farm6.staticflickr.com/5807/20669891016_91249d3239_c.jpg)

Alternatively, simply type 'status' command at the MariaDB prompt any time while you are logged in. The output will show server version as well as protocol version as follows.

![](https://farm6.staticflickr.com/5801/20669891046_73f60e5c81_c.jpg)

### Method Two ###

If you don't have access to the MariaDB server, you cannot use the first method. In this case, you can infer MariaDB server version by checking which MariaDB package was installed. This works only when the MariaDB server was installed using a distribution's package manager.

You can search for the installed MariaDB server package as follows.

#### Debian, Ubuntu or Linux Mint: ####

    $ dpkg -l | grep mariadb

The output below indicates that installed MariaDB server is version 10.0.17.

![](https://farm1.staticflickr.com/607/20669890966_b611fcd915_c.jpg)

#### Fedora, CentOS or RHEL: ####

    $ rpm -qa | grep mariadb

The output below indicates that the installed version is 5.5.41.

![](https://farm1.staticflickr.com/764/20508160748_23d9808256_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-mariadb-server-version.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
