[#]: subject: (Drop telnet for OpenSSL)
[#]: via: (https://opensource.com/article/21/5/drop-telnet-openssl)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Drop telnet for OpenSSL
======
Telnet's lack of encryption makes OpenSSL a safer option for connecting
to remote systems.
![Lock][1]

The [telnet][2] command is one of the most popular network troubleshooting tools for anyone from systems administrators to networking hobbyists. In the early years of networked computing, telnet was used to connect to a remote system. You could use telnet to access a port on a remote system, log in, and run commands on that host.

Due to telnet's lack of encryption, it has largely been replaced by OpenSSL for this job. Yet telnet's relevance persisted (and persists in some cases even today) as a sort of intelligent `ping`. While the `ping` command is a great way to probe a host for responsiveness, that's _all_ it can do. Telnet, on the other hand, not only confirms an active port, but it can also interact with a service on that port. Even so, because most modern network services are encrypted, telnet can be far less useful depending on what you're trying to achieve.

### OpenSSL s_client

For most tasks that once required telnet, I now use OpenSSL's `s_client` command. (I use [curl][3] for some tasks, but those are cases where I probably wouldn't have used telnet anyway.) Most people know [OpenSSL][4] as a library and framework for encryption, but not everyone realizes it's also a command. The `s_client` component of the `openssl` command implements a generic SSL or TLS client, helping you connect to a remote host using SSL or TLS. It's intended for testing and, internally at least, uses the same functionality as the library.

### Install OpenSSL

OpenSSL may already be installed on your Linux system. If not, you can install it with your distribution's package manager:


```
`$ sudo dnf install openssl`
```

On Debian or similar:


```
`$ sudo apt install openssl`
```

Once it's installed, verify that it responds as expected:


```
$ openssl version
OpenSSL x.y.z FIPS
```

### Verify port access

The most basic telnet usage is a task that looks something like this:


```
$ telnet mail.example.com 25
Trying 98.76.54.32...
Connected to example.com.
Escape character is '^]'.
```

This opens an interactive session with (in this example) whatever service is listening on port 25 (probably a mail server). As long as you gain access, you can communicate with the service.

Should port 25 be inaccessible, the connection is refused.

OpenSSL is similar, although usually less interactive. To verify access to a port:


```
$ openssl s_client -connect example.com:80
CONNECTED(00000003)
140306897352512:error:1408F10B:SSL [...]

no peer certificate available

No client certificate CA names sent

SSL handshake has read 5 bytes and written 309 bytes
Verification: OK

New, (NONE), Cipher is (NONE)
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 0 (ok)
```

This is little more than a targeted ping, though. As you can see from the output, no SSL certificate was exchanged, so the connection immediately terminated. To get the most out of `openssl s_client`, you must target the encrypted port.

### Interactive OpenSSL

Web browsers and web servers interact such that traffic directed at port 80 is actually forwarded to 443, the port reserved for encrypted HTTP traffic. Knowing this, you can navigate to encrypted ports with the `openssl` command and interact with whatever web service is running on it.

First, make a connection to a port using SSL. Using the `-showcerts` option causes the SSL certificate to print to your terminal, making the initial output a lot more verbose than telnet:


```
$ openssl s_client -connect example.com:443 -showcerts
[...]
    0080 - 52 cd bd 95 3d 8a 1e 2d-3f 84 a0 e3 7a c0 8d 87   R...=..-?...z...
    0090 - 62 d0 ae d5 95 8d 82 11-01 bc 97 97 cd 8a 30 c1   b.............0.
    00a0 - 54 78 5c ad 62 5b 77 b9-a6 35 97 67 65 f5 9b 22   Tx\\.b[w..5.ge.."
    00b0 - 18 8a 6a 94 a4 d9 7e 2f-f5 33 e8 8a b7 82 bd 94   ..j...~/.3......

    Start Time: 1619661100
    Timeout   : 7200 (sec)
    Verify return code: 0 (ok)
    Extended master secret: no
    Max Early Data: 0
-
read R BLOCK
```

You're left in an interactive session. Eventually, this session will close, but if you act promptly, you can send HTTP signals to the server:


```
[...]
GET / HTTP/1.1
HOST: example.com
```

Press **Return** twice, and you receive the data for `example.com/index.html`:


```
[...]
&lt;body&gt;
&lt;div&gt;
    &lt;h1&gt;Example Domain&lt;/h1&gt;
    &lt;p&gt;This domain is for use in illustrative examples in documents. You may use this
    domain in literature without prior coordination or asking for permission.&lt;/p&gt;
    &lt;p&gt;&lt;a href="[https://www.iana.org/domains/example"\&gt;More][5] information...&lt;/a&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;/body&gt;
&lt;/html&gt;
```

#### Email server

You can also use OpenSSL's `s_client` to test an encrypted email server. For this to work, you must have your test user's username and password encoded in Base64.
Here's an easy way to do this:


```
$ perl -MMIME::Base64 -e 'print encode_base64("username");'
$ perl -MMIME::Base64 -e 'print encode_base64("password");'
```

Once you have those values recorded, you can connect to a mail server over SSL, usually on port 587:


```
$ openssl s_client -starttls smtp \
-connect email.example.com:587
&gt; ehlo example.com
&gt; auth login
##paste your user base64 string here##
##paste your password base64 string here##

&gt; mail from: [noreply@example.com][6]
&gt; rcpt to: [admin@example.com][7]
&gt; data
&gt; Subject: Test 001
This is a test email.
.
&gt; quit
```

Check your email (in this sample code, it's `admin@example.com`) for a test message from `noreply@example.com`.

### OpenSSL or telnet?

There are still uses for telnet, but it's not the indispensable tool it once was. The command has been relegated to "legacy" networking packages on many distributions, but without a `telnet-ng` or some obvious successor, admins are sometimes puzzled about why it's excluded from default installs. The answer is that it's not essential anymore, it's getting less and less useful—and that's _good_. Network security is important, so get comfortable with tools that interact with encrypted interfaces, so you don't have to disable your safeguards during troubleshooting.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/drop-telnet-openssl

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://www.redhat.com/sysadmin/telnet-netcat-troubleshooting
[3]: https://opensource.com/downloads/curl-command-cheat-sheet
[4]: https://www.openssl.org/
[5]: https://www.iana.org/domains/example"\>More
[6]: mailto:noreply@example.com
[7]: mailto:admin@example.com
