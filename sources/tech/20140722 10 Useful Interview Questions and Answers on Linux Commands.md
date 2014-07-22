10 Useful Interview Questions and Answers on Linux Commands
================================================================================
Linux command Line and the interaction of users with Linux Shell with Linux Commands is the most wonderful part of Linux and is one of the most widely topic from interview point. Here in this article we are coming up with 10 wonderful questions that are important from the interview perspective and will surely add to yours knowledge base.

![Linux Command Questions](http://www.tecmint.com/wp-content/uploads/2014/07/Linux-Command-Questions.png)
Linux Command Questions

### 1. How will you suspend a running process and put it in the background? ###

**Answer** : In order to suspend a running process/job and put it in the background we need to use the key combination Ctrl+z.

### 2. What are the minimum number of partitions required to install Linux and How will you check boot messages? ###

**Answer** : The /root partition alone is sufficient to perform the whole task however minimum three partitions are recommended to install Linux. These are root, boot and swap. An IDE Hard Disk Drive supports upto 63 partitions and SCSI Hard Disk Drive supports up-to 15 partitions.

In order to check boot messages we need to use cat or dmesg commands as shown below.

    # cat /var/log/messages

OR 

    # dmesg

### 3. Name the Daemon responsible for tracking System Event on your Linux box? ###

**Answer** : The Daemon ‘syslogd’ is responsible for tracking system information and stores the tracked logs in specific log files.

### 4. What are the minimum requirements to run command ‘fsck’ on root partition? ###

**Answer** : The /root partition must be mounted as read only mode and not read-write to execute fsck command on root partition.

### 5. How to copy /home directory hierarchically to another directory. How will you do it? ###

**Answer** : A Linux command ‘cpio’ comes to rescue here. The ‘cpio’ utility copies files and directories hierarchically over another location.

### 6. How will you automate the rotation of logs in Linux? ###

**Answer** : A Linux command ‘logrotate’ comes to rescue when it comes to automate the logs in Linux.

### 7. How to know who has scheduled the job? ###

**Answer** : The Linux command ‘at’ along with switch ‘-l’ is all we need to use in order to check who has scheduled the job.

### 8. How to view the contents of the tar ball without extracting it. How will you do this? ###

**Answer** : We need to use command ‘tar’ with options ‘-tvf’. The options ‘t’ (Display the contents), ‘v’ (Verbose), ‘f’ (files).

### 9. What is page Fault and how it happens? ###

**Answer** : A program request for some data and if it is not available in the Memory it is called as page fault. Page Fault occurs as a result of program shutdown.

### 10. What are return codes in program? ###

**Answer** : A return code is the feature of Shell. The result of return code shows the status of a program. A successful program after execution returns ’0′, && can be used to prioritize which application will be executing first.

That’s all for now. I’ll be here again with another interesting article soon. Till then stay tuned and connected to Tecmint. Don’t forget to provide us with your valuable feedback in the comment section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-useful-interview-questions-and-answers-on-linux-commands/

原文作者：[Avishek Kumar][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/