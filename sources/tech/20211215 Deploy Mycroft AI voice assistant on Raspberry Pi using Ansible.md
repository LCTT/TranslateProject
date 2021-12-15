[#]: subject: "Deploy Mycroft AI voice assistant on Raspberry Pi using Ansible"
[#]: via: "https://opensource.com/article/21/12/mycroft-raspberry-pi-ansible"
[#]: author: "Gaëtan Trellu https://opensource.com/users/goldyfruit"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Deploy Mycroft AI voice assistant on Raspberry Pi using Ansible
======
Use these Ansible playbooks for an optimized Mycroft AI experience.
![Looking at a map][1]

Mycroft AI is a virtual assistant application that can respond to verbal requests and complete tasks such as searching the Internet for some information you need, or downloading your favorite podcast, and so on. It's a fine piece of open source software that, unlike similar software from companies in the business of harvesting personal data, provides privacy and platform flexibility.

Mycroft AI, written in Python, can install on many different hardware platforms. The famous Raspberry Pi board is a popular choice _(but not the only one)_ to run the voice assistant. Conveniently, Mycroft provides an image for Raspberry Pi, which is called [Picroft][2]. Picroft is an excellent solution, but it does have some limitations, such as the lack of 64-bit support.

### Raspberry Pi 4, the platform of choice and my target

The Raspberry Pi board is popular within the Mycroft community because it's inexpensive, has a lot of educational potential, and provides the possibility of interesting expansions thanks to Mycroft's skills and the Pi's easy access to General-Purpose Input/Output (GPIO) pins (for example, the [wake word LED GPIO skill][3]).

The model 4B has enough CPU power and memory to run Mycroft smoothly. I use the model 4B with 8GB of RAM, running Raspberry Pi OS Bullseye 64-bit Lite, which you can download from [RaspberryPi.org][4].

### Another automation story

Building your own Mycroft AI system does mean that you must pay attention to some details. According to my initial experience (from a year ago), here is a list of important technical details you must keep in mind:

  * Audio output _(speaker configuration)_
  * Audio input _(microphone configuration)_
  * Microphone quality (_the actual hardware you buy_)
  * Wake word response _("Hey Mycroft!")_
  * Latency of response _("What's the weather like?")_



These aren't issues of Mycroft AI, they're just the things you must keep in mind while choosing your hardware and configuring your operating system. The Pi itself is capable of running Mycroft AI, but there are adjustments that require special configuration. Specifically, these are:

  * CPU scheduler
  * SD card performances
  * PulseAudio configuration
  * Network latency



I had to do a lot of research and manual actions to solve the headaches from the list above, but I did achieve the "ultimate" goal—the smoothest experience!

### Ansible to the rescue!

So now that I've created _the smoothest experience_, how do I ensure that every action done to achieve this goal gets captured and gets re-applied only if required on any Raspberry Pi 4 board?

[Ansible][5] to the rescue! Ansible is idempotent by design, which means that it applies the requested changes only if required. If everything is configured correctly, Ansible does not change a thing. This is the beauty of idempotency!

To achieve this ultimate goal, I use two Ansible roles:

  * One to configure and tweak the Raspberry Pi
  * One to install and configure Mycroft AI



#### Ansible prepi role

The [Ansible prepi role][6] applies some configurations to obtain better performances from a Raspberry Pi 4B board and prepare the path to Mycroft.

  * Update Raspberry Pi OS to the latest version
  * Add Debian backports repository
  * Update firmware using the next branch, which provides kernel 5.15 and edge firmware
  * Update EEPROM using the beta version, which provides edge features
  * Setup initial_turbo to speed up the boot process
  * Overclock the Raspberry Pi to 2Ghz
  * Mount /tmp on a RAMDisk
  * Optimize / partition mount options to improve SDcard read/write
  * Manage I2C, SPI &amp; UART interfaces
  * Set CPU governor to performance to avoid context switching between the idle* kernel functions
  * Install and configure PulseAudio _(non-system wide)_
  * Reboot the Raspberry Pi when new firmware or EEPROM gets installed



#### Ansible mycroft role

This [Ansible mycroft role][7] installs and configures Mycroft AI Core from the GitHub repository based on the `dev_setup.sh` Bash script provided by the Mycroft core team.

  * Python 3 virtual environment
  * Systemd integration
  * Extra skills installation
  * Boto3, py_mplayer, and pyopenssl libraries install
  * RAMDisk support for IPC
  * File configuration support
  * PulseAudio optimizations
  * Secure Mycroft message bus websocket



I'll need an [Ansible playbook][8] to orchestrate the two roles.

### Personal requirements

Here is a list of requirements for this project:

  * Raspberry Pi 4B board (or later) connected to your network
  * [Raspberry Pi OS 64-bit][9]
  * Ansible 2.9 (or later)
  * SSH, up and running



To burn the Raspberry Pi OS image to the SD card, you can use [Etcher][10] or the imaging tool of your choice.

I overclock my Pi to get a boost in performance, but this can be dangerous to your hardware. Before using my Ansible playbooks, read them carefully! _You are responsible for the choices made with this role._ You decide which firmware, which EEPROM you want to use. The same rule applies to the overclocking feature. **Remember that overclocking requires a proper cooling system.**

### Execute the Ansible playbook

The first step is to retrieve the Ansible playbooks from GitHub. Use the following `git` command:


```
`$ git clone https://github.com/smartgic/ansible-playbooks-mycroft.git`
```

This repository contains an Ansible `requirements.yml` file which provides a list of Ansible roles required by this playbook, the roles must be retrieved from Ansible Galaxy.


```


$ cd ansible-playbooks-mycroft
$ ansible-galaxy install -r requirements.yml
Starting galaxy role install process
\- downloading role 'mycroft', owned by smartgic
\- downloading role from <https://github.com/smartgic/ansible-role-mycroft/archive/main.tar.gz>
\- extracting smartgic.mycroft to /home/goldyfruit/.ansible/roles/smartgic.mycroft
\- smartgic.mycroft (main) was installed successfully
\- downloading role 'prepi', owned by smartgic
\- downloading role from <https://github.com/smartgic/ansible-role-prepi/archive/main.tar.gz>
\- extracting smartgic.prepi to /home/goldyfruit/.ansible/roles/smartgic.prepi
\- smartgic.prepi (main) was installed successfully

```

The second step is to edit the Ansible inventory provided in the repository to reference the hosts I need to be managed by Ansible.


```


[rpi]
rpi4b01 ansible_host=192.168.1.97 ansible_user=pi

```

`[rpi]` is the group and should not be changed. This group has one host named `rpi4b01`, which has IP `192.168.1.97` and provides `pi` as Linux (default on Raspberry Pi OS) user for Ansible to connect with.

Now the tricky part: what value do you want for each option? It's up to you, but here's my go-to configuration:


```


# file: install-custom.yml
\- hosts: rpi
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
      - <https://github.com/smartgic/mycroft-finished-booting-skill.git>

  tasks:
    - import_role:
        name: smartgic.prepi

    - import_role:
        name: smartgic.mycroft

```

The content needs to be saved in a file (for example, `install-custom.yml`).

And now the moment of truth: run your freshly created playbook.


```
`$ ansible-playbook -i inventory install-custom.yml -k`
```

The `-k` option from `ansible-playbook` command is only required if not using the SSH key. During the playbook execution, the Raspberry Pi could reboot a couple of times. The playbook is smart enough to handle this.

Once Ansible is done, you see a congratulatory message, which prompts you for the next steps you need to take.

![Congratulations message][11]

(Gaëtan Trellu, [CC BY-SA 4.0][12])

### Ansible makes custom Mycroft easy

These playbooks are the lessons I learned since starting my journey with Mycroft AI. It allows me to build, re-build, customize, and replicate my install with the peace of mind of having consistency everywhere!

Do you have any comments, questions, or concerns? Leave a comment, visit me on Twitter [@goldyfruit][13], or stop by [Mycroft channels][14].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/mycroft-raspberry-pi-ansible

作者：[Gaëtan Trellu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/goldyfruit
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr (Looking at a map)
[2]: https://mycroft-ai.gitbook.io/docs/using-mycroft-ai/get-mycroft/picroft
[3]: https://github.com/smartgic/mycroft-wakeword-led-gpio-skill
[4]: https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2021-11-08/2021-10-30-raspios-bullseye-arm64-lite.zip
[5]: https://github.com/ansible/ansible
[6]: https://github.com/smartgic/ansible-role-prepi
[7]: https://github.com/smartgic/ansible-role-mycroft
[8]: https://github.com/smartgic/ansible-playbooks-mycroft
[9]: https://downloads.raspberrypi.org/raspios_arm64/images
[10]: https://opensource.com/article/18/7/getting-started-etcherio
[11]: https://opensource.com/sites/default/files/uploads/congratulations-message.png (Congratulations message)
[12]: https://creativecommons.org/licenses/by-sa/4.0/
[13]: https://twitter.com/goldyfruit
[14]: https://chat.mycroft.ai/community/channels/general
