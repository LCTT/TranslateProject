[#]: subject: "5 reasons to use sudo on Linux"
[#]: via: "https://opensource.com/article/22/5/use-sudo-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 reasons to use sudo on Linux
======
Here are five security reasons to switch to the Linux sudo command. Download our sudo cheat sheet for more tips.

![Command line prompt][1]
Image by: Opensource.com

On traditional Unix and Unix-like systems, the first and only user that exists on a fresh install is named *root*. Using the root account, you log in and create secondary "normal" users. After that initial interaction, you're expected to log in as a normal user.

Running your system as a normal user is a self-imposed limitation that protects you from silly mistakes. As a normal user, you can't, for instance, delete the configuration file that defines your network interfaces or accidentally overwrite your list of users and groups. You can't make those mistakes because, as a normal user, you don't have permission to access those important files. Of course, as the literal owner of a system, you could always use the `su` command to become the superuser (root) and do whatever you want, but for everyday tasks you're meant to use your normal account.

Using `su` worked well enough for a few decades, but then the `sudo` command came along.

To a longtime superuser, the `sudo` command might seem superfluous at first. In some ways, it feels very much like the `su` command. For instance, here's the `su` command in action:

```
$ su root
<enter passphrase>
# dnf install -y cowsay
```

And here's `sudo` doing the same thing:

```
$ sudo dnf install -y cowsay
<enter passphrase>
```

The two interactions are nearly identical. Yet most distributions recommend using `sudo` instead of `su`, and most major distributions have eliminated the root account altogether. Is it a conspiracy to dumb down Linux?

Far from it, actually. In fact, `sudo` makes Linux more flexible and configurable than ever, with no loss of features and [several significant benefits][2].

### Why sudo is better than root on Linux

Here are five reasons you should be using `sudo` instead of `su`.

### 1. Root is a confirmed attack vector

I use the usual mix of [firewalls][3], [fail2ban][4], and [SSH keys][5] to prevent unwanted entry to the servers I run. Before I understood the value of `sudo`, I used to look through logs with horror at all the failed brute force attacks directed at my server. Automated attempts to log in as root are easily the most common, and with good reason.

An attacker with enough knowledge to attempt a break-in also would also know that, before the widespread use of `sudo`, essentially every Unix and Linux system had a root account. That's one less guess about how to get into your server an attacker has to make. The login name is always right, as long as it's root, so all an attacker needs is a valid passphrase.

Removing the root account offers a good amount of protection. Without root, a server has no confirmed login accounts. An attacker must guess at possible login names. In addition, the attacker must guess a password to associate with a login name. That's not just one guess and then another guess; it's two guesses that must be correct concurrently.

### 2. Root is the ultimate attack vector

Another reason root is a popular name in failed access logs is that it's the most powerful user possible. If you're going to set up a script to brute force its way into somebody else's server, why waste time trying to get in as a regular user with limited access to the machine? It only makes sense to go for the most powerful user available.

By being both the singularly known user name and the most powerful user account, root essentially makes it pointless to try to brute force anything else.

### 3. Selective permission

The `su` command is all or nothing. If you have the password for `su` root, you can become the superuser. If you don't have the password for `su`, you have no administrative privileges whatsoever. The problem with this model is that a sysadmin has to choose between handing over the master key to their system or withholding the key and all control of the system. That's not always what you want. [Sometimes you want to delegate.][6]

For example, say you want to grant a user permission to run a specific application that usually requires root permissions, but you don't want to give this user the root password. By editing the `sudo` configuration, you can allow a specific user, or any number of users belonging to a specific Unix group, to run a specific command. The `sudo` command requires a user's existing password, not your password, and certainly not the root password.

### 4. Time out

When running a command with `sudo`, an authenticated user's privileges are escalated for 5 minutes. During that time, they can run the command or commands you've given them permission to run.

After 5 minutes, the authentication cache is cleared, and the next use of `sudo` prompts for a password again. Timing out prevents a user from accidentally performing that action later (for instance, a careless search through your shell history or a few too many Up arrow presses). It also ensures that another user can't run the commands if the first user walks away from their desk without locking their computer screen.

### 5. Logging

The shell history feature serves as a log of what a user has been doing. Should you ever need to understand how something on your system happened, you could (in theory, depending on how shell history is configured) use `su` to switch to somebody else's account, review their shell history, and maybe get an idea of what commands a user has been executing.

If you need to audit the behavior of 10s or 100s of users, however, you might notice that this method doesn't scale. Shell histories also rotate out pretty quickly, with a default age of 1,000 lines, and they're easily circumvented by prefacing any command with an empty space.

When you need logs on administrative tasks, `sudo` offers a complete [logging and alerting subsystem][7], so you can review activity from a centralized location and even get an alert when something significant happens.

### Learn the features

The `sudo` command has even more features, both current and in development, than what I've listed in this article. Because `sudo` is often something you configure once then forget about, or something you configure only when a new admin joins your team, it can be hard to remember its nuances.

Download our [sudo cheat sheet][8] and use it as a helpful reminder for all of its uses when you need it the most.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/use-sudo-linux

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/command_line_prompt.png
[2]: https://opensource.com/article/19/10/know-about-sudo
[3]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[4]: https://www.redhat.com/sysadmin/protect-systems-fail2ban
[5]: https://opensource.com/article/20/2/ssh-tools
[6]: https://opensource.com/article/17/12/using-sudo-delegate
[7]: https://opensource.com/article/19/10/know-about-sudo
[8]: https://opensource.com/downloads/linux-sudo-cheat-sheet
