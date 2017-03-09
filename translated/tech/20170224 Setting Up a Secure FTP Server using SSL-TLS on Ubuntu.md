

��Ubuntu��ʹ��SSL/TLS�һ����ȫ��FTP������
============================================================

 �������������ѵ����� - [10����ѵ�Linux����Ա������][13] | [4����ѵ�shell�ű�������][14]

�ڱ��̳��У����ǽ��������ʹ��Ubuntu 16.04 / 16.10�е�SSL / TLS����FTP��������VSFTPD�����ǳ���ȫ��FTP�ػ����̡�����

�������Ϊ����CentOS�ķ��а氲װһ����ȫ��FTP��������������Ķ� �C [��CentOS��ʹ��SSL / TLS����FTP������][2]

����ѭ��ָ���еĸ�������֮�����ǽ��˽���FTP�����������ü��ܷ���Ļ���ԭ����ȷ����ȫ�����ݴ���������Ҫ��


####Ҫ��

1.  ����� [��Ubuntu�ϰ�װ������һ��FTP������][1]

�����ǽ�����һ��֮ǰ��ȷ�������е������������root������л���
Before we move further, make sure that all commands in this article will be run as root or [sudo��Ȩ�˺�][3].

### ��һ������Ubuntu��ΪFTP����SSL/TLS֤��
1.���ǽ�������/etc/ssl/�´���һ����Ŀ¼�����洢SSL/TLS֤�����Կ�ļ�������������ڣ�

```
$ sudo mkdir /etc/ssl/private
```

2. ���������������һ���ļ�������֤�����Կ��ͨ��������������

```
$ sudo openssl req -x509 -nodes -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -days 365 -newkey rsa:2048
```

����������ʾ��ش��������⣬��Ҫ������������ڽű���ֵ��
```
Country Name (2 letter code) [XX]:IN
State or Province Name (full name) []:Lower Parel
Locality Name (eg, city) [Default City]:Mumbai
Organization Name (eg, company) [Default Company Ltd]:TecMint.com
Organizational Unit Name (eg, section) []:Linux and Open Source
Common Name (eg, your name or your server's hostname) []:tecmint
Email Address []:admin@tecmint.com
```

### �ڶ�������Ubuntu������VSFTPD��ʹ��SSL/TLS

3.�����ǽ���VSFTPD����֮ǰ������[UFW����ǽ������][4]���û������Ǳ���򿪶˿�990��40000-50000����������VSFTD�����ļ��зֱ�����TLS���Ӻͱ����˿ڵĶ˿ڷ�Χ��
```
$ sudo ufw allow 990/tcp
$ sudo ufw allow 40000:50000/tcp
$ sudo ufw status
```

4. ���ڣ���VSFTPD�����ļ�������SSL��ϸ��Ϣ��

```
$ sudo vi /etc/vsftpd/vsftpd.conf
OR
$ sudo nano /etc/vsftpd/vsftpd.conf
```

Ȼ����ӻ�λѡ��`ssl_enable`��������ֵ����ΪYES������SSL��ʹ�ã�ͬ������ΪTLS��SSL����ȫ�����ǽ�ͨ������`ssl_tlsv1`ѡ������VSFTPDʹ��TLS��


```
ssl_enable=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
```

5. ��������ʹ��`��`�ַ�ע�͵�������У�������ʾ��

```
#rsa_cert_file=/etc/ssl/private/ssl-cert-snakeoil.pem
#rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
```

Ȼ������������Զ���SSL֤�����Կ�ļ���λ�ã�

```
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem
```

6.���ڣ�����Ҳ������ֹ�������û�ʹ��SSL��½��������ʹ���еķ�������½ʹ��һ����ȫ��SSL�������������ݣ������ڵ�½���ڼ䷢�����룺

```
allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```

7.���⣬���ǿ���ʹ������ѡ����FTP����������Ӹ���İ�ȫ���� ��ʹ��ѡ��`require_ssl_reuse=YES`�����õ�SSL�������Ӷ���ҪչʾSSL�Ự���ã�֤������֪���Ϳ����ŵ���ͬ�������ܡ����ԣ�����Ӧ�ý�������


```
require_ssl_reuse=NO
```

���⣬���ǿ�������VSFTPD����ʹ��`ssl_ciphers`ѡ����м���SSL���ӵ�SSL���롣 �⽫�����ڴ�ܹ����ߵ��κ�Ŭ������ǿ�Ƶõ�һ���ض������룬�����ֵ�©����

```
ssl_ciphers=HIGH
```


8. Ȼ�����Ƕ��屻���˿ڵĶ˿ڷ�Χ����С�����˿ڣ���

```
pasv_min_port=40000
pasv_max_port=50000
```

9. Ҫ����SSL���ԣ���ζ��openSSL������ϼ�¼��VSFTPD��־�ļ������ǿ���ʹ��`debug_ssl`ѡ�
```
debug_ssl=YES
```

��󣬱����ļ����ҹر�����Ȼ������VSFTPD����

```
$ systemctl restart vsftpd
```

### ����������Ubuntu��ʹ��SSL / TLS������֤FTP

10. ִ�������������ú�ͨ������[ʹ���������е�FTP] [5]����VSFTPD�Ƿ�����ʹ��SSL / TLS���ӣ�������ʾ��

����������������������һ���������Ϣ��������VSFTPD�������û����������û�����֧�ּ��ܷ���İ�ȫ�ͻ��˵�½��


```
$ ftp 192.168.56.10
Connected to 192.168.56.10  (192.168.56.10).
220 Welcome to TecMint.com FTP service.
Name (192.168.56.10:root) : ravi
530 Non-anonymous sessions must use encryption.
Login failed.
421 Service not available, remote server has closed connection
ftp>
```

��������в�֧�ּ��ܷ���Ӷ�����������������ˣ�Ҫ��ȫ���ӵ������˼��ܷ����FTP��������������Ҫһ��Ĭ��֧��SSL/TLS���ӵ�FTP�ͻ��ˣ�����FileZilla��

### ���Ĳ����ڿͻ����ϰ�װFileZillaStep����ȫ������FTP

FileZilla��һ��ǿ��ģ��㷺ʹ�õĿ�ƽ̨FTP�ͻ��ˣ�֧����SSL/TLS�ϵ�FTP��Ϊ����Linux�ͻ��˻����ϰ�װFileZilla��ʹ����������

```
--------- On Debian/Ubuntu ---------
$ sudo apt-get install filezilla   
--------- On CentOS/RHEL/Fedora --------- 
# yum install epel-release filezilla
--------- On Fedora 22+ --------- 
$ sudo dnf install filezilla
```

12. һ����װ��ɣ�����Ȼ����File=>Sites Manager���ߣ���Ctrl+S������ȡ�����Site Manager��

[
 ![Filezilla Site Manager](http://www.tecmint.com/wp-content/uploads/2017/02/Filezilla-Site-Manager.png) 
][6]

Filezilla Site Manager

13. ���ڣ���������/վ�����֣����IP��ַ������ʹ�õ�Э�飬���ܺ͵�½���ͣ����������Ļ��ʹ���������㷽����ֵ����

���New Site��ť������һ���µ�վ��/�������ӡ�

```
Host:  192.168.56.10
Protocol:  FTP �C File Transfer Protocol
Encryption:  Require explicit FTP over   #recommended 
Logon Type: Ask for password	        #recommended 
User: username
```
[
 ![��Filezilla�������µ�FTPվ��](http://www.tecmint.com/wp-content/uploads/2017/02/Configure-New-FTP-Site-on-Filezilla.png) 
][7]

��Filezilla�������µ�FTPվ��

14. Ȼ�������Ľ��浥���������������룬Ȼ����֤����SSL / TLS���ӵ�֤�飬���ٴε���ȷ�������ӵ�FTP��������
[
 ![��֤FTP��SSL֤��](http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate-1.png) 
][8]

��֤FTP��SSL֤��

15.���ڣ���Ӧ��ͨ��TLS���ӳɹ��ص�½��FTP���������������״̬���֣�����ȡ�й�����ӿڵĸ�����Ϣ��

[
 ![����Ubuntu��FTP������](http://www.tecmint.com/wp-content/uploads/2017/02/Connected-Ubuntu-FTP-Server.png) 
][9]

����Ubuntu��FTP������

16. ���������[�ӱ��صĻ��������ļ���FTP������][10]���ļ�����, �鿴FileZilla�ӿڵ��¶����鿴�й��ļ�����ı��档

[
 ![ʹ��Filezilla��ȫ�Ĵ���FTP�ļ�](http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-using-FTP.png) 
][11]

ʹ��Filezilla��ȫ�Ĵ���FTP�ļ�

�������� ʼ�ռ�ס����װFTP�������������ü��ܷ������ĳЩ��ȫ������ ���������ڱ��̳��н��͵ģ�����������FTP������ʹ��SSL / TLS������ʵ��Ubuntu 16.04 / 16.10�еİ�ȫ�ԡ�

�������FTP������������SSL/TLS�����κ����⣬��ʹ������ע�ͱ����������Ա��̳�/�����������뷨��

--------------------------------------------------------------------------------


���߼�飺

Aaron Kili��Linux��F.O.S.S�����ߣ������Ƴ���Linux SysAdmin���翪����Ա��Ŀǰ��TecMint�����ݴ����ߣ���ϲ������Ժ����������ŷ���֪ʶ��

--------------------------------------------------------------------------------

via: http://www.tecmint.com/secure-ftp-server-using-ssl-tls-on-ubuntu/

���ߣ�[Aaron Kili][a]
���ߣ�[����ID](https://github.com/DockerChen)
У�ԣ�[У����ID](https://github.com/У����ID)

������ [LCTT](https://github.com/LCTT/TranslateProject) ԭ�����룬[Linux�й�](https://linux.cn/) �����Ƴ�

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-ftp-server-in-ubuntu/
[2]:http://www.tecmint.com/axel-commandline-download-accelerator-for-linux/
[3]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[4]:http://www.tecmint.com/how-to-install-and-configure-ufw-firewall/
[5]:http://www.tecmint.com/sftp-command-examples/
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Filezilla-Site-Manager.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-New-FTP-Site-on-Filezilla.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Verify-FTP-SSL-Certificate-1.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Connected-Ubuntu-FTP-Server.png
[10]:http://www.tecmint.com/sftp-command-examples/
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Transfer-Files-Securely-using-FTP.png
[12]:http://www.tecmint.com/author/aaronkili/
[13]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[14]:http://www.tecmint.com/free-linux-shell-scripting-books/