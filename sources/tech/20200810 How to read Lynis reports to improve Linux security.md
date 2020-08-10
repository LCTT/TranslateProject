[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to read Lynis reports to improve Linux security)
[#]: via: (https://opensource.com/article/20/8/linux-lynis-security)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

How to read Lynis reports to improve Linux security
======
Use Lynis' scans and reports to find and fix Linux security issues.
![Lock][1]

When I read Gaurav Kamathe's article _[Scan your Linux security with Lynis][2]_, it reminded me of my time as a systems administrator for the US Department of Labor. One of my duties was to keep our Unix servers hardened. Each quarter, an independent verifier came in to review our servers' security status. Each time on the day the verifier was scheduled to arrive, I ran Security Readiness Review (SRR), a scanning tool that used a large set of scripts to identify and report any security findings. SRR was open source, so I could view all the source scripts and their functions. This enabled me to look into the code, determine what specifically was wrong, and quickly fix each problem it found.

### What is Lynis?

[Lynis][3] is an open source security-auditing tool that works much like SRR by scanning a Linux system and providing detailed reports on any weaknesses it finds. Also like SRR, it is made up of a large set of scripts, and each script checks for a specific item, e.g., minimum and maximum password age requirements.

After running Lynis, you can use its report to locate each item's script and learn exactly how Lynis checked for and reported each problem. You can also use the same script code to create new code to automate a resolution.

### How to read Lynis reports

Since Gaurav's article covered Lynis' installation and usage, in this article, I'll show some examples of how you can read and use its reports.

To get started, run an audit:


```
`# lynis audit system --quick`
```

After it completes, the full report will be displayed on your screen. Towards the bottom, the **Suggestions** section lists all the items that may need to be triaged to better harden the system, as well as a TEST-ID for each.

To harden the system and reduce the size of the list, start chasing each item. The description in the **Suggestions** section may be everything you need to know what action to take. If it doesn't, you can use the `show details` command:


```
`# lynis show details TEST-ID`
```

For instance, one of the suggestions on my system is:

> The database required for `locate` could not be found. Run `updatedb` or `locate.updatedb` to create this file. [FILE-6410]

It looks like I just need to run the command `updatedb`, but if I want to be sure, I can use Lynis' `show details` option:


```
# lynis show details FILE-6410
2020-06-16 20:54:33 Performing test ID FILE-6410 (Checking Locate database)
2020-06-16 20:54:33 Test: Checking locate database
2020-06-16 20:54:33 Result: file /var/lib/mlocate/mlocate.db not found
2020-06-16 20:54:33 Result: file /var/lib/locate/locatedb not found
2020-06-16 20:54:33 Result: file /var/lib/locatedb not found
2020-06-16 20:54:33 Result: file /var/lib/slocate/slocate.db not found
2020-06-16 20:54:33 Result: file /var/cache/locate/locatedb not found
2020-06-16 20:54:33 Result: file /var/db/locate.database not found
2020-06-16 20:54:33 Result: database not found
2020-06-16 20:54:33 Suggestion: The database required for 'locate' could not be found. Run 'updatedb' or 'locate.updatedb' to create this file. [test:FILE-6410] [details:-] [solution:-]
2020-06-16 20:54:33 ====
```

These details indicate Lynis was unable to find various files. This case is very clear-cut. I can run the `updatedb` command and recheck this test:


```
# updatedb
# lynis --tests FILE-6410
```

Furthermore, rechecking the details shows which file it found that satisfied the test:


```
# lynis show details FILE-6410
2020-06-16 21:38:40 Performing test ID FILE-6410 (Checking Locate database)
2020-06-16 21:38:40 Test: Checking locate database
2020-06-16 21:38:40 Result: locate database found (/var/lib/mlocate/mlocate.db)
2020-06-16 21:38:40 Result: file /var/lib/locate/locatedb not found
2020-06-16 21:38:40 Result: file /var/lib/locatedb not found
2020-06-16 21:38:40 Result: file /var/lib/slocate/slocate.db not found
2020-06-16 21:38:40 Result: file /var/cache/locate/locatedb not found
2020-06-16 21:38:40 Result: file /var/db/locate.database not found
2020-06-16 21:38:40 ====
```

### Diving deeper

Many of Lynis' suggestions are not as straightforward as this one. If you aren't sure what a finding or a suggestion refers to, it can be difficult to know how to fix the problem. Suppose you run Lynis against a new Linux server, and there are several items pertaining to the secure shell (SSH) daemon, one of which refers to the `MaxAuthTries` setting:


```
* Consider hardening SSH configuration [SSH-7408]
    - Details  : MaxAuthTries (6 --&gt; 3)
      <https://cisofy.com/lynis/controls/SSH-7408/>
```

To resolve this, you need to know the location of the SSH configuration files. A seasoned Linux administrator may already know where to find them, but if you don't, there is a way to see where Lynis found them.

#### Locate Lynis test scripts

Lynis supports many operating systems; therefore, your installation location might vary. On a Red Hat Enterprise Linux or Fedora Linux system, use `rpm` to find the test files:


```
`# rpm -ql lynis`
```

This lists all the test files and reports their location in the `lynis/include` directory. Search this directory for the TEST-ID you want to know about (SSH-7408 in this case):


```
# grep SSH-7408 /usr/share/lynis/include/*
/usr/share/lynis/include/tests_ssh:    # Test        : SSH-7408
```

#### Find SSH issues

The file named `tests_ssh` contains the TEST-ID, and this is where you can find the scan functions related to SSH. Take a look at this file to see the various functions called by the Lynis scanner. The first section defines a list of directories in a variable called `SSH_DAEMON_CONFIG_LOCS`. The following few sections are responsible for checking the SSH daemon status, locating its configuration file, and identifying its version. I found the code that looks for the configuration file in the section for Test SSH-7404, described as "Determine SSH daemon configuration file location". This code contains a **`for`** loop that searches the items in the list for a file called `sshd_config`. I can use this logic to do my own search:


```
# find /etc /etc/ssh /usr/local/etc/ssh /opt/csw/etc/ssh -name sshd_config
/etc/ssh/sshd_config
/etc/ssh/sshd_config
find: ‘/usr/local/etc/ssh’: No such file or directory
find: ‘/opt/csw/etc/ssh’: No such file or directory
```

Further exploring this file reveals the code related to finding SSH-7408. This test covers `MaxAuthTries` and several other settings. Now I can find the variable in the SSH configuration file:


```
# grep MaxAuthTries /etc/ssh/sshd_config
#MaxAuthTries 6
```

#### Fix legal banner problems

Lynis also reported a finding pertaining to the legal banners shown when you log into a system. On my home desktop system (where I don't expect many other people to log in), I haven't bothered to change the default `issue` files. A corporate or government system is likely required to include a legal banner to warn users that their logins and activity may be recorded and monitored. Lynis reports this with tests BANN-7126 and BANN-7130:


```
* Add a legal banner to /etc/issue, to warn unauthorized users [BANN-7126]
      <https://cisofy.com/lynis/controls/BANN-7126/>

* Add legal banner to /etc/issue.net, to warn unauthorized users [BANN-7130]
      <https://cisofy.com/lynis/controls/BANN-7130/>
```

I don't find much on my system running Fedora 32 Workstation:


```
# cat /etc/issue /etc/issue.net
\S
Kernel \r on an \m (\l)

\S
Kernel \r on an \m (\l)
```

I could add something like "Keep out" or "Don't break anything," but the test's description doesn't provide enough information to resolve the issue, so I took another look at the Lynis scripts. I noticed that the `include` directory contained a file called `tests_banners`; this seemed like a good place to look. With some help from `grep`, I saw the associated tests:


```
# grep -E 'BANN-7126|BANN-7130' /usr/share/lynis/include/tests_banners
    # Test        : BANN-7126
    Register --test-no BANN-7126 --preqs-met ${PREQS_MET} --weight L --network NO --category security --description "Check issue banner file contents"
    # Test        : BANN-7130
    Register --test-no BANN-7130 --preqs-met ${PREQS_MET} --weight L --network NO --category security --description "Check issue.net banner file contents"
```

After examining the associated code in the file for the test, I found out that both of these tests are iterating through some predefined legal terms with a `for` loop:


```
`for ITEM in ${LEGAL_BANNER_STRINGS}; do`
```

These legal terms are stored in the variable `LEGAL_BANNER_STRINGS` defined at the top of the file. Scrolling back to the top shows the full list:


```
`LEGAL_BANNER_STRINGS="audit access authori condition connect consent continu criminal enforce evidence forbidden intrusion law legal legislat log monitor owner penal policy policies privacy private prohibited record restricted secure subject system terms warning"`
```

My initial suggestions ("keep out" and "don't break anything") wouldn't have satisfied the test, because they don't contain any words from this list.

This banner message contains several of the required words, and therefore, it will satisfy this test and prevent Lynis from reporting it:

> Attention, by continuing to connect to this system, you consent to the owner storing a log of all activity. Unauthorized access is prohibited.

Note that this message must be added to both `/etc/issue` and `/etc/issue.net`.

### Making it repeatable

You could make these edits manually, but you may instead want to consider automation. For example, there may be many settings that need to be changed, or you might need to do these edits on a regular basis on many servers. Creating a hardening script would be a great way to streamline this process. For SSH configurations, some `sed` commands in your hardening script will resolve those findings. Or, you might use an echo statement to add the legal banners:


```
sed -i '/MaxAuthTries/s/#MaxAuthTries 6/MaxAuthTries 3/' /etc/ssh/sshd_config

echo "Legal Banner" | tee -a /etc/issue /etc/issue.net
```

Automation enables you to create a repeatable script that can be saved and managed across your infrastructure. You could also incorporate this script in your initial server provisioning.

### Harden your system

This type of exercise can improve your scripting skills both by following along with existing code and by writing your own scripts. Because it is open source, Lynis makes it easy to see under the hood how your system is checked and what its reports mean. The end result will be a well-hardened system that you can show off anytime those auditors come around.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/linux-lynis-security

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-password.jpg?itok=KJMdkKum (Lock)
[2]: https://opensource.com/article/20/5/linux-security-lynis
[3]: https://github.com/CISOfy/lynis
