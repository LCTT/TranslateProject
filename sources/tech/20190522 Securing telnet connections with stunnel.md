[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Securing telnet connections with stunnel)
[#]: via: (https://fedoramagazine.org/securing-telnet-connections-with-stunnel/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

Securing telnet connections with stunnel
======

![][1]

Telnet is a client-server protocol that connects to a remote server through TCP over port 23. Telnet does not encrypt data and is considered insecure and passwords can be easily sniffed because data is sent in the clear. However there are still legacy systems that need to use it. This is where **stunnel** comes to the rescue.

Stunnel is designed to add SSL encryption to programs that have insecure connection protocols. This article shows you how to use it, with telnet as an example.

### Server Installation

Install stunnel along with the telnet server and client [using sudo][2]:

```
sudo dnf -y install stunnel telnet-server telnet
```

Add a firewall rule, entering your password when prompted:

```
firewall-cmd --add-service=telnet --perm
firewall-cmd --reload
```

Next, generate an RSA private key and an SSL certificate:

```
openssl genrsa 2048 > stunnel.key
openssl req -new -key stunnel.key -x509 -days 90 -out stunnel.crt
```

You will be prompted for the following information one line at a time. When asked for _Common Name_ you must enter the correct host name or IP address, but everything else you can skip through by hitting the **Enter** key.

```
You are about to be asked to enter information that will be
incorporated into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:
State or Province Name (full name) []:
Locality Name (eg, city) [Default City]:
Organization Name (eg, company) [Default Company Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (eg, your name or your server's hostname) []:
Email Address []
```

Merge the RSA key and SSL certificate into a single _.pem_ file, and copy that to the SSL certificate directory:

```
cat stunnel.crt stunnel.key > stunnel.pem
sudo cp stunnel.pem /etc/pki/tls/certs/
```

Now it’s time to define the service and the ports to use for encrypting your connection. Choose a port that is not already in use. This example uses port 450 for tunneling telnet. Edit or create the _/etc/stunnel/telnet.conf_ file:

```
cert = /etc/pki/tls/certs/stunnel.pem
sslVersion = TLSv1
chroot = /var/run/stunnel
setuid = nobody
setgid = nobody
pid = /stunnel.pid
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
[telnet]
accept = 450
connect = 23
```

The **accept** option is the port the server will listen to for incoming telnet requests. The **connect** option is the internal port the telnet server listens to.

Next, make a copy of the systemd unit file that allows you to override the packaged version:

```
sudo cp /usr/lib/systemd/system/stunnel.service /etc/systemd/system
```

Edit the _/etc/systemd/system/stunnel.service_ file to add two lines. These lines create a chroot jail for the service when it starts.

```
[Unit]
Description=TLS tunnel for network daemons
After=syslog.target network.target

[Service]
ExecStart=/usr/bin/stunnel
Type=forking
PrivateTmp=true
ExecStartPre=-/usr/bin/mkdir /var/run/stunnel
ExecStartPre=/usr/bin/chown -R nobody:nobody /var/run/stunnel

[Install]
WantedBy=multi-user.target
```

Next, configure SELinux to listen to telnet on the new port you just specified:

```
sudo semanage port -a -t telnetd_port_t -p tcp 450
```

Finally, add a new firewall rule:

```
firewall-cmd --add-port=450/tcp --perm
firewall-cmd --reload
```

Now you can enable and start telnet and stunnel.

```
systemctl enable telnet.socket stunnel@telnet.service --now
```

A note on the _systemctl_ command is in order. Systemd and the stunnel package provide an additional [template unit file][3] by default. The template lets you drop multiple configuration files for stunnel into _/etc/stunnel_ , and use the filename to start the service. For instance, if you had a _foobar.conf_ file, you could start that instance of stunnel with _systemctl start[stunnel@foobar.service][4]_ , without having to write any unit files yourself.

If you want, you can set this stunnel template service to start on boot:

```
systemctl enable stunnel@telnet.service
```

### Client Installation

This part of the article assumes you are logged in as a normal user ([with sudo privileges][2]) on the client system. Install stunnel and the telnet client:

```
dnf -y install stunnel telnet
```

Copy the _stunnel.pem_ file from the remote server to your client _/etc/pki/tls/certs_ directory. In this example, the IP address of the remote telnet server is 192.168.1.143.

```
sudo scp myuser@192.168.1.143:/etc/pki/tls/certs/stunnel.pem
/etc/pki/tls/certs/
```

Create the _/etc/stunnel/telnet.conf_ file:

```
cert = /etc/pki/tls/certs/stunnel.pem
client=yes
[telnet]
accept=450
connect=192.168.1.143:450
```

The **accept** option is the port that will be used for telnet sessions. The **connect** option is the IP address of your remote server and the port it’s listening on.

Next, enable and start stunnel:

```
systemctl enable stunnel@telnet.service --now
```

Test your connection. Since you have a connection established, you will telnet to _localhost_ instead of the hostname or IP address of the remote telnet server:

```
[user@client ~]$ telnet localhost 450
Trying ::1...
telnet: connect to address ::1: Connection refused
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

Kernel 5.0.9-301.fc30.x86_64 on an x86_64 (0)
server login: myuser
Password: XXXXXXX
Last login: Sun May  5 14:28:22 from localhost
[myuser@server ~]$
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/securing-telnet-connections-with-stunnel/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/stunnel-816x345.jpg
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://fedoramagazine.org/systemd-template-unit-files/
[4]: mailto:stunnel@foobar.service
