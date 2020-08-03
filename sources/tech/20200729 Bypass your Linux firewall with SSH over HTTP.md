[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bypass your Linux firewall with SSH over HTTP)
[#]: via: (https://opensource.com/article/20/7/linux-shellhub)
[#]: author: (Domarys https://opensource.com/users/domarys)

Bypass your Linux firewall with SSH over HTTP
======
Remote work is here to stay; use this helpful open source solution to
quickly connect and access all your devices from anywhere.
![Terminal command prompt on orange background][1]

With the growth of connectivity and remote jobs, accessing remote computing resources becomes more important every day. But the requirements for providing external access to devices and hardware make this task complex and risky. Aiming to reduce this friction, [ShellHub][2] is a cloud server that allows universal access to those devices, from any external network.

ShellHub is an open source solution, licensed under Apache 2.0, that covers all those needs and allows users to connect and manage multiple devices through a single account. It was developed to facilitate developers' and programmers' tasks, making remote access to Linux devices possible for any hardware architecture.

Looking more closely, the ShellHub solution uses the HTTP transport layer to encapsulate the SSH protocol. This transport layer choice allows for seamless use on most networks as it is commonly available and accepted by most companies' firewall rules and policies.

These examples use ShellHub version 0.3.2, released on Jun 10, 2020.

### Using ShellHub

To access the platform, just go to [shellhub.io][3] and register yourself to create an account. Your registration data will help the development team to understand the user profile and provide more insight into how to improve the platform.

![ShellHub registration form][4]

Figure 1: Registration form available in [shellhub.io][5]

ShellHub's design has an intuitive and clean interface that makes all information and functionality available in the fastest way. After you've registered, you will be on the dashboard, ready to register your first device.

### Adding a device

To enable the connection of devices via ShellHub, you'll need to generate an identifier that will be used to authenticate your device when it connects to the server.

This identification must be configured inside the agent (ShellHub client) that will be saved in the device along with the image or it must be added as a Docker container.

By default, ShellHub uses Docker to run the agent, which is very convenient, as it provides frictionless addition of devices on the existing system, with Docker support being the only requirement. To add a device, you need to paste the command line, which is presented inside the ShellHub Cloud dialog (see Figure 2).

![Figure 2: Adding a device to the ShellHub Cloud][6]

By default, the device uses its MAC address as its hostname. Internally, the device is identified by its key, which is generated during the device registration to authenticate it with the server.

### Accessing devices

To access your devices, just go to View All Devices in the dashboard, or click on Devices ****on the left side menu; these will list all your registered devices.

The device state can be easily seen on the page. The online ones show a green icon next to them and can be connected by clicking on the terminal icon. You then enter the credentials and, finally, click the Connect button, see (Figure 3).

![Figure 3: Accessing a device using the terminal on the web][7]

Another way to access your devices is from any SSH client like [PuTTY][8], [Termius][9], or even the Linux terminal. We can use the ShellHub Identification, called SSHID, as the destination address to connect (e.g., ssh [username@SSHID][10]). Figure 4 illustrates how we can connect to our machine using the Linux SSH client on the terminal.

![Figure 4: Connecting to a device using the Linux terminal][11]

Whenever you log in to the ShellHub Cloud platform, you'll have access to all your registered devices on the dashboard so you can access them from everywhere, anytime. ShellHub adds simplicity to the process of keeping communications secure with your remote machines through an open source platform and in a transparent way.

Join ShellHub Community on [GitHub][2] or feel free to send your suggestions or feedback to the developers' team through [Gitter][12] or by emailing [contato@ossystems.com.br][13]. We love to receive contributions from community members!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/linux-shellhub

作者：[Domarys][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/domarys
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE (Terminal command prompt on orange background)
[2]: https://github.com/shellhub-io/shellhub
[3]: https://www.shellhub.io/
[4]: https://opensource.com/sites/default/files/uploads/shellhub_registration_form_0.png (ShellHub registration form)
[5]: https://opensource.com/article/20/7/www.shellhub.io
[6]: https://opensource.com/sites/default/files/figure2.gif
[7]: https://opensource.com/sites/default/files/figure3.gif
[8]: https://www.putty.org/
[9]: https://termius.com/
[10]: mailto:username@SSHID
[11]: https://opensource.com/sites/default/files/figure4.gif
[12]: https://gitter.im/shellhub-io/community?at=5e39ad8b3aca1e4c5f633e8f
[13]: mailto:contato@ossystems.com.br
