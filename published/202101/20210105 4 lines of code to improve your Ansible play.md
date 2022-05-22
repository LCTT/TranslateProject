[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13046-1.html)
[#]: subject: (4 lines of code to improve your Ansible play)
[#]: via: (https://opensource.com/article/21/1/improve-ansible-play)
[#]: author: (Jeff Warncia https://opensource.com/users/jeffwarncia)

改进你的 Ansible 剧本的 4 行代码
======

> 只要付出一点点努力，你就可以帮助下一个人，不只是绘制出安全路径，还可以留下危险的警告。

![](https://img.linux.net.cn/data/attachment/album/202101/23/225612fowskoyyk1gtwtog.jpg)

在博客圈里，人们对基础架构即代码、持续集成/持续交付（CI/CD）管道、代码审查和测试制度赞不绝口，但人们很容易忘记，这种精心设计的象牙塔只是一种理想，而不是现实。虽然不完美的系统困扰着我们，但我们必须交付一些东西。

在系统自动化的过程中，很少有比那些通过粘合 API 创建的象牙塔更脆弱的塔。这是一个脆弱的世界。要让它“工作起来”，交付它，然后继续前进，压力巨大。

### 要解决的问题

想象一个简单的功能请求：编写一些 [Ansible][2] 代码，在外部系统中创建几条记录，以记录一个 VLAN 的一些详细信息。我最近很想做一些实验室的管理工作来完成这个任务。这个外部系统是一个常见的<ruby>互联网协议地址管理<rt>Internet Protocol Address Management</rt></ruby>（IPAM）工具，但对于一个更抽象的<ruby>配置管理数据库<rt>Configuration Management DataBase</rt></ruby>（CMDB）或一个与网络无关的记录来说，困难是一样的。在这个例子中，我创建一个记录的直接愿望就是让系统保存记录而已。

如果我们的目标是一个超紧凑的、直接的、笨拙的宏，那么它可能用 100 行代码就能写出来。如果我记得 API，我也许能在一个小时内把它敲出来，该代码的作用不会超过预期，除了确切的成品之外，什么也没留下。对它的目的而言是完美的，但是对未来的扩展毫无用处。

如今，我希望几乎每个人都能从一个<ruby>角色<rt>role</rt></ruby>和几个<ruby>任务<rt>task</rt></ruby>文件开始这项任务，准备扩展到十几个创建、读取、更新和删除（CRUD）操作。因为我不了解这个 API，我可能会花上几个小时到几天的时间，仅仅是摆弄它，弄清楚它的内部模式和工艺，弥和它的功能和我用代码编写出来的意图之间的差距。

在研究 API 的时候，我发现创建一个 VLAN 记录需要一个父对象引用 `vlan_view_ref`。这看起来像一个路径片段，里面有随机字符。也许它是一个哈希，也许它真的是随机的，我不确定。我猜想，许多在泥泞中挣扎的人，在迫在眉睫的截止日期前，可能会把这个任意的字符串复制粘贴到 Ansible 中，然后继续混下去。忽略这个<ruby>角色<rt>role</rt></ruby>的实现细节，显而易见这个<ruby>剧本<rt>playbook</rt></ruby>级的任务应该是这样：

```
- name: "Create VLAN"
  include_role:
    name: otherthing
    tasks_from: vlan_create.yml
  vars:
    vlan_name: "lab-infra"
    vlan_tag: 100
    vlan_view_ref: "vlan_view/747f602d-0381"
```

不幸的是，除了通过 API，`vlan_view_ref` 标识符是不可用的，所以即使把它移到<ruby>清单文件<rt>inventory</rt></ruby>或额外的变量中也没有什么帮助。<ruby>剧本<rt>playbook</rt></ruby>的用户需要对系统有一些更深入的理解，才能找出正确的引用 ID。

在实验室建设的情况下，我会经常重新部署这个记录系统。因此，这个父对象引用 ID 每天都会发生变化，我不希望每次都要手动找出它。所以，我肯定要按名称搜索该引用。没问题：

```
- name: Get Lab vlan view reference
  include_role:
    name: otherthing
    tasks_from: search_for.yml
  vars:
    _resource: vlan_view
    _query: "name={{ vlan_parent_view_name }}"
```

最终，它进行了一个 REST 调用。这将“返回” 一个 JSON，按照惯例，为了便于在角色外访问，我把它填充进了 `_otherthing_search_result` 中，。`search_for.yml` 的实现是抽象的，它总是返回一个包含零或多个结果的字典。

正如我读过的几乎所有真实世界的 Ansible 代码所证明的那样，大多数 Ansible 开发者将会继续前进，好像一切都很好，并且可以直接访问预期的单个结果：

```
- name: Remember our default vlan view ref
  set_fact:
    _thatthig_vlan_view_ref: "{{ _otherthing_search_result[0]._ref }}"

- name: "Create VLAN"
  include_role:
    name: otherthing
    tasks_from: vlan_create.yml
  vars:
    vlan_name: "lab-infra"
    vlan_tag: 100
    vlan_view_ref: "{{ vlan_parent_view_name }}"
```

但有时 `_otherthing_search_result[0]` 是未定义的，所以 `_thatthig_vlan_view_ref` 也将是未定义的。很有可能是因为代码运行在不同的真实环境中，而有人忘记了在清单中或在命令行中更新 `{{ vlan_parent_view_name }}`。或者，无论公平与否，也许有人进入了工具的图形用户界面（GUI），删除了记录或更改了它的名称什么的。

我知道你在想什么。

_“好吧，不要这样做。这是一个没有哑巴的场所。不要那么笨。”_。

也许我对这种情况还算满意，反驳道：“Ansible 会很正确的告诉你`错误是：list 对象没有元素 0`，甚至会带个行号。你还想怎样？”作为开发者，我当然知道这句话的意思 —— 我刚写的代码。我刚从三天的和 API 斗智斗勇中走出来，我的脑子很清醒。

### 明天是另一个故事

但是到了明天，我可能会忘记什么是父对象引用，我肯定会忘记第 30 行上的内容。如果一个月后出了问题，就算你能找到我，我也得花一个下午的时间重新解读 API 指南，才能搞清楚到底出了什么问题。

而如果我出门了呢？如果我把代码交给了一个运维团队，也许是一个实习生通过 [Tower][3] 来运行，把 `vlan_view_name` 手动输入到表单之类的东西呢？那第 30 行出的问题是对他们没有帮助的。

你说，加注释吧! 嗯，是的。我可以在代码中写一些梗概，以帮助下周或下个月的开发人员。这对运行代码的人没有帮助，他的“工作”刚刚失败，当然对于企业也无济于事。

记住，我们此刻无所不能。在写代码或者跳过写代码的时候，我们是站在实力和知识的立场上进行的。我们花了几个小时，甚至几天的时间，研究了文档、现实、其他 bug、其他问题，我们留下了代码、注释，甚至可能还有文档。我们写的代码是分享成功的，而成功正是我们用户想要的。但是在这种学习中也有很多失败的地方，我们也可以留下这些。

### 在代码中留言

“第 30 行有错误”对任何人都没有帮助。至少，我可以用更好的错误信息来处理明显的错误情况：

```
  - name: Fail if zero vlan views returned
     fail:
       msg: "Got 0 results from searching for VLAN view {{ vlan_parent_view_name }}. Please verify exists in otherthing, and is accessible by the service account."
     when: _otherthing_search_result | length == 0
```

在这四行代码中（没有额外的思考），我把具体的、有用的建议留给了下一个人 —— 那个无助的运维团队成员，或者更有可能是一个月后的我 —— 这是关于现实世界中的问题，其实根本不是关于代码的。这条消息可以让任何人发现一个简单的复制/粘贴错误，或者记录系统发生了变化。不需要 Ansible 知识，不需要凌晨 3 点给开发人员发短信“看看第 30 行”。

但是等等！还有更多！

在了解 `otherthing` 的过程中，我了解到它在一个关键的方面，嗯，还挺笨的。它的许多记录类型（如果不是全部的话）没有唯一性约束，可能存在几个相同的记录。VLAN 视图被定义为有一个名称、一个开始 ID 和一个结束 ID；其他记录类型也同样简单，显然这应该是一个唯一的元组 —— 基于现实和数据库规范化的抽象概念。但 `otherthing` 允许重复的元组，尽管在概念上讲永远不可能。

在我的实验室里，我很乐意尝试并记住不要这样做。在企业生产环境中，我可能会写一个策略。不管是哪种方式，经验告诉我，系统会被破坏，会在倒霉的时候被破坏，而且可能需要很长时间才能让这些问题发酵成，嗯，一个问题。

对于 “第 30 行有错误”，一个本来有丰富经验的 Ansible 开发者可能会认识到这是“记录没有找到”，而不用知道其他的事情就足以解决这个问题。但如果 `_otherthing_search_result[0]` 只有有时是正确的 `vlan_view_ref`，那就糟糕多了，它让整个世界被破坏，而悄无声息。而这个错误可能完全表现在其他地方，也许六个月后的安全审计会将其标记为记录保存不一致，如果有多种工具和人工访问方式，可能需要几天或几周的时间才能发现这个特定代码出错的事实。

在几天对 API 的摸索中，我学到了这一点。我不是在找问题，如果有记录，我没有看到。所以我来到了这篇文章的重点。我没有因为它是一个实验室，修复它，然后继续前进而忽略了这种不可能的情况，而是花了两分钟留下了_代码_ —— 不是注释，不是心理笔记，不是文档 —— 而是会一直运行的代码，涵盖了这种不可能的情况：

```
  - name: Fail if > 1 views returned
     fail:
       msg: "Got {{ _otherthing_search_result | length }} results from searching for VLAN view {{ vlan_parent_view_name }}. Otherthing allows this, but is not handled by this code."
     when: _otherthing_search_result | length > 1
```

我手动创建了失败条件，所以我可以手动测试这个条件。我希望它永远不会在实际使用中运行，但我觉得它会。

如果（当）这个错误发生在生产环境中，那么有人可以决定该怎么做。我希望他们能修复坏数据。如果它经常发生，我希望他们能追踪到另一个损坏的系统。如果他们要求删除这段代码，而这段代码做了未定义和错误的事情，那是他们的特权，也是我不想工作的地方。代码是不完美的，但它是完整的。这是匠人的工作。

现实世界中的自动化是一个迭代的过程，它与不完美的系统进行斗争，并平等地使用。它永远不会处理所有的特殊情况。它甚至可能无法处理所有的正常情况。通过 Lint、代码审查和验收测试的工作代码是处理安全和所需路径的代码。只要付出一点点努力，你就可以帮助下一个人，不仅仅是绘制安全路径，还可以对你发现的危险留下警告。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/improve-ansible-play

作者：[Jeff Warncia][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffwarncia
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://www.ansible.com/
[3]: https://www.ansible.com/products/tower
