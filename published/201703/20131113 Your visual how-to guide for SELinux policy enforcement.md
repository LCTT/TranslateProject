看漫画学 SELinux 强制策略
============================================================

![SELinux policy guide](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life-uploads/selinux_rules_lead_image.png?itok=jxV7NgtD "Your visual how-to guide for SELinux policy enforcement") 

>图像来自:  opensource.com

今年是我们一起庆祝 SELinux 纪念日的第十个年头了（LCTT 译者注：本文发表于 2013 年）。真是太难以置信了！SELinux 最初在 Fedora Core 3 中被引入，随后加入了红帽企业版 Linux 4。从来没有使用过 SELinux 的家伙，你可要好好儿找个理由了…… 

SElinux 是一个标签型系统。每一个进程都有一个标签。操作系统中的每一个文件/目录客体（object）也都有一个标签。甚至连网络端口、设备，乃至潜在的主机名都被分配了标签。我们把控制访问进程的标签的规则写入一个类似文件的客体标签中，这些规则我们称之为策略（policy）。内核强制实施了这些规则。有时候这种“强制”被称为强制访问控制体系（Mandatory Access Control）（MAC）。

一个客体的拥有者对客体的安全属性并没有自主权。标准 Linux 访问控制体系，拥有者/分组 + 权限标志如 rwx，常常被称作自主访问控制（Discretionary Access Control）（DAC）。SELinux 没有文件 UID 或拥有权的概念。一切都被标签控制，这意味着在没有至高无上的 root 权限进程时，也可以设置 SELinux 系统。

**注意：** _SELinux不允许你摒弃 DAC 控制。SELinux 是一个并行的强制模型。一个应用必须同时支持 SELinux 和 DAC 来完成特定的行为。这可能会导致管理员迷惑为什么进程被拒绝访问。管理员被拒绝访问是因为在 DAC 中有些问题，而不是在 SELinux 标签。

### 类型强制

让我们更深入的研究下标签。SELinux 最主要的“模型”或“强制”叫做类型强制（type enforcement）。基本上这意味着我们根据进程的类型来定义其标签，以及根据文件系统客体的类型来定义其标签。

_打个比方_

想象一下在一个系统里定义客体的类型为猫和狗。猫（CAT）和狗（DOG）都是进程类型（process type）。

![Image showing a cartoon of a cat and dog.](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_01_catdog.png) 

我们有一类希望能与之交互的客体，我们称之为食物。而我希望能够为食物增加类型：`cat_food` （猫的食物）和 `dog_food`（狗的食物）。

![Cartoon Cat eating Cat Food and Dog eating Dog Food](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_03_foods.png) 

作为一个策略制定者，我可以说一只狗有权限去吃狗粮（`dog_chow`），而一只猫有权限去吃猫粮（`cat_chow`）。在 SELinux 中我可以将这条规则写入策略中。

![allow cat cat_chow:food eat; allow dog dog_chow:food eat](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_04_policy.png "SELinux rule") 

`allow cat cat_chow:food eat;`

`允许 猫 猫粮：食物 吃；`

`allow dog dog_chow:food eat;`

`允许 狗 狗粮：食物 吃；`

有了这些规则，内核会允许猫进程去吃打上猫粮标签 `cat_chow` 的食物，允许狗去吃打上狗粮标签 `dog_chow` 的食物。

![Cartoon Cat eating Cat Food and Dog eating Dog Food](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_02_eat.png) 

此外，在 SELinux 系统中，由于禁止是默认规则，这意味着，如果狗进程想要去吃猫粮 `cat_chow`，内核会阻止它。

![](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_06_tux-dog-leash.png) 

同理，猫也不允许去接触狗粮。

 ![Cartoon cat not allowed to eat dog fooda](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_07_tux-cat-no.png "Cartoon cat not allowed to eat dog fooda") 

_现实例子_

我们将 Apache 进程标为 `httpd_t`，将 Apache 上下文标为 `httpd_sys_content_t` 和 `httpdsys_content_rw_t`。假设我们把信用卡数据存储在 MySQL 数据库中，其标签为 `msyqld_data_t`。如果一个 Apache 进程被劫持，黑客可以获得 `httpd_t` 进程的控制权，从而能够去读取 `httpd_sys_content_t` 文件并向 `httpd_sys_content_rw_t` 文件执行写操作。但是黑客却不允许去读信用卡数据（`mysqld_data_t`），即使 Apache 进程是在 root 下运行。在这种情况下 SELinux 减轻了这次闯入的后果。

### 多类别安全强制

_打个比方_

上面我们定义了狗进程和猫进程，但是如果你有多个狗进程：Fido 和 Spot，而你想要阻止 Fido 去吃 Spot 的狗粮 `dog_chow` 怎么办呢?

![SELinux rule](https://opensource.com/sites/default/files/resize/images/life-uploads/mcs-enforcement_02_fido-eat-spot-food-500x251.png "SELinux rule") 

一个解决方式是创建大量的新类型，如 `Fido_dog` 和 `Fido_dog_chow`。但是这很快会变得难以驾驭因为所有的狗都有差不多相同的权限。

为了解决这个问题我们发明了一种新的强制形式，叫做多类别安全（Multi Category Security）（MCS）。在 MCS 中，我们在狗进程和狗粮的标签上增加了另外一部分标签。现在我们将狗进程标记为 `dog:random1(Fido)` 和 `dog:random2(Spot)`。 

![Cartoon of two dogs fido and spot](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_01_fido-spot.png) 

我们将狗粮标记为 `dog_chow:random1(Fido)` 和 `dog_chow:random2(Spot)`。

![SELinux rule](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_03_foods.png "SELinux rule") 

MCS 规则声明如果类型强制规则被遵守而且该 MCS 随机标签正确匹配，则访问是允许的，否则就会被拒绝。

Fido (`dog:random1`) 尝试去吃 `cat_chow:food` 被类型强制拒绝了。

![Cartoon of Kernel (Penquin) holding leash to prevent Fido from eating cat food.](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_04-bad-fido-cat-chow.png) 

Fido (`dog:random1`) 允许去吃 `dog_chow:random1`。 

![Cartoon Fido happily eating his dog food](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_05_fido-eat-fido-food.png) 

Fido (`dog:random1`) 去吃 spot(`dog_chow:random2`)的食物被拒绝。

![Cartoon of Kernel (Penquin) holding leash to prevent Fido from eating spots dog food.](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_06_fido-no-spot-food.png) 

_现实例子_

在计算机系统中我们经常有很多具有同样访问权限的进程，但是我们又希望它们各自独立。有时我们称之为多租户环境（multi-tenant environment）。最好的例子就是虚拟机。如果我有一个运行很多虚拟机的服务器，而其中一个被劫持，我希望能够阻止它去攻击其它虚拟机和虚拟机镜像。但是在一个类型强制系统中 KVM 虚拟机被标记为 `svirt_t` 而镜像被标记为 `svirt_image_t`。 我们允许 `svirt_t` 可以读/写/删除标记为 `svirt_image_t` 的上下文。通过使用 libvirt 我们不仅实现了类型强制隔离，而且实现了 MCS 隔离。当 libvirt 将要启动一个虚拟机时，它会挑选出一个 MCS 随机标签如 `s0:c1,c2`，接着它会将 `svirt_image_t:s0:c1,c2` 标签分发给虚拟机需要去操作的所有上下文。最终，虚拟机以 `svirt_t:s0:c1,c2` 为标签启动。因此，SELinux 内核控制 `svirt_t:s0:c1,c2` 不允许写向 `svirt_image_t:s0:c3,c4`，即使虚拟机被一个黑客劫持并接管，即使它是运行在 root 下。

我们在 OpenShift 中使用[类似的隔离策略][8]。每一个 gear（user/app process）都有相同的 SELinux 类型（`openshift_t`）（LCTT 译注：gear 为 OpenShift 的计量单位）。策略定义的规则控制着 gear 类型的访问权限，而一个独一无二的 MCS 标签确保了一个 gear 不能影响其他 gear。

请观看[这个短视频][9]来看 OpenShift gear 切换到 root 会发生什么。

### 多级别安全强制

另外一种不经常使用的 SELinux 强制形式叫做多级别安全（Multi Level Security）（MLS）；它开发于上世纪 60 年代，并且主要使用在受信操作系统上如 Trusted Solaris。

其核心观点就是通过进程使用的数据等级来控制进程。一个 _secret_ 进程不能读取 _top secret_ 数据。

MLS 很像 MCS，除了它在强制策略中增加了支配的概念。MCS 标签必须完全匹配，但一个 MLS 标签可以支配另一个 MLS 标签并且获得访问。

_打个比方_

不讨论不同名字的狗，我们现在来看不同种类。我们现在有一只格雷伊猎犬和一只吉娃娃。

![Cartoon of a Greyhound and a Chihuahua](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_01_chigrey.png) 

我们可能想要允许格雷伊猎犬去吃任何狗粮，但是吉娃娃如果尝试去吃格雷伊猎犬的狗粮可能会被呛到。

我们把格雷伊猎犬标记为 `dog:Greyhound`，把它的狗粮标记为 `dog_chow:Greyhound`，把吉娃娃标记为 `dog:Chihuahua`，把它的狗粮标记为 `dog_chow:Chihuahua`。

![Cartoon of a Greyhound dog food and a Chihuahua dog food.](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_04_mlstypes.png) 

使用 MLS 策略，我们可以使 MLS 格雷伊猎犬标签支配吉娃娃标签。这意味着 `dog:Greyhound` 允许去吃 `dog_chow:Greyhound` 和 `dog_chow:Chihuahua`。

![SELinux rule](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_05_chigreyeating.png "SELinux rule") 

但是 `dog:Chihuahua` 不允许去吃 `dog_chow:Greyhound`。 

![Cartoon of Kernel (Penquin) stopping the Chihahua from eating the greyhound food.  Telling him it would be a big too beefy for him.](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_03_chichoke.png) 

当然，由于类型强制， `dog:Greyhound` 和 `dog:Chihuahua` 仍然不允许去吃 `cat_chow:Siamese`，即使 MLS 类型 GreyHound 支配 Siamese。

![Cartoon of Kernel (Penquin) holding leash to prevent both dogs from eating cat food.](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_06_nocatchow.png) 

_现实例子_

有两个 Apache 服务器：一个以 `httpd_t:TopSecret` 运行，一个以 `httpd_t:Secret` 运行。如果 Apache 进程 `httpd_t:Secret` 被劫持，黑客可以读取 `httpd_sys_content_t:Secret` 但会被禁止读取 `httpd_sys_content_t:TopSecret`。

但是如果运行 `httpd_t:TopSecret` 的 Apache 进程被劫持，它可以读取 `httpd_sys_content_t:Secret` 数据和 `httpd_sys_content_t:TopSecret` 数据。

我们在军事系统上使用 MLS，一个用户可能被允许读取 _secret_ 数据，但是另一个用户在同一个系统上可以读取 _top secret_ 数据。

### 结论

SELinux 是一个功能强大的标签系统，控制着内核授予每个进程的访问权限。最主要的特性是类型强制，策略规则定义的进程访问权限基于进程被标记的类型和客体被标记的类型。也引入了另外两个控制手段，分离有着同样类型进程的叫做 MCS，而 MLS，则允许进程间存在支配等级。

_*所有的漫画都来自 [Máirín Duffy][6]_

--------------------------------------------------------------------------------

作者简介：

Daniel J Walsh - Daniel Walsh 已经在计算机安全领域工作了将近 30 年。Daniel 与 2001 年 8 月加入红帽。

-------------------------

via: https://opensource.com/business/13/11/selinux-policy-guide

作者：[Daniel J Walsh][a]
译者：[xiaow6](https://github.com/xiaow6)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rhatdan
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://opensource.com/article/16/11/managing-devices-linux?src=linux_resource_menu
[4]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://opensource.com/users/mairin
[7]:https://opensource.com/business/13/11/selinux-policy-guide?rate=XNCbBUJpG2rjpCoRumnDzQw-VsLWBEh-9G2hdHyB31I
[8]:http://people.fedoraproject.org/~dwalsh/SELinux/Presentations/openshift_selinux.ogv
[9]:http://people.fedoraproject.org/~dwalsh/SELinux/Presentations/openshift_selinux.ogv
[10]:https://opensource.com/user/16673/feed
[11]:https://opensource.com/business/13/11/selinux-policy-guide#comments
[12]:https://opensource.com/users/rhatdan
