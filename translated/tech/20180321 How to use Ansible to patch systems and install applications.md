如何使用 Ansible 打补丁以及安装应用
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4)
你有没有想过，如何打补丁、重启系统，然后继续工作？

如果你的回答是肯定的，那就需要了解一下 [Ansible][1] 了。它是一个配置管理工具，对于一些复杂的系统管理任务有时候需要几个小时才能完成，又或者对安全性有比较高要求的时候，使用 Ansible 能够大大简化工作流程。

以我作为系统管理员的经验，打补丁是一项最有难度的工作。每次遇到公共漏洞和暴露（CVE, Common Vulnearbilities and Exposure）通知或者信息安全漏洞预警（IAVA, Information Assurance Vulnerability Alert）时都必须要高度关注安全漏洞，否则安全部门将会严肃追究自己的责任。

使用 Ansible 可以通过运行[封装模块][2]以缩短打补丁的时间，下面以[yum模块][3]更新系统为例,使用 Ansible 可以执行安装、更新、删除、从其它地方安装（例如持续集成/持续开发中的 `rpmbuild`）。以下是系统更新的任务：
```
  - name: update the system

    yum:

      name: "*"

      state: latest

```

在第一行，我们给这个任务命名，这样可以清楚 Ansible 的工作内容。第二行表示使用 `yum` 模块在CentOS虚拟机中执行更新操作。第三行 `name: "*"` 表示更新所有程序。最后一行 `state: latest` 表示更新到最新的 RPM。

系统更新结束之后，需要重新启动并重新连接：
```
  - name: restart system to reboot to newest kernel

    shell: "sleep 5 && reboot"

    async: 1

    poll: 0



  - name: wait for 10 seconds

    pause:

      seconds: 10



  - name: wait for the system to reboot

    wait_for_connection:

      connect_timeout: 20

      sleep: 5

      delay: 5

      timeout: 60



  - name: install epel-release

    yum:

      name: epel-release

      state: latest

```

`shell` 字段中的命令让系统在5秒休眠之后重新启动，我们使用 `sleep` 来保持连接不断开，使用 `async` 设定最大等待时长以避免发生超时，`poll` 设置为0表示直接执行不需要等待执行结果。等待10秒钟，使用 `wait_for_connection` 在虚拟机恢复连接后尽快连接。随后由 `install epel-release` 任务检查 RPM 的安装情况。你可以对这个剧本执行多次来验证它的幂等性，唯一会显示造成影响的是重启操作，因为我们使用了 `shell` 模块。如果不想造成实际的影响，可以在使用 `shell` 模块的时候 `changed_when: False`。

现在我们已经知道如何对系统进行更新、重启虚拟机、重新连接、安装 RPM 包。下面我们通过 [Ansible Lightbulb][4] 来安装 NGINX:
```
  - name: Ensure nginx packages are present

    yum:

      name: nginx, python-pip, python-devel, devel

      state: present

    notify: restart-nginx-service



  - name: Ensure uwsgi package is present

    pip:

      name: uwsgi

      state: present

    notify: restart-nginx-service



  - name: Ensure latest default.conf is present

    template:

      src: templates/nginx.conf.j2

      dest: /etc/nginx/nginx.conf

      backup: yes

    notify: restart-nginx-service



  - name: Ensure latest index.html is present

    template:

      src: templates/index.html.j2

      dest: /usr/share/nginx/html/index.html



  - name: Ensure nginx service is started and enabled

    service:

      name: nginx

      state: started

      enabled: yes



  - name: Ensure proper response from localhost can be received

    uri:

      url: "http://localhost:80/"

      return_content: yes

    register: response

    until: 'nginx_test_message in response.content'

    retries: 10

    delay: 1

```

And the handler that restarts the nginx service:
```
# 安装 nginx 的操作文件

  - name: restart-nginx-service

    service:

      name: nginx

      state: restarted

```

在这个角色里，我们使用 RPM 安装了 `nginx`、`python-pip`、`python-devel`、`devel`，用 PIP 安装了 `uwsgi`，接下来使用 `template` 模块复制 `nginx.conf` 和 `index.html` 以显示页面，并确保服务在系统启动时启动。然后就可以使用 `uri` 模块检查到页面的连接了。

这个是一个系统更新、系统重启、安装 RPM 包的剧本示例，后续可以继续安装 nginx，当然这里可以替换成任何你想要的角色和应用程序。
```
  - hosts: all

    roles:

      - centos-update

      - nginx-simple

```

观看演示视频了解了解这个过程。

[demo](https://asciinema.org/a/166437/embed?)

这只是关于如何更新系统、重启以及后续工作的示例。简单起见，我只添加了不带[变量][5]的包，当你在操作大量主机的时候，你就需要修改其中的一些设置了：

这是由于在生产环境中如果你想逐一更新每一台主机的系统，你需要花相当一段时间去等待主机重启才能够继续下去。

有关 Ansible 进行自动化工作的更多用法，请查阅[其它文章][6]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/ansible-patch-systems

作者：[Jonathan Lozada De La Matta][a]
译者：[HankChow](https://github.com/HankChow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlozadad
[1]:https://www.ansible.com/overview/how-ansible-works
[2]:https://docs.ansible.com/ansible/latest/list_of_packaging_modules.html
[3]:https://docs.ansible.com/ansible/latest/yum_module.html
[4]:https://github.com/ansible/lightbulb/tree/master/examples/nginx-role
[5]:https://docs.ansible.com/ansible/latest/playbooks_variables.html
[6]:https://opensource.com/tags/ansible
