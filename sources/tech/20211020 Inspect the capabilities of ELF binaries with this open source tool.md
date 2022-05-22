[#]: subject: "Inspect the capabilities of ELF binaries with this open source tool"
[#]: via: "https://opensource.com/article/21/10/linux-elf-capa"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Inspect the capabilities of ELF binaries with this open source tool
======
Use capa to reveal all the mysteries of ELF binaries.
![Puzzle pieces coming together to form a computer screen][1]

If Linux is your primary working environment, then you might be familiar with the Executable and Linkable Format ([ELF][2]), the main file format used for executables, libraries, core-dumps, and more, on Linux. I've written articles covering native Linux tools to understand ELF binaries, beginning with [how ELF binaries are built][3], followed by some general tips on how to [analyze ELF binaries][4]. If you are not familiar with ELF and executables in general, I suggest reading these articles first.

### Introducing Capa

Capa is an [open-source project][5] from Mandiant (a cybersecurity company). In the project's own words, _capa detects capabilities in executable files_. Although the primary target of Capa is unknown and possibly malicious executables, the examples in this article run Capa on day-to-day Linux utilities to see how the tool works.

Given that most malware is Windows-based, earlier Capa versions only supported the PE file format, a dominant Windows executable format. However, starting with v3.0.0, support for ELF files has been added (thanks to [Intezer][6]).

### What are capabilities?

What does the concept of _capabilities_ actually mean, especially in the context of executable files? Programs or software fulfill certain computing needs or solve a problem. To keep things simple, our requirements could vary from finding a file, reading/writing to a file, running a program, logging some data to a log file, opening a network connection, etc. We then use a programming language of our choice with specific instructions to fulfill these tasks and compile the program. The resulting binary or executables then performs these tasks on the user's behalf, so the resulting executable is _capable_ of carrying out the above tasks.

Looking at the source code, it's easy to identify what a program does or what its intent is. However, once the program is compiled as an executable, the source code is converted to machine language and is no longer part of the resulting executable (unless compiled with debug info). We can still make some sense of it by looking at the equivalent assembly instructions backed by some knowledge of the Linux API (glibc/system calls), however, it's difficult. Tools like de-compilers do exist which try to convert the assembly to a pseudo-code of what might have been the original source code. However, it isn't a one-to-one match, and it is only a best-effort attempt.

### Why another tool?

If we have multiple native Linux tools to analyze binaries, why do we need another one? The existing tools aid developers in troubleshooting and debugging issues that might arise during development. They are often the first step for initial analysis on unknown binaries, however, they are not sufficient.

Sometimes what is needed isn't lengthy disassembly or long pseudo-code, but just a quick summary of the capabilities seen in the binary based on its API usage. Often, malicious binaries and malware employ some anti-analysis or anti-reversing techniques that render such native tools helpless.

Capa's primary audience is malware or security researchers who often come across unknown binaries for which source code isn't available. They need to identify if it's malware or a benign executable. An initial first step is finding out what the executable can do before moving to dynamic analysis. This can be done with some pre-defined rule sets matched against a popular framework (ATT&amp;CK). Native Linux tools were not designed for such uses.

### Getting Capa

Download a pre-built Capa Linux program from [here][7]. You must use v3.0.0 or above. Capa is programmed in Python, however the downloaded program isn't a `.py` file that the Python interpreter can execute. It is instead an ELF executable that runs directly from the Linux command line.


```
$ pwd
/root/CAPA
$
$ wget -q <https://github.com/mandiant/capa/releases/download/v3.0.2/capa-v3.0.2-linux.zip>
$
$ file capa-v3.0.2-linux.zip
capa-v3.0.2-linux.zip: Zip archive data, at least v2.0 to extract
$
$ unzip capa-v3.0.2-linux.zip
Archive:  capa-v3.0.2-linux.zip
  inflating: capa                    
$
$ ls -l capa
-rwxr-xr-x. 1 root root 41282976 Sep 28 18:29 capa
$
$ file capa
capa: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=1da3a1d77c7109ce6444919f4a15e7e6c63d02fa, stripped
```

### Command line options

Capa comes with a variety of command line options. This article visits a few of them, beginning with the help content:


```
$ ./capa -h
usage: capa [-h] [--version] [-v] [-vv] [-d] [-q] [--color {auto,always,never}] [-f {auto,pe,elf,sc32,sc64,freeze}]
            [-b {vivisect,smda}] [-r RULES] [-s SIGNATURES] [-t TAG] [-j]
            sample

The FLARE team's open-source tool to identify capabilities in executable files.

&lt;&lt; snip &gt;&gt;
$
```

Use this command to check if the required version of Capa (v3 and above) is running:


```
$ ./capa --version
capa v3.0.2-0-gead8a83
```

### Capa output and the MITRE ATT&amp;CK framework

Capa output can be a bit overwhelming, so first run it on a simple utility, such as `pwd`. The `pwd` command on Linux prints the current working directory and is a common command. Please note that `pwd` might be a shell-inbuilt for you (no separate executable) depending on the distro you are using. Identify its path using the `which` command first and then provide the complete path to Capa. Here is an example:


```
$ which pwd
/usr/bin/pwd
$
$ file /usr/bin/pwd
/usr/bin/pwd: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=ec306ddd72ce7be19dfc1e62328bb89b6b3a6df5, for GNU/Linux 3.2.0, stripped
$
$ ./capa -f elf /usr/bin/pwd
loading : 100%| 633/633 [00:00&lt;00:00, 2409.72 rules/s]
matching: 100%| 76/76 [00:01&lt;00:00, 38.87 functions/s, skipped 0 library functions]
+------------------------+------------------------------------------------------------------------------------+
| md5                    | 8d50bbd7fea04735a70f21cca5063efe                                                   |
| sha1                   | 7d9df581bc3d34c9fb93058be2cdb9a8c04ec061                                           |
| sha256                 | 53205e6ef4e1e7e80745adc09c00f946ae98ccf6f8eb9c4535bd29188f7f1d91                   |
| os                     | linux                                                                              |
| format                 | elf                                                                                |
| arch                   | amd64                                                                              |
| path                   | /usr/bin/pwd                                                                       |
+------------------------+------------------------------------------------------------------------------------+

+------------------------+------------------------------------------------------------------------------------+
| ATT&amp;CK Tactic          | ATT&amp;CK Technique                                                                   |
|------------------------+------------------------------------------------------------------------------------|
| DISCOVERY              | File and Directory Discovery:: T1083                                               |
+------------------------+------------------------------------------------------------------------------------+

+-----------------------------+-------------------------------------------------------------------------------+
| MBC Objective               | MBC Behavior                                                                  |
|-----------------------------+-------------------------------------------------------------------------------|
| FILE SYSTEM                 | Writes File:: [C0052]                                                         |
+-----------------------------+-------------------------------------------------------------------------------+

+------------------------------------------------------+------------------------------------------------------+
| CAPABILITY                                           | NAMESPACE                                            |
|------------------------------------------------------+------------------------------------------------------|
| enumerate files on Linux (2 matches)                 | host-interaction/file-system/files/list              |
| write file on Linux                                  | host-interaction/file-system/write                   |
+------------------------------------------------------+------------------------------------------------------+
```

Run Capa with the `-f elf` argument to tell it that the executable to analyze is in the ELF file format. This option might be required for unknown binaries; however, Capa is perfectly capable of detecting the format on its own and doing the analysis, so you can skip this option if required. In the beginning, you will see a loading/matching message as Capa loads its rules from the backend and then analyzes the executable and matches those rules against it. Skip displaying this by adding the `-q` option to all commands.

Capa output is divided into various sections. The first section uniquely identifies the binary using its md5, sha1, or sha256 hash followed by the operating system, file format, and architecture information. This information is often critical when dealing with executables. In the following sections, Capa uses the ATT&amp;CK Tactic and Technique to match the capabilities. If you are unfamiliar with what ATT&amp;CK means, please refer to the [MITRE ATT&amp;CK Framework here][8].

MITRE ATT&amp;CK is best described in the project's own words:

> MITRE ATT&amp;CK® is a globally-accessible knowledge base of adversary tactics and techniques based on real-world observations.

You can match the output of Capa in the following two sections with that of the MITRE ATT&amp;CK framework. I shall skip this part in this article.

Finally, in the Capability section, you can see two specific capabilities listed out:


```
enumerate files on Linux
write file on Linux
```

Compare this with the nature of the `pwd` program, which needs to show the current directory. Here it matches the first capability (remember the concept of everything is a file in Linux). What about the second part, which says _writing file_? We certainly haven't written `pwd` output to any file. However, remember `pwd` needs to write the current directory location to the terminal; how else will the output be printed? If you are still unsure of how this works, run the following command and match the output. If you are unfamiliar with `strace` or what it does, I have an article covering it [here][9]. Focus on the _write_ system call toward the end of the article where the `pwd` executable needs to write the directory path (string) to **1**, which stands for standard out. In our case, that is the terminal.


```
$ strace -f  /usr/bin/pwd
execve("/usr/bin/pwd", ["/usr/bin/pwd"], 0x7ffd7983a238 /* 49 vars */) = 0
brk(NULL)

&lt;&lt; snip &gt;&gt;

write(1, "/root/CAPA\n", 11/root/CAPA
)            = 11
close(1)                                = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
```

### Running Capa on different Linux utilities

Now that you know how to run Capa, I highly recommend you try it on various day-to-day Linux utilities. When choosing utilities try to be as diverse as possible. For example, select utilities that work with file systems or storage commands, such as `ls`, `mount`, `cat`, `echo`, etc. Next, move to network utilities, like `netstat`, `ss`, `telnet`, etc., where you will find the network capabilities of an executable. Extend it to more extensive programs daemons like `sshd` to see crypto-related capabilities, followed by `systemd`, `bash`, etc.

A word of caution, don't be too spooked if you see rules that match malware for these native utilities. For example, when analyzing systemd, Capa showed matches for COMMAND AND CONTROL based on the capability to receive data from a network. This capability could be used by genuine programs for legitimate cases, while malware could use it for malicious purposes.

### Running in Debug mode

If you wish to see how Capa finds all these capabilities in an executable, provide the `-d` flag, which displays additional information on the screen that might help understand its inner working. Use this data and look for clues in the source code on GitHub.


```
`$ ./capa -q /usr/sbin/sshd -d`
```

The first thing to notice is that Capa saves rules to a temp directory and reads them from there:


```
`DEBUG:capa:reading rules from directory /tmp/_MEIKUG6Oj/rules`
```

The debug output shows it loaded various rules from this directory. As an example, see how it tried to identify the hostname of a machine:


```
`DEBUG:capa:loaded rule: 'get hostname' with scope: function`
```

With this information, it's easy to look up the rule. Simply go to the `rules` directory and `grep` for the specific rule name like the example below. The rule is stated in a .yml file.


```
$ grep -irn "name: get hostname" *
rules/host-interaction/os/hostname/get-hostname.yml:3:    name: get hostname
```

Check for the `-api` sections where various APIs are listed. Capa looks for the `gethostname` API usage (on Linux), and you can see the Windows equivalent listed there, too.


```
$ cat _MEIKUG6Oj/rules/host-interaction/os/hostname/get-hostname.yml
rule:
  meta:
    name: get hostname
    namespace: host-interaction/os/hostname

&lt;&lt; snip &gt;&gt;

  features:
    - or:
      - api: kernel32.GetComputerName
      - api: kernel32.GetComputerNameEx
      - api: GetComputerObjectName
      - api: ws2_32.gethostname
      - api: gethostname
```

You can find more information about this specific system call on Linux using the man page.


```
$ man 2 gethostname

GETHOSTNAME(2)                          Linux Programmer's Manual                               GETHOSTNAME(2)

NAME
       gethostname, sethostname - get/set hostname

&lt;&lt; snip &gt;&gt;
```

### Verbose usage

Another good way to identify which API's Capa is looking for is using the verbose mode, as shown below. This simple example displays the usage of `opendir`, `readdir`, and `fwrite` APIs:


```
$ ./capa  -q /usr/bin/pwd -vv
enumerate files on Linux (2 matches)

&lt;&lt; snip &gt;&gt;

        api: opendir @ 0x20052E8
        api: readdir @ 0x2005369, 0x200548A

write file on Linux

&lt;&lt; snip &gt;&gt;

    os: linux
    or:
      api: fwrite @ 0x2002CB5
```

### Custom rules

As with other good tools, Capa allows you to extend it by adding your own rules. This hint was also given in the debug output, if you noticed.


```
`$ capa --signature ./path/to/signatures/ /path/to/executable`
```

### Specific rules only

You can also look for specific rules instead of having Capa trying to match every rule. Do this by adding the `-t` flag followed by the exact rule name:


```
`$ ./capa -t "create process on Linux" /usr/sbin/sshd -q -j`
```

Display the rule name from the .yml files within the `rules` directory. For example:


```
$ grep name rules/host-interaction/process/create/create-process-on-linux.yml
    name: create process on Linux
```

### Output format

Finally, Capa allows output in JSON format using the `-j` flag. This flag helps consume the information quickly and aid automation. This example command requires that the [jq command][10] is installed:


```
`$ ./capa -t "create process on Linux" /usr/sbin/sshd -q -j | jq .`
```

### Wrap up

Capa is a worthy addition to the much-needed tools for ELF executables. I say _much-needed_ because we regularly see cases of Linux malware now. Tools on Linux must catch up to tackle these threats. You can play around with Capa and try it on various executables, and also write your own rules and add them upstream for the benefit of the community.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-elf-capa

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[3]: https://opensource.com/article/19/10/gnu-binutils
[4]: https://opensource.com/article/20/4/linux-binary-analysis
[5]: https://github.com/mandiant/capa
[6]: https://www.intezer.com/
[7]: http://github.com/mandiant/capa/releases
[8]: https://attack.mitre.org/
[9]: https://opensource.com/article/19/10/strace
[10]: https://stedolan.github.io/jq/
