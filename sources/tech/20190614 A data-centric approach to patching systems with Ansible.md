[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A data-centric approach to patching systems with Ansible)
[#]: via: (https://opensource.com/article/19/6/patching-systems-ansible)
[#]: author: (Mark Phillips https://opensource.com/users/markp/users/markp)

A data-centric approach to patching systems with Ansible
======
Use data and variables in Ansible to control selective patching.
![metrics and data shown on a computer screen][1]

When you're patching Linux machines these days, I could forgive you for asking, "How hard can it be?" Sure, a **yum update -y** will sort it for you in a flash.

![Animation of updating Linux][2]

But for those of us working with more than a handful of machines, it's not that simple. Sometimes an update can create unintended consequences across many machines, and you're left wondering how to put things back the way they were. Or you might think, "Should I have applied the critical patch on its own and saved myself a lot of pain?"

Faced with these sorts of challenges in the past led me to build a way to cherry-pick the updates needed and automate their application.

### A flexible idea

Here's an overview of the process:

![Overview of the Ansible patch process][3]

This system doesn't permit machines to have direct access to vendor patches. Instead, they're selectively subscribed to repositories. Repositories contain only the patches that are required––although I'd encourage you to give this careful consideration so you don't end up with a proliferation (another management overhead you'll not thank yourself for creating).

Now patching a machine comes down to 1) The repositories it's subscribed to and 2) Getting the "thumbs up" to patch. By using variables to control both subscription and permission to patch, we don't need to tamper with the logic (the plays); we only need to alter the data.

Here is an [example Ansible role][4] that fulfills both requirements. It manages repository subscriptions and has a simple variable that controls running the patch command.


```
\---
# tasks file for patching

\- name: Include OS version specific differences
include_vars: "{{ ansible_distribution }}-{{ ansible_distribution_major_version }}.yml"

\- name: Ensure Yum repositories are configured
template:
src: template.repo.j2
dest: "/etc/yum.repos.d/{{ item.label }}.repo"
owner: root
group: root
mode: 0644
when: patching_repos is defined
loop: "{{ patching_repos }}"
notify: patching-clean-metadata

\- meta: flush_handlers

\- name: Ensure OS shipped yum repo configs are absent
file:
path: "/etc/yum.repos.d/{{ patching_default_repo_def }}"
state: absent

# add flexibility of repos here
\- name: Patch this host
shell: 'yum update -y'
args:
warn: false
when: patchme|bool
register: result
changed_when: "'No packages marked for update' not in result.stdout"
```

### Scenarios

In our fictitious, large, globally dispersed environment (of four hosts), we have:

  * Two web servers
  * Two database servers
  * An application comprising one of each server type



OK, so this number of machines isn't "enterprise-scale," but remove the counts and imagine the environment as multiple, tiered, geographically dispersed applications. We want to patch elements of the stack across server types, application stacks, geographies, or the whole estate.

![Example patch groups][5]

Using only changes to variables, can we achieve that flexibility? Sort of. Ansible's [default behavior][6] for hashes is to overwrite. In our example, the **patching_repos** variable for the **db1** and **web1** hosts are overwritten because of their later occurrence in our inventory. Hmm, a bit of a pickle. There are two ways to manage this:

  1. Multiple inventory files
  2. [Change the variable behavior][7]



I chose number one because it maintains clarity. Once you start merging variables, it's hard to find where a hash appears and how it's put together. Using the default behavior maintains clarity, and it's the method I'd encourage you to stick with for your own sanity.

### Get on with it then

Let's run the play, focusing only on the database servers.

Did you notice the final step— **Patch this host** —says **skipping**? That's because we didn't set [the controlling variable][8] to do the patching. What we have done is set up the repository subscriptions to be ready.

So let's run the play again, limiting it to the web servers and tell it to do the patching. I ran this example with verbose output so you can see the yum updates happening.

Patching an application stack requires another inventory file, as mentioned above. Let's rerun the play.

Patching hosts in the European geography is the same scenario as the application stack, so another inventory file is required.

Now that all the repository subscriptions are configured, let's just patch the whole estate. Note the **app1** and **emea** groups don't need the inventory here––they were only being used to separate the repository definition and setup. Now, **yum update -y** patches everything. If you didn't want to capture those repositories, they could be configured as **enabled=0**.

### Conclusion

The flexibility comes from how we group our hosts. Because of default hash behavior, we need to think about overlaps—the easiest way, to my mind at least, is with separate inventories.

With regard to repository setup, I'm sure you've already said to yourself, "Ah, but the cherry-picking isn't that simple!" There is additional overhead in this model to download patches, test that they work together, and bundle them with dependencies in a repository. With complementary tools, you could automate the process, and in a large-scale environment, you'd have to.

Part of me is drawn to just applying full patch sets as a simpler and easier way to go; skip the cherry-picking part and apply a full set of patches to a "standard build." I've seen this approach applied to both Unix and Windows estates with enforced quarterly updates.

I’d be interested in hearing your experiences of patching regimes, and the approach proposed here, in the comments below or [via Twitter][9].

Many companies still have massive data centres full of hardware. Here's how Ansible can help.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/patching-systems-ansible

作者：[Mark Phillips][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/markp/users/markp
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://opensource.com/sites/default/files/uploads/quick_update.gif (Animation of updating Linux)
[3]: https://opensource.com/sites/default/files/uploads/patch_process.png (Overview of the Ansible patch process)
[4]: https://github.com/phips/ansible-patching/blob/master/roles/patching/tasks/main.yml
[5]: https://opensource.com/sites/default/files/uploads/patch_groups.png (Example patch groups)
[6]: https://docs.ansible.com/ansible/2.3/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable
[7]: https://docs.ansible.com/ansible/2.3/intro_configuration.html#sts=hash_behaviour
[8]: https://github.com/phips/ansible-patching/blob/master/roles/patching/defaults/main.yml#L4
[9]: https://twitter.com/thismarkp
