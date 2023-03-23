[#]: subject: "5 tips for choosing an Ansible collection that's right for you"
[#]: via: "https://opensource.com/article/21/3/ansible-collections"
[#]: author: "Tadej Borovšak https://opensource.com/users/tadeboro"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 tips for choosing an Ansible collection that's right for you
======
Try these strategies to find and vet collections of Ansible plugins and modules before you install them.

![Women in computing and open source][1]

Image by: Ray Smith

In August 2020, Ansible issued its first release since the developers split the core functionality from the vast majority of its modules and plugins. A few [basic Ansible modules][2] remain part of core Ansible—modules for templating configuration files, managing services, and installing packages. All the other modules and plugins found their homes in dedicated [Ansible collections][3].

This article offers a quick look at Ansible collections in general and—especially—how to recognize high-quality ones.

### What are Ansible collections?

At its core, an Ansible collection is a collection (pun intended) of related modules and plugins that you can manage independently from Ansible's core engine. For example, the [Sensu Go Ansible collection][4] contains Ansible content for managing all aspects of Sensu Go. It includes Ansible roles for installing Sensu Go components and modules for creating, updating, and deleting monitoring resources. Another example is the [Sops Ansible collection][5] that integrates [Mozilla's Secret Operations editor][6] with Ansible.

With the introduction of Ansible collections, [Ansible Galaxy][7] became the central hub for all Ansible content. Authors publish their Ansible collections there, and Ansible users use Ansible Galaxy's search function to find Ansible content they need.

Ansible comes bundled with the `ansible-galaxy` tool for installing collections. Once you know what Ansible collection you want to install, things are relatively straightforward: Run the installation command listed on the Ansible Galaxy page. Ansible takes care of downloading and installing it. For example:

```
$ ansible-galaxy collection install sensu.sensu_go
Process install dependency map
Starting collection install process
Installing 'sensu.sensu_go:1.7.1' to
  '/home/user/.ansible/collections/ansible_collections/sensu/sensu_go'
```

But finding the Ansible collection you need and vetting its contents are the harder parts.

### How to select an Ansible collection

In the old times of monolithic Ansible, using third-party Ansible modules and plugins was not for the faint of heart. As a result, most users used whatever came bundled with their version of Ansible.

The ability to install Ansible collections offered a lot more control over the content you use in your Ansible playbooks. You can install the core Ansible engine and then equip it with the modules, plugins, and roles you need. But, as always, with great power comes great responsibility.

Now users are solely responsible for the quality of content they use to build Ansible playbooks. But how can you separate high-quality content from the rest? Here are five things to check when evaluating an Ansible collection.

#### 1. Documentation

Once you find a potential candidate on Ansible Galaxy, check its documentation first. In an ideal world, each Ansible collection would have a dedicated documentation site. For example, the [Sensu Go][8] and [F5 Networks][9] Ansible collections have them. Most other Ansible collections come only with a README file, but this will change for the better once the documentation tools mature.

The Ansible collection's documentation should contain at least a quickstart tutorial with installation instructions. This part of the documentation aims to have users up and running in a matter of minutes. For example, the Sensu Go Ansible collection has a [dedicated quickstart guide][10], while the Sops Ansible collection includes this information in [its README][11] file.

Another essential part of the documentation is a detailed module, plugin, and role reference guide. Collection authors do not always publish those guides on the internet, but they should always be accessible with the `ansible-doc` tool.

```
$ ansible-doc community.sops.sops_encrypt
> SOPS_ENCRYPT    (/home/tadej/.ansible/collections/ansible>

        Allows to encrypt binary data (Base64 encoded), text
        data, JSON or YAML data with sops.

  * This module is maintained by The Ansible Community
OPTIONS (= is mandatory):

- attributes
        The attributes the resulting file or directory should
        have.
        To get supported flags look at the man page for
        `chattr' on the target system.
        This string should contain the attributes in the same
        order as the one displayed by `lsattr'.
        The `=' operator is assumed as default, otherwise `+'
        or `-' operators need to be included in the string.
        (Aliases: attr)[Default: (null)]
        type: str
        version_added: 2.3
...
```

#### 2. Playbook readability

An Ansible playbook should serve as a human-readable description of the desired state. To achieve that, modules from the Ansible collection under evaluation should have a consistent user interface and descriptive parameter names.

For example, if Ansible modules interact with a web service, authentication parameters should be separated from the rest. And all modules should use the same authentication parameters if possible.

```
- name: Create a check that runs every 30 seconds
  sensu.sensu_go.check:
    auth: &auth
      url: https://my.sensu.host:8080
      user: demo
      password: demo-pass
    name: check
    command: check-cpu.sh -w 75 -c 90
    interval: 30
    publish: true

- name: Create a filter
  sensu.sensu_go.filter:
     # Reuse the authentication data from before
    auth: *auth
    name: filter
    action: deny
    expressions:
       - event.check.interval == 10
      - event.check.occurrences == 1
```

#### 3. Basic functionality

Before you start using third-party Ansible content in production, always check each Ansible module's basic functionality.

Probably the most critical property to look for is the result. Ansible modules and roles that enforce a state are much easier to use than their action-executing counterparts. This is because you can update your Ansible playbook and rerun it without risking a significant breakage.

```
- name: Command module executes an action -> fails on re-run
  ansible.builtin.command: useradd demo

- name: User module enforces a state -> safe to re-run
  ansible.builtin.user:
    name: demo
```

You should also expect support for [check mode][12], which simulates the change without making it. If you combine check mode with state enforcement, you get a configuration drift detector for free.

```
$ ansible-playbook --check playbook.yaml

PLAY [host] ************************************************

TASK [Create user] *****************************************
ok: [host]

...

PLAY RECAP *************************************************
host        : ok=5    changed=2    unreachable=0    failed=0
                      skipped=3        rescued=0   ignored=0
```

#### 4. Implementation robustness

A robustness check is a bit harder to perform if you've never developed an Ansible module or role before. Checking the continuous integration/continuous delivery (CI/CD) configuration files should give you a general idea of what is tested. Finding `ansible-test` and `molecule` commands in the test suite is an excellent sign.

#### 5. Maintenance

During your evaluation, you should also take a look at the issue tracker and development activity. Finding old issues with no response from maintainers is one sign of a poorly maintained Ansible collection.

Judging the health of a collection by the development activity is a bit trickier. No commits in the last year are a sure sign of an unmaintained Ansible collection because the Ansible ecosystem is developing rapidly. Seeing a few commits per month is usually a sign of a mature project that receives timely updates.

### Time well-spent

Evaluating Ansible collections is not an entirely trivial task. Hopefully, these tips will make your selection process somewhat more manageable. It does take time and effort to find the appropriate content for your use case. But with automation becoming an integral part of almost everything, all this effort is well-spent and will pay dividends in the future.

If you are thinking about creating your own Ansible Collection, you can download a [free eBook from Steampunk][13] packed full of advice on building and maintaining high-quality Ansible integrations.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/ansible-collections

作者：[Tadej Borovšak][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tadeboro
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/OSDC_women_computing_3.png
[2]: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/
[3]: https://docs.ansible.com/ansible/latest/collections/index.html#list-of-collections
[4]: https://galaxy.ansible.com/sensu/sensu_go
[5]: https://galaxy.ansible.com/community/sops
[6]: https://github.com/mozilla/sops
[7]: https://galaxy.ansible.com/
[8]: https://sensu.github.io/sensu-go-ansible/
[9]: https://clouddocs.f5.com/products/orchestration/ansible/devel/
[10]: https://sensu.github.io/sensu-go-ansible/quickstart-sensu-go-6.html
[11]: https://github.com/ansible-collections/community.sops#using-this-collection
[12]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_checkmode.html#using-check-mode
[13]: https://steampunk.si/pdf/Importance_of_High_quality_Ansible_Collections_XLAB_Steampunk_ebook.pdf
