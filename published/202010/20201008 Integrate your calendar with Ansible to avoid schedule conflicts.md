[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12733-1.html)
[#]: subject: (Integrate your calendar with Ansible to avoid schedule conflicts)
[#]: via: (https://opensource.com/article/20/10/calendar-ansible)
[#]: author: (Nicolas Leiva https://opensource.com/users/nicolas-leiva)

将你的日历与 Ansible 集成，以避免与日程冲突
======

> 通过将日历应用集成到 Ansible 中，确保你的自动化工作流计划不会与其他东西冲突。

![](https://img.linux.net.cn/data/attachment/album/202010/18/221110wk9kd9ewrde11zxx.jpg)

“随时”是执行自动化工作流的好时机吗？出于不同的原因，答案可能是否定的。

如果要避免同时进行更改，以最大限度地减少对关键业务流程的影响，并降低意外服务中断的风险，则在你的自动化运行的同时，其他任何人都不应该试图进行更改。

在某些情况下，可能存在一个正在进行的计划维护窗口。或者，可能有大型事件即将来临、一个关键的业务时间、或者假期（你或许不想在星期五晚上进行更改）。

![Street scene with a large calendar and people walking][2]

无论出于什么原因，你都希望将此信息发送到你的自动化平台，以防止在特定时间段内执行周期性或临时任务。用变更管理的行话，我说的是当变更活动不应该发生时，指定封锁窗口。

### Ansible 中的日历集成

如何在 [Ansible][5] 中实现这个功能？虽然它本身没有日历功能，但 Ansible 的可扩展性将允许它与任何具有 API 的日历应用集成。

目标是这样的：在执行任何自动化或变更活动之前，你要执行一个 `pre-task` ，它会检查日历中是否已经安排了某些事情（目前或最近），并确认你没有在一个阻塞的时间段中。

想象一下，你有一个名为 `calendar` 的虚构模块，它可以连接到一个远程日历，比如 Google 日历，以确定你指定的时间是否已经以其他方式被标记为繁忙。你可以写一个类似这样的剧本：

```
- name: Check if timeslot is taken
  calendar:
    time: "{{ ansible_date_time.iso8601 }}"
  register: output
```

Ansible 实际会给出 `ansible_date_time`，将其传递给 `calendar` 模块，以验证时间的可用性，以便它可以注册响应 （`output`），用于后续任务。

如果你的日历是这样的：

![Google Calendar screenshot][6]

那么这个任务的输出就会指明这个时间段被占用的事实 （`busy: true`）：

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

### 阻止任务运行

接下来，[Ansible Conditionals][8] 将帮助阻止所有之后任务的执行。一个简单的例子，你可以在下一个任务上使用 `when` 语句来强制它只有当上一个输出中的 `busy` 字段不是 `true` 时，它才会运行：

```
tasks:
  - shell: echo "Run this only when not busy!"
    when: not output.busy
```

### 总结

在[上一篇文章][9]中，我说过 Ansible 是一个将事物连接在一起的框架，将不同的组成部分相互连接，以协调端到端自动化工作流。

这篇文章探讨了 Ansible 剧本如何与日历应用集成以检查可用性。然而，我只做了一些表面工作！例如，你的任务也可以阻止日历中的一个时间段，这里的发挥空间很大。

在我的下一篇文章中，我将深入 `calendar` 模块是如何构建的，以及其他编程语言如何与 Ansible 一起使用。如果你和我一样是 [Go][10] 的粉丝，请继续关注！

* * *

_这篇文章最初发表在 Medium 上，名为 [Ansible and Google Calendar integration for change management][11]，采用 CC BY-SA 4.0 许可，经许可后转载。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/calendar-ansible

作者：[Nicolas Leiva][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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
