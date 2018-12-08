使用Ansible来管理你的工作站：配置自动化
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/robot_arm_artificial_ai.png?itok=8CUU3U_7)

Ansible是一个令人惊讶的自动化的配置管理工具。主要应用在服务器和云部署上，但在工作站上的应用（无论是台式机还是笔记本）却得到了很少的关注，这就是本系列所要关注的。

在这个系列的第一部分，我会向你展示'ansible-pull'命令的基本用法，我们创建了一个安装了少量包的palybook.它本身是没有多大的用处的，但是它为后续的自动化做了准备。

在这篇文章中，所有的事件操作都是闭环的，而且在最后部分，我们将会有一个针对工作站自动配置的完整的工作解决方案。现在，我们将要设置Ansible的配置，这样未来将要做的改变将会自动的部署应用到我们的工作站上。现阶段，假设你已经完成了第一部分的工作。如果没有的话，当你完成的时候回到本文。你应该已经有一个包含第一篇文章中代码的Github库。我们将直接按照之前的方式创建。

首先，因为我们要做的不仅仅是安装包文件，所以我们要做一些重新的组织工作。现在，我们已经有一个名为'local.yml'并包含以下内容的playbook:
```
- hosts: localhost

  become: true

  tasks:

  - name: Install packages

    apt: name={{item}}

    with_items:

      - htop

      - mc

      - tmux

```

如果我们仅仅想实现一个任务那么上面的配置就足够了。随着向我们的配置中不断的添加内容，这个文件将会变的相当的庞大和杂乱。最好能够根据不同类型的配置将play文件分为独立的文件。为了达到这个要求，创建一个名为taskbook的文件，它和playbook很像但内容更加的流线型。让我们在Git库中为taskbook创建一个目录。
```
mkdir tasks

```

在'local.yml'playbook中的代码使它很好过过渡到成为安装包文件的taskbook.让我们把这个文件移动到刚刚创建好并新命名的目录中。

```
mv local.yml tasks/packages.yml

```
现在，我们编辑'packages.yml'文件将它进行大幅的瘦身，事实上，我们可以精简除了独立任务本身之外的所有内容。让我们把'packages.yml'编辑成如下的形式：
```
- name: Install packages

  apt: name={{item}}

  with_items:

    - htop

    - mc

    - tmux

```

正如你所看到的，它使用同样的语法，但我们去掉了对这个任务无用没有必要的所有内容。现在我们有了一个专门安装包文件的taskbook.然而我们仍然需要一个名为'local.yml'的文件，因为执行'ansible-pull'命令时仍然会去发现这个文件。所以我们将在我们库的根目录下（不是在'task'目录下）创建一个包含这些内容的全新文件：
```
- hosts: localhost

  become: true

  pre_tasks:

    - name: update repositories

      apt: update_cache=yes

      changed_when: False



  tasks:

    - include: tasks/packages.yml

```

这个新的'local.yml'扮演的是将要导入我们的taksbooks的主页的角色。我已经在这个文件中添加了一些你在这个系列中看不到的内容。首先，在这个文件的开头处，我添加了'pre——tasks',这个任务的作用是在其他所有任务运行之前先运行某个任务。在这种情况下，我们给Ansible的命令是让它去更新我们的分布存储库主页，下面的配置将执行这个任务要求：

```
apt: update_cache=yes

```
通常'apt'模块是用来安装包文件的，但我们也能够让它来更新库索引。这样做的目的是让我们的每个play在Ansible运行的时候能够以最新的索引工作。这将确保我们在使用一个老旧的索引安装一个包的时候不会出现问题。因为'apt'模块仅仅在Debian，Ubuntu和他们的衍生环境下工作。如果你运行的一个不同的环境，你期望在你的环境中使用一个特殊的模块而不是'apt'。如果你需要使用一个不同的模块请查看Ansible的相关文档。

下面这行值得以后解释：
```
changed_when: False

```
在独立任务中的这行阻止了Ansible去报告play改变的结果即使是它本身在系统中导致的一个改变。在这中情况下，我们不会去在意库索引是否包含新的数据；它几乎总是会的，因为库总是在改变的。我们不会去在意'apt'库的改变，因为索引的改变是正常的过程。如果我们删除这行，我们将在过程保告的后面看到所有的变动，即使仅仅库的更新而已。最好能够去忽略这类的改变。

接下来是常规任务的阶段，我们将创建好的taskbook导入。我们每次添加另一个taskbook的时候，要添加下面这一行：
```
tasks:

  - include: tasks/packages.yml

```

如果你将要运行'ansible-pull'命令，他应该向上一篇文章中的那样做同样重要的事情。 不同的是我们已经提高了我们的组织并且能够更有效的扩展它。'ansible-pull'命令的语法，为了节省你到上一篇文章中去寻找，参考如下：
```
sudo ansible-pull -U https://github.com/<github_user>/ansible.git

```
如果你还记得话，'ansible-pull'的命令拉取一个Git库并且应用了它所包含的配置。

既然我们的基础已经搭建好，我们现在可以扩展我们的Ansible并且添加功能。更特别的是，我们将添加配置来自动化的部署对工作站要做的改变。为了支撑这个要求，首先我们要创建一个特殊的账户来应用我们的Ansible配置。这个不是必要的，我们仍然能够在我们自己的用户下运行Ansible配置。但是使用一个隔离的用户能够将其隔离到不需要我们参与的在后台运行的一个系统进程中，

我们可以使用常规的方式来创建这个用户，但是既然我们正在使用Ansible,我们应该尽量避开使用手动的改变。替代的是，我们将会创建一个taskbook来处理用户的创建任务。这个taskbook目前将会仅仅创建一个用户，但你可以在这个taskbook中添加额外的plays来创建更多的用户。我将这个用户命名为'ansible'，你可以按照自己的想法来命名（如果你做了这个改变要确保更新所有的变动）。让我们来创建一个名为'user.yml'的taskbook并且将以下代码写进去：

```
- name: create ansible user

  user: name=ansible uid=900

```
下一步，我们需要编辑'local.yml'文件，将这个新的taskbook添加进去，像如下这样写：

```
- hosts: localhost

  become: true

  pre_tasks:

    - name: update repositories

      apt: update_cache=yes

      changed_when: False



  tasks:

    - include: tasks/users.yml

    - include: tasks/packages.yml

```
现在当我们运行'ansible-pull'命令的时候，一个名为'ansible'的用户将会在系统中被创建。注意我特地通过参数'UID'为这个用户声明了用户ID为900。这个不是必须的，但建议直接创建好UID。因为在1000以下的UID在登陆界面是不会显示的，这样是很棒的因为我们根本没有需要去使用'ansibe'账户来登陆我们的桌面。UID 900是固定的；它应该是在1000以下没有被使用的任何一个数值。你可以使用以下命令在系统中去验证UID 900是否已经被使用了：

```
cat /etc/passwd |grep 900

```
然而，你使用这个UID应该不会遇到什么问题，因为迄今为止在我使用的任何发行版中我还没遇到过它是被默认使用的。

现在，我们已经拥有了一个名为'ansible'的账户，它将会在之后的自动化配置中使用。接下来，我们可以创建实际的定时作业来自动操作它。而不是将其放置到我们刚刚创建的'users.yml'文件中，我们应该将其分开放到它自己的文件中。在任务目录中创建一个名为'cron.yml'的taskbook并且将以下的代买写进去：
```
- name: install cron job (ansible-pull)

  cron: user="ansible" name="ansible provision" minute="*/10" job="/usr/bin/ansible-pull -o -U https://github.com/<github_user>/ansible.git > /dev/null"

```
定时模块的语法几乎是不需加以说明的。通过这个play,我们创建了一个通过用户'ansible'运行的定时作业。这个作业将每隔10分钟执行一次，下面是它将要执行的命令：

```
/usr/bin/ansible-pull -o -U https://github.com/<github_user>/ansible.git > /dev/null

```
同样，我们也可以添加想要我们的所有工作站部署的额外定时作业到这个文件中。我们只需要在新的定时作业中添加额外的palys即可。然而，仅仅是添加一个定时的taskbook是不够的，我们还需要将它添加到'local.yml'文件中以便它能够被调用。将下面的一行添加到末尾：
```
- include: tasks/cron.yml

```
现在当'ansible-pull'命令执行的时候，它将会以通过用户'ansible'每个十分钟设置一个新的定时作业。但是，每个十分钟运行一个Ansible作业并不是一个好的方式因为这个将消耗很多的CPU资源。每隔十分钟来运行对于Ansible来说是毫无意义的除非欧文已经在Git库中改变一些东西。

然而，我们已经解决了这个问题。注意到我在定时作业中的命令'ansible-pill'添加的我们之前从未用到过的参数'-o'.这个参数告诉Ansible只有在从上次'ansible-pull'被调用以后库有了变化后才会运行。如果库没有任何变化，他将不会做任何事情。通过这个方法，你将不会无端的浪费CPU资源。当然，一些CPU资源将会在下来存储库的时候被使用，但不会像再一次应用整个配置的时候使用的那么多。当'ansible-pull'执行的时候，它将会遍历在playbooks和taskbooks中的所有任务，但至少它不会毫无目的的运行。

尽管我们已经添加了所有必须的配置要素来自动化'ansible-pull',它任然还不能正常的工作。'ansible-pull'命令需要sudo的权限来运行，这将允许它执行系统级的命令。然而我们创建的用户'ansible'并没有被设置为以'sudo'的权限来执行命令，因此当定时作业触发的时候，执行将会失败。通常沃恩可以使用命令'visudo'来手动的去设置用户'ansible'的拥有这个权限。然而我们现在应该以Ansible的方式来操作，而且这将会是一个向你展示'copy'模块是如何工作的机会。'copy'模块允许你从库复制一个文件到文件系统的任何位置。在这个案列中，我们将会复制'sudo'的一个配置文件到'/etc/sudoers.d/'以便用户'ansible'能够以管理员的权限执行任务。

打开'users.yml',将下面的play添加到文件末尾。

```
- name: copy sudoers_ansible

  copy: src=files/sudoers_ansible dest=/etc/sudoers.d/ansible owner=root group=root mode=0440

```
'copy'模块，正如我们看到的，从库复制一个文件到其他任何位置。在这个过程中，我们正在抓取一个名为'sudoers_ansible'(我们将在后续创建)的文件并将它复制到拥有者为'root'的'/etc/sudoers/ansible'中。

接下来，我们需要创建我们将要复制的文件。在你的库的根目录下，创建一个名为'files'的目录：

```
mkdir files

```
然后，在我们刚刚创建的'files'目录里，创建包含以下内容的名为'sudoers_ansible'的文件：
```
ansible ALL=(ALL) NOPASSWD: ALL

```
在'/etc/sudoer.d'目录里创建一个文件，就像我们正在这样做的，允许我们为一个特殊的用户配置'sudo'权限。现在我们正在通过'sudo'允许用户'ansible'不需要密码拥有完全控制权限。这将允许'ansible-pull'以后台任务的形式运行而不需要手动去运行。

现在，你可以通过再次运行'ansible-pull'来拉取最新的变动：
```
sudo ansible-pull -U https://github.com/<github_user>/ansible.git

```
从这个节点开始，'ansible-pull'的定时作业将会在后台每隔十分钟运行一次来检查你的库是否有变化，如果它发现有变化，将会运行你的palybook并且应用你的taskbooks.

所以现在我们有了一个完整的工作方案。当你第一次设置一台新的笔记本或者台式机的时候，你要去手动的运行'ansible-pull'命令，但仅仅是在第一次的时候。从第一次之后，用户'ansible'将会在后台接手后续的运行任务。当你想对你的机器做变动的时候，你只需要简单的去拉取你的Git库来做变动，然后将这些变化回传到库中。接着，当定时作业下次在每台机器上运行的时候，它将会拉取变动的部分并应用它们。你现在只需要做一次变动，你的所有工作站将会跟着一起变动。这方法尽管有一点不方便，通常，你会有一个你的机器列表的文件和包含不同机器的规则。不管怎样，'ansible-pull'的方法，就像在文章中描述的，是管理工作站配置的非常有效的方法。

我已经在我的[Github repository]中更新了这篇文章中的代码，所以你可以随时去浏览来再一次检查你的语法。同时我将前一篇文章中的代码移到了它自己的目录中。

在第三部分，我们将通过介绍使用Ansible来配置GNOME桌面设置来结束这个系列。我将会告诉你如何设置你的墙纸和锁屏壁纸，应用一个桌面主题以及更多的东西。

同时，到了布置一些作业的时候了，大多数人有我们使用的各种应用的配置文件。可能是Bash,Vim或者其他你使用的工具的配置文件。现在你可以尝试通过我们在使用的Ansible库来自动复制这些配置到你的机器中。在这篇文章中，我已将想你展示了如何去复制文件，所以去尝试以下看看你是都已经能应用这些知识。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/manage-your-workstation-configuration-ansible-part-2

作者：[Jay LaCroix][a]
译者：[FelixYFZ](https://github.com/FelixYFZ)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlacroix
[1]:https://opensource.com/article/18/3/manage-workstation-ansible
[2]:https://github.com/jlacroix82/ansible_article.git
