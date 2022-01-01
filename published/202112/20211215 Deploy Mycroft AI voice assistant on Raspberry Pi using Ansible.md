[#]: subject: "Deploy Mycroft AI voice assistant on Raspberry Pi using Ansible"
[#]: via: "https://opensource.com/article/21/12/mycroft-raspberry-pi-ansible"
[#]: author: "Gaëtan Trellu https://opensource.com/users/goldyfruit"
[#]: collector: "lujun9972"
[#]: translator: "jrglinux"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14102-1.html"

使用 Ansible 在树莓派上部署 Mycroft AI 语音助手
======

> 使用本文中的这些 Ansible 剧本可以帮你获得更优的 Mycroft AI 体验。

![](https://img.linux.net.cn/data/attachment/album/202112/21/135748sdbpuhu6p3duus32.jpg)

Mycroft AI 是一款虚拟助手应用程序，可以响应语音请求并完成相应的任务，比如在互联网上搜索你需要的某些信息，或者下载你喜欢的博客等等。这是一款优秀的开源软件，不同于那些收集个人数据业务的公司的同款软件，Mycroft AI 注重于保护隐私以及提供平台灵活性。

Mycroft AI 使用 python 开发，可以安装于不同的硬件平台上。家喻户晓的树莓派便是一个非常热门的运行语音助手的硬件方案（不过不是唯一的方案）。方便的是，Mycroft 为树莓派提供了 [Picroft][2] 镜像，虽然目前 Picroft 还有一些限制，比如不支持 64 位系统，不过不能阻止它成为一种优秀的解决方案。

### 树莓派 4，我选择的目标平台

树莓派在 Mycroft 社区中非常受欢迎，因为其性价比高，在教育行业中有着巨大的优势，并且由于 Mycroft 提供的便捷功能以及树莓派本身易于访问的输入/输出（GPIO）引脚等，为树莓派提供了有趣的扩展可能（比如，提供 [唤醒词 LED GPIO][3] 能力）。

树莓派 4B 具有足够的 CPU 算力以及内存来平稳运行 Mycroft。我使用的是 8G 内存的树莓派4B，运行 Raspberry Pi OS Bullseye 64-bit 系统，你可以从 [RaspberryPi.org][4] 网站下载该系统镜像文件。

### 自动化这件事

构建你自己的 Mycroft AI 系统，必须要注意一些细节问题。根据我（一年以来）的初步经验，以下罗列了一些重要的技术细节点：

* 音频输出（扬声器配置）
* 音频输入（麦克风配置）
* 麦克风质量（以购买的实际硬件为准）
* 唤醒词响应（比如打招呼 “嘿，Mycroft”）
* 响应延迟（比如提问 “天气怎么样”）

这些并不是 Mycroft AI 的问题（LCTT 译注：难道软件平台就没有处理延时问题？），它们只能是你在选择硬件和配置操作时必须牢记关心的事情。树莓派本身能够运行 Mycroft AI，但有一些配置需要额外的注意下：

* CPU 调度器
* SD 卡性能
* PulseAudio 配置
* 网络延迟

我做了大量的研究和实践来解决上面列出这些令人头疼的注意点，最终我实现了我的“终极”目标 —— 最流畅的体验！

### Ansible 雪中送炭

我已经摸索出了最流畅的体验配置，但是如何确保在任何树莓派 4 板子上都能不遗漏每一个设置细节，然后达到重新部署这种流畅性体验的目标呢？

[Ansible][5] 能帮助你实现。Ansible 在设计上是幂等设计，这意味着它仅在需要时响应更改的请求。如果一切配置正确，Ansible 不会改变任何事情。这便是幂等设计的优美之处。

为了达到这一目的，我使用了两种 Ansible 场景角色工具：

* 一个用于配置和调整树莓派
* 一个用于安装和配置 Mycroft AI

### Ansible prepi 角色

[Ansible prepi role][6] 应用了一些配置，以便让树莓派 4B 发挥更佳的性能以及为安装 Mycroft 做前提准备。

* 更新 Raspberry Pi OS 至最新版本
* 添加 Debian backports 仓库
* 使用 next 分支更新固件，该分支支持 5.15 版本内核以及边缘固件
* 使用测试版本更新 EEPROM，该版本支持边缘功能
* 设置 `initial_turbo` 用来加速启动过程
* 将树莓派超频至 2GHz
* 在 RAMDisck 上挂载 `/tmp`
* 优化 `/` 分区挂载选项，提升 SD 卡读/写性能
* 管理 I2C、SPI、UART 接口
* 设置 CPU 控制器至避免在空间内核函数之间发生上下文切换的模式，以便提升性能
* 安装和配置 PulseAduio（非系统范围）
* 新固件或者 EEPROM 安装后重启树莓派

### Ansible mycroft 角色

[Ansible mycroft role][7] 基于脚本 `dev_setup.sh` 从 Github 仓库获取并安装和配置 Mycroft AI，该脚本是 Mycroft 核心团队提供。

* 需要准备 Python3 环境
* 系统集成环境
* 额外的安装技能
* 安装 Boto3、py_mplayer、pyopenssl 库
* 支持 IPC 的 RAMDisck
* 支持文件配置
* PulseAudio 优化
* 安全的 Mycroft 消息总线 websocket

我利用 [Ansible 剧本][8] 来协调上面两个角色的使用。

### 个人配置需求

下面列举了一些个人配置的需求：

* 能上网的树莓派 4B 板子（或者更新的板子）
* [Raspberry Pi OS 64-bit][9]
* Ansible 2.9（或者更新版本）
* 可正常工作的 SSH

推荐使用 [Etcher][10] 来烧录 Raspberry Pi OS 镜像至 SD 卡，你也可以使用你选择的镜像烧录工具。

我将树莓派超频来提升性能，不过这可能对你的硬件是一种潜在危险。在使用我的 Ansible 剧本配置之前，请先仔细阅读。你需要为你的每个配置选择负责。你将决定使用哪个固件、哪个 EEPROM。超频的话需要记得提供相应的冷却系统。

### 执行 Ansible 剧本

第一步，使用命令从 Github 获取 Ansible 剧本：

```
$ git clone https://github.com/smartgic/ansible-playbooks-mycroft.git
```

源码中，`requirements.yml` 文件中提供了该剧本的依赖角色列表，必须从 Ansible Galaxy 中检索这些依赖。

```
$ cd ansible-playbooks-mycroft
$ ansible-galaxy install -r requirements.yml
Starting galaxy role install process
- downloading role 'mycroft', owned by smartgic
- downloading role from https://github.com/smartgic/ansible-role-mycroft/archive/main.tar.gz
- extracting smartgic.mycroft to /home/goldyfruit/.ansible/roles/smartgic.mycroft
- smartgic.mycroft (main) was installed successfully
- downloading role 'prepi', owned by smartgic
- downloading role from https://github.com/smartgic/ansible-role-prepi/archive/main.tar.gz
- extracting smartgic.prepi to /home/goldyfruit/.ansible/roles/smartgic.prepi
- smartgic.prepi (main) was installed successfully
```

第二步，编辑仓库中的 Ansible 清单，设置需要管理的主机。

```
[rpi]
rpi4b01 ansible_host=192.168.1.97 ansible_user=pi
```

`[rpi]` 代表组，无需更改。该组有一个主机 `rpi4b01`，其 IP 地址为 `192.168.1.97`， 并创建 `pi` 作为 Linux（Raspberry Pi OS）上的默认用户。

现在比较棘手的部分到了：你希望每个选项怎么配置？这取决于你自己，下面是我的首选配置，供你参考：

```
# file: install-custom.yml
- hosts: rpi
  gather_facts: yes
  become: yes

  pre_tasks:
    - name: Install Python 3.x Ansible requirement
      raw: apt-get install -y python3
      changed_when: no
      tags:
        - always

  vars:
    # PREPI
    prepi_pi_user: pi
    prepi_hostname: mylovelypi
    prepi_firmware_update: yes
    prepi_overclock: yes
    prepi_force_turbo: yes
    prepi_cpu_freq: 2000
    prepi_pulseaudio_daemon: yes

    # MYCROFT
    mycroft_branch: dev
    mycroft_user: "{{ prepi_pi_user }}"
    mycroft_skills_update_interval: 2.0
    mycroft_recording_timeout_with_silence: 3.0
    mycroft_enclosure_name: picroft
    mycroft_extra_skills:
      - https://github.com/smartgic/mycroft-finished-booting-skill.git

  tasks:
    - import_role:
        name: smartgic.prepi

    - import_role:
        name: smartgic.mycroft
```

上面的配置内容需要保存在文件里（比如，`install-custom.yml`）。

现在关键步骤：运行你新创建的剧本。

```
$ ansible-playbook -i inventory install-custom.yml -k
```

`-k` 选项只有在不需要 SSH 密钥的时候才使用。在命令执行期间，树莓派可能会重启若干次。Ansible 剧本会自动处理这个问题，不必担心。

Ansible 配置完成后，你可以看到一条祝贺消息，提示你下一步需要做什么。

![Congratulations message (Gaëtan Trellu, CC BY-SA 4.0)][11]

### Ansible 让定制 Mycroft 变得更容易

这些 Ansible 剧本是我开始使用 Mycroft AI 后学到的经验教训。它们帮助我在任何一个地方都能构建、重构、定制、拷贝我的安装，并保持一致，这让我很省心！

读完此文，你有何意见、问题或疑虑？欢迎在 Twitter上 [@goldyfruit][13]上和我交流，或者访问 [Mycroft 频道][14] 搜寻答案。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/mycroft-raspberry-pi-ansible

作者：[Gaëtan Trellu][a]
选题：[lujun9972][b]
译者：[jrglinux](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/goldyfruit
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr "Looking at a map"
[2]: https://mycroft-ai.gitbook.io/docs/using-mycroft-ai/get-mycroft/picroft
[3]: https://github.com/smartgic/mycroft-wakeword-led-gpio-skill
[4]: https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2021-11-08/2021-10-30-raspios-bullseye-arm64-lite.zip
[5]: https://github.com/ansible/ansible
[6]: https://github.com/smartgic/ansible-role-prepi
[7]: https://github.com/smartgic/ansible-role-mycroft
[8]: https://github.com/smartgic/ansible-playbooks-mycroft
[9]: https://downloads.raspberrypi.org/raspios_arm64/images
[10]: https://opensource.com/article/18/7/getting-started-etcherio
[11]: https://opensource.com/sites/default/files/uploads/congratulations-message.png "Congratulations message"
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://twitter.com/goldyfruit
[14]: https://chat.mycroft.ai/community/channels/general
