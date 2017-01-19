# rusking translating 
Setup SysVol Replication Across Two Samba4 AD DC with Rsync – Part 6
============================================================

This topic will cover SysVol replication across two Samba4 Active Directory Domain Controllers performed with the help of a few powerful Linux tools, such as [Rsync file synchronization utility][2], [Cron scheduling daemon][3] and [SSH protocol][4].

#### Requirements:

1.  [Join Ubuntu 16.04 as Additional Domain Controller to Samba4 AD DC – Part 5][1]

### Step 1: Accurate Time Synchronization Across DCs

1. Before starting to replicate the contents of the sysvol directory across both domain controllers you need to provide an accurate time for these machines.

If the delay is greater than 5 minutes on both directions and their clocks are not properly in sync, you should start experiencing various problems with AD accounts and domain replication.

To overcome the problem of time drifting between two or more domain controllers, you need to [install and configure NTP server][5] on your machine by executing the below command.

```
# apt-get install ntp
```

2. After NTP daemon has been installed, open the main configuration file, comment the default pools (add a # in front of each pool line) and add a new pool which will point back to the main Samba4 AD DC FQDN with NTPserver installed, as suggested on the below example.

```
# nano /etc/ntp.conf
```

Add following lines to ntp.conf file.

```
pool 0.ubuntu.pool.ntp.org iburst
#pool 1.ubuntu.pool.ntp.org iburst
#pool 2.ubuntu.pool.ntp.org iburst
#pool 3.ubuntu.pool.ntp.org iburst
pool adc1.tecmint.lan
# Use Ubuntu's ntp server as a fallback.
pool ntp.ubuntu.com
```
[
 ![Configure NTP for Samba4](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-NTP-for-Samba4.png) 
][6]

Configure NTP for Samba4

3. Don’t close the file yet, move to the bottom of the file and add the following lines in order for other clients to be able to query and [sync the time with this NTP server][7], issuing signed NTP requests, in case the primary DC goes offline:

```
restrict source notrap nomodify noquery mssntp
ntpsigndsocket /var/lib/samba/ntp_signd/
```

4. Finally, save and close the configuration file and restart NTP daemon in order to apply the changes. Wait for a few seconds or minutes for the time to synchronize and issue ntpq command in order to print the current summary state of the adc1 peer in sync.

```
# systemctl restart ntp
# ntpq -p
```
[
 ![Synchronize NTP Time with Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Synchronize-Time.png) 
][8]

Synchronize NTP Time with Samba4 AD

### Step 2: SysVol Replication with First DC via Rsync

By default, Samba4 AD DC doesn’t perform SysVol replication via DFS-R (Distributed File System Replication) or the FRS (File Replication Service).

This means that Group Policy objects are available only if the first domain controller is online. If the first DC becomes unavailable, the Group Policy settings and logon scripts will not apply further on Windows machines enrolled into the domain.

To overcome this obstacle and achieve a rudimentary form of SysVol replication we will schedule a [Linux rsync command][9] combined with a SSH encrypted tunnel with [key-based SSH authentication][10] in order to securely transfer GPO objects from the first domain controller to the second domain controller.

This method ensures GPO objects consistency across domain controllers, but has one huge drawback. It works only in one direction because rsync will transfer all changes from the source DC to the destination DC when synchronizing GPO directories.

Objects which no longer exist on the source will be deleted from the destination as well. In order to limit and avoid any conflicts, all GPO edits should be made only on the first DC.

5. To start the process of SysVol replication, first [generate a SSH key on the first Samba AD DC][11] and transfer the key to the second DC by issuing the below commands.

Do not use a passphrase for this key in order for the scheduled transfer to run without user interference.

```
# ssh-keygen -t RSA  
# ssh-copy-id root@adc2  
# ssh adc2 
# exit 
```
[
 ![Generate SSH Key on Samba4 DC](http://www.tecmint.com/wp-content/uploads/2017/01/Generate-SSH-Key.png) 
][12]

Generate SSH Key on Samba4 DC

6. After you’ve assured that the root user from the first DC can automatically login on the second DC, run the following Rsync command with `--dry-run` parameter in order simulate SysVol replication. Replace adc2accordingly.

```
# rsync --dry-run -XAavz --chmod=775 --delete-after  --progress --stats  /var/lib/samba/sysvol/ root@adc2:/var/lib/samba/sysvol/
```

7. If the simulation process works as expected, run the rsync command again without the `--dry-run` option in order to actually replicate GPO objects across your domain controllers.

```
# rsync -XAavz --chmod=775 --delete-after  --progress --stats  /var/lib/samba/sysvol/ root@adc2:/var/lib/samba/sysvol/
```
[
 ![Samba4 AD DC SysVol Replication](http://www.tecmint.com/wp-content/uploads/2017/01/SysVol-Replication-for-Samba4-DC.png) 
][13]

Samba4 AD DC SysVol Replication

8. After SysVol replication process has finished, login to the destination domain controller and list the contents of one of the GPO objects directory by running the below command.

The same GPO objects from the first DC should be replicated here too.

```
# ls -alh /var/lib/samba/sysvol/your_domain/Policiers/
```
[
 ![Verify Samba4 DC SysVol Replication](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-DC-SysVol-Replication.png) 
][14]

Verify Samba4 DC SysVol Replication

9. To automate the process of Group Policy replication (sysvol directory transport over network), schedule a root job to run the rsync command used earlier every 5 minutes by issuing the below command.

```
# crontab -e 
```

Add rsync command to run every 5 minutes and direct the output of the command, including the errors, to the log file /var/log/sysvol-replication.log .In case something doesn’t work as expected you should consult this file in order to troubleshoot the problem.

```
*/5 * * * * rsync -XAavz --chmod=775 --delete-after  --progress --stats  /var/lib/samba/sysvol/ root@adc2:/var/lib/samba/sysvol/ > /var/log/sysvol-replication.log 2>&1
```

10. Assuming that in future there will be some related issues with SysVol ACL permissions, you can run the following commands in order to detect and repair these errors.

```
# samba-tool ntacl sysvolcheck
# samba-tool ntacl sysvolreset
```
[
 ![Fix SysVol ACL Permissions](http://www.tecmint.com/wp-content/uploads/2017/01/Fix-SysVol-ACL-Permissions.png) 
][15]

Fix SysVol ACL Permissions

11. In case the first Samba4 AD DC with FSMO role as “PDC Emulator” becomes unavailable, you can force the Group Policy Management Console installed on a Microsoft Windows system to connect only to the second domain controller by choosing Change Domain Controller option and manually selecting the target machine as illustrated below.

[
 ![Change Samba4 Domain Controller](http://www.tecmint.com/wp-content/uploads/2017/01/Change-Samba4-Domain-Controller.png) 
][16]

Change Samba4 Domain Controller

[
 ![Select Samba4 Domain Controller](http://www.tecmint.com/wp-content/uploads/2017/01/Select-Samba4-Domain-Controller.png) 
][17]

Select Samba4 Domain Controller

While connected to the second DC from Group Policy Management Console, you should avoid making any modification to your domain Group Policy. When the first DC will become available again, rsync command will destroy all changes made on this second domain controller.

--------------------------------------------------------------------------------

作者简介：

![](http://2.gravatar.com/avatar/be16e54026c7429d28490cce41b1e157?s=128&d=blank&r=g)

I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/samba4-ad-dc-sysvol-replication/

作者：[Matei Cezar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/join-additional-ubuntu-dc-to-samba4-ad-dc-failover-replication/
[2]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[3]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[4]:http://www.tecmint.com/5-best-practices-to-secure-and-protect-ssh-server/
[5]:http://www.tecmint.com/install-and-configure-ntp-server-client-in-debian/
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-NTP-for-Samba4.png
[7]:http://www.tecmint.com/how-to-synchronize-time-with-ntp-server-in-ubuntu-linux-mint-xubuntu-debian/
[8]:http://www.tecmint.com/wp-content/uploads/2017/01/Synchronize-Time.png
[9]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[10]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[11]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[12]:http://www.tecmint.com/wp-content/uploads/2017/01/Generate-SSH-Key.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/01/SysVol-Replication-for-Samba4-DC.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-DC-SysVol-Replication.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/01/Fix-SysVol-ACL-Permissions.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/01/Change-Samba4-Domain-Controller.png
[17]:http://www.tecmint.com/wp-content/uploads/2017/01/Select-Samba4-Domain-Controller.png
