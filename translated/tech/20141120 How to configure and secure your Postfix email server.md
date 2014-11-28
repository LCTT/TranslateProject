Postfix邮件服务器的配置与安全加固
================================================================================
![](http://techarena51.com/wp-content/uploads/2014/08/postfix.png)

当你启动并运行应用服务器后，你就需要一台好的邮件服务器来为你传递邮件。我为我所有的服务器开通了postfix邮件服务，下面就是我常用的配置。

### CentOS 6上安装Postfix ###

    yum install postfix

默认安装了Sendmail，所以最好将它停掉并移除。

    service sendmail stop
    yum remove sendmail

Postfix包含了**两个配置文件main.cf和master.cf**，对于基本的配置，你需要修改main.cf。同时，postfix可以像shell变量一样定义参数，并通过美元符号来调用。这些参数不需要再使用前定义，Postfix只在运行中需要时才会查询某个参数。

### 配置postfix ###

    vim /etc/postfix/main.cf

去掉以下行的注释

    #Add the hostname of your machine
    myhostname = yourhostname.com
    
    #From Domain to be used when mail is sent from this linux machine
    myorigin = $myhostname
    
    #The network interface to receive mail on, I prefer localhost as I only want emails from this system to be delivered
    inet_interfaces = localhost
    
    # The protocol to use when postfix will make or accept a connection. You can use “all” if you want to enable IPv6 support
    inet_protocols = ipv4
    
    
    #Domains to receive email for
    mydestination = $myhostname, localhost.$mydomain, localhost
    
    #Only forward emails for the local machine and not machines on the network.
    mynetworks_style = host

启动postfix

    service postfix start

这些基本的postfix配置可以让你的机器发送邮件，你可以通过发送邮件并检查“maillog”日志文件来验证。

    echo test mail | mail -s "test"  leo@techarena51.com && sudo tail -f /var/log/maillog
    
    #Logs should output the following
    Aug 25 14:16:21 vps postfix/smtp[32622]: E6A372DC065D: to=, relay=smtp.mailserver.org[50.56.21.176], delay=0.8, delays=0.1/0/0.43/0.27, dsn=2.0.0, status=sent (250 Great success)
    Aug 25 14:16:21 vps postfix/qmgr[5355]: E6A372DC065D: removed

但是，上述配置并不够，因为邮件服务大多数时候都会被垃圾邮件挤满，你需要添加SPF、PTR和DKIM记录。你的邮件仍然可能被当作垃圾邮件来投递，因为你的IP地址被列入了黑名单，大多数时候是因为你的vps先前被入侵了。

另外一种选择，或者说是更好的方式是使用第三方邮件提供商提供的邮件服务，如Gmail，或者甚至是Mailgun。我使用Mailgun，因为它们提供了每个月10000封免费电子邮件，而Gmail则提供了每天100封左右的邮件。

在“/etc/postfix/main.cf”中，你需要添加“smtp.mailgun.com”作为你的“转发主机”，并启用“SASL”验证，这样postfix就可以连接并验证到远程Mailgun服务器。

添加或取消以下行的注释。

    relayhost = [smtp.mailgun.org]
    smtp_sasl_auth_enable = yes
    smtp_sasl_password_maps=static:your_username:your_password
    smtp_sasl_security_options=noanonymous

Postfix本身不会实施“SASL”验证，因此你需要安装“cyrus-sasl-plain”。

    sudo yum install cyrus-sasl-plain

如果你不安装此包，那么你就会收到这条错误信息“SASL authentication failed; cannot authenticate to server smtp.mailgun.org[50.56.21.176]: no mechanism available)”

重启postfix

    sudo service postfix restart

### 使用TLS加固Postfix安全 ###

Postfix支持TLS，它是SSL的后继者，允许你使用基于密钥的验证来加密数据。我推荐你阅读http://www.postfix.org/TLS_README.html，以了解tls是怎么和postfix一起工作的。

为了使用TLS，你需要生成一个私钥和一个由证书授权机构颁发的证书。在本例中，我将使用自颁发的证书。

    sudo yum install mod_ssl openssl
    # Generate private key 
    openssl genrsa -out smtp.key 2048 
    
    # Generate CSR 
    openssl req -new -key smtp.key -out smtp.csr
    
    # Generate Self Signed Key
    openssl x509 -req -days 365 -in smtp.csr -signkey smtp.key -out smtp.crt
    
    # Copy the files to the correct locations
    cp smtp.crt /etc/pki/tls/certs
    cp smtp.key /etc/pki/tls/private/smtp.key
    cp smtp.csr /etc/pki/tls/private/smtp.csr

打开postfix配置文件，然后添加以下参数。

    sudo vim /etc/postfix/main.cf
    
    smtp_tls_security_level = may
    smtpd_tls_security_level = may
    smtp_tls_note_starttls_offer = yes
    
    smtpd_tls_key_file = /etc/pki/tls/private/smtp.key
    smtpd_tls_cert_file = /etc/pki/tls/certs
    smtp_tls_CAfile = /etc/ssl/certs/ca.crt
    smtp_tls_loglevel = 1

安全级别“may”意味着宣告对远程SMTP客户端上的STARTTLS的支持，但是客户端不需要使用加密。我在这里用它作为每个[mailgun文档][1]，但是如果你想要强制使用TLS加密，可以使用“encrypt”。

    service postfix restart
    #Send  a test email
    echo test mail | mail -s "test"  test@yourdomain.com && sudo tail -f /var/log/maillog

你应该会看到以下信息

    Aug 21 00:00:06 vps postfix/smtp[4997]: setting up TLS connection to smtp.mailgun.org[50.56.21.176]:587
    Aug 21 00:00:06 vps postfix/smtp[4997]: Trusted TLS connection established to smtp.mailgun.org[50.56.21.176]:587: TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits)

如果一切正常，你可以注释掉以下参数。

“smtp_tls_loglevel = 1”

对于故障排除，我推荐你阅读[Postfix小建议和排障命令][2]

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/configure-secure-postfix-email-server/

作者：[Leo G][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://documentation.mailgun.com/user_manual.html#smtp-relay
[2]:http://techarena51.com/index.php/postfix-configuration-and-explanation-of-parameters/
