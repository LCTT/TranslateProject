translating---geekpi

How to Integrate iRedMail Roundcube with Samba4 AD DC – Part 12
============================================================

by [Matei Cezar][15] | Published: May 13, 2017 | Last Updated: May 14, 2017

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][16] | [4 Free Shell Scripting eBooks][17]

[Roundcube][3], one of the most used webmail user agent in Linux, offers a modern web interface for end users to interact with all mail services in order to read, compose and send e-mails. Roundcube supports a variety of mail protocols, including the secured ones, such IMAPS, POP3S or submission.

In this topic we’ll discuss how to configure Roundcube in iRedMail with IMAPS and submission secured ports to retrieve and send emails for Samba4 AD accounts, how to access iRedMail Roundcube web interface from a browser and add a web address alias, how to enable Samba4 AD integration for Global LDAP Address Book and how to disable some unneeded iRedMail services.

#### Requirements

1.  [How to Install iRedMail on CentOS 7 for Samba4 AD Integration][1]

2.  [Configure iRedMail on CentOS 7 for Samba4 AD Integration][2]

### Step 1: Declare E-mail Address for Domain Accounts in Samba4 AD DC

1. In order send and receive mail for Samba4 AD DC domain accounts, you need to edit each user account and explicitly set email filed with the proper e-mail address by opening ADUC tool from a [Windows machine with RSAT tools installed][4] and joined to Samba4 AD as illustrated in the below image.

 [![Add Email Account to Join Samba4 AD DC](https://www.tecmint.com/wp-content/uploads/2017/05/Active-Directory-User-and-Computers.jpg)][5] 

Add Email Account to Join Samba4 AD DC

2. Similarly, to use mail lists, you need to create groups in ADUC, add the corresponding e-mail address for each group and assign the proper user accounts as members of the group.

With this setup created as a mail list, all members mailboxes of a Samba4 AD group will receive mail destined for an AD group e-mail address. Use the below screenshots as a guide to declare e-mail filed for a Samba4 group account and add domain users as members of the group.

Make sure all accounts members added to a group have their e-mail address declared.

 [![Create Group Admin for Samba4 AD DC](https://www.tecmint.com/wp-content/uploads/2017/05/Create-Group-Admin-for-Samba4-AD-DC.png)][6] 

Create Group Admin for Samba4 AD DC

 [![Add Users to Group](https://www.tecmint.com/wp-content/uploads/2017/05/Add-Users-to-Group.png)][7] 

Add Users to Group

In this example, all mails sent to admins@tecmint.lan e-mail address declared for ‘Domain Admins’ group will be received by each member mailbox of this group.

3. An alternative method that you can use to declare the e-mail address for a Samba4 AD account is by creating a user or a group with samba-tool command line directly from one of the AD DC console and specify the e-mail address with the `--mail-address` flag.

Use one of the following command syntax to create a user with e-mail address specified:

```
# samba-tool user add  --mail-address=user_email@domain.tld  --surname=your_surname  --given-name=your_given_name  your_ad_user
```

Create a group with e-mail address specified:

```
# samba-tool group add  --mail-address=group_email@domain.tld  your_ad_group
```

To add members to a group:

```
# samba-tool group addmembers your_group user1,user2,userX
```

To list all available samba-tool command fields for a user or a group use the following syntax:

```
# samba-tool user add -h
# samba-tool group add -h
```

### Step 3: Secure Roundcube Webmail

4. Before modifying Roundcube configuration file, first, use [netstat command][8] piped through egrep filter to list the sockets that [Dovecot and Postfix][9] listen to and assure that the properly secured ports (993 for IMAPS and 587 for submission) are active and enabled.

```
# netstat -tulpn| egrep 'dovecot|master'
```

5. To enforce mail reception and transfer between Roundcube and iRedMail services on secured IMAP and SMTP ports, open Roundcube configuration file located in /var/www/roundcubemail/config/config.inc.php and make sure you change the following lines, for localhost in this case, as shown in the below excerpt:

```
// For IMAPS
$config['default_host'] = 'ssl://127.0.0.1';
$config['default_port'] = 993;
$config['imap_auth_type'] = 'LOGIN';
// For SMTP
$config['smtp_server'] = 'tls://127.0.0.1';
$config['smtp_port'] = 587;
$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';
$config['smtp_auth_type'] = 'LOGIN';
```

This setup is highly recommended in case Roudcube is installed on a remote host than the one that provides mail services (IMAP, POP3 or SMTP daemons).

6. Next, don’t close the configuration file, search and make the following small changes in order for Roundcube to be visited only via HTTPS protocol, to hide the version number and to automatically append the domain name for accounts who login in the web interface.

```
$config['force_https'] = true;
$config['useragent'] = 'Your Webmail'; // Hide version number
$config['username_domain'] = 'domain.tld'
```

7. Also, disable the following plugins: managesieve and password by adding a comment `(//)` in front of the line that starts with $config[‘plugins’].

Users will change their password from a Windows or Linux machine joined to Samba4 AD DC once they login and authenticate to the domain. A sysadmin will globally manage all sieve rules for domain accounts.

```
// $config['plugins'] = array('managesieve', 'password');
```

8. Finally, save and close the configuration file and visit Roundcube Webmail by opening a browser and navigate to iRedMail IP address or FQDN/mail location via HTTPS protocol.

The first time when you visit Roundcube an alert should appear on the browser due to the Self-Signed Certificate the web server uses. Accept the certificate and login with a Samba AD account credentials.

```
https://iredmail-FQDN/mail
```
 [![Roundcube Webmail Login](https://www.tecmint.com/wp-content/uploads/2017/05/Roundcube-Webmail-Login.png)][10] 

Roundcube Webmail Login

### Step 3: Enable Samba AD Contacts in Roundcube

9. To configure Samba AD Global LDAP Address Book to appear Roundcube Contacts, open Roundcube configuration file again for editing and make the following changes:

Navigate to the bottom of the file and identify the section that begins with ‘# Global LDAP Address Book with AD’, delete all its content until the end of the file and replace it with the following code block:

```
# Global LDAP Address Book with AD.
#
$config['ldap_public']["global_ldap_abook"] = array(
'name'          => 'tecmint.lan',
'hosts'         => array("tecmint.lan"),
'port'          => 389,
'use_tls'       => false,
'ldap_version'  => '3',
'network_timeout' => 10,
'user_specific' => false,
'base_dn'       => "dc=tecmint,dc=lan",
'bind_dn'       => "vmail@tecmint.lan",
'bind_pass'     => "your_password",
'writable'      => false,
'search_fields' => array('mail', 'cn', 'sAMAccountName', 'displayname', 'sn', 'givenName'),
'fieldmap' => array(
'name'        => 'cn',
'surname'     => 'sn',
'firstname'   => 'givenName',
'title'       => 'title',
'email'       => 'mail:*',
'phone:work'  => 'telephoneNumber',
'phone:mobile' => 'mobile',
'department'  => 'departmentNumber',
'notes'       => 'description',
),
'sort'          => 'cn',
'scope'         => 'sub',
'filter' => '(&(mail=*)(|(&(objectClass=user)(!(objectClass=computer)))(objectClass=group)))',
'fuzzy_search'  => true,
'vlv'           => false,
'sizelimit'     => '0',
'timelimit'     => '0',
'referrals'     => false,
);
```

On this block of code replace name, hosts, base_dn, bind_dn and bind_pass values accordingly.

10. After you’ve made all the required changes, save and close the file, login to Roundcube webmail interface and go to Address Book menu.

Hit on your Global Address Book chosen name and a contact list of all domain accounts (users and groups) with their specified e-mail address should be visible.

 [![Roundcube User Contact List](https://www.tecmint.com/wp-content/uploads/2017/05/Roundcube-User-Contact-List.png)][11] 

Roundcube User Contact List

### Step 4: Add an Alias for Roundcube Webmail Interface

11. To visit Roundcube at a web address with the following form https://webmail.domain.tld instead of the old address provided by default by iRedMail you need to make the following changes.

From a joined Windows machine with RSAT tools installed, open DNS Manager and add a new CNAME record for iRedMail FQDN, named webmail, as illustrated in the following image.

 [![DNS Webmail Properties](https://www.tecmint.com/wp-content/uploads/2017/05/DNS-Webmail-Properties.jpg)][12] 

DNS Webmail Properties

12. Next, on iRedMail machine, open Apache web server SSL configuration file located in /etc/httpd/conf.d/ssl.conf and change DocumentRoot directive to point to /var/www/roundcubemail/ system path.

file /etc/httpd/conf.d/ssl.conf excerpt:

```
DocumentRoot “/var/www/roundcubemail/”
```

Restart Apache daemon to apply changes.

```
# systemctl restart httpd
```

13. Now, point the browser to the following address and Roundcube interface should appear. Accept the Self-Signed Cerificate error to continue to login page. Replace domain.tld from this example with your own domain name.

```
https://webmail.domain.tld
```

### Step 5: Disable iRedMail Unused Services

14. Since iRedMail daemons are configured to query Samba4 AD DC LDAP server for account information and other resources, you can safely stop and disable some local services on iRedMail machine, such as LDAP database server and iredpad service by issuing the following commands.

```
# systemctl stop slapd iredpad
# systemctl disable slapd iredpad
```

15. Also, disable some scheduled tasks performed by iRedMail, such as LDAP database backup and iRedPad tracking records by adding a comment (#) in front of each line from crontab file as illustrated on the below screenshot.

```
# crontab -e
```
 [![Disable iRedMail Tasks](https://www.tecmint.com/wp-content/uploads/2017/05/Disable-iRedMail-Tasks.png)][13] 

Disable iRedMail Tasks

### Step 6: Use Mail Alias in Postfix

16. To redirect all locally generated mail (destined for postmaster and subsequently redirected to root account) to a specific Samba4 AD account, open Postfix aliases configuration file located in /etc/postfix/aliases and modify root line as follows:

```
root: 	your_AD_email_account@domain.tld
```

17. Apply the aliases configuration file so that Postfix can read it in its own format by executing newaliases command and test if the mail gets sent to the proper domain e-email account by issuing the following command.

```
# echo “Test mail” | mail -s “This is root’s email” root
```

18. After the mail has been sent, login to Roundcube webmail with the domain account you’ve setup for mail redirection and verify the previously sent mail should be received in your account Inbox.

 [![Verify User Mail](https://www.tecmint.com/wp-content/uploads/2017/05/Verify-User-Mail.png)][14] 

Verify User Mail

That’all! Now, you have a fully working mail server integrated with Samba4 Active Directory. Domain accounts can send and receive mail for their internal domain or for other external domains.

The configurations used in this tutorial can be successfully applied to integrate an iRedMail server to a Windows Server 2012 R2 or 2016 Active Directory.

--------------------------------------------------------------------------------

作者简介：

I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.

-----------


via: https://www.tecmint.com/integrate-iredmail-roundcube-with-samba4-ad-dc/

作者：[ ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/cezarmatei/
[1]:https://www.tecmint.com/install-iredmail-on-centos-7-for-samba4-ad-integration/
[2]:https://www.tecmint.com/integrate-iredmail-to-samba4-ad-dc-on-centos-7/
[3]:https://www.tecmint.com/install-and-configure-roundcube-webmail-for-postfix-mail-server/
[4]:https://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[5]:https://www.tecmint.com/wp-content/uploads/2017/05/Active-Directory-User-and-Computers.jpg
[6]:https://www.tecmint.com/wp-content/uploads/2017/05/Create-Group-Admin-for-Samba4-AD-DC.png
[7]:https://www.tecmint.com/wp-content/uploads/2017/05/Add-Users-to-Group.png
[8]:https://www.tecmint.com/20-netstat-commands-for-linux-network-management/
[9]:https://www.tecmint.com/configure-postfix-and-dovecot-with-virtual-domain-users-in-linux/
[10]:https://www.tecmint.com/wp-content/uploads/2017/05/Roundcube-Webmail-Login.png
[11]:https://www.tecmint.com/wp-content/uploads/2017/05/Roundcube-User-Contact-List.png
[12]:https://www.tecmint.com/wp-content/uploads/2017/05/DNS-Webmail-Properties.jpg
[13]:https://www.tecmint.com/wp-content/uploads/2017/05/Disable-iRedMail-Tasks.png
[14]:https://www.tecmint.com/wp-content/uploads/2017/05/Verify-User-Mail.png
[15]:https://www.tecmint.com/author/cezarmatei/
[16]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[17]:https://www.tecmint.com/free-linux-shell-scripting-books/
