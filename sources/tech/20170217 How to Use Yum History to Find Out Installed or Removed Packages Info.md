OneNewLife translating

How to Use ‘Yum History’ to Find Out Installed or Removed Packages Info
============================================================


[YUM][1] is an interactive, rpm based, high level package manager for RHEL/CentOS systems, it enables users to install new packages, remove/erase old/unwanted packages. It can [automatically run system updates][2] and does dependency analysis, and also perform queries on the installed and/or available packages plus so much more.

In this article, we will explain how to view history of YUM transactions in order to find out information about installed packages and those that where removed/erased from a system.

**Suggested Read:** [20 Linux YUM Commands for Package Management][3]

Below are some examples of how to use the YUM history command.

### View Complete YUM History

To view a full history of YUM transactions, we can run the command below which will show us the: transaction id, login user who executed the particular action, date and time when the operation happened, the actual action and additional information about any thing wrong with the operation:

```
# yum history 
```
[
 ![View Yum History](http://www.tecmint.com/wp-content/uploads/2017/02/View-Yum-History.png) 
][4]

View Yum History

### Use Yum to Find Package Info

The history sub-commands: info/list/summary can take a transaction ID or package name as an argument. Additionally, the list sub-command can take a special argument, all meaning – all transactions.

The previous history command is equivalent to running:

```
# yum history list all
```

And, you can view details of transactions concerning a given package such as `httpd` web server with the `info`command as follows:

```
# yum history info httpd
```
[
 ![Yum - Find Package Info](http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Find-Package-Info.png) 
][5]

Yum – Find Package Info

To get a summary of the transactions concerning `httpd` package, we can issue the following command:

```
# yum history summary httpd
```
[
 ![Yum - Find Summary of Package](http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Find-Summary-of-Package.png) 
][6]

Yum – Find Summary of Package

It is also possible to use a transaction ID, the command below will display details of the transaction ID `15`.

```
# yum history info 15
```
[
 ![Yum - Find Package Info Using ID](http://www.tecmint.com/wp-content/uploads/2017/02/Find-Package-Info-Using-ID.png) 
][7]

Yum – Find Package Info Using ID

### Use Yum History to Find Package Transaction Info

There are sub-commands that print out transaction details of a specific package or group of packages. We can use `package-list` or `package_info` to view more info about `httpd` package like so:

```
# yum history package-list httpd
OR
# yum history package-info httpd
```
[
 ![Yum - Find Package Transaction Info](http://www.tecmint.com/wp-content/uploads/2017/02/Find-Package-Transaction-Info.png) 
][8]

Yum – Find Package Transaction Info

To get history about multiple packages, we can run:

```
# yum history package-list httpd epel-release
OR
# yum history packages-list httpd epel-release
```
[
 ![Yum - Find Multiple Packages Info](http://www.tecmint.com/wp-content/uploads/2017/02/Find-Multiple-Package-Info.png) 
][9]

Yum – Find Multiple Packages Info

### Use Yum to Rollback Packages

Furthermore, there are certain history sub-commands that enable us to: undo/redo/rollback transactions.

1.  Undo – will undo a specified transaction.
2.  redo – repeat the work of a specified transaction
3.  rollback – will undo all transactions up to the point of the specified transaction.

They take either a single transaction id or the keyword last and an offset from the last transaction.

For example, assuming we’ve done 60 transactions, “last” refers to transaction 60, and “last-4” points to transaction 56.

**Suggested Read:** [How to Use ‘yum-utils’ to Maintain Yum and Boost its Performance][10]

This is how the sub-commands above work: If we have 5 transactions: V, W, X, Y and Z, where packages where installed respectively.

```
# yum history undo 2    #will remove package W
# yum history redo 2    #will  reinstall package W
# yum history rollback 2    #will remove packages from X, Y, and Z. 
```

In the following example, transaction 2 was a update operation, as seen below, the redo command that follows will repeat transaction 2 upgrading all the packages updated by that time:

```
# yum history | grep -w "2"
```
[
 ![Yum - Find Package Transaction ID](http://www.tecmint.com/wp-content/uploads/2017/02/Find-Yum-Package-Transaction-ID.png) 
][11]

Yum – Find Package Transaction ID

```
# yum history redo 2
```
[
 ![Yum Redo Package Update](http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Redo-Package-Update.png) 
][12]

Yum Redo Package Update

The redo sub-command can also take some optional arguments before we specify a transaction:

1.  force-reinstall – reinstalls any packages that were installed in that transaction (via yum install, upgrade or downgrade).
2.  force-remove – removes any packages that were updated or downgraded.

```
# yum history redo force-reinstall 16
```
[
 ![Yum - Force Install Package](http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Force-Install-Package.png) 
][13]

Yum – Force Install Package

### Find Yum History Database and Sources Info

These sub-commands provide us information about the history DB and additional info sources:

1.  addon-info – will provide sources of additional information.
2.  stats – displays statistics about the current history DB.
3.  sync – enables us to alter the the rpmdb/yumdb data stored for any installed packages.

Consider the commands below to understand how these sub-commands practically work:

```
# yum history addon-info
# yum history stats
# yum history sync
```

To set a new history file, use the new sub-command:

```
# yum history new
```

We can find a complete information about YUM history command and several other commands in the yum man page:

```
# man yum
```

**Suggested Read:** [4 Ways to Disable/Lock Certain Package Updates Using Yum][14]

That’s it for now. In this guide, we explained various YUM history commands to view details of YUM transactions. Remember to offer us your thoughts concerning this guide via the comment section below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/view-yum-history-to-find-packages-info/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/auto-install-security-patches-updates-on-centos-rhel/
[3]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/View-Yum-History.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Find-Package-Info.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Find-Summary-of-Package.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Find-Package-Info-Using-ID.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Find-Package-Transaction-Info.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Find-Multiple-Package-Info.png
[10]:http://www.tecmint.com/linux-yum-package-management-with-yum-utils/
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Find-Yum-Package-Transaction-ID.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Redo-Package-Update.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/02/Yum-Force-Install-Package.png
[14]:http://www.tecmint.com/yum-lock-disable-blacklist-certain-package-update-version/
[15]:http://www.tecmint.com/author/aaronkili/
[16]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[17]:http://www.tecmint.com/free-linux-shell-scripting-books/
