[#]: subject: (Ansible emphasizes inclusive language in new release)
[#]: via: (https://opensource.com/article/21/5/inclusive-language-ansible)
[#]: author: (Jill Rouleau https://opensource.com/users/jillr)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Ansible emphasizes inclusive language in new release
======
The project is working to eliminate racism and other harmful prejudices
from the project's code and community.
![Two diverse hands holding a globe][1]

During this development cycle, the [Ansible][2] project has made significant progress in its goals to make the community and code more welcoming and inclusive. With the release of Ansible Core 2.11, harmful terminology in the Ansible codebase is deprecated and it comes with new replacement terms. These changes will follow our standard deprecation cycle to give users time to adapt.

### Why this? Why now?

Summer 2020 was a watershed moment in world culture that placed a very stark spotlight on inequities around the world, lingering societal remnants of the past, and present effects of racism and other harmful prejudices. Ansible recognizes that racism comes in many forms and that some of the most prevalent and insidious forms are found in how our history intersects with everyday language.

In the spirit of harm reduction, and in keeping with a saying we have: "Be kind, Be open, Be accountable, Be Ansible," a coalition within the Ansible community reviewed the Ansible codebase and documentation and made alternative terminology recommendations across the board. This effort will continue to be introspective and sensitive to the effects of language and terminology on our community and the broader world.

### What changes were made?

#### Master branches are now "main"

Over the summer, we updated the branch naming for the collections maintained by Ansible. Going forward, "main" will be the default branch for all repositories in the Ansible and Ansible collections GitHub organizations.

#### Deprecated terminology

We reviewed the [Ansible Core][3] codebase for harmful language and made changes where we found these terms in the [code][4] and the [documentation][5]. Harmful language will remain available via aliases for a full deprecation cycle (four releases) to ensure users have an opportunity to update their Ansible configurations and usage. These changes include:

Deprecated term | New term available in Ansible Core 2.11
---|---
whitelist (e.g., callback_whitelist, DEFAULT_CALLBACK_WHITELIST) | enabled (e.g., callback_enabled, CALLBACKS_ENABLED)
blacklist (e.g., BLACKLIST_EXTS, BLACKLIST_DIRS) | reject (e.g., REJECT_EXTS, REJECTLIST_DIRS)
master machine / node | controller machine / node

### When

These changes will be included in the Ansible 4.0 package, which will be released on May 18th, 2021.

### How to get involved

The Ansible community maintains a large number of repositories and codebases. We do not believe our work is complete, and the effort to eradicate harmful language from the project will continue. Red Hat is proud to be a participating organization in the [Inclusive Naming Initiative][6]. The Ansible project looks forward to continuing to work with the community to make Ansible the most welcoming and inclusive space it can be.

We invite members of the Ansible community to join in this effort by connecting with our [Diversity and Inclusion working group][7].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/inclusive-language-ansible

作者：[Jill Rouleau][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jillr
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/world_hands_diversity.png?itok=zm4EDxgE (Two diverse hands holding a globe)
[2]: https://docs.ansible.com/ansible/devel/index.html
[3]: https://github.com/ansible/ansible
[4]: https://github.com/ansible/ansible/pull/70028
[5]: https://github.com/ansible/ansible/pull/70082
[6]: https://inclusivenaming.org/
[7]: https://github.com/ansible/community/wiki/Diversity
