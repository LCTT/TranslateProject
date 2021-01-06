[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 lines of code to improve your Ansible play)
[#]: via: (https://opensource.com/article/21/1/improve-ansible-play)
[#]: author: (Jeff Warncia https://opensource.com/users/jeffwarncia)

4 lines of code to improve your Ansible play
======
With a tiny bit of effort, you can help the next person by not just
mapping the safe path but leaving warnings about the dangers.
![A person programming][1]

Out in the blogosphere, which sings the virtues of infrastructure-as-code, continuous integration/continuous delivery (CI/CD) pipelines, code reviews, and testing regimes, it is easy to forget that such a well-engineered ivory tower is an ideal, not a reality. Imperfect systems haunt us, but we must ship something.

There are few towers less ivory than those created by gluing together APIs in the course of system automation. It is a brittle world. The pressures are enormous to get it "working," get it shipped, and move on.

### A problem to solve

Imagine a simple feature request: Write some [Ansible][2] code to create several records in an external system to record some details of a VLAN. I recently had an itch to do some lab administration work to fulfill this task. The external system is a well-known internet protocol address management (IPAM) tool, but the roadblocks are the same for a more abstract configuration management database (CMDB) or a record unrelated to networking. In this example, my immediate desire for creating a record is that alone—the system is only for record-keeping.

If the goal was a hyper-compact, straightforward, and dumb macro, it might work out to be 100 lines of code. If I had the API memorized, I might be able to bang it out in an hour, with the code doing nothing more than expected and leaving nothing but the exact, finished artifact behind. Exactly perfect for its purpose and entirely useless for any future expansion.

Nowadays, I'd expect almost everyone to start this task with a role and several task files, prepared to expand to what will be a dozen or so create, read, update, and delete (CRUD) operations. Because I'm not one of the people who know this API, I may spend between several hours and several days just fooling around with it, figuring out its internal patterns and craftsmanship, bridging the gap between its capabilities and my desires encoded in the code.

While researching the API, I discovered that creating a VLAN record requires a parent object _reference_. This looks something like a path fragment with random characters in it. Maybe it's a hash, or maybe it really is random; I don't know. I imagine that many down in the mud with a looming deadline might just copy and paste this arbitrary string into Ansible and move on with their lives. Ignoring the implementation details of the role, the obvious play-level task would be:


```
\- name: "Create VLAN"
  include_role:
    name: otherthing
    tasks_from: vlan_create.yml
  vars:
    vlan_name: "lab-infra"
    vlan_tag: 100
    vlan_view_ref: "vlan_view/747f602d-0381"
```

Unfortunately, that `vlan_view_ref` identifier isn't available except via the API, so even moving it to an inventory or extra variable doesn't help very much. The playbook's user would need to have some unusual level of understanding of the system to find out the correct reference ID.

In my lab-building situation, I will redeploy this system of record frequently. Therefore, the parent ID will change from day to day, and I don't want to have to figure it out manually each time. So I definitely must search for the reference by name. No problem:


```
\- name: Get Lab vlan view reference
  include_role:
    name: otherthing
    tasks_from: search_for.yml
  vars:
    _resource: vlan_view
    _query: "name={{ vlan_parent_view_name }}"
```

Ultimately, it makes a REST call. This "returns" JSON, which I stuff into `_otherthing_search_result` by convention and for ease of access outside the role. The `search_for.yml` implementation is abstract, and it always returns a dict of zero or more results.

Most Ansible developers, as evidenced by nearly all the real-world Ansible code I've ever read, would proceed as if all is great and directly access the expected single result:


```
\- name: Remember our default vlan view ref
  set_fact:
    _thatthig_vlan_view_ref: "{{ _otherthing_search_result[0]._ref }}"

\- name: "Create VLAN"
  include_role:
    name: otherthing
    tasks_from: vlan_create.yml
  vars:
    vlan_name: "lab-infra"
    vlan_tag: 100
    vlan_view_ref: "{{ vlan_parent_view_name }}"
```

But sometimes `_thatthing_search_result[0]` will be undefined, so `_thatthig_vlan_view_ref` will be undefined. Most likely, this is because the code ran in a different real-world environment and someone forgot to update `{{ vlan_parent_view_name }}` either in the inventory or from the command line. Or, fair or foul, maybe someone went into the tool's graphical user interface (GUI) and deleted the record or changed its name or something.

I know what you're thinking.

_"Well, don't do that. This is a no dumb venue. Be less dumb."_

Maybe I am OK with this situation and retort: "Ansible will tell you quite correctly `The error was: list object has no element 0` and even cough up a line number. What more do you want?" As the developer, of course, I know what that means—I just wrote it. I just came off three days of fooling around with the API. My mind is fresh.

### Tomorrow is another story

But by tomorrow, I'll probably forget what a vlan view reference is, and I'll definitely forget what is on line 30. If it goes wrong in a month, even if you manage to find me, I'll have to take an afternoon to decode the API guide again to figure out what went wrong.

And what if I'm out the door? What if I've turned the code over to an operations team, maybe an intern running it through [Tower][3], hand-feeding `vlan_view_name` into a survey or such? That line 30 is the problem is of no help to them.

Add comments, you say! Well, yes. I could write some terse prose in the code to help the developer next week or next month. This does not help the person running the code and whose job just failed, and it certainly doesn't help the business get done whatever it needs done.

Remember, we are all-powerful in the moment. In writing code or skipping writing code, we do it from a position of strength and knowledge. We have taken hours, or even days, assimilating the documentation, the reality, the other bugs, the other problems, and we have left behind code, comments, and maybe even documentation. We write code that shares that success, and success is what our users want. But there was a lot of failure in that learning; we can leave that behind, too.

### Leave a message in code

`Error on line 30` helps no one. At the absolute minimum, I can handle the obvious error case with a better error message:


```
  - name: Fail if zero vlan views returned
     fail:
       msg: "Got 0 results from searching for VLAN view {{ vlan_parent_view_name }}. Please verify exists in otherthing, and is accessible by the service account."
     when: _otherthing_search_result | length == 0
```

In four lines of code (and zero additional thinking), I have specific, helpful advice to whoever comes next—that hapless operations team member, or more likely me in a month—about the real-world problem that really isn't about the code at all. This message allows anyone to discover a simple copy/paste error or that the system of record changed. No Ansible knowledge needed, no 3am page to a developer to "look at line 30."

But wait! There's more!

In learning about `otherthing`, I learned it was, well, kinda dumb in one critical respect. Many, if not all, of its record types have no uniqueness constraint, and several identical records may exist. A vlan view is defined as having a name, a start ID, and an end ID; other record types are similarly simple and obviously should be a unique tuple—based both on reality and the abstract concept of database normalization. But `otherthing` allows duplicate tuples, despite it never conceptually being possible.

In my lab, I'm happy enough to try and remember not to do that. In a corporate production environment, I might write a policy. Either way, experience tells me that the system will get corrupted, it will get corrupted at a bad time, and it might take a long time for these problems to become, well, a problem.

With `Error on line 30`, an otherwise reasonably experienced Ansible developer might recognize that as being "record not found" without knowing anything else, and this would be enough to fix the problem. But it's much, much worse to have `_thatthing_search_result[0]` only sometimes the correct `vlan_view_ref`—it allows the world to be broken, silently. And the error may manifest itself somewhere else entirely; perhaps a security audit six months from now will flag this as inconsistent record-keeping, and if there are several tools and manual access, it might take days or weeks to track down the fact that this particular code was at fault.

In several days of fumbling around with the API, I learned this. I wasn't looking for problems; if it was documented, I did not see it. So I come to the point of this essay. Rather than dismiss this impossible situation as being because its a lab, fixing it, and moving on, I took two minutes to leave behind _code_—not a comment, not a mental note, not documentation—but code that will always run, that covers this impossible situation:


```
  - name: Fail if &gt;1 views returned
     fail:
       msg: "Got {{ _otherthing_search_result | length }} results from searching for VLAN view {{ vlan_parent_view_name }}. Otherthing allows this, but is not handled by this code."
     when: _otherthing_search_result | length &gt; 1
```

I manually created the failure condition, so I could manually test this condition. I hope it will never run in real-world use, but I am confident it will.

If (when) that error happens in production, then someone can decide what to do. I'd expect them to fix the bad data. If it happens a lot, I'd hope they would track down the other broken system. If they demand this code be removed, and this code does the undefined and wrong thing, that is their prerogative and a place where I don't want to work. The code is imperfect, but it is complete. The work of a craftsman.

Automation in the real world is an iterative process that fights with and uses imperfect systems equally. It will never handle all the exceptional situations. It might not even handle all the normal situations. Working code that passes lint, code reviews, and acceptance tests is code that handles the safe and needed path. With a tiny bit of effort, you can help out the next person by not just mapping the safe path but leaving behind warnings to the dangers you found.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/improve-ansible-play

作者：[Jeff Warncia][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffwarncia
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://www.ansible.com/
[3]: https://www.ansible.com/products/tower
