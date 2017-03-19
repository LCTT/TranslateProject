Yuan0302  Translating
FTPS (FTP over SSL) vs SFTP (SSH File Transfer Protocol)
============================================================

[
 ![ftps sftp](http://www.techmixer.com/pic/2015/07/ftps-sftp.png "ftps sftp") 
][5]

 ![ftps sftp](data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs= "ftps sftp") 

**SSH File transfer protocol, SFTP** or **File Transfer protocol via Secure Socket Layer, **FTPS are the most common secure FTP communication technologies used to transfer computer files from one host to another host over a TCP networks. Both SFTP and FTPS offer a high level file transfer security protection with strong algorithms such as AES and Triple DES to encrypt any data transferred.

But the most notable differences between SFTP and FTPS is how connections are authenticated and managed.

FTPS is FTP utilising Secure Secure Layer (SSL) certificate for Security. The entire secure FTP connection is authenticated using an User ID, Password and SSL certificate. Once FTPS connection established, [FTP client software][6] will check destination [FTP server ][7]if the server’s certificate is trusted.

The SSL certificate will considered trusted if either the certificate was signed off by a known certificate authority (CA) or if the certificate was self-signed (by your partner) and you have a copy of their public certificate in your trusted key store. All username and password information for FTPS will be encrypted through secure FTP connection.

### Below are the FTPS pros and cons:

Pros:

*   The communication can be read and understood by a human
*   Provides services for server-to-server file transfer
*   SSL/TLS has good authentication mechanisms (X.509 certificate features)
*   FTP and SSL support is built into many internet communications frameworks

Cons:

*   Does not have a uniform directory listing format
*   Requires a secondary DATA channel, which makes it hard to use behind firewalls
*   Does not define a standard for file name character sets (encodings)
*   Not all FTP servers support SSL/TLS
*   Does not have a standard way to get and change file or directory attributes

SFTP or SSH File Transfer Protocol is another secure Secure File Transfer Protocol is designed as a SSH extension to provide file transfer capability, so it usually uses only the SSH port for both data and control. When your [FTP client][8] software connect to SFTP server, it will transmit public key to the server for authentication. If the keys match, along with any user/password supplied, then the authentication will succeed.

### Below are the SFTP Pros and Cons:

Pros:

*   Has only one connection (no need for a DATA connection).
*   FTP connection is always secured
*   FTP directory listing is uniform and machine-readable
*   FTP protocol includes operations for permission and attribute manipulation, file locking, and more functionality.

Cons:

*   The communication is binary and can not be logged “as is” for human reading
    SSH keys are harder to manage and validate.
*   The standards define certain things as optional or recommended, which leads to certain compatibility problems between different software titles from different vendors.
*   No server-to-server copy and recursive directory removal operations
*   No built-in SSH/SFTP support in VCL and .NET frameworks.

Overall most of FTP server software support both secure FTP technologies with strong authentication options.

But SFTP will be clear winner since it’s very firewall friendly. SFTP only needs a single port number (default of 22) to be opened through the firewall.  This port will be used for all SFTP communications, including the initial authentication, any commands issued, as well as any data transferred.

FTPS will be more difficult to implement through a tightly secure firewall since FTPS uses multiple network port numbers. Every time a file transfer request (get, put) or directory listing request is made, another port number needs to be opened.  Therefore it have to open a range of ports in your firewalls to allow for FTPS connections, which can be a security risk for your network.

FTP Server software that supports FTPS and SFTP:

1.  [Cerberus FTP Server][2]
2.  [FileZilla – Most famous free FTPs and FTPS server software][3]
3.  [Serv-U FTP Server][4]

--------------------------------------------------------------------------------

via: http://www.techmixer.com/ftps-sftp/

作者：[Techmixer.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.techmixer.com/
[1]:http://www.techmixer.com/ftps-sftp/#respond
[2]:http://www.cerberusftp.com/
[3]:http://www.techmixer.com/free-ftp-server-best-windows-ftp-server-download/
[4]:http://www.serv-u.com/
[5]:http://www.techmixer.com/pic/2015/07/ftps-sftp.png
[6]:http://www.techmixer.com/free-ftp-file-transfer-protocol-softwares/
[7]:http://www.techmixer.com/free-ftp-server-best-windows-ftp-server-download/
[8]:http://www.techmixer.com/best-free-mac-ftp-client-connect-ftp-server/
