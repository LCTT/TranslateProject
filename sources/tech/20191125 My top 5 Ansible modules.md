[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My top 5 Ansible modules)
[#]: via: (https://opensource.com/article/19/11/ansible-modules)
[#]: author: (Mark Phillips https://opensource.com/users/markp)

My top 5 Ansible modules
======
Learn how to achieve almost anything with these Ansible modules.
![][1]

When I was growing up, my grandfather had a shed in his garden. He would spend hours in there, making and fixing things. This was way before we had the internet, so I spent a lot of time studying him creating things in that shed. Although the shed was full of many tools, from drills to lathes to electrical gubbins and lots of things I doubt I could identify even today, he made use of only a tiny subset of what he had at hand. Yet there never seemed to be limits to what he could achieve.

I tell you that story because I feel like my career has been spent in a metaphorical shed. Computers are so many tools, all in a small (virtual?) space. And there are tool sheds within tool sheds—my favourite being Ansible. The recent 2.9 release ships with 3,681 modules! **3,681!** When I first started using Ansible in the summer of 2013, version 1.2.1 had just 113 modules, yet, as [I wrote at the time][2], I could still achieve anything I imagined.

Modules are the backbone of Ansible, the gears to make light of heavy lifting. They're designed to do one job well, thus realising [the Unix philosophy][3]. This is how we've come to bundle so many of them; Ansible as the conductor of the orchestra now has a lot of instruments at its command.

Reviewing a Git repository of my Ansible plays and roles over the years reveals that I have used just 35 modules. This small subset was used to build large infrastructures. I wonder what could be achieved with an even smaller subset, though? As I reviewed those 35, I pondered if I could achieve the same results with only five modules at my disposal. So here are my five favourite modules, in a rather tenuous order of precedence.

### 5. [authorized_key][4]

Secure shell (SSH) is at the heart of Ansible, at least for almost everything besides Windows. Key (no pun intended) to using SSH efficiently with Ansible is… [keys][5]! Slight aside—there are a lot of very cool things you can do for security with SSH keys. It's worth perusing the **authorized_keys** section of the [sshd manual page][6]. Managing SSH keys can become laborious if you're getting into the realms of granular user access, and although we could do it with either of my next two favourites, I prefer to use the module because it [enables easy management through variables][7].

### 4. [file][8]

Besides the obvious function of placing a file somewhere, the **file** module also sets ownership and permissions. I'd say that's a lot of _bang for your buck_ with one module. I'd proffer a substantial portion of security relates to setting permissions too, so the **file** module plays nicely with **authorized_keys**.

### 3. [template][9]

There are so many ways to manipulate the contents of files, and I see lots of folk use **[lineinfile][10]**. I've used it myself for small tasks. However, the **template** module is so much clearer because you maintain the entire file for context. My preference is to write Ansible content in such a way that anyone can understand it _easily_—which to me means not making it hard to understand what is happening. Use of **template** means being able to see the entire file you're putting into place, complete with the variables you are using to change pieces.

### 2. [uri][11]

Many modules in the current distribution leverage Ansible as an orchestrator. They talk to another service, rather than doing something specific like putting a file into place. Usually, that talking is over HTTP too. In the days before many of these modules existed, you _could_ program an API directly using the **uri** module. It's a powerful access tool, enabling you to do a lot. I wouldn't be without it in my fictitious Ansible shed.

### 1. [shell][12]

The joker card in our pack. The Swiss Army Knife. If you're absolutely stuck for how to control something else, use **shell**. Some will argue we're now talking about making Ansible a Bash script—but, I would say it's still better because with the use of the **name** parameter in your plays and roles, you document every step. To me, that's as big a bonus as anything. Back in the days when I was still consulting, I once helped a database administrator (DBA) migrate to Ansible. The DBA wasn't one for change and pushed back at changing working methods. So, to ease into the Ansible way, we called some existing DB management scripts from Ansible using the **shell** module. With an informative **name** statement to accompany the task.

You can achieve a lot with these five modules. Yes, modules designed to do a specific task will make your life even easier. But with a smidgen of engineering simplicity, you can achieve a lot with very little. Ansible developer Brian Coca is a master at it, and [his tips and tricks talk][13] is always worth a watch.

* * *

What do you think about my top five? What five modules would you pick and why, if you were so limited? Let me know in the comments below!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/ansible-modules

作者：[Mark Phillips][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/markp
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mandelbrot_set.png?itok=bmPc0np5
[2]: http://probably.co.uk/post/puppet-vs-chef-vs-ansible/
[3]: https://en.wikipedia.org/wiki/Unix_philosophy#Do_One_Thing_and_Do_It_Well
[4]: https://docs.ansible.com/ansible/latest/modules/authorized_key_module.html
[5]: https://linux.die.net/man/1/ssh-keygen
[6]: https://linux.die.net/man/8/sshd
[7]: https://github.com/phips/ansible-demos/blob/3bf59df1eb2390b31b5c42333197e2fbb7fec93f/roles/ansible-users/tasks/main.yml#L35
[8]: https://docs.ansible.com/ansible/latest/modules/file_module.html
[9]: https://docs.ansible.com/ansible/latest/modules/template_module.html
[10]: https://docs.ansible.com/ansible/latest/modules/lineinfile_module.html
[11]: https://docs.ansible.com/ansible/latest/modules/uri_module.html
[12]: https://docs.ansible.com/ansible/latest/modules/shell_module.html
[13]: https://www.ansible.com/ansible-tips-and-tricks
