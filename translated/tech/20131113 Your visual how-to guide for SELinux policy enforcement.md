
看漫画学 SELinux 强制策略
============================================================

 ![SELinux policy guide](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life-uploads/selinux_rules_lead_image.png?itok=jxV7NgtD "Your visual how-to guide for SELinux policy enforcement") 
>图像来自:  opensource.com

今年是我们一起庆祝 SELinux 纪念日的第十个年头了。真是太难以置信了！SELinux 最初在 Fedora Core 3 中被引入，随后加入了红帽企业版 Linux 4。从来没有使用过 SELinux 的家伙，你可要好好儿找个理由了…… 

更多的 Linux 资源

*   [Linux 是什么？][1]
*   [Linux 容器是什么？][2]
*   [在 Linux 中操作设备][3]
*   [立刻下载： Linux 命令小抄][4]
*   [我们最新的 Linux 文章][5]

SElinux 是一个标签型系统。每一个进程都有一个标签。操作系统中的每一个文件/目录客体都有一个标签。甚至连网络端口、设备和潜在的主机名称都被分配了标签。我们把控制访问进程标签的规则写入一个类似文件的客体标签中。我们称之为_策略_。内核加强了这些规则。有时候这种加强被称为强制访问控制体系 （MAC）。

一个客体的拥有者在客体的安全属性下没有自主权。标准 Linux 访问控制体系，拥有者/分组 + 权限标志如 rwx，常常被称作自主访问控制（DAC）。SELinux 没有文件 UID 或 拥有权的概念。一切都被标签控制。意味着配置一个 SELinux 系统可以没有一个功能强大的根进程。

**注意：** _SELinux不允许你摒弃 DAC 控制。SELinux 是一个并行的强制模型。一个应用必须同时支持 SELinux 和 DAC 来完成特定的行为。这可能会导致管理员迷惑为什么进程返回拒绝访问。管理员看到拒绝访问是因为 DAC 出了问题，而不是 SELinux标签。

### 类型强制

让我们更深入的研究下标签。SELinux 最主要的模型或强制叫做_类型强制_。基本上这意味着我们通过一个进程的类型来定义它的标签，通过文件系统客体的类型来定义它的标签。

_打个比方_

想象一下在一个系统里定义客体的类型为猫和狗。猫（CAT）和狗（DOG）都是进程类型（PROCESS TYPES）。

_*所有的漫画都来自 [Máirín Duffy][6]_

 ![Image showing a cartoon of a cat and dog.](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_01_catdog.png) 

我们有一类客体希望能够和我们称之为食物的东西交互。而我希望能够为食物增加类型：_cat_food_ （猫粮）和 _dog_food_（狗粮）。

 ![Cartoon Cat eating Cat Food and Dog eating Dog Food](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_03_foods.png) 

作为一个策略制定者，我可以说一只狗有权限去吃狗粮（DOG_CHOW），而一只猫有权限去吃猫粮（CAT_CHOW）。在 SELinux 中我可以将这条规则写入策略中。

 ![allow cat cat_chow:food eat; allow dog dog_chow:food eat](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_04_policy.png "SELinux rule") 

allow cat cat_chow:food eat;

允许 猫 猫粮 吃；

allow dog dog_chow:food eat;

允许 狗 狗粮 吃；

有了这些规则，内核会允许猫进程去吃打上猫粮标签 _cat_chow_ 的食物，允许狗去吃打上狗粮标签 _dog_chow_ 的食物。

 ![Cartoon Cat eating Cat Food and Dog eating Dog Food](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_02_eat.png) 

但是在 SELinux 系统中，一切都是默认被禁止的。这意味着，如果狗进程想要去吃猫粮 _cat_chow_，内核会阻止它。

 ![](https://opensource.com/sites/default/files/images/life-uploads/type-enforcement_06_tux-dog-leash.png) 

同理，猫也不允许去接触狗粮。

 ![Cartoon cat not allowed to eat dog fooda](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_07_tux-cat-no.png "Cartoon cat not allowed to eat dog fooda") 

_现实例子_

我们将 Apache 进程标为 _httpd_t_，将 Apache 上下文标为 _httpd_sys_content_t_ 和 _httpdsys_content_rw_t_。想象一下我们把信用卡数据存储在 mySQL 数据库中，其标签为 _msyqld_data_t_。如果一个 Apache 进程被劫持，黑客可以获得 _httpd_t_ 进程的控制权而且允许去读取 _httpd_sys_content_t_ 文件并向 _httpd_sys_content_rw_t_ 执行写操作。但是黑客却不允许去读信用卡数据（_mysqld_data_t_），即使 Apache 进程是在 root 下运行。在这种情况下 SELinux 减轻了这次闯入的后果。



### 多类别安全强制

_打个比方_

上面我们定义了狗进程和猫进程，但是如果你有多个狗进程：Fido 和 Spot，而你想要阻止 Fido 去吃 Spot 的狗粮 _dog_chow_ 怎么办呢?

 ![SELinux rule](https://opensource.com/sites/default/files/resize/images/life-uploads/mcs-enforcement_02_fido-eat-spot-food-500x251.png "SELinux rule") 

一个解决方式是创建大量的新类型，如 _Fido_dog_ 和 _Fido_dog_chow_。但是这很快会变得难以驾驭因为所有的狗都有差不多相同的权限。

为了解决这个问题我们发明了一种新的强制形式，叫做多类别安全（MCS）。在 MCS 中，我们在狗进程和狗粮的标签上增加了另外一部分标签。现在我们将狗进程标记为 _dog:random1(Fido)_ 和 _dog:random2(Spot)_。 

 ![Cartoon of two dogs fido and spot](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_01_fido-spot.png) 

我们将狗粮标记为_dog_chow:random1(Fido)_ 和 _dog_chow:random2(Spot)_。

 ![SELinux rule](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_03_foods.png "SELinux rule") 

MCS 规则声明如果类型强制规则被遵守而且随机 MCS 标签正确匹配，则访问是允许的，否则就会被拒绝。

Fido (dog:random1) 尝试去吃 _cat_chow:food_ 被类型强制拒绝了。

 ![Cartoon of Kernel (Penquin) holding leash to prevent Fido from eating cat food.](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_04-bad-fido-cat-chow.png) 

Fido (dog:random1) 允许去吃 _dog_chow:random1._ 

 ![Cartoon Fido happily eating his dog food](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_05_fido-eat-fido-food.png) 

Fido (dog:random1) 去吃 spot( _dog_chow:random2_ )的食物被拒绝.

 ![Cartoon of Kernel (Penquin) holding leash to prevent Fido from eating spots dog food.](https://opensource.com/sites/default/files/images/life-uploads/mcs-enforcement_06_fido-no-spot-food.png) 

_现实例子_

在计算机系统中我们经常有很多具有同样访问权限的进程，但是我们又希望它们各自独立。有时我们称之为_多租户环境_。最好的例子就是虚拟机。如果我有一个运行很多虚拟机的服务器，而其中一个被劫持，我希望能能够阻止它去攻击其它虚拟机和虚拟机镜像。但是在一个类型强制系统中 KVM 虚拟机被标记为 _svirt_t_ 而镜像被标记为 _svirt_image_t_。 我们有权限允许 _svirt_t_ 可以读/写/删除标记为 _svirt_image_t_ 的上下文。通过使用 libvirt 我们不仅实现了类型强制隔离，而且实现了 MCS 隔离。当 libvirt 将要启动一个虚拟机，它会挑选出一个随机 MCS 标签如 _s0:c1,c2_，接着它会将 _svirt_image_t:s0:c1,c2_ 标签分发给虚拟机需要去操作的所有上下文。最终，虚拟机以 _svirt_t:s0:c1,c2_ 为标签启动。因此，SELinux 内核控制 _svirt_t:s0:c1,c2_ 不允许写向 _svirt_image_t:s0:c3,c4_，即使虚拟机被一个黑客劫持并接管。即使它是运行在 root 下。

我们在 OpenShift 中使用[类似的隔离策略][8]。每一个 gear（user/app process）都有相同的 SELinux 类型（openshift_t）（译者注：gear 为 OpenShift 的计量单位）。策略定义的规则控制着 gear 类型的访问权限，而一个独一无二的 MCS 标签确保了一个 gear 不能影响其他 gear。

请观看[这个短视频][9]来看 OpenShift gear 切换到 root 会发生什么。

### MLS enforcement

多级别安全强制

另外一种不经常使用的 SELinux 强制形式叫做 多级别安全（MLS）；它于 60 年代被开发并且主要使用在受信的操作系统上如 Trusted Solaris。

核心观点就是通过进程使用的数据等级来控制进程。一个 _secret_ 进程不能读取 _top secret_ 数据。

MLS 很像 MCS，除了它在强制策略中增加了支配概念。MCS 标签必须完全匹配，但 一个 MLS 标签可以支配另一个 MLS 标签并且获得访问。

_打个比方_

不讨论不同名字的狗，我们现在来看不同种类。我们现在有一只灰狗和一只吉娃娃。

 ![Cartoon of a Greyhound and a Chihuahua](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_01_chigrey.png) 

我们可能想要允许灰狗去吃任何狗粮，但是吉娃娃如果尝试去吃灰狗的狗粮可能会被呛到。

我们把灰狗标记为 _dog:Greyhound_，把它的狗粮标记为 _dog_chow:Greyhound_，把吉娃娃标记为 _dog:Chihuahua_，把它的狗粮标记为 _dog_chow:Chihuahua_。

 ![Cartoon of a Greyhound dog food and a Chihuahua dog food.](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_04_mlstypes.png) 

使用 MLS 策略，我们可以使 MLS 灰狗标签支配吉娃娃标签。这意味着 _dog:Greyhound_  允许去吃 _dog_chow:Greyhound_ 和  _dog_chow:Chihuahua_ 。

 ![SELinux rule](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_05_chigreyeating.png "SELinux rule") 

但是 _dog:Chihuahua_ 不允许去吃 _dog_chow:Greyhound_。 

 ![Cartoon of Kernel (Penquin) stopping the Chihahua from eating the greyhound food.  Telling him it would be a big too beefy for him.](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_03_chichoke.png) 

当然，由于类型强制， _dog:Greyhound_  和  _dog:Chihuahua_ 仍然不允许去吃 _cat_chow:Siamese_，即使 MLS 类型 GreyHound 支配 Siamese。

 ![Cartoon of Kernel (Penquin) holding leash to prevent both dogs from eating cat food.](https://opensource.com/sites/default/files/images/life-uploads/mls-enforcement_06_nocatchow.png) 

_现实例子_

有两个 Apache 服务器：一个以 _httpd_t:TopSecret_ 运行，一个以 _httpd_t:Secret_ 运行。如果 Apache 进程 _httpd_t:Secret_ 被劫持，黑客可以读取 _httpd_sys_content_t:Secret_ 但会被禁止读取 _httpd_sys_content_t:TopSecret_。

但是如果运行  _httpd_t:TopSecret_ 的 Apache 进程被劫持，它可以读取 _httpd_sys_content_t:Secret_ 数据和 _httpd_sys_content_t:TopSecret_ 数据。

我们在军事系统上使用 MLS，一个用户可能被允许读取 _secret_ 数据，但是另一个用户在同一个系统上可以读取 _top secret_ 数据。



### 结论

SELinux 是一个功能强大的标签系统，控制内核授予每个进程的访问权限。最主要的特性是类型强制，策略规则定义的进程访问权限基于进程被标记的类型和客体被标记的类型。另外两个控制手段也被引入，来独立有着同样类型进程的叫做 MCS，可以完全独立每个进程，而MLS，允许进程间存在支配等级。

--------------------------------------------------------------------------------

作者简介：

Daniel J Walsh - Daniel Walsh 已经在计算机安全领域工作了将近 30 年。Daniel 与 2001 年 8 月加入红帽。

-------------------------

via: https://opensource.com/business/13/11/selinux-policy-guide

作者：[Daniel J Walsh ][a]
译者：[xiaow6](https://github.com/xiaow6)
校对：[校对者ID](https://github.com/校对者ID)

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
