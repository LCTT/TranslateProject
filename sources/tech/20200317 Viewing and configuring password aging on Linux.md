[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Viewing and configuring password aging on Linux)
[#]: via: (https://www.networkworld.com/article/3532815/viewing-and-configuring-password-aging-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Viewing and configuring password aging on Linux
======
With proper settings, Linux users can be forced to periodically change their passwords. Here's how to view password aging settings and how to configure some of the settings.
BlueBay2014 / Getty Images

User passwords on Linux systems can be configured to be permanent or can be set to expire so that individuals must reset them periodically. Periodic password changing is generally considered good practice for security reasons, but is not configured by default.

To view and modify password-aging settings, you need to be familiar with a couple important commands – the **chage** command along with its **-l** option and the **passwd** command with its **-S**. These commands, along with a few other **chage** commands that are used to configure password aging are described in this post.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

### Viewing password aging settings

The way to determine if password aging is in place for some particular account is to use the **chage** command as shown below. Note that root authority is needed to check any account other than your own. Notice the password expiration date below.

```
$ sudo chage -l dory
Last password change                                    : Mar 15, 2020
Password expires                                        : Jun 13, 2020    <==
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 10
Maximum number of days between password change          : 90
Number of days of warning before password expires       : 14
```

If password aging is _not_ being applied, the account information would look like this:

```
$ sudo chage -l nemo
Last password change                                    : Jan 14, 2019
Password expires                                        : never         <==
Password inactive                                       : never
Account expires                                         : Mar 26, 2706989
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

You can also view some of this information using the **passwd -S** command, but you'll need to know what each of the fields in the output represents:

```
dory$ passwd -S
dory P 03/15/2020 10 90 14 -1
```

The seven fields here represent:

  * 1 –  username
  * 2 – account status (L=locked, NP=no password, P=usable password)
  * 3 – date of the last password change
  * 4 – minimum age for a change (password cannot be changed if it isn’t this many days old)
  * 5 – maximum age (password must be changed by the time it gets this many days old)
  * 6 – number of days before a required change that warnings will be provided
  * 7 – number of days after password expires before it is locked (made inactive)



One interesting thing to note is that the **chage** command doesn’t show you if an account is locked; it only shows the password aging settings. The **passwd -S** command, on the other hand, will tell you when a password is locked. In this example, note that the account status is “L”:

[][2]

```
$ sudo passwd -S dorothy
dorothy L 07/09/2019 0 99999 7 10
```

This locking takes effect in the **/etc/shadow** file with the field that normally contains the password "hash" field becoming just a "!".

```
$ sudo grep dorothy /etc/shadow
dorothy:!:18086:0:99999:7:10::    <==
```

That fact that an account is locked is not obvious in the **chage** output:

```
$ sudo chage -l dorothy
Last password change                                    : Jul 09, 2019
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

### Some options for password aging

The most commonly used settings are for the minimum and maximum days. These are often used in combination. For example, you might configure a password so that it cannot be used for more than 90 days (maximum) and then add that it cannot be changed before it has been in effect for a week or 10 days (minimum days). This ensures that users won’t change a password when required and then immediately change it back to what it was previously.

```
$ sudo chage -M 90 -m 10 shark
$ sudo chage -l shark
Last password change                                    : Mar 16, 2020
Password expires                                        : Jun 14, 2020
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 10    <==
Maximum number of days between password change          : 90    <==
Number of days of warning before password expires       : 7
```

You can also set a specific expiration date for an account using the **-E** option.

```
$ sudo chage -E 2020-11-11 tadpole
$ sudo chage -l tadpole
Last password change                                    : Oct 15, 2019
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : Nov 11, 2020  <==
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

Password aging can be an important option as long as it doesn't encourage users to use passwords that are way too simple or write them down in insecure ways. For more information on controlling the character of passwords (e.g., combinations of uppercase and lowercase letters, digits, etc.), check out this post on [password complexity][3].

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3532815/viewing-and-configuring-password-aging-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[3]: https://www.networkworld.com/article/2726217/how-to-enforce-password-complexity-on-linux.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
