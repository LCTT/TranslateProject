15 command-line aliases to save you time
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_blue.png?itok=IfckxN48)

Linux command-line aliases are great for helping you work more efficiently. Better still, some are included by default in your installed Linux distro.

This is an example of a command-line alias in Fedora 27:

![](https://opensource.com/sites/default/files/uploads/default.png)

The command `alias` shows the list of existing aliases. Setting an alias is as simple as typing:

`alias new_name="command"`

Here are 15 command-line aliases that will save you time:

1. To install any utility/application:

`alias install="sudo yum install -y"`

Here, `sudo` and `-y` are optional as per user’s preferences:


![install alias.png][2]

2. To update the system:

`alias update="sudo yum update -y"`

3. To upgrade the system:

`alias upgrade="sudo yum upgrade -y"`

4. To change to the root user:

`alias root="sudo su -"`

5. To change to "user," where "user" is set as your username:

`alias user="su user"`

6. To display the list of all available ports, their status, and IP:

`alias myip="ip -br -c a"`

7. To `ssh` to the server `myserver`:

`alias myserver="ssh user@my_server_ip”`

8. To list all processes in the system:

`alias process="ps -aux"`

9. To check the status of any system service:

`alias sstatus="sudo systemctl status"`

10. To restart any system service:

`alias srestart="sudo systemctl restart"`

11. To kill any process by its name:

`alias kill="sudo pkill"`

![kill process alias.png][4]

12. To display the total used and free memory of the system:

`alias mem="free -h"`

13. To display the CPU architecture, number of CPUs, threads, etc. of the system:

`alias cpu="lscpu"`

14. To display the total disk size of the system:

`alias disk="df -h"`

15. To display the current system Linux distro (for CentOS, Fedora, and Red Hat):

`alias os="cat /etc/redhat-release"`

![system_details alias.png][6]




--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/time-saving-command-line-aliases

作者：[Aarchit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[2]:https://opensource.com/sites/default/files/uploads/install.png (install alias.png)
[4]:https://opensource.com/sites/default/files/uploads/kill.png (kill process alias.png)
[6]:https://opensource.com/sites/default/files/uploads/system_details.png (system_details alias.png)
