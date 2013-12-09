tomatoKiller 翻译中 

10 Linux Interview Questions and Answers for Linux Beginners – Part 3
================================================================================
Continuing the **Interview Questions** series, with a big thanks for the nice feedback on last two articles of this series, we are here presenting **10 questions** again for interactive learning.

- [11 Basic Linux Interview Questions and Answers – Part 1][1]
- [10 Basic Linux Interview Questions and Answers – Part II][2]

![](http://www.tecmint.com/wp-content/uploads/2013/12/Basic-Interview-Questions-Part-3.png)

### 1. How will you add a new user (say, tux) to your system.? ###

- useradd command
- adduser command
- linuxconf command
- All of the above
- None of the above

> **Answer** : All of the above commands i.e., **useradd, adduser** and **linuxconf** will add an user to the Linux system.

### 2. How many primary partition is possible on one drive? ###

- 1
- 2
- 4
- 16

> **Answer** : There are a maximum of ‘**4**‘ primary partition possible on a drive.

### 3. The default port for Apache/Http is? ###

- 8080
- 80
- 8443
- 91
- None of the above.

> **Answer** : By default Apache/Http is configured on port **80**.

### 4. What does GNU stand for? ###

- GNU’s not Unix
- General Unix
- General Noble Unix
- Greek Needed Unix
- None of the above

> **Answer** : GNU stands for ‘**GNU**‘s not **Unix**‘.

### 5. You typed at shell prompt “mysql” and what you got in return was “can’t connect to local MySQL server through socket ‘/var/mysql/mysql.sock’”, what would you check first. ###

> **Answer** : Seeing the error message, I will first check if mysql is running or not using commands **service mysql status** or **service mysqld status**. If mysql service is not running, starting of the service is required.

**Note**:The above error message can be the result of ill configured **my.cnf** or mysql **user permission**. If mysql service starting doesn’t help, you need to see into the above said issues.

### 6. How to Mount a windows ntfs partition on Linux? ###

> **Answer** : First install **ntfs­3g** pack on the system using **apt** or **yum** tool and then use “**mount sudo mount ­t ntfs­3g /dev/<Windows­partition>/<Mount­point>**” command to mount Windows partition on Linux.

### 7. From the following which is not an RPM based OS.? ###

- RedHat Linux
- Centos
- Scientific Linux
- Debian
- Fedora

> **Answer** : The ‘**Debian**‘ operating system is not an **RPM** based and all listed above are ‘**RPM**‘ based except Debian.

### 8. Which command can be used to rename a file in Linux.? ###

- mv
- ren
- rename
- change
- None of the Above

> **Answer** : The **mv** command is used to rename a file in Linux. For example, **mv /path_to_File/original_file_name.extension /Path_to_File/New_name.extension**.

### 9. Which command is used to create and display file in Linux? ###

- ed
- vi
- cat
- nano
- None of the above

Answer : The ‘**cat**‘ command can be used to create and display file in Linux.

### 10. What layer protocol is responsible for user and the application program support such as passwords, resource sharing, file transfer and network management? ###

- Layer 4 protocols
- Layer 5 protocols
- Layer 6 protocols
- Layer 7 protocols
- None of the above

> **Answer** : The ‘**Layer 7 Protocol**‘ is responsible for user and the application program support such as passwords, resource sharing, file transfer and network management.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-interview-questions-and-answers-for-linux-beginners/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/basic-linux-interview-questions-and-answers/
[2]:http://www.tecmint.com/basic-linux-interview-questions-and-answers-part-ii/
