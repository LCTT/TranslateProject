使用 Ansible 管理你的工作站：配置桌面设置
======

> 在本系列第三篇（也是最后一篇）文章中，我们将使用 Ansible 自动化配置 GNOME 桌面设置。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cube_innovation_process_block_container.png?itok=vkPYmSRQ)

在本系列关于使用 Ansible 配置工作站的[第一篇文章][1]中，我们设置了一个仓库并配置了一些基本的东西。在[第二篇文章][2]中，我们配置了 Ansible 以使其在对仓库进行更改时自动应用设置。在第三篇（也是最后一篇）文章中，我们将使用 Ansible 配置 GNOME 桌面设置。

此配置只适用于较新的发行版（例如我将在示例中使用的 Ubuntu 18.04）。较旧版本的 Ubuntu 将无法运行，因为它们附带了一个老版本的 `python-psutils`，对于 Ansible 的 `dconf` 模块无法正常工作。如果你使用的是较新版本的 Linux 发行版，则应该没有问题。

在开始之前，确保你已经完成了本系列的第一部分和第二部分，因为第三部分建立在此基础之上的。如果还没有，下载前两篇文章中一直使用的 GitHub [仓库][3]，我们将为其添加更多功能。

### 设置壁纸和锁屏

首先，我们将创建一个任务手册来保存我们的 GNOME 设置。在仓库的根目录中，应该有一个名为 `local.yml` 的文件，添加以下行：

```
- include: tasks/gnome.yml
```

整个文件应如下所示：

```
- hosts: localhost
  become: true
  pre_tasks:
    - name: update repositories
      apt: update_cache=yes
      changed_when: False

  tasks:
    - include: tasks/users.yml
    - include: tasks/cron.yml
    - include: tasks/packages.yml
    - include: tasks/gnome.yml
```

基本上，这添加了对名为 `gnome.yml` 文件的引用，它将存储在仓库内的 `tasks` 目录中。我们还没有创建这个文件，现在就来创建它。在 `tasks` 目录中创建 `gnome.yml` 文件，并将以下内容放入：

```
- name: Install python-psutil package
  apt: name=python-psutil

- name: Copy wallpaper file
  copy: src=files/wallpaper.jpg dest=/home/jay/.wallpaper.jpg owner=jay group=jay mode=600

- name: Set GNOME Wallpaper
  become_user: jay
  dconf: key="/org/gnome/desktop/background/picture-uri" value="'file:///home/jay/.wallpaper.jpg'"
```

注意，此代码多次引用我的用户名（`jay`），因此确保使用你机器上的用户名替换每次出现的 `jay`。另外，如果你没有像我一样使用 Ubuntu 18.04，你将必须更改 `apt` 一行来匹配你所选择的发行版的包管理器，并确认 `python-psutil` 包的名称，因为它可能有所不同。

在示例任务中，我引用了 `file` 目录下的 `wallpaper.jpg` 文件，此文件必须存在，否则 Ansible 配置将失败。在 `tasks` 目录中，创建一个名为 `files` 的子目录。找到你喜欢的壁纸图片，将其命名为 `wallpaper.jpg`，然后把它放在 `files` 目录中。如果文件是 PNG 图像而不是 JPG，在代码和仓库中更改文件扩展名。如果你觉得没有创意，我在 [GitHub 仓库][3] 中有一个示例壁纸文件，你可以使用它。

完成所有这些更改后，将内容提交到 GitHub 仓库，并推送这些更改。总结一下，你应该完成以下工作：

  * 修改 `local.yml` 文件以引用 `tasks/gnome.yml` 
  * 使用上面提到的内容创建 `tasks/gnome.yml`
  * 在 `tasks` 目录中创建一个 `files` 目录，其中有一个名为 `wallpaper.jpg` 的图像文件（或者你选择的任何名称）。

完成这些步骤并将更改推送到仓库后，配置应该在下次计划运行期间自动应用。（你可能还记得我们在上一篇文章中对此进行了自动化。）如果你想节省时间，可以使用以下命令立即应用配置：

```
sudo ansible-pull -U https://github.com/<github_user>/ansible.git
```

如果一切正常，你应该可以看到你的新壁纸。

让我们花一点时间来了解新的 GNOME 任务手册的功能。首先，我们添加了一个计划来安装 `python-psutil` 包。如果不添加它，我们就不能使用 `dconf` 模块，因为它需要在修改 GNOME 设置之前安装这个包。接下来，我们使用 `copy` 模块将壁纸文件复制到我们的 `home` 目录，并将生成的文件命名为以点开头的隐藏文件。如果你不希望此文件放在 `home` 目录的根目录中，你可以随时指示此部分将其复制到其它位置 —— 只要你在正确的位置引用它，它仍然可以工作。在下一个计划中，我们使用 `dconf` 模块来更改 GNOME 设置。在这种情况下，我们调整了 `/org/gnome/desktop/background/picture-uri` 键并将其设置为 `file:///home/jay/.wallpaper.jpg`。注意本节中的引号 —— 你必须在 `dconf` 值中使用两个单引号，如果值是一个字符串，还必须包含在双引号内。

现在，让我们进一步进行配置，并将背景应用于锁屏。这是现在的 GNOME 任务手册，但增加了两个额外的计划：

```
- name: Install python-psutil package
  apt: name=python-psutil

- name: Copy wallpaper file
  copy: src=files/wallpaper.jpg dest=/home/jay/.wallpaper.jpg owner=jay group=jay mode=600

- name: Set GNOME wallpaper
  dconf: key="/org/gnome/desktop/background/picture-uri" value="'file:///home/jay/.wallpaper.jpg'"

- name: Copy lockscreenfile
  copy: src=files/lockscreen.jpg dest=/home/jay/.lockscreen.jpg owner=jay group=jay mode=600

- name: Set lock screen background
  become_user: jay
  dconf: key="/org/gnome/desktop/screensaver/picture-uri" value="'file:///home/jay/.lockscreen.jpg'"
```

正如你所看到的，我们做的事情和设置壁纸时差不多。我们添加了两个额外的任务，一个是复制锁屏图像并将其放在我们的 `home` 目录中，另一个是将设置应用于 GNOME 以便使用它。同样，确保将 `jay` 更改为你的用户名，并命名你想要的锁屏图片 `lockscreen.jpg`，并将其复制到 `files` 目录。将这些更改提交到仓库后，在下一次计划的 Ansible 运行期间就会应用新的锁屏。

### 应用新的桌面主题

设置壁纸和锁屏背景很酷，但是让我们更进一步来应用桌面主题。首先，让我们在我们的任务手册中添加一条指令来安装 `arc` 主题的包。将以下代码添加到 GNOME 任务手册的开头：

```
- name: Install arc theme
  apt: name=arc-theme
```

然后，在底部，添加以下动作：

```
- name: Set GTK theme
  become_user: jay
  dconf: key="/org/gnome/desktop/interface/gtk-theme" value="'Arc'"
```

你看到 GNOME 的 GTK 主题在你眼前变化了吗？我们添加了一个动作来通过 `apt` 模块安装 `arc-theme` 包，另一个动作将这个主题应用到 GNOME。

### 进行其它定制

既然你已经更改了一些 GNOME 设置，你可以随意添加其它定制。你在 GNOME 中调整的任何设置都可以通过这种方式自动完成，设置壁纸和主题只是几个例子。你可能想知道如何找到要更改的设置，以下是一个我用的技巧。

首先，通过在你管理的计算机上运行以下命令，获取所有当前 `dconf` 设置的快照：

```
dconf dump / > before.txt
```

此命令将所有当前更改导出到名为 `before.txt` 的文件中。接下来，手动更改要自动化的设置，并再次获取 `dconf` 设置：

```
dconf dump / > after.txt
```

现在，你可以使用 `diff` 命令查看两个文件之间的不同之处：

```
diff before.txt after.txt
```

这应该会给你一个已更改键值的列表。虽然手动更改设置确实违背了自动化的目的，但你实际上正在做的是获取更新首选设置时更改的键，这允许你创建 Ansible 任务以修改这些设置，这样你就再也不需要碰这些设置了。如果你需要还原机器，Ansible 仓库会处理好你的每个定制。如果你有多台计算机，甚至是一组工作站，则只需手动进行一次更改，所有其他工作站都将应用新设置并完全同步。

### 最后

如果你已经阅读完本系列文章，你应该知道如何设置 Ansible 来自动化工作站。这些示例提供了一个有用的基础，你可以使用这些语法和示例进行其他定制。随着你的进展，你可以继续添加新的修改，这将使你的 Ansible 配置一直增长。

我已经用 Ansible 以这种方式自动化了一切，包括我的用户帐户和密码、Vim、tmux 等配置文件、桌面包、SSH 设置、SSH 密钥，基本上我想要自定义的一切都使用了。以本系列文章作为起点，将为你实现工作站的完全自动化铺平道路。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/manage-your-workstation-ansible-part-3

作者：[Jay LaCroix][a]
选题：[lujun9972](https://github.com/lujun9972 )
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlacroix
[1]:https://linux.cn/article-10434-1.html
[2]:https://linux.cn/article-10449-1.html
[3]:https://github.com/jlacroix82/ansible_article.git
