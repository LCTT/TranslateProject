[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building container images with the ansible-bender tool)
[#]: via: (https://opensource.com/article/19/10/building-container-images-ansible)
[#]: author: (Tomas Tomecek https://opensource.com/users/tomastomecek)

Building container images with the ansible-bender tool
======
Learn how to use Ansible to execute commands in a container.
![Blocks for building][1]

Containers and [Ansible][2] blend together so nicely—from management and orchestration to provisioning and building. In this article, we'll focus on the building part.

If you are familiar with Ansible, you know that you can write a series of tasks, and the **ansible-playbook** command will execute them for you. Did you know that you can also execute such commands in a container environment and get the same result as if you'd written a Dockerfile and run **podman build**.

Here is an example:


```
\- name: Serve our file using httpd
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

You could execute this playbook locally on your web server or in a container, and it would work—as long as you remember to create the **our-file.txt** file first.

But something is missing. You need to start (and configure) httpd in order for your file to be served. This is a difference between container builds and infrastructure provisioning: When building an image, you just prepare the content; running the container is a different task. On the other hand, you can attach metadata to the container image that tells the command to run by default.

Here's where a tool would help. How about trying **ansible-bender**?


```
`$ ansible-bender build the-playbook.yaml fedora:30 our-httpd`
```

This script uses the ansible-bender tool to execute the playbook against a Fedora 30 container image and names the resulting container image **our-httpd**.

But when you run that container, it won't start httpd because it doesn't know how to do it. You can fix this by adding some metadata to the playbook:


```
\- name: Serve our file using httpd
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

Now you can build the image (from here on, please run all the commands as root—currently, Buildah and Podman won't create dedicated networks for rootless containers):


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
our-httpd-20191004-131941266141-cont : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

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

The image is built, and it's time to run the container:


```
# podman run our-httpd
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 10.88.2.106. Set the 'ServerName' directive globally to suppress this message
```

Is your file being served? First, find out the IP of your container:


```
# podman inspect -f '{{ .NetworkSettings.IPAddress }}' 7418570ba5a0
10.88.2.106
```

And now you can check:


```
$ curl <http://10.88.2.106/our-file.txt>
Ansible is ❤
```

What were the contents of your file?

This was just an introduction to building container images with Ansible. If you want to learn more about what ansible-bender can do, please check it out on [GitHub][3]. Happy building!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/building-container-images-ansible

作者：[Tomas Tomecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomastomecek
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/blocks_building.png?itok=eMOT-ire (Blocks for building)
[2]: https://www.ansible.com/
[3]: https://github.com/ansible-community/ansible-bender
