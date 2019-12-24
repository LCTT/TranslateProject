[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Start, Stop & Restart Services in Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/start-stop-restart-services-linux/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How to Start, Stop & Restart Services in Ubuntu and Other Linux Distributions
======

Services are essential background processes that are usually run while booting up and shut down with the OS.

If you are a sysadmin, you’ll deal with the service regularly.

If you are a normal desktop user, you may come across the need to restart a service like [setting up Barrier for sharing mouse and keyboard between computers][1]. or when you are [using ufw to setup firewall][2].

Today I will show you two different ways you can manage services. You’ll learn to start, stop and restart services in Ubuntu or any other Linux distribution.

systemd vs init

Ubuntu and many other distributions these days use systemd instead of the good old init.

In systemd, you manage sevices with systemctl command.

In init, you manage service with service command.

You’ll notice that even though your Linux system uses systemd, it is still able to use the service command (intended to be used with init system). This is because service command is actually redirect to systemctl. It’s sort of backward compatibility introduced by systemd because sysadmins were habitual of using the service command.

I’ll show both systemctl and service command in this tutorial.

_I am Ubuntu 18.04 here, but the process (no pun intended) is the same for other versions._

### Method 1: Managing services in Linux with systemd

I am starting with systemd because of the obvious reason of its widespread adoption.

#### 1\. List all services

In order to manage the services, you first need to know what services are available on your system.

You can use the systemd command to list all the services on your Linux system:

```
systemctl list-unit-files --type service -all
```

![systemctl list-unit-files][3]

This command will output the state of all services. The value of a service’s state can be enabled, disabled, masked (inactive until mask is unset), static and generated.

Combine it with the [grep command][4] and you can **display just the running services**:

```
sudo systemctl | grep running
```

![Display running services systemctl][5]

Now that you know how to reference all different services, you can start actively managing them.

**Note:** ***&lt;service-***_**name&gt;**_ _in the commands should be replaced by the name of the service you wish to manage (e.g. network-manager, ufw etc.)._

#### **2\. Start a** service

To start a service in Linux, you just need to use its name like this:

```
systemctl start <service-name>
```

#### 3\. **Stop** a service

To stop a systemd service, you can use the stop option of systemctl command:

```
systemctl stop <service-name>
```

#### 4\. Re**start** a service

To restart a service in Linux with systemd, you can use:

```
systemctl restart <service-name>
```

#### 5\. Check the status of a service

You can confirm that you have successfully executed a certain action by printing the service status:

```
systemctl status <service-name>
```

This will output information in the following manner:

![systemctl status][6]

That was systemd. Let’s switch to init now.

### Method 2: Managing services in Linux with init

The commands in init are also as simple as system.

#### 1\. List all services

To list all the Linux services, use

```
service --status-all
```

![service –status-all][7]

The services preceded by **[ – ]** are **disabled** and those with **[ + ]** are **enabled**.

#### **2\. Start** a service

To start a service in Ubuntu and other distributions, use this command:

```
service <service-name> start
```

#### **3\. Stop** a service

Stopping a service is equally easy.

```
service <service-name> stop
```

#### 4\. Re**start** a service

If you want to restart a service, the command is:

```
service <service-name> restart
```

#### 5\. Check the status of a service

Furthermore, to check if your intended result was achieved, you can output the service ****status**:**

```
service <service-name> status
```

This will output information in the following manner:

![service status][8]

This will, most importantly, tell you if a certain service is active **(**running**)** or not.

**Wrapping Up**

Today I detailed two very simple methods of managing services on Ubuntu or any other Linux system. I hope this article was helpful to you.

Which method do you prefer? Let us know in the comment section below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/start-stop-restart-services-linux/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/keyboard-mouse-sharing-between-computers/
[2]: https://itsfoss.com/set-up-firewall-gufw/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/systemctl_list_services.png?ssl=1
[4]: https://linuxhandbook.com/grep-command-examples/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/systemctl_grep_running.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/systemctl_status.jpg?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/service_status_all.png?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/service_status.jpg?ssl=1
