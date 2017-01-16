translating---geekpi

Let Sudo Insult You When You Enter Incorrect Password
============================================================

Sudoers is the default sudo security policy plugin in Linux, however, experienced system administrators can specify a custom security policy as well as input and output logging plugins. It is driven by the `/etc/sudoers`file or alternatively in LDAP.

You can define sudoers insults option or several others in the file above. It is set under defaults entries section. Read through our last article that explains [10 Useful Sudoers Configurations for Setting ‘sudo’ in Linux][1].

In this article, we will explain a sudoers configuration parameter to enable an individual or system administrator set [sudo command][2] to insult system users who enter wrong password.

Start by opening the file `/etc/sudoers` like so:

```
$ sudo visudo
```

Go to the defaults section and add the following line:

```
Defaults   insults
```

Below is a sample of /etc/sudoers file on my system showing defaults entries.

[
 ![Set sudo Insults Parameter](http://www.tecmint.com/wp-content/uploads/2017/01/Set-sudo-Insults-Parameter.png) 
][3]

Set sudo Insults Parameter

From the screenshot above, you can see that there are many other defaults defined such as send mail to root when each time a user enters a bad password, set a secure path, configure a custom sudo log file and more.

Save the file and close it.

Run a command with sudo and enter the wrong password, then observe how insults option works:

```
$ sudo visudo
```
[
 ![sudo Insult in Action](http://www.tecmint.com/wp-content/uploads/2017/01/How-sudo-Insult-Works.png) 
][4]

sudo Insult in Action

Note: When you configure the insults parameter, it disables the `badpass_message` parameter which prints a specific message on the command line (the default message is “sorry, try again”) in case a user enters a wrong password.

To modify the message, add the `badpass_message` parameter to the /etc/sudoers file as shown below.

```
Defaults  badpass_message="Password is wrong, please try again"  #try to set a message of your own
```
[
 ![Set sudo badpassword Message](http://www.tecmint.com/wp-content/uploads/2017/01/Set-sudo-badpassword-Message.png) 
][5]

Set sudo badpassword Message

Save the file and close it, then invoke sudo and see how it works, the message you set as the value of badpass_message will be printed every time you or any system user types a wrong password.

```
$ sudo visudo
```
[
 ![Sudo badpassword Message](http://www.tecmint.com/wp-content/uploads/2017/01/sudo-badpassword-Message.png) 
][6]

Sudo badpassword Message

That’s all, in this article we reviewed how to set sudo to print insults when users type a wrong password. Do share your thoughts via the comment section below.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------


via: http://www.tecmint.com/sudo-insult-when-enter-wrong-password/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[2]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-sudo-Insults-Parameter.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/How-sudo-Insult-Works.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-sudo-badpassword-Message.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/sudo-badpassword-Message.png
