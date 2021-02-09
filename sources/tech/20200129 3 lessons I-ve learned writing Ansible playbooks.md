[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 lessons I've learned writing Ansible playbooks)
[#]: via: (https://opensource.com/article/20/1/ansible-playbooks-lessons)
[#]: author: (Jeff Geerling https://opensource.com/users/geerlingguy)

3 lessons I've learned writing Ansible playbooks
======
Avoid common pitfalls and supercharge your Ansible playbook maintenance
by following these best practices.
![plastic game pieces on a board][1]

I've used Ansible since 2013 and maintain some of my original playbooks to this day. They have evolved with Ansible from version 1.4 to the current version (as of this writing, 2.9).

Along the way, as Ansible grew from having dozens to hundreds and now thousands of modules, I've learned a lot about how to make sure my playbooks are maintainable and scalable as my systems grow. Even for simple projects (like the [playbook I use to manage my own laptop][2]), it pays dividends to avoid common pitfalls and make decisions that will make the future you thankful instead of regretful.

The three main takeaways from this experience are:

  1. Stay organized
  2. Test early and often
  3. Simplify, optimize



The importance of each lesson I've learned follows in that order, too; it's no use trying to optimize something (point 3) that's already poorly assembled (point 1). Each step builds on the one above, so I'll guide you through each step.

### Stay organized

![Organized bins of equipment][3]

At a bare minimum, you should **store your Ansible playbooks in a Git repository**. This helps with so many things:

  1. Once you have a known working state, you can commit the work (ideally, with tags marking major versions, like 1.0.0 for the first stable version and 2.0.0 for an upgrade or rewrite).
  2. You can always walk back changes if necessary to a previous known-working state (e.g., by using `git reset` or `git checkout <tag>`).
  3. Large-scale changes (e.g., feature additions or a major upgrade) can be worked on in a branch, so you can still maintain the existing playbook and have adequate time to work on major changes.



Storing playbooks in Git also helps with the second important organization technique: **run your playbooks from a build server**.

Whether you use [Ansible Tower][4], [Jenkins][5], or some other build system, using a central interface for playbook runs gives you consistency and stability—you don't risk having one admin run a playbook one way (e.g., with the wrong version of roles or an old checkout) and someone else running it another way, breaking your servers.

It also helps because it forces you to ensure all your playbook's resources are encapsulated in the playbook's repository and build configuration. Ideally, the entire build (including the job configuration) would be captured in the repository (e.g., through the use of a `Jenkinsfile` or its equivalent).

Another important aspect to organization is **documentation**; at a bare minimum, I have a README in every playbook repository with the following contents:

  * The playbook's purpose
  * Links to relevant resources (CI build status, external documentation, issue tracking, primary contacts)
  * Instructions for local testing and development



Even if you have the playbook automated through a build server, it is important to have thorough and correct documentation for how to run the playbook otherwise (e.g., locally in a test environment). I like to make sure my projects are easily approachable—not only for others who might eventually need to work with them but also myself! I often forget a nuance or dependency when running a playbook, and the README is the perfect place to outline any peculiarities.

Finally, the _structure_ of the Ansible tasks themselves are important, and I like to ensure I have a maintainable structure by having **small, readable task files** and by extracting related sets of tasks into **Ansible roles**.

Generally, if an individual playbook reaches around 100 lines of YAML, I'll start breaking it up into separate task files and using `include_tasks` to include those files. If I find a set of tasks that operates independently and could be broken out into its own [Ansible role][6], I'll work on extracting those tasks and related handlers, variables, and templates.

Using roles is the best way to supercharge Ansible playbook maintenance; I often have to do similar tasks in many (if not most) playbooks, like managing user accounts or installing and configuring a web server or database. Abstracting these tasks into Ansible roles means I can maintain one set of tasks to be used among many playbooks, with variables to give flexibility where needed.

Ansible roles can also be contributed back to the community via [Ansible Galaxy][7] if you're able to make them generic and provide the code with an open source license. I have contributed over a hundred roles to Galaxy, and they are made better by the fact that thousands of other playbooks (besides my own) rely on them and break if there is a bug in the role.

One final note on roles: If you choose to use external roles (either from Galaxy or a private Git repository), I recommend committing the role to your repository (instead of adding it to a `.gitignore` file and downloading the role every time you run your playbook) because I like to avoid relying on downloads from Ansible Galaxy for every playbook run. You should still use a `requirements.yml` file to define role dependencies and define specific versions for the roles so you can choose when to upgrade your dependencies.

### Test early and often

![A stack of computer boards][8]

Ansible allows you to define infrastructure as code. And like any software, it is essential to be able to verify that the code you write does what you expect.

Like any software, it's best to _test_ your Ansible playbooks. And when I consider testing for any individual Ansible project I build, I think of a spectrum of CI testing options I can use, going in order from the easiest to hardest to implement:

  1. `yamllint`
  2. `ansible-playbook --syntax-check`
  3. `ansible-lint`
  4. [Molecule test][9] (integration tests)
  5. `ansible-playbook --check` (testing against production)
  6. Building parallel infrastructure



The first three options (linting and running a syntax check on your playbook) are essentially free; they run very fast and can help you avoid the most common problems with your playbook's task structure and formatting.

They provide some value, but unless the playbook is extremely simple, I like to go beyond basic linting and run tests using [Molecule][9]. I usually use Molecule's built-in Docker integration to run my playbook against a local Docker instance running the same base OS as my production server. For some of my roles, which I run on different Linux distributions (e.g., CentOS and Debian), I run the Molecule test playbook once for each distro—and sometimes with extra test scenarios for more complex roles.

If you're interested in learning how to test roles with Molecule, I wrote a blog post on the topic a couple of years ago called [Testing your Ansible roles with Molecule][10]. The process for testing full playbooks is similar, and in both cases, the tests can be run inside most CI environments (for example, my [geerlingguy.apache][11] role runs a suite of [Molecule tests via Travis CI][12]).

The final two test options, running the playbook in `--check` mode or building parallel production infrastructure, require more setup work and often go beyond what's necessary for efficient testing processes. But in cases where playbooks manage servers critical to business revenue, they can be necessary.

There are a few other things that are important to watch for when running tests and periodically checking or updating your playbooks:

  * Make sure you track (and fix) any `DEPRECATION WARNING`s you see in Ansible's output. Usually, you'll have a year or two before the warning leads to a failure in the latest Ansible version, so the earlier you can update your playbook code, the better.
  * Every Ansible version has a [porting guide][13]) that is extremely helpful when you're updating from one version to the next.
  * If you see annoying `WARN` messages in playbook output when you're using a module like `command`, and you know you can safely ignore them, you can add a `warn: no` under the `args` in a task. It's better to squelch these warnings so that more actionable warnings (like deprecation warnings) will be noticed at a glance.



Finally, I like to make sure my CI environments are always running the latest Ansible release (and not locked into a specific version that I know works with my playbooks), because I know if a playbook will break right after the new release comes out. My build server is locked into a specific Ansible version, which may be one or two versions behind the latest version, so this gives me the time to ensure I fix any new issues discovered in CI tests before I upgrade my build server to the latest version.

### Simplify, optimize

![Charging AirPods][14]

> "YAML is not a programming language."
>  — Jeff Geerling

Simplicity in your playbooks makes maintenance and future changes a lot easier. Sometimes I'll look at a playbook and be puzzled as to what's happening because there are multiple `when` and `until` conditions with a bunch of Python mixed in with Jinja filters.

If I start to see more than one or two chained filters or Python method calls (especially anything having to do with regular expressions), I see that as a prime candidate for rewriting the required functionality as an Ansible module. The module could be maintained in Python and tested independently and would be easier to maintain as strictly Python code rather than mixing in all the Python inline with your YAML task definitions.

So my first point is: Stick to Ansible's modules and simple task definitions as much as possible. Try to use Jinja filters wherever possible, and avoid chaining more than one or two filters on a variable at a time. If you have a lot of complex inline Python or Jinja, it's time to consider refactoring it into a custom Ansible module.

Another common thing I see people do, especially when building out roles the first time, is using complex dict variables where separate "flat" variables may be more flexible.

For example, instead of having an **apache** role with many options in one giant dict, like this:


```
apache:
  startservers: 2
  maxclients: 2
```

And consider using separate flat variables:


```
apache_startservers: 2
apache_maxclients: 2
```

The reason for this is simple: Using flat variables allows playbooks to override one particular value easily, without having to redefine the entire dictionary. This is especially helpful when you have dozens (or in some rare cases, _hundreds_) of default variables in a role.

Once the playbook and role code looks good, it's time to start thinking about **optimization**.

A few of the first things I look at are:

  * Can I disable `gather_facts`? Not every playbook needs all the facts, and it adds a bit of overhead on every run, on every server.
  * Can I increase the number of `forks` Ansible uses? The default is five, but if I have 50 servers, can I operate on 20 or 25 at a time to vastly reduce the amount of time Ansible takes to run a playbook on all the servers?
  * In CI, can I parallelize test scenarios? Instead of running one test, then the next, if I can start all the tests at once, it will make my CI test cycle much faster. If CI is slow, you'll tend to ignore it or not wait until the test run is complete, so it's important to make sure your test cycle is short.



When I'm looking through tasks in a role or playbook, I also look for a few blatant performance issues that are common with certain modules:

  * When using `package` (or `apt`, `yum`, `dnf`, etc.), if there is more than one package being managed, the list should be passed directly to the `name` parameter and not via `with_items` or a `loop`—this way Ansible can efficiently operate on the whole list in one go instead of doing it package by package.
  * When using `copy`, how many files are being copied? If there is a single file or even a few dozen, it might be fine, but the `copy` module is very slow if you have hundreds or thousands of files to be copied (better to use a module like `synchronize` or a different strategy like copying a tarball and expanding it on the server).
  * If using `lineinfile` in a loop, it might be more efficient (and sometimes easier to maintain) to use `template` instead and control the entire file in one pass.



Once I've gotten most of the low-hanging fruit out of the way, I like to profile my playbook, and Ansible has some built-in tools for this. You can configure extra callback plugins to measure role and task performance by setting the `callback_whitelist` option under `defaults` in your `ansible.cfg`:


```
[defaults]
callback_whitelist = profile_roles, profile_tasks, timer
```

Now, when you run your playbook, you get a summary of the slowest roles and tasks at the end:


```
Monday 10 September       22:31:08 -0500 (0:00:00.851)       0:01:08.824 ******
===============================================================================
geerlingguy.docker ------------------------------------------------------ 9.65s
geerlingguy.security ---------------------------------------------------- 9.33s
geerlingguy.nginx ------------------------------------------------------- 6.65s
geerlingguy.firewall ---------------------------------------------------- 5.39s
geerlingguy.munin-node -------------------------------------------------- 4.51s
copy -------------------------------------------------------------------- 4.34s
geerlingguy.backup ------------------------------------------------------ 4.14s
geerlingguy.htpasswd ---------------------------------------------------- 4.13s
geerlingguy.ntp --------------------------------------------------------- 3.94s
geerlingguy.swap -------------------------------------------------------- 2.71s
template ---------------------------------------------------------------- 2.64s
...
```

If anything takes more than a few seconds, it might be good to figure out exactly why it's taking so long.

### Summary

I hope you learned a few ways you can make your Ansible Playbooks more maintainable; as I said in the beginning, each of the three takeaways (stay organized, test, then simplify and optimize) builds on the previous, so start by making sure you have clean, documented code, then make sure it's well-tested, and finally look at how you can make it even better and faster!

* * *

_This article is a follow up to Jeff's presentation, [Make your Ansible playbooks flexible, maintainable, and scalable][15], at AnsibleFest 2018, which you can [watch here][16]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/ansible-playbooks-lessons

作者：[Jeff Geerling][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/geerlingguy
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team-game-play-inclusive-diversity-collaboration.png?itok=8sUXV7W1 (plastic game pieces on a board)
[2]: https://github.com/geerlingguy/mac-dev-playbook
[3]: https://opensource.com/sites/default/files/uploads/organized.jpg (Organized bins of equipment)
[4]: https://www.ansible.com/products/tower
[5]: https://jenkins.io
[6]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html
[7]: https://galaxy.ansible.com
[8]: https://opensource.com/sites/default/files/uploads/test-early-often.jpg (A stack of computer boards)
[9]: https://molecule.readthedocs.io/en/stable/
[10]: https://www.jeffgeerling.com/blog/2018/testing-your-ansible-roles-molecule
[11]: https://github.com/geerlingguy/ansible-role-apache
[12]: https://travis-ci.org/geerlingguy/ansible-role-apache
[13]: https://docs.ansible.com/ansible/latest/porting_guides/porting_guides.html
[14]: https://opensource.com/sites/default/files/uploads/simplify-optimize.jpg (Charging AirPods)
[15]: https://www.jeffgeerling.com/blog/2019/make-your-ansible-playbooks-flexible-maintainable-and-scalable-ansiblefest-austin-2018
[16]: https://www.youtube.com/watch?v=kNDL13MJG6Y
