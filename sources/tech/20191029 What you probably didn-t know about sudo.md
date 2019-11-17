[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you probably didn’t know about sudo)
[#]: via: (https://opensource.com/article/19/10/know-about-sudo)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

What you probably didn’t know about sudo
======
Think you know everything about sudo? Think again.
![Command line prompt][1]

Everybody knows **sudo**, right? This tool is installed by default on most Linux systems and is available for most BSD and commercial Unix variants. Still, after talking to hundreds of **sudo** users, the most common answer I received was that **sudo** is a tool to complicate life.

There is a root user and there is the **su** command, so why have yet another tool? For many, **sudo** was just a prefix for administrative commands. Only a handful mentioned that when you have multiple administrators for the same system, you can use **sudo** logs to see who did what.

So, what is **sudo**? According to the [**sudo** website][2]:

> _"Sudo allows a system administrator to delegate authority by giving certain users the ability to run some commands as root or another user while providing an audit trail of the commands and their arguments."_

By default, **sudo** comes with a simple configuration, a single rule allowing a user or a group of users to do practically anything (more on the configuration file later in this article):


```
`%wheel ALL=(ALL) ALL`
```

In this example, the parameters mean the following:

  * The first parameter defines the members of the group.
  * The second parameter defines the host(s) the group members can run commands on.
  * The third parameter defines the usernames under which the command can be executed.
  * The last parameter defines the applications that can be run.



So, in this example, the members of the **wheel** group can run all applications as all users on all hosts. Even this really permissive rule is useful because it results in logs of who did what on your machine.

### Aliases

Of course, once it is not just you and your best friend administering a shared box, you will start to fine-tune permissions. You can replace the items in the above configuration with lists: a list of users, a list of commands, and so on. Most likely, you will copy and paste some of these lists around in your configuration.

This situation is where aliases can come handy. Maintaining the same list in multiple places is error-prone. You define an alias once and then you can use it many times. Therefore, when you lose trust in one of your administrators, you can remove them from the alias and you are done. With multiple lists instead of aliases, it is easy to forget to remove the user from one of the lists with elevated privileges. 

### Enable features for a certain group of users

The **sudo** command comes with a huge set of defaults. Still, there are situations when you want to override some of these. This is when you use the **Defaults** statement in the configuration. Usually, these defaults are enforced on every user, but you can narrow the setting down to a subset of users based on host, username, and so on. Here is an example that my generation of sysadmins loves to hear about: insults. These are just some funny messages for when someone mistypes a password:


```
czanik@linux-mewy:~&gt; sudo ls
[sudo] password for root:
Hold it up to the light --- not a brain in sight!
[sudo] password for root:
My pet ferret can type better than you!
[sudo] password for root:
sudo: 3 incorrect password attempts
czanik@linux-mewy:~&gt;
```

Because not everyone is a fan of sysadmin humor, these insults are disabled by default. The following example shows how to enable this setting only for your seasoned sysadmins, who are members of the **wheel** group:


```
Defaults !insults
Defaults:%wheel insults
```

I do not have enough fingers to count how many people thanked me for bringing these messages back.

### Digest verification

There are, of course, more serious features in **sudo** as well. One of them is digest verification. You can include the digest of applications in your configuration: 


```
`peter ALL = sha244:11925141bb22866afdf257ce7790bd6275feda80b3b241c108b79c88 /usr/bin/passwd`
```

In this case, **sudo** checks and compares the digest of the application to the one stored in the configuration before running the application. If they do not match, **sudo** refuses to run the application. While it is difficult to maintain this information in your configuration—there are no automated tools for this purpose—these digests can provide you with an additional layer of protection.

### Session recording

Session recording is also a lesser-known feature of **sudo**. After my demo, many people leave my talk with plans to implement it on their infrastructure. Why? Because with session recording, you see not just the command name, but also everything that happened in the terminal. You can see what your admins are doing even if they have shell access and logs only show that **bash** is started.

There is one limitation, currently. Records are stored locally, so with enough permissions, users can delete their traces. Stay tuned for upcoming features.

### Plugins

Starting with version 1.8, **sudo** changed to a modular, plugin-based architecture. With most features implemented as plugins, you can easily replace or extend the functionality of **sudo** by writing your own. There are both open source and commercial plugins already available for **sudo**.

In my talk, I demonstrated the **sudo_pair** plugin, which is available [on GitHub][3]. This plugin is developed in Rust, meaning that it is not so easy to compile, and it is even more difficult to distribute the results. On the other hand, the plugin provides interesting functionality, requiring a second admin to approve (or deny) running commands through **sudo**. Not just that, but sessions can be followed on-screen and terminated if there is suspicious activity.

In a demo I did during a recent talk at the All Things Open conference, I had the infamous:


```
`czanik@linux-mewy:~> sudo  rm -fr /`
```

command displayed on the screen. Everybody was holding their breath to see whether my laptop got destroyed, but it survived.

### Logs

As I already mentioned at the beginning, logging and alerting is an important part of **sudo**. If you do not check your **sudo** logs regularly, there is not much worth in using **sudo**. This tool alerts by email on events specified in the configuration and logs all events to **syslog**. Debug logs can be turned on and used to debug rules or report bugs.

### Alerts

Email alerts are kind of old-fashioned now, but if you use **syslog-ng** for collecting your log messages, your **sudo** log messages are automatically parsed. You can easily create custom alerts and send those to a wide variety of destinations, including Slack, Telegram, Splunk, or Elasticsearch. You can learn more about this feature from [my blog on syslong-ng.com][4].

### Configuration

We talked a lot about **sudo** features and even saw a few lines of configuration. Now, let’s take a closer look at how **sudo** is configured. The configuration itself is available in **/etc/sudoers**, which is a simple text file. Still, it is not recommended to edit this file directly. Instead, use **visudo**, as this tool also does syntax checking. If you do not like **vi**, you can change which editor to use by pointing the **EDITOR** environment variable at your preferred option.

Before you start editing the **sudo** configuration, make sure that you know the root password. (Yes, even on Ubuntu, where root does not have a password by default.) While **visudo** checks the syntax, it is easy to create a syntactically correct configuration that locks you out of your system.

When you have a root password at hand in case of an emergency, you can start editing your configuration. When it comes to the **sudoers** file, there is one important thing to remember: This file is read from top to bottom, and the last setting wins. What this fact means for you is that you should start with generic settings and place exceptions at the end, otherwise exceptions are overridden by the generic settings.

You can find a simple **sudoers** file below, based on the one in CentOS, and add a few lines we discussed previously:


```
Defaults !visiblepw
Defaults always_set_home
Defaults match_group_by_gid
Defaults always_query_group_plugin
Defaults env_reset
Defaults env_keep = "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS"
Defaults env_keep += "MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE"
Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin
root ALL=(ALL) ALL
%wheel ALL=(ALL) ALL
Defaults:%wheel insults
Defaults !insults
Defaults log_output
```

This file starts by changing a number of defaults. Then come the usual default rules: The **root** user and members of the **wheel** group have full permissions over the machine. Next, we enable insults for the **wheel** group, but disable them for everyone else. The last line enables session recording.

The above configuration is syntactically correct, but can you spot the logical error? Yes, there is one: Insults are disabled for everyone since the last, generic setting overrides the previous, more specific setting. Once you switch the two lines, the setup works as expected: Members of the **wheel** group receive funny messages, but the rest of the users do not receive them.

### Configuration management

Once you have to maintain the **sudoers** file on multiple machines, you will most likely want to manage your configuration centrally. There are two major open source possibilities here. Both have their advantages and drawbacks.

You can use one of the configuration management applications that you also use to configure the rest of your infrastructure. Red Hat Ansible, Puppet, and Chef all have modules to configure **sudo**. The problem with this approach is that updating configurations is far from real-time. Also, users can still edit the **sudoers** file locally and change settings.

The **sudo** tool can also store its configuration in LDAP. In this case, configuration changes are real-time and users cannot mess with the **sudoers** file. On the other hand, this method also has limitations. For example, you cannot use aliases or use **sudo** when the LDAP server is unavailable.

### New features

There is a new version of **sudo** right around the corner. Version 1.9 will include many interesting new features. Here are the most important planned features:

  * A recording service to collect session recordings centrally, which offers many advantages compared to local storage:
    * It is more convenient to search in one place.
    * Recordings are available even if the sender machine is down.
    * Recordings cannot be deleted by someone who wants to delete their tracks.
  * The **audit** plugin does not add new features to **sudoers**, but instead provides an API for plugins to easily access any kind of **sudo** logs. This plugin enables creating custom logs from **sudo** events using plugins.
  * The **approval** plugin enables session approvals without using third-party plugins.
  * And my personal favorite: Python support for plugins, which enables you to easily extend **sudo** using Python code instead of coding natively in C.



### Conclusion

I hope this article proved to you that **sudo** is a lot more than just a simple prefix. There are tons of possibilities to fine-tune permissions on your system. You cannot just fine-tune permissions, but also improve security by checking digests. Session recordings enable you to check what is happening on your systems. You can also extend the functionality of **sudo** using plugins, either using something already available or writing your own. Finally, given the list of upcoming features you can see that even if **sudo** is decades old, it is a living project that is constantly evolving.

If you want to learn more about **sudo**, here are a few resources:

  * [The **sudo** website][5]

  * [The **sudo** blog][6]

  * [Follow us on Twitter][7]




--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/know-about-sudo

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://www.sudo.ws
[3]: https://github.com/square/sudo_pair/
[4]: https://www.syslog-ng.com/community/b/blog/posts/alerting-on-sudo-events-using-syslog-ng
[5]: https://www.sudo.ws/
[6]: https://blog.sudo.ws/
[7]: https://twitter.com/sudoproject
