luoyutiantan
Shellshock: How to protect your Unix, Linux and Mac servers
================================================================================
> **Summary**: The Unix/Linux Bash security hole can be deadly to your servers. Here's what you need to worry about, how to see if you can be attacked, and what to do if your shields are down.

The only thing you have to fear with [Shellshock, the Unix/Linux Bash security hole][1], is fear itself. Yes, Shellshock can serve as a highway for worms and malware to hit your Unix, Linux, and Mac servers, but you can defend against it.

![](http://cdn-static.zdnet.com/i/r/story/70/00/034072/cybersecurity-v1-620x464.jpg?hash=BQMxZJWuZG&upscale=1)

If you don't patch and defend yourself against Shellshock today, you may have lost control of your servers by tomorrow. 

However, Shellshock is not as bad as [HeartBleed][2]. Not yet, anyway.

While it's true that the [Bash shell][3] is the default command interpreter on most Unix and Linux systems and all Macs — the majority of Web servers — for an attacker to get to your system, there has to be a way for him or her to actually get to the shell remotely. So, if you're running a PC without [ssh][4], [rlogin][5], or another remote desktop program, you're probably safe enough.

A more serious problem is faced by devices that use embedded Linux — such as routers, switches, and appliances. If you're running an older, no longer supported model, it may be close to impossible to patch it and will likely be vulnerable to attacks. If that's the case, you should replace as soon as possible.

The real and present danger is for servers. According to the National Institute of Standards (NIST), [Shellshock scores a perfect 10][6] for potential impact and exploitability. [Red Hat][7] reports that the most common attack vectors are:

- **httpd (Your Web server)**: CGI [Common-Gateway Interface] scripts are likely affected by this issue: when a CGI script is run by the web server, it uses environment variables to pass data to the script. These environment variables can be controlled by the attacker. If the CGI script calls Bash, the script could execute arbitrary code as the httpd user. mod_php, mod_perl, and mod_python do not use environment variables and we believe they are not affected.
- **Secure Shell (SSH)**: It is not uncommon to restrict remote commands that a user can run via SSH, such as rsync or git. In these instances, this issue can be used to execute any command, not just the restricted command.
- **dhclient**: The [Dynamic Host Configuration Protocol Client (dhclient)][8] is used to automatically obtain network configuration information via DHCP. This client uses various environment variables and runs Bash to configure the network interface. Connecting to a malicious DHCP server could allow an attacker to run arbitrary code on the client machine.
- **[CUPS][9] (Linux, Unix and Mac OS X's print server)**: It is believed that CUPS is affected by this issue. Various user-supplied values are stored in environment variables when cups filters are executed.
- **sudo**: Commands run via sudo are not affected by this issue. Sudo specifically looks for environment variables that are also functions. It could still be possible for the running command to set an environment variable that could cause a Bash child process to execute arbitrary code.
- **Firefox**: We do not believe Firefox can be forced to set an environment variable in a manner that would allow Bash to run arbitrary commands. It is still advisable to upgrade Bash as it is common to install various plug-ins and extensions that could allow this behavior.
- **Postfix**: The Postfix [mail] server will replace various characters with a ?. While the Postfix server does call Bash in a variety of ways, we do not believe an arbitrary environment variable can be set by the server. It is however possible that a filter could set environment variables.

So much for Red Hat's thoughts. Of these, the Web servers and SSH are the ones that worry me the most. The DHCP client is also troublesome, especially if, as it the case with small businesses, your external router doubles as your Internet gateway and DHCP server.

Of these, Web server attacks seem to be the most common by far. As Florian Weimer, a Red Hat security engineer, wrote: "[HTTP requests to CGI scripts][10] have been identified as the major attack vector." Attacks are being made against systems [running both Linux and Mac OS X][11].

Jaime Blasco, labs director at [AlienVault][12], a security management services company, ran a [honeypot][13] looking for attackers and found "[several machines trying to exploit the Bash vulnerability][14]. The majority of them are only probing to check if systems are vulnerable. On the other hand, we found two worms that are actively exploiting the vulnerability and installing a piece of malware on the system."

Other security researchers have found that the malware is the usual sort. They typically try to plant distributed denial of service (DDoS) IRC bots and attempt to guess system logins and passwords using a list of poor passwords such as 'root', 'admin', 'user', 'login', and '123456.'

So, how do you know if your servers can be attacked? First, you need to check to see if you're running a vulnerable version of Bash. To do that, run the following command from a Bash shell:

env x='() { :;}; echo vulnerable' bash -c "echo this is a test"

If you get the result:

*vulnerable this is a test*

Bad news, your version of Bash can be hacked. If you see:

*bash: warning: x: ignoring function definition attempt bash: error importing function definition for `x' this is a test*

You're good. Well, to be more exact, you're as protected as you can be at the moment.

While all major Linux distributors have released patches that stop most attacks — [Apple has not released a patch yet][15] — it has been discovered that "[patches shipped for this issue are incomplete][16]. An attacker can provide specially-crafted environment variables containing arbitrary commands that will be executed on vulnerable systems under certain conditions." While it's unclear if these attacks can be used to hack into a system, it is clear that they can be used to crash them, thanks to a null-pointer exception.

Patches to fill-in the [last of the Shellshock security hole][17] are being worked on now. In the meantime, you should update your servers as soon as possible with the available patches and keep an eye open for the next, fuller ones.

In the meantime, if, as is likely, you're running the Apache Web server, there are some [Mod_Security][18] rules that can stop attempts to exploit Shellshock. These rules, created by Red Hat, are:

    Request Header values:
    SecRule REQUEST_HEADERS "^\(\) {" "phase:1,deny,id:1000000,t:urlDecode,status:400,log,msg:'CVE-2014-6271 - Bash Attack'"
    
    SERVER_PROTOCOL values:
    SecRule REQUEST_LINE "\(\) {" "phase:1,deny,id:1000001,status:400,log,msg:'CVE-2014-6271 - Bash Attack'"
    
    GET/POST names:
    SecRule ARGS_NAMES "^\(\) {" "phase:2,deny,id:1000002,t:urlDecode,t:urlDecodeUni,status:400,log,msg:'CVE-2014-6271 - Bash Attack'"
    
    GET/POST values:
    SecRule ARGS "^\(\) {" "phase:2,deny,id:1000003,t:urlDecode,t:urlDecodeUni,status:400,log,msg:'CVE-2014-6271 - Bash Attack'"
    
    File names for uploads:
    SecRule FILES_NAMES "^\(\) {" "phase:2,deny,id:1000004,t:urlDecode,t:urlDecodeUni,status:400,log,msg:'CVE-2014-6271 - Bash Attack'"

It is vital that you patch your servers as soon as possible, even with the current, incomplete ones, and to set up defenses around your Web servers. If you don't, you could come to work tomorrow to find your computers completely compromised. So get out there and start patching!

--------------------------------------------------------------------------------

via: http://www.zdnet.com/shellshock-how-to-protect-your-unix-linux-and-mac-servers-7000034072/

作者：[Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]:http://www.zdnet.com/unixlinux-bash-critical-security-hole-uncovered-7000034021/
[2]:http://www.zdnet.com/heartbleed-serious-openssl-zero-day-vulnerability-revealed-7000028166
[3]:http://www.gnu.org/software/bash/
[4]:http://www.openbsd.org/cgi-bin/man.cgi?query=ssh&sektion=1
[5]:http://unixhelp.ed.ac.uk/CGI/man-cgi?rlogin
[6]:http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7169
[7]:http://www.redhat.com/
[8]:http://www.isc.org/downloads/dhcp/
[9]:https://www.cups.org/
[10]:http://seclists.org/oss-sec/2014/q3/650
[11]:http://www.zdnet.com/first-attacks-using-shellshock-bash-bug-discovered-7000034044/
[12]:http://www.alienvault.com/
[13]:http://www.sans.org/security-resources/idfaq/honeypot3.php
[14]:http://www.alienvault.com/open-threat-exchange/blog/attackers-exploiting-shell-shock-cve-2014-6721-in-the-wild
[15]:http://apple.stackexchange.com/questions/146849/how-do-i-recompile-bash-to-avoid-the-remote-exploit-cve-2014-6271-and-cve-2014-7
[16]:https://bugzilla.redhat.com/show_bug.cgi?id=1141597#c27
[17]:http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-7169
[18]:http://www.inmotionhosting.com/support/website/modsecurity/what-is-modsecurity-and-why-is-it-important
