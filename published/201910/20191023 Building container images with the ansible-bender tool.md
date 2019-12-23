[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11518-1.html)
[#]: subject: (Building container images with the ansible-bender tool)
[#]: via: (https://opensource.com/article/19/10/building-container-images-ansible)
[#]: author: (Tomas Tomecek https://opensource.com/users/tomastomecek)

使用 ansible-bender 构建容器镜像
======

> 了解如何使用 Ansible 在容器中执行命令。

![](https://img.linux.net.cn/data/attachment/album/201910/30/090738vzbifzfpa6qz9bij.jpg)

容器和 [Ansible][2] 可以很好地融合在一起：从管理和编排到供应和构建。在本文中，我们将重点介绍构建部分。

如果你熟悉 Ansible，就会知道你可以编写一系列任务，`ansible-playbook` 命令将为你执行这些任务。你知道吗，如果你编写 Dockerfile 并运行 `podman build`，你还可以在容器环境中执行此类命令，并获得相同​​的结果。

这是一个例子：

```
- name: Serve our file using httpd
  hosts: all
  tasks:
  - name: Install httpd
    package:
      name: httpd
      state: installed
  - name: Copy our file to httpd’s webroot
    copy:
      src: our-file.txt
      dest: /var/www/html/
```

你可以在 Web 服务器本地或容器中执行这个剧本，并且只要你记得先创建 `our-file.txt`，它就可以工作。

但是这里缺少了一些东西。你需要启动（并配置）httpd 以便提供文件。这是容器构建和基础架构供应之间的区别：构建镜像时，你只需准备内容；而运行容器是另一项任务。另一方面，你可以将元数据附加到容器镜像，它会默认运行命令。

这有个工具可以帮助。试试看 `ansible-bender` 怎么样？

```
$ ansible-bender build the-playbook.yaml fedora:30 our-httpd
```

该脚本使用 `ansible-bender` 对 Fedora 30 容器镜像执行该剧本，并将生成的容器镜像命名为 `our-httpd`。

但是，当你运行该容器时，它不会启动 httpd，因为它不知道如何操作。你可以通过向该剧本添加一些元数据来解决此问题：

```
- name: Serve our file using httpd
  hosts: all
  vars:
    ansible_bender:
      base_image: fedora:30
      target_image:
        name: our-httpd
        cmd: httpd -DFOREGROUND
  tasks:
  - name: Install httpd
    package:
      name: httpd
      state: installed
  - name: Listen on all network interfaces.
    lineinfile:    
      path: /etc/httpd/conf/httpd.conf  
      regexp: '^Listen '
      line: Listen 0.0.0.0:80  
  - name: Copy our file to httpd’s webroot
    copy:
      src: our-file.txt
      dest: /var/www/html
```

现在你可以构建镜像（从这里开始，请以 root 用户身份运行所有命令。目前，Buildah 和 Podman 不会为无 root 容器创建专用网络）：

```
# ansible-bender build the-playbook.yaml
PLAY [Serve our file using httpd] ****************************************************
                                                                                                                                                                             
TASK [Gathering Facts] ***************************************************************    
ok: [our-httpd-20191004-131941266141-cont]

TASK [Install httpd] *****************************************************************
loaded from cache: 'f053578ed2d47581307e9ba3f64f4b4da945579a082c6f99bd797635e62befd0'
skipping: [our-httpd-20191004-131941266141-cont]

TASK [Listen on all network interfaces.] *********************************************
changed: [our-httpd-20191004-131941266141-cont]

TASK [Copy our file to httpd’s webroot] **********************************************
changed: [our-httpd-20191004-131941266141-cont]

PLAY RECAP ***************************************************************************
our-httpd-20191004-131941266141-cont : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Getting image source signatures
Copying blob sha256:4650c04b851c62897e9c02c6041a0e3127f8253fafa3a09642552a8e77c044c8
Copying blob sha256:87b740bba596291af8e9d6d91e30a01d5eba9dd815b55895b8705a2acc3a825e
Copying blob sha256:82c21252bd87532e93e77498e3767ac2617aa9e578e32e4de09e87156b9189a0
Copying config sha256:44c6dc6dda1afe28892400c825de1c987c4641fd44fa5919a44cf0a94f58949f
Writing manifest to image destination
Storing signatures
44c6dc6dda1afe28892400c825de1c987c4641fd44fa5919a44cf0a94f58949f
Image 'our-httpd' was built successfully \o/
```

镜像构建完毕，可以运行容器了：

```
# podman run our-httpd
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 10.88.2.106. Set the 'ServerName' directive globally to suppress this message
```

是否提供文件了？首先，找出你容器的 IP：

```
# podman inspect -f '{{ .NetworkSettings.IPAddress }}' 7418570ba5a0
10.88.2.106
```

你现在可以检查了：

```
$ curl http://10.88.2.106/our-file.txt
Ansible is ❤
```

你文件内容是什么？

这只是使用 Ansible 构建容器镜像的介绍。如果你想了解有关 `ansible-bender` 可以做什么的更多信息，请查看它的 [GitHub][3] 页面。构建快乐！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/building-container-images-ansible

作者：[Tomas Tomecek][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomastomecek
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/blocks_building.png?itok=eMOT-ire (Blocks for building)
[2]: https://www.ansible.com/
[3]: https://github.com/ansible-community/ansible-bender
