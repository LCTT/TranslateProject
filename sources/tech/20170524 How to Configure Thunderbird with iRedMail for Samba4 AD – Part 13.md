translating---geekpi

How to Configure Thunderbird with iRedMail for Samba4 AD – Part 13
============================================================


This tutorial will guide you on how to configure Mozilla Thunderbird client with an iRedMail server in order to send and receive mail via IMAPS and SMTP submission protocols, how to setup contacts database with Samba AD LDAP server and how to configure other related mail features, such as enabling Thunderbird contacts via LDAP database offline replica.

The process of installing and configuring Mozilla Thunderbird client described here is valid for Thunderbird clients installed on Windows or Linux operating systems.

#### Requirements

1.  [How to Configure and Integrate iRedMail Services to Samba4 AD DC][1]

2.  [Integrate iRedMail Roundcube with Samba4 AD DC][2]

### Step 1: Configure Thunderbird for iRedMail Server

1. After installing Thunderbird mail client, hit on the launcher or shortcut to open the program and on the first screen check E-mail System Integration and click on Skip Integration button to continue.

 [![Thunderbird System Integration](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-System-Integration.png)][3] 

Thunderbird System Integration

2. On the welcome screen hit on Skip this and use my existing mail button and add your name, your Samba account e-mail address and password, check Remember password field and hit on Continue button to start your mail account setup.

After Thunderbird client tries to identify the correct IMAP settings provided by iRedMail server hit on Manual config button to manually setup Thunderbird.

 [![Thunderbird Mail Account Setup](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Mail-Account-Setup.png)][4] 

Thunderbird Mail Account Setup

3. After the Mail Account Setup window expands, manually edit IMAP and SMTP settings by adding your proper iRedMail server FQDN, add secured ports for both mail services (993 for IMAPS and 587 for submission), select the proper SSL communication channel for each port and authentication and hit Done to complete the setup. Use the below image as a guide.

 [![Thunderbird iRedMail Settings](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-iRedMail-Settings.png)][5] 

Thunderbird iRedMail Settings

4. A new Security Exception window should appear on your screen due to the Self-Signed Certificates your iRedMail server enforces. Check on Permanently store this exception and hit on Confirm Security Exception button to add this security exception and the Thunderbird client should be successfully configured.

 [![Thunderbird Security Exception](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Security-Exception.png)][6] 

Thunderbird Security Exception

You will see all received mail for your domain account and you should be able to send or receive mail to and from your domain or other domain accounts.

 [![Domain Mails Inbox](https://www.tecmint.com/wp-content/uploads/2017/05/Domain-Mails-Inbox.png)][7] 

Domain Mails Inbox

### Step 2: Setup Thunderbird Contacts Database with Samba AD LDAP

5. In order for Thunderbird clients to query Samba AD LDAP database for contacts, hit on Settings menu by right clicking on your account from the left plane and navigate to Composition & Addressing → Addressing → Use a different LDAP server → Edit Directories button as illustrated on the below images.

 [![Thunderbird Samba AD LDAP Settings](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Samba-AD-LDAP-Settings.png)][8] 

Thunderbird Samba AD LDAP Settings

 [![Thunderbird Composition & Addressing Settings](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Composition-Addressing-Settings.png)][9] 

Thunderbird Composition & Addressing Settings

6. The LDAP Directory Servers windows should open by now. Hit on Add button and fill Directory Server Properties windows with the following content:

On General tab add descriptive name for this object, add the name of your domain or the FQDN of a Samba domain controller, the base DN of your domain in the form dc=your_domain,dc=tld, LDAP port number 389 and the vmail Bind DN account used to query the Samba AD LDAP database in the form vmail@your_domain.tld.

Use the below screenshot as a guide.

 [![Directory Server Properties](https://www.tecmint.com/wp-content/uploads/2017/05/Directory-Server-Properties.png)][10] 

Directory Server Properties

7. On the next step, move to Advanced tab from Directory Server Properties, and add the following content in Search filter filed:

```
(&(mail=*)(|(&(objectClass=user)(!(objectClass=computer)))(objectClass=group)))
```
 [![Add Search Filter](https://www.tecmint.com/wp-content/uploads/2017/05/Add-Search-Filter.png)][11] 

Add Search Filter

Leave the rest of the settings as default and hit on OK button to apply changes and again on OK button to close LDAP Directory Servers window and OK button again on Account Settings to close the window.

 [![Select LDAP Directory Server](https://www.tecmint.com/wp-content/uploads/2017/05/Select-LDAP-Directory-Server.png)][12] 

Select LDAP Directory Server

8. To test if Thunderbird client can query Samba AD LDAP database for contacts, hit on the upper Address Book icon, select the name of the LDAP database created earlier.

Add the password for the Bind DN account configured to interrogate the AD LDAP server (vmail@your_domain.tld), check Use Password Manager to remember the password and hit OK button to reflect changes and close the window.

 [![Thunderbird Samba AD LDAP Testing](https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Samba-AD-LDAP-Testing.png)][13] 

Thunderbird Samba AD LDAP Testing

9. Search for a Samba AD contact by using the upper search filed and suppling a domain account name. Be aware that Samba AD accounts with no e-mail address declared in their AD E-mail field will not be listed in Thunderbird Address Book searches.

 [![Search Samba AD Mail Contacts](https://www.tecmint.com/wp-content/uploads/2017/05/Search-Samba-AD-Mail-Contacts.png)][14] 

Search Samba AD Mail Contacts

10. To search for a contact while composing an e-mail, click on View → Contacts Sidebar or press F9 key to open Contacts panel.

 [![Search Mail Contacts in Thunderbird](https://www.tecmint.com/wp-content/uploads/2017/05/Search-Mail-Contact-in-Thunderbird.png)][15] 

Search Mail Contacts in Thunderbird

11. Select the proper Address Book and you should be able to search and add an e-mail address for your recipient. When sending the first mail, a new security alert window should appear. Hit on Confirm Security Exception and the mail should be sent to your recipient e-mail address.

 [![Send Mail in Thunderbird](https://www.tecmint.com/wp-content/uploads/2017/05/Send-Mail-in-Thunderbird.jpg)][16] 

Send Mail in Thunderbird

12. In case you want to search contacts through Samba LDAP database only for a specific AD Organizational Unit, edit the Address Book for your Directory Server name from the left plane, hit on Properties and add the custom Samba AD OU as illustrated on the below example.

```
ou=your_specific_ou,dc=your_domain,dc=tld 
```
 [![Search Contacts in Samba LDAP Database](https://www.tecmint.com/wp-content/uploads/2017/05/Search-Contacts-in-Samba-LDAP-Database.png)][17] 

Search Contacts in Samba LDAP Database

### Step 3: Setup LDAP Offline Replica

13. To configure Samba AD LDAP offline replica for Thunderbird hit on Address Book button, select your LDAP Address Book, open Directory Server Properties -> General tab and change the port number to 3268.

Then switch to Offline tab and hit on Download Now button to start replicate Samba AD LDAP database locally.

 [![Setup LDAP Offline Replica in Thunderbird](https://www.tecmint.com/wp-content/uploads/2017/05/Setup-LDAP-Offline-Replica-in-Thunderbird.png)][18] 

Setup LDAP Offline Replica in Thunderbird

 [![Download LDAP Database for Offline](https://www.tecmint.com/wp-content/uploads/2017/05/Download-Samba-LDAP-Database-Offline.png)][19] 

Download LDAP Database for Offline

When the process of synchronizing contacts finishes you will be informed with the message Replication succeeded. Hit OK and close all windows. In case Samba domain controller cannot be reached you can still search for LDAP contacts by working in offline mode.

--------------------------------------------------------------------------------

作者简介：

I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.



--------------

via: https://www.tecmint.com/configure-thunderbird-with-iredmail-for-samba4-ad-ldap/

作者：[Matei Cezar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/cezarmatei/
[1]:https://www.tecmint.com/integrate-iredmail-to-samba4-ad-dc-on-centos-7/
[2]:https://www.tecmint.com/integrate-iredmail-roundcube-with-samba4-ad-dc/
[3]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-System-Integration.png
[4]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Mail-Account-Setup.png
[5]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-iRedMail-Settings.png
[6]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Security-Exception.png
[7]:https://www.tecmint.com/wp-content/uploads/2017/05/Domain-Mails-Inbox.png
[8]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Samba-AD-LDAP-Settings.png
[9]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Composition-Addressing-Settings.png
[10]:https://www.tecmint.com/wp-content/uploads/2017/05/Directory-Server-Properties.png
[11]:https://www.tecmint.com/wp-content/uploads/2017/05/Add-Search-Filter.png
[12]:https://www.tecmint.com/wp-content/uploads/2017/05/Select-LDAP-Directory-Server.png
[13]:https://www.tecmint.com/wp-content/uploads/2017/05/Thunderbird-Samba-AD-LDAP-Testing.png
[14]:https://www.tecmint.com/wp-content/uploads/2017/05/Search-Samba-AD-Mail-Contacts.png
[15]:https://www.tecmint.com/wp-content/uploads/2017/05/Search-Mail-Contact-in-Thunderbird.png
[16]:https://www.tecmint.com/wp-content/uploads/2017/05/Send-Mail-in-Thunderbird.jpg
[17]:https://www.tecmint.com/wp-content/uploads/2017/05/Search-Contacts-in-Samba-LDAP-Database.png
[18]:https://www.tecmint.com/wp-content/uploads/2017/05/Setup-LDAP-Offline-Replica-in-Thunderbird.png
[19]:https://www.tecmint.com/wp-content/uploads/2017/05/Download-Samba-LDAP-Database-Offline.png
[20]:https://www.tecmint.com/author/cezarmatei/
[21]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[22]:https://www.tecmint.com/free-linux-shell-scripting-books/
