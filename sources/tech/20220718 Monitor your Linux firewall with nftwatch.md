[#]: subject: "Monitor your Linux firewall with nftwatch"
[#]: via: "https://opensource.com/article/22/7/nftwatch-linux-firewall"
[#]: author: "Kenneth Aaron https://opensource.com/users/flyingrhino"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Monitor your Linux firewall with nftwatch
======
I created the Linux nftwatch command to watch firewall traffic stats.

Netfilter tables ([nftables][4]) is the default firewall shipped with modern Linux distros. It's available on Fedora and RHEL 8, the latest Debian, and many others. It replaces the older iptables that was bundled in earlier distro releases. It's a powerful and worthy replacement for iptables, and as someone who uses it extensively, I appreciate its power and functionality.

One of the features of nftables is the ability to add counters to many elements, such as rules. These are enabled on demand. You need to explicitly ask for it on a per line basis using the "counter" argument. I have them enabled for specific rules in my firewall, which gives me visibility into those rules.

This got me thinking. How can I look at these counters in real time? At first I tried "watch" which allows things like refresh rate, but I didn't like the default format and it wasn't scrollable. I found using `head` and `tail` and `awk` less than ideal. A user-friendly solution didn't exist. So I wrote my own, which I'd like to share with the open source community.

### Introducing nftwatch on Linux

My solution, which I call nftwatch, does a few things:

* It reorders and reformats the nftables output to make it more readable.
* It allows scrolling the output up or down.
* Its user-defined refresh rate (can be changed in real time).
* It can pause the display.

Instead of a dump of a table, you get output that shows activity for each rule:

![Image of nftwatch][5]

(Kenneth Aaron, CC BY-SA 4.0)

You can download it here from its [Git repository][6].

It is 100% python, 100% open source, and 100% free. It ticks all the boxes for free, quality programs.

### Install nftwatch on Linux

Here are the manual install instructions:

1. Clone or download the project from the git repository.
2. Copy `nftwatch.yml` to `/etc/nftwatch.yml`.
3. Copy `nftwatch` to `/usr/local/bin/nftwatch` and grant it executable permissions using `chmod a+x`.
4. Use `nftwatch` with no args to run it.
5. See `nftwatch -m` for the man page.

You can also run nftwatch without the [YAML][7] config file, in which case it uses builtin defaults.

### Usage

The nftwatch command displays nftables rules. Most of the controls are designed for this purpose.

Arrow keys and the equivalent Vim keypresses control scrolling. Use the **F** or **S** key to change the refresh speed. Use the **P** key to pause the display.

Run `nftwatch -m` for full instructions, and a list of interactive key controls.

### A new view of your firewall

Firewalls can seem obtuse and vague even if you spend time to configure them. Aside from extrapolating indicators from log entries, it's hard to tell what kind of activity your firewall is actually seeing. With nftwatch, you can see your firewall at work, and ideally gain a better understanding of the kind of traffic your network has to deal with on a daily basis.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/nftwatch-linux-firewall

作者：[Kenneth Aaron][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flyingrhino
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://developers.redhat.com/blog/2016/10/28/what-comes-after-iptables-its-successor-of-course-nftables?extIdCarryOver=true&sc_cid=701f2000001OH79AAG#getting_started
[5]: https://opensource.com/sites/default/files/2022-07/nftwatch-sample.png
[6]: https://github.com/flyingrhinonz/nftwatch](https://github.com/flyingrhinonz/nftwatch
[7]: https://opensource.com/article/21/9/yaml-cheat-sheet
