hankchow translating

How to use Ansible to patch systems and install applications
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4)
Have you ever wondered how to patch your systems, reboot, and continue working?

If so, you'll be interested in [Ansible][1] , a simple configuration management tool that can make some of the hardest work easy. For example, system administration tasks that can be complicated, take hours to complete, or have complex requirements for security.

In my experience, one of the hardest parts of being a sysadmin is patching systems. Every time you get a Common Vulnerabilities and Exposure (CVE) notification or Information Assurance Vulnerability Alert (IAVA) mandated by security, you have to kick into high gear to close the security gaps. (And, believe me, your security officer will hunt you down unless the vulnerabilities are patched.)

Ansible can reduce the time it takes to patch systems by running [packaging modules][2]. To demonstrate, let's use the [yum module][3] to update the system. Ansible can install, update, remove, or install from another location (e.g., `rpmbuild` from continuous integration/continuous development). Here is the task for updating the system:
```
  - name: update the system

    yum:

      name: "*"

      state: latest

```

In the first line, we give the task a meaningful `name` so we know what Ansible is doing. In the next line, the `yum module` updates the CentOS virtual machine (VM), then `name: "*"` tells yum to update everything, and, finally, `state: latest` updates to the latest RPM.

After updating the system, we need to restart and reconnect:
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

The `shell module` puts the system to sleep for 5 seconds then reboots. We use `sleep` to prevent the connection from breaking, `async` to avoid timeout, and `poll` to fire & forget. We pause for 10 seconds to wait for the VM to come back and use `wait_for_connection` to connect back to the VM as soon as it can make a connection. Then we `install epel-release` to test the RPM installation. You can run this playbook multiple times to show the `idempotent`, and the only task that will show as changed is the reboot since we are using the `shell` module. You can use `changed_when: False` to ignore the change when using the `shell` module if you expect no actual changes.

So far we've learned how to update a system, restart the VM, reconnect, and install a RPM. Next we will install NGINX using the role in [Ansible Lightbulb][4].
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
# handlers file for nginx-example

  - name: restart-nginx-service

    service:

      name: nginx

      state: restarted

```

In this role, we install the RPMs `nginx`, `python-pip`, `python-devel`, and `devel` and install `uwsgi` with PIP. Next, we use the `template` module to copy over the `nginx.conf` and `index.html` for the page to display. After that, we make sure the service is enabled on boot and started. Then we use the `uri` module to check the connection to the page.

Here is a playbook showing an example of updating, restarting, and installing an RPM. Then continue installing nginx. This can be done with any other roles/applications you want.
```
  - hosts: all

    roles:

      - centos-update

      - nginx-simple

```

Watch this demo video for more insight on the process.

[demo](https://asciinema.org/a/166437/embed?)

This was just a simple example of how to update, reboot, and continue. For simplicity, I added the packages without [variables][5]. Once you start working with a large number of hosts, you will need to change a few settings:

This is because on your production environment you might want to update one system at a time (not fire & forget) and actually wait a longer time for your system to reboot and continue.

For more ways to automate your work with this tool, take a look at the other [Ansible articles on Opensource.com][6].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/ansible-patch-systems

作者：[Jonathan Lozada De La Matta][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlozadad
[1]:https://www.ansible.com/overview/how-ansible-works
[2]:https://docs.ansible.com/ansible/latest/list_of_packaging_modules.html
[3]:https://docs.ansible.com/ansible/latest/yum_module.html
[4]:https://github.com/ansible/lightbulb/tree/master/examples/nginx-role
[5]:https://docs.ansible.com/ansible/latest/playbooks_variables.html
[6]:https://opensource.com/tags/ansible
