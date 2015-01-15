Tips for Apache Migration From 2.2 to 2.4 on Ubuntu 14.04
================================================================================
If you do a distribution upgrade from **Ubuntu** 12.04 to 14.04, the upgrade will bring among other things an important update to **Apache**, from [version 2.2][1] to version 2.4. The update brings many improvements but it may cause some errors when used with the old configuration file from 2.2.

### Access control in Apache 2.4 Virtual Hosts ###

Starting with **Apache 2.4** authorization is applied in a way that is much more flexible then just a single check against a single data store like it was in 2.2. In the past it was tricky to figure how and in what order authorization is applied but with the introduction of authorization container directives such as and , the configuration also has control over when the authorization methods are called and what criteria determines when access is granted.

This is the point where most upgrades fail because of wrong configuration because in 2.2 access control based on IP address, hostname or other characteristic was done using the directives Order, Allow, Deny or Satisfy, but in 2.4 this is done with authorization checks using the new modules.

To be clear let's see some virtual host examples, this can be found in your /etc/apache2/sites-enabled/default or /etc/apache2/sites-enabled/YOUR_WEBSITE_NAME:

Old 2.2 virtual host configuration:

    Order allow,deny
    Allow from all

New 2.4 virtual host configuration:

    Require all granted

![apache 2.4 config](http://blog.linoxide.com/wp-content/uploads/2014/12/apache-2.4-config.jpg)

### .htaccess problems ###

If after the upgrade some settings don't work or you get redirect errors, check if those settings are in a .htaccess file. If settings in the .htaccess file are not used by Apache it's because in 2.4 AllowOverride directive is set to None by default, thus ignoring the .htaccess files. All you have to do is to either change or add the AllowOverride All directive to your site configuration file.

You also see the AllowOverride All directive set in the screenshot above.

### Missing config file or module ###

From my experience another problem during upgrades is that your configuration file includes an old module or configuration file that is no longer needed or supported in 2.4, you will get a clear warning that Apache can't include the respective file and all you have to do is go to your configuration file and remove the line that causes problem. Afterwards you can search or install a similar module.

### Other small changes you shound know about ###

There are a few other changes that you should consider, although they generally result in an warning and not an error:

- MaxClients has been renamed to MaxRequestWorkers, which describes more accurately what it does. For async MPMs, like event, the maximum number of clients is not equivalent than the number of worker threads. The old name is still supported.
- The DefaultType directive no longer has any effect, other than to emit a warning if it's used with any value other than none. You need to use other configuration settings to replace it in 2.4.
- EnableSendfile now defaults to Off.
- FileETag now defaults to "MTime Size" (without INode).
- KeepAlive only accepts values of On or Off. Previously, any value other than "Off" or "0" was treated as "On".
- Directives AcceptMutex, LockFile, RewriteLock, SSLMutex, SSLStaplingMutex, and WatchdogMutexPath have been replaced with a single Mutex directive. You will need to evaluate any use of these removed directives in your 2.2 configuration to determine if they can just be deleted or will need to be replaced using Mutex.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/apache-migration-2-2-to-2-4-ubuntu-14-04/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://httpd.apache.org/docs/2.4/