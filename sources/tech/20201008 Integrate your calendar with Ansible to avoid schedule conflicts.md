[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Integrate your calendar with Ansible to avoid schedule conflicts)
[#]: via: (https://opensource.com/article/20/10/calendar-ansible)
[#]: author: (Nicolas Leiva https://opensource.com/users/nicolas-leiva)

Integrate your calendar with Ansible to avoid schedule conflicts
======
Make sure your automation workflow's schedule doesn't conflict with
something else by integrating a calendar app into Ansible.
![Calendar close up snapshot][1]

Is "anytime" a good time to execute your automation workflow? The answer is probably no, for different reasons.

If you want to avoid simultaneous changes to minimize the impact on critical business processes and reduce the risk of unintended service disruptions, then no one else should be attempting to make changes at the same time your automation is running.

In some scenarios, there could be an ongoing scheduled maintenance window. Or maybe there is a big event coming up, a critical business time, or a holiday—or maybe you prefer not to make changes on a Friday night.

![Street scene with a large calendar and people walking][2]

([Curtis MacNewton][3], [CC BY-ND 2.0][4])

Whatever the reason, you want to signal this information to your automation platform and prevent the execution of periodic or ad-hoc tasks during specific time slots. In change management jargon, I am talking about specifying blackout windows when change activity should not occur.

### Calendar integration in Ansible

How can you accomplish this in [Ansible][5]? While it has no calendar function per se, Ansible's extensibility will allow it to integrate with any calendar application that has an API.

The goal is this: Before you execute any automation or change activity, you execute a `pre-task` that checks whether something is already scheduled in the calendar (now or soon enough) and confirms you are not in the middle of a blocked timeslot.

Imagine you have a fictitious module named `calendar`, and it can connect to a remote calendar, like Google Calendar, to determine if the time you specify has otherwise been marked as busy. You could write a playbook that looks like this:


```
\- name: Check if timeslot is taken
  calendar:
    time: "{{ ansible_date_time.iso8601 }}"
  register: output
```

Ansible facts will give `ansible_date_time`, which is passed to the `calendar` module to verify the time availability so that it can register the response (`output`) to use in subsequent tasks.

If your calendar looks like this:

![Google Calendar screenshot][6]

(Nicolas Leiva, [CC BY-SA 4.0][7])

Then the output of this task would highlight the fact this timeslot is taken (`busy: true`):


```
ok: [localhost] =&gt; {
   "output": {
       "busy": true,
       "changed": false,
       "failed": false,
       "msg": "The timeslot 2020-09-02T17:53:43Z is busy: true"
   }
}
```

### Prevent tasks from running

Next, [Ansible Conditionals][8] will help prevent the execution of any further tasks. As a simple example, you could use a `when` statement on the next task to enforce that it runs only when the field `busy` in the previous output is not `true`:


```
tasks:
  - shell: echo "Run this only when not busy!"
    when: not output.busy
```

### Conclusion

In a [previous article][9], I said Ansible is a framework to wire things together, interconnecting different building blocks to orchestrate an end-to-end automation workflow.

This article looked at how playbooks can integrate or talk to a calendar application to check availability. However, I am just scratching the surface! For example, your tasks could also block a timeslot in the calendar… the sky is the limit.

In my next article, I will dig into how the `calendar` module is built and how other programming languages can be used with Ansible. Stay tuned if you are a [Go][10] fan like me!

* * *

_This originally appeared on Medium as [Ansible and Google Calendar integration for change management][11] under a CC BY-SA 4.0 license and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/calendar-ansible

作者：[Nicolas Leiva][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nicolas-leiva
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT (Calendar close up snapshot)
[2]: https://opensource.com/sites/default/files/uploads/street-calendar.jpg (Street scene with a large calendar and people walking)
[3]: https://www.flickr.com/photos/7841127@N02/4217116202
[4]: https://creativecommons.org/licenses/by-nd/2.0/
[5]: https://docs.ansible.com/ansible/latest/index.html
[6]: https://opensource.com/sites/default/files/uploads/googlecalendarexample.png (Google Calendar screenshot)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.html
[9]: https://medium.com/swlh/python-and-ansible-to-automate-a-network-security-workflow-28b9a44660c6
[10]: https://golang.org/
[11]: https://medium.com/swlh/ansible-and-google-calendar-integration-for-change-management-7c00553b3d5a
