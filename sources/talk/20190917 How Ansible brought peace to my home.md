[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Ansible brought peace to my home)
[#]: via: (https://opensource.com/article/19/9/ansible-documentation-kids-laptops)
[#]: author: (James Farrell https://opensource.com/users/jamesfhttps://opensource.com/users/jlozadadhttps://opensource.com/users/jason-bakerhttps://opensource.com/users/aseem-sharmahttps://opensource.com/users/marcobravo)

How Ansible brought peace to my home
======
Configuring his young daughters' computers with Ansible made it simple
for this dad to manage the family's computers.
![Coffee and laptop][1]

A few months ago, I read Marco Bravo's article [_How to use Ansible to document procedures_][2] on Opensource.com. I will admit, I didn't quite get it at the time. I was not actively using [Ansible][3], and I remember thinking it looked like more work than it was worth. But I had an open mind and decided to spend time looking deeper into Ansible.

I soon found an excuse to embark on my first real Ansible adventure: repurposing old laptops like in [_How to make an old computer useful again_][4]. I've always liked playing with old computers, and the prospect of automating something with modern methods piqued my interest.

### The task

Earlier this year, I gave my seven-year-old daughter a repurposed Dell Mini 9 running some flavor of Ubuntu. At first, my six-year-old daughter didn't care much about it, but as the music played and she discovered the fun programs, her interest set in.

I realized I would need to build another one for her soon. And any parent with small children close in age can likely identify with my dilemma. If both children don't get identical things, conflicts will arise. Similar toys, similar clothes, similar shoes … sometimes the color, shape, and blinking lights must be identical. I am sure they would notice any difference in laptop configuration, and it would become a point of contention. Therefore, I needed these laptops to have identical functionality.

Also, with small children in the mix, I suspected I would be rebuilding these things a few times. Failures, accidents, upgrades, corruptions … this threatened to become a time sink.

Since two young girls sharing one Dell Mini 9 was not really a workable solution, I grabbed a Dell D620 from my pile of old hardware, upgraded the RAM, put in an inexpensive SSD, and started to cook up a repeatable process to build the children's computer configuration.

If you think about it, this task seems ideal for a configuration management system. I needed something to document what I was doing so it could be easily repeatable.

### Ansible to the rescue

I didn't try to set up a full-on pre-boot execution environment (PXE) to support an occasional laptop install. I wanted to teach my children to do some of the installation work for me (a different kind of automation, ha!).

I decided to start from a minimal OS install and eventually broke down my Ansible approach into three parts: bootstrap, account setup, and software installation. I could have put everything into one giant script, but separating these functions allowed me to mix and match them for other projects and refine them individually over time. Ansible's YAML file readability helped keep things clear as I refined my systems.

For this laptop experiment, I decided to use Debian 32-bit as my starting point, as it seemed to work best on my older hardware. The bootstrap YAML script is intended to take a bare-minimal OS install and bring it up to some standard. It relies on a non-root account to be available over SSH and little else. Since a minimal OS install usually contains very little that is useful to Ansible, I use the following to hit one host and prompt me to log in with privilege escalation:


```
`$ ansible-playbook bootstrap.yml -i '192.168.0.100,' -u jfarrell -Kk`
```

The script makes use of Ansible's [raw][5] module to set some base requirements. It ensures Python is available, upgrades the OS, sets up an Ansible control account, transfers SSH keys, and configures sudo privilege escalation. When bootstrap completes, everything should be in place to have this node fully participate in my larger Ansible inventory. I've found that bootstrapping bare-minimum OS installs is nuanced (if there is interest, I'll write another article on this topic).

The account YAML setup script is used to set up (or reset) user accounts for each family member. This keeps user IDs (UIDs) and group IDs (GIDs) consistent across the small number of machines we have, and it can be used to fix locked accounts when needed. Yes, I know I could have set up Network Information Service or LDAP authentication, but the number of accounts I have is very small, and I prefer to keep these systems very simple. Here is an excerpt I found especially useful for this:


```
\---
\- name: Set user accounts
  hosts: all
  gather_facts: false
  become: yes
  vars_prompt:
    - name: passwd
      prompt: "Enter the desired ansible password:"
      private: yes

  tasks:
  - name: Add child 1 account
    user:
      state: present
      name: child1
      password: "{{ passwd | password_hash('sha512') }}"
      comment: Child One
      uid: 888
      group: users
      shell: /bin/bash
      generate_ssh_key: yes
      ssh_key_bits: 2048
      update_password: always
      create_home: yes
```

The **vars_prompt** section prompts me for a password, which is put to a Jinja2 transformation to produce the desired password hash. This means I don't need to hardcode passwords into the YAML file and can run it to change passwords as needed.

The software installation YAML file is still evolving. It includes a base set of utilities for the sysadmin and then the stuff my users need. This mostly consists of ensuring that the same graphical user interface (GUI) interface and all the same programs, games, and media files are installed on each machine. Here is a small excerpt of the software for my young children:


```
 - name: Install kids software
    apt:
      name: "{{ packages }}"
      state: present
    vars:
      packages:
     - lxde
      - childsplay
      - tuxpaint
      - tuxtype
      - pysycache
      - pysiogame
      - lmemory
      - bouncy
```

I created these three Ansible scripts using a virtual machine. When they were perfect, I tested them on the D620. Then converting the Mini 9 was a snap; I simply loaded the same minimal Debian install then ran the bootstrap, accounts, and software configurations. Both systems then functioned identically.

For a while, both sisters enjoyed their respective computers, comparing usage and exploring software features.

### The moment of truth

A few weeks later came the inevitable. My older daughter finally came to the conclusion that her pink Dell Mini 9 was underpowered. Her sister's D620 had superior power and screen real estate. YouTube was the new rage, and the Mini 9 could not keep up. As you can guess, the poor Mini 9 fell into disuse; she wanted a new machine, and sharing her younger sister's would not do.

I had another D620 in my pile. I replaced the BIOS battery, gave it a new SSD, and upgraded the RAM. Another perfect example of breathing new life into old hardware.

I pulled my Ansible scripts from source control, and everything I needed was right there: bootstrap, account setup, and software. By this time, I had forgotten a lot of the specific software installation information. But details like account UIDs and all the packages to install were all clearly documented and ready for use. While I surely could have figured it out by looking at my other machines, there was no need to spend the time! Ansible had it all clearly laid out in YAML.

Not only was the YAML documentation valuable, but Ansible's automation made short work of the new install. The minimal Debian OS install from USB stick took about 15 minutes. The subsequent shape up of the system using Ansible for end-user deployment only took another nine minutes. End-user acceptance testing was successful, and a new era of computing calmness was brought to my family (other parents will understand!).

### Conclusion

Taking the time to learn and practice Ansible with this exercise showed me the true value of its automation and documentation abilities. Spending a few hours figuring out the specifics for the first example saves time whenever I need to provision or fix a machine. The YAML is clear, easy to read, and—thanks to Ansible's idempotency—easy to test and refine over time. When I have new ideas or my children have new requests, using Ansible to control a local virtual machine for testing is a valuable time-saving tool.

Doing sysadmin tasks in your free time can be fun. Spending the time to automate and document your work pays rewards in the future; instead of needing to investigate and relearn a bunch of things you've already solved, Ansible keeps your work documented and ready to apply so you can move onto other, newer fun things!

I can see the brightness of curiosity in my six year old niece Shuchi's eyes when she explores a...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/ansible-documentation-kids-laptops

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamesfhttps://opensource.com/users/jlozadadhttps://opensource.com/users/jason-bakerhttps://opensource.com/users/aseem-sharmahttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://opensource.com/article/19/4/ansible-procedures
[3]: https://www.ansible.com/
[4]: https://opensource.com/article/19/7/how-make-old-computer-useful-again
[5]: https://docs.ansible.com/ansible/2.3/raw_module.html
