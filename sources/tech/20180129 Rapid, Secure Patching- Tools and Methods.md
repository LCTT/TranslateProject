Rapid, Secure Patching: Tools and Methods
======

It was with some measure of disbelief that the computer science community greeted the recent [EternalBlue][1]-related exploits that have torn through massive numbers of vulnerable systems. The SMB exploits have kept coming (the most recent being [SMBLoris][2] presented at the last DEF CON, which impacts multiple SMB protocol versions, and for which Microsoft will issue no corrective patch. Attacks with these tools [incapacitated critical infrastructure][3] to the point that patients were even turned away from the British National Health Service.

It is with considerable sadness that, during this SMB catastrophe, we also have come to understand that the famous Samba server presented an exploitable attack surface on the public internet in sufficient numbers for a worm to propagate successfully. I previously [have discussed SMB security][4] in Linux Journal, and I am no longer of the opinion that SMB server processes should run on Linux.

In any case, systems administrators of all architectures must be able to down vulnerable network servers and patch them quickly. There is often a need for speed and competence when working with a large collection of Linux servers. Whether this is due to security situations or other concerns is immaterial—the hour of greatest need is not the time to begin to build administration tools. Note that in the event of an active intrusion by hostile parties, [forensic analysis][5] may be a legal requirement, and no steps should be taken on the compromised server without a careful plan and documentation. Especially in this new era of the black hats, computer professionals must step up their game and be able to secure vulnerable systems quickly.

### Secure SSH Keypairs

Tight control of a heterogeneous UNIX environment must begin with best-practice use of SSH authentication keys. I'm going to open this section with a simple requirement. SSH private keys must be one of three types: Ed25519, ECDSA using the E-521 curve or RSA keys of 3072 bits. Any key that does not meet those requirements should be retired (in particular, DSA keys must be removed from service immediately).

The [Ed25519][6] key format is associated with Daniel J. Bernstein, who has such a preeminent reputation in modern cryptography that the field is becoming a DJB [monoculture][7]. The Ed25519 format is deigned for speed, security and size economy. If all of your SSH servers are recent enough to support Ed25519, then use it, and consider nothing else.

[Guidance on creating Ed25519 keys][8] suggests 100 rounds for a work factor in the "-o" secure format. Raising the number of rounds raises the strength of the encrypted key against brute-force attacks (should a file copy of the private key fall into hostile hands), at the cost of more work and time in decrypting the key when ssh-add is executed. Although there always is [controversy and discussion][9] with security advances, I will repeat the guidance here and suggest that the best format for a newly created SSH key is this:

```

ssh-keygen -a 100 -t ed25519

```

Your systems might be too old to support Ed25519—Oracle/CentOS/Red Hat 7 have this problem (the 7.1 release introduced support). If you cannot upgrade your old SSH clients and servers, your next best option is likely E-521, available in the ECDSA key format.

The ECDSA curves came from the US government's National Institute of Standards (NIST). The best known and most implemented of all of the NIST curves are P-256, P-384 and E-521\. All three curves are approved for secret communications by a variety of government entities, but a number of cryptographers have [expressed growing suspicion][10] that the P-256 and P-384 curves are tainted. Well known cryptographer Bruce Schneier [has remarked][11]: "I no longer trust the constants. I believe the NSA has manipulated them through their relationships with industry." However, DJB [has expressed][12] limited praise of the E-521 curve: "To be fair I should mention that there's one standard NIST curve using a nice prime, namely 2521 – 1; but the sheer size of this prime makes it much slower than NIST P-256." All of the NIST curves have greater issues with "side channel" attacks than Ed25519—P-521 is certainly a step down, and many assert that none of the NIST curves are safe. In summary, there is a slight risk that a powerful adversary exists with an advantage over the P-256 and P-384 curves, so one is slightly inclined to avoid them. Note that even if your OpenSSH (source) release is capable of E-521, it may be [disabled by your vendor][13] due to patent concerns, so E-521 is not an option in this case. If you cannot use DJB's 2255 – 19 curve, this command will generate an E-521 key on a capable system:

```

ssh-keygen -o -a 100 -b 521 -t ecdsa

```

And, then there is the unfortunate circumstance with SSH servers that support neither ECDSA nor Ed25519\. In this case, you must fall back to RSA with much larger key sizes. An absolute minimum is the modern default of 2048 bits, but 3072 is a wiser choice:

```

ssh-keygen -o -a 100 -b 3072 -t rsa

```

Then in the most lamentable case of all, when you must use old SSH clients that are not able to work with private keys created with the -o option, you can remove the password on id_rsa and create a naked key, then use OpenSSL to encrypt it with AES256 in the PKCS#8 format, as [first documented by Martin Kleppmann][14]. Provide a blank new password for the keygen utility below, then supply a new password when OpenSSL reprocesses the key:

```

$ cd ~/.ssh

$ cp id_rsa id_rsa-orig

$ ssh-keygen -p -t rsa
Enter file in which the key is (/home/cfisher/.ssh/id_rsa):
Enter old passphrase:
Key has comment 'cfisher@localhost.localdomain'
Enter new passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved with the new passphrase.

$ openssl pkcs8 -topk8 -v2 aes256 -in id_rsa -out id_rsa-strong
Enter Encryption Password:
Verifying - Enter Encryption Password:

mv id_rsa-strong id_rsa
chmod 600 id_rsa

```

After creating all of these keys on a newer system, you can compare the file sizes:

```

$ ll .ssh
total 32
-rw-------. 1 cfisher cfisher  801 Aug 10 21:30 id_ecdsa
-rw-r--r--. 1 cfisher cfisher  283 Aug 10 21:30 id_ecdsa.pub
-rw-------. 1 cfisher cfisher  464 Aug 10 20:49 id_ed25519
-rw-r--r--. 1 cfisher cfisher  111 Aug 10 20:49 id_ed25519.pub
-rw-------. 1 cfisher cfisher 2638 Aug 10 21:45 id_rsa
-rw-------. 1 cfisher cfisher 2675 Aug 10 21:42 id_rsa-orig
-rw-r--r--. 1 cfisher cfisher  583 Aug 10 21:42 id_rsa.pub

```

Although they are relatively enormous, all versions of OpenSSH that I have used have been compatible with the RSA private key in PKCS#8 format. The Ed25519 public key is now small enough to fit in 80 columns without word wrap, and it is as convenient as it is efficient and secure.

Note that PuTTY may have problems using various versions of these keys, and you may need to remove passwords for a successful import into the PuTTY agent.

These keys represent the most secure formats available for various OpenSSH revisions. They really aren't intended for PuTTY or other general interactive activity. Although one hopes that all users create strong keys for all situations, these are enterprise-class keys for major systems activities. It might be wise, however, to regenerate your system host keys to conform to these guidelines.

These key formats may soon change. Quantum computers are causing increasing concern for their ability to run [Shor's Algorithm][15], which can be used to find prime factors to break these keys in reasonable time. The largest commercially available quantum computer, the [D-Wave 2000Q][16], effectively [presents under 200 qubits][17] for this activity, which is not (yet) powerful enough for a successful attack. NIST [announced a competition][18] for a new quantum-resistant public key system with a deadline of November 2017 In response, a team including DJB has released source code for [NTRU Prime][19]. It does appear that we will likely see a post-quantum public key format for OpenSSH (and potentially TLS 1.3) released within the next two years, so take steps to ease migration now.

Also, it's important for SSH servers to restrict their allowed ciphers, MACs and key exchange lest strong keys be wasted on broken crypto (3DES, MD5 and arcfour should be long-disabled). My [previous guidance][20] on the subject involved the following (three) lines in the SSH client and server configuration (note that formatting in the sshd_config file requires all parameters on the same line with no spaces in the options; line breaks have been added here for clarity):

```

Ciphers chacha20-poly1305@openssh.com,
        aes256-gcm@openssh.com,
        aes128-gcm@openssh.com,
        aes256-ctr,
        aes192-ctr,
        aes128-ctr

MACs    hmac-sha2-512-etm@openssh.com,
        hmac-sha2-256-etm@openssh.com,
        hmac-ripemd160-etm@openssh.com,
        umac-128-etm@openssh.com,
        hmac-sha2-512,
        hmac-sha2-256,
        hmac-ripemd160,
        umac-128@openssh.com

KexAlgorithms curve25519-sha256@libssh.org,
              diffie-hellman-group-exchange-sha256

```

Since the previous publication, RIPEMD160 is likely no longer safe and should be removed. Older systems, however, may support only SHA1, MD5 and RIPEMD160\. Certainly remove MD5, but users of PuTTY likely will want to retain SHA1 when newer MACs are not an option. Older servers can present a challenge in finding a reasonable Cipher/MAC/KEX when working with modern systems.

At this point, you should have strong keys for secure clients and servers. Now let's put them to use.

### Scripting the SSH Agent

Modern OpenSSH distributions contain the ssh-copy-id shell script for easy key distribution. Below is an example of installing a specific, named key in a remote account:

```

$ ssh-copy-id -i ~/.ssh/some_key.pub person@yourserver.com
ssh-copy-id: INFO: Source of key(s) to be installed:
   "/home/cfisher/.ssh/some_key.pub"
ssh-copy-id: INFO: attempting to log in with the new key(s),
   to filter out any that are already installed
ssh-copy-id: INFO: 1 key(s) remain to be installed --
   if you are prompted now it is to install the new keys
person@yourserver.com's password:

Number of key(s) added: 1

Now try logging into the machine, with:
   "ssh 'person@yourserver.com'"
and check to make sure that only the key(s) you wanted were added.

```

If you don't have the ssh-copy-id script, you can install a key manually with the following command:

```

$ ssh person@yourserver.com 'cat >> ~/.ssh/authorized_keys' < \
      ~/.ssh/some_key.pub

```

If you have SELinux enabled, you might have to mark a newly created authorized_keys file with a security type; otherwise, the sshd server dæmon will be prevented from reading the key (the syslog may report this issue):

```

$ ssh person@yourserver.com 'chcon -t ssh_home_t
 ↪~/.ssh/authorized_keys'

```

Once your key is installed, test it in a one-time use with the -i option (note that you are entering a local key password, not a remote authentication password):

```

$ ssh -i ~/.ssh/some_key person@yourserver.com
Enter passphrase for key '/home/v-fishecj/.ssh/some_key':
Last login: Wed Aug 16 12:20:26 2017 from 10.58.17.14
yourserver $

```

General, interactive users likely will cache their keys with an agent. In the example below, the same password is used on all three types of keys that were created in the previous section:

```

$ eval $(ssh-agent)
Agent pid 4394

$ ssh-add
Enter passphrase for /home/cfisher/.ssh/id_rsa:
Identity added: ~cfisher/.ssh/id_rsa (~cfisher/.ssh/id_rsa)
Identity added: ~cfisher/.ssh/id_ecdsa (cfisher@init.com)
Identity added: ~cfisher/.ssh/id_ed25519 (cfisher@init.com)

```

The first command above launches a user agent process, which injects environment variables (named SSH_AGENT_SOCK and SSH_AGENT_PID) into the parent shell (via eval). The shell becomes aware of the agent and passes these variables to the programs that it runs from that point forward.

When launched, the ssh-agent has no credentials and is unable to facilitate SSH activity. It must be primed by adding keys, which is done with ssh-add. When called with no arguments, all of the default keys will be read. It also can be called to add a custom key:

```

$ ssh-add  ~/.ssh/some_key
Enter passphrase for /home/cfisher/.ssh/some_key:
Identity added: /home/cfisher/.ssh/some_key
 ↪(cfisher@localhost.localdomain)

```

Note that the agent will not retain the password on the key. ssh-add uses any and all passwords that you enter while it runs to decrypt keys that it finds, but the passwords are cleared from memory when ssh-add terminates (they are not sent to ssh-agent). This allows you to upgrade to new key formats with minimal inconvenience, while keeping the keys reasonably safe.

The current cached keys can be listed with ssh-add -l (from, which you can deduce that "some_key" is an Ed25519):

```

$ ssh-add -l
3072 SHA256:cpVFMZ17oO5n/Jfpv2qDNSNcV6ffOVYPV8vVaSm3DDo
     /home/cfisher/.ssh/id_rsa (RSA)
521 SHA256:1L9/CglR7cstr54a600zDrBbcxMj/a3RtcsdjuU61VU
     cfisher@localhost.localdomain (ECDSA)
256 SHA256:Vd21LEM4lixY4rIg3/Ht/w8aoMT+tRzFUR0R32SZIJc
     cfisher@localhost.localdomain (ED25519)
256 SHA256:YsKtUA9Mglas7kqC4RmzO6jd2jxVNCc1OE+usR4bkcc
     cfisher@localhost.localdomain (ED25519)

```

While a "primed" agent is running, the SSH clients may use (trusting) remote servers fluidly, with no further prompts for credentials:

```

$ sftp person@yourserver.com
Connected to yourserver.com.
sftp> quit

$ scp /etc/passwd person@yourserver.com:/tmp
passwd                              100% 2269    65.8KB/s   00:00

$ ssh person@yourserver.com
   (motd for yourserver.com)
$ ls -l /tmp/passwd
-rw-r--r--  1 root  wheel  2269 Aug 16 09:07 /tmp/passwd
$ rm /tmp/passwd
$ exit
Connection to yourserver.com closed.

```

The OpenSSH agent can be locked, preventing any further use of the credentials that it holds (this might be appropriate when suspending a laptop):

```

$ ssh-add -x
Enter lock password:
Again:
Agent locked.

$ ssh yourserver.com
Enter passphrase for key '/home/cfisher/.ssh/id_rsa': ^C

```

It will provide credentials again when it is unlocked:

```

$ ssh-add -X
Enter lock password:
Agent unlocked.

```

You also can set ssh-agent to expire keys after a time limit with the -t option, which may be useful for long-lived agents that must clear keys after a set daily shift.

General shell users may cache many types of keys with a number of differing agent implementations. In addition to the standard OpenSSH agent, users may rely upon PuTTY's pageant.exe, GNOME keyring or KDE Kwallet, among others (the use of the PUTTY agent could likely fill an article on its own).

However, the goal here is to create "enterprise" keys for critical server controls. You likely do not want long-lived agents in order to limit the risk of exposure. When scripting with "enterprise" keys, you will run an agent only for the duration of the activity, then kill it at completion.

There are special options for accessing the root account with OpenSSH—the PermitRootLogin parameter can be added to the sshd_config file (usually found in /etc/ssh). It can be set to a simple yes or no, forced-commands-only, which will allow only explicitly-authorized programs to be executed, or the equivalent options prohibit-password or without-password, both of which will allow access to the keys generated here.

Many hold that root should not be allowed any access. [Michael W. Lucas][21] addresses the question in SSH Mastery:

> Sometimes, it seems that you need to allow users to SSH in to the system as root. This is a colossally bad idea in almost all environments. When users must log in as a regular user and then change to root, the system logs record the user account, providing accountability. Logging in as root destroys that audit trail....It is possible to override the security precautions and make sshd permit a login directly as root. It's such a bad idea that I'd consider myself guilty of malpractice if I told you how to do it. Logging in as root via SSH almost always means you're solving the wrong problem. Step back and look for other ways to accomplish your goal.

When root action is required quickly on more than a few servers, the above advice can impose painful delays. Lucas' direct criticism can be addressed by allowing only a limited set of "bastion" servers to issue root commands over SSH. Administrators should be forced to log in to the bastions with unprivileged accounts to establish accountability.

However, one problem with remotely "changing to root" is the [statistical use of the Viterbi algorithm][22] Short passwords, the su - command and remote SSH calls that use passwords to establish a trinary network configuration are all uniquely vulnerable to timing attacks on a user's keyboard movement. Those with the highest security concerns will need to compensate.

For the rest of us, I recommend that PermitRootLogin without-password be set for all target machines.

Finally, you can easily terminate ssh-agent interactively with the -k option:

```

$ eval $(ssh-agent -k)
Agent pid 4394 killed

```

With these tools and the intended use of them in mind, here is a complete script that runs an agent for the duration of a set of commands over a list of servers for a common named user (which is not necessarily root):

```

# cat artano

#!/bin/sh

if [[ $# -lt 1 ]]; then echo "$0 - requires commands"; exit; fi

R="-R5865:127.0.0.1:5865" # set to "-2" if you don't want
 ↪port forwarding

eval $(ssh-agent -s)

function cleanup { eval $(ssh-agent -s -k); }

trap cleanup EXIT

function remsh { typeset F="/tmp/${1}" h="$1" p="$2";
 ↪shift 2; echo "#$h"
 if [[ "$ARTANO" == "PARALLEL" ]]
 then ssh "$R" -p "$p" "$h" "$@" < /dev/null >>"${F}.out"
  ↪2>>"${F}.err" &
 else ssh "$R" -p "$p" "$h" "$@"
 fi }    # HOST                                          PORT CMD

if ssh-add ~/.ssh/master_key
then remsh yourserver.com                                  22 "$@"
     remsh container.yourserver.com                      2200 "$@"
     remsh anotherserver.com                               22 "$@"
     # Add more hosts here.
else echo Bad password - killing agent. Try again.
fi

wait

#######################################################################
# Examples:           # Artano is an epithet of a famous mythical being
# artano 'mount /patchdir'      # you will need an fstab entry for this
# artano 'umount /patchdir'
# artano 'yum update -y 2>&1'
# artano 'rpm -Fvh /patchdir/\*.rpm'
#######################################################################

```

This script runs all commands in sequence on a collection of hosts by default. If the ARTANO environment variable is set to PARALLEL, it instead will launch them all as background processes simultaneously and append their STDOUT and STDERR to files in /tmp (this should be no problem when dealing with fewer than a hundred hosts on a reasonable server). The PARALLEL setting is useful not only for pushing changes faster, but also for collecting audit results.

Below is an example using the yum update agent. The source of this particular invocation had to traverse a firewall and relied on a proxy setting in the /etc/yum.conf file, which used the port-forwarding option (-R) above:

```

# ./artano 'yum update -y 2>&1'
Agent pid 3458
Enter passphrase for /root/.ssh/master_key:
Identity added: /root/.ssh/master_key (/root/.ssh/master_key)
#yourserver.com
Loaded plugins: langpacks, ulninfo
No packages marked for update
#container.yourserver.com
Loaded plugins: langpacks, ulninfo
No packages marked for update
#anotherserver.com
Loaded plugins: langpacks, ulninfo
No packages marked for update
Agent pid 3458 killed

```

The script can be used for more general maintenance functions. Linux installations running the XFS filesystem should "defrag" periodically. Although this normally would be done with cron, it can be a centralized activity, stored in a separate script that includes only on the appropriate hosts:

```

&1'
Agent pid 7897
Enter passphrase for /root/.ssh/master_key:
Identity added: /root/.ssh/master_key (/root/.ssh/master_key)
#yourserver.com
#container.yourserver.com
#anotherserver.com
Agent pid 7897 killed

```

An easy method to collect the contents of all authorized_keys files for all users is the following artano script (this is useful for system auditing and is coded to remove file duplicates):

```

artano 'awk -F: {print\$6\"/.ssh/authorized_keys\"} \
     /etc/passwd | sort -u | xargs grep . 2> /dev/null'

```

It is convenient to configure NFS mounts for file distribution to remote nodes. Bear in mind that NFS is clear text, and sensitive content should not traverse untrusted networks while unencrypted. After configuring an NFS server on host 1.2.3.4, I add the following line to the /etc/fstab file on all the clients and create the /patchdir directory. After the change, the artano script can be used to mass-mount the directory if the network configuration is correct:

```

# tail -1 /etc/fstab
1.2.3.4:/var/cache/yum/x86_64/7Server/ol7_latest/packages
 ↪/patchdir nfs4 noauto,proto=tcp,port=2049 0 0

```

Assuming that the NFS server is mounted, RPMs can be upgraded from images stored upon it (note that Oracle Spacewalk or Red Hat Satellite might be a more capable patch method):

```

# ./artano 'rpm -Fvh /patchdir/\*.rpm'
Agent pid 3203
Enter passphrase for /root/.ssh/master_key:
Identity added: /root/.ssh/master_key (/root/.ssh/master_key)
#yourserver.com
Preparing...                          ########################
Updating / installing...
xmlsec1-1.2.20-7.el7_4                ########################
xmlsec1-openssl-1.2.20-7.el7_4        ########################
Cleaning up / removing...
xmlsec1-openssl-1.2.20-5.el7          ########################
xmlsec1-1.2.20-5.el7                  ########################
#container.yourserver.com
Preparing...                          ########################
Updating / installing...
xmlsec1-1.2.20-7.el7_4                ########################
xmlsec1-openssl-1.2.20-7.el7_4        ########################
Cleaning up / removing...
xmlsec1-openssl-1.2.20-5.el7          ########################
xmlsec1-1.2.20-5.el7                  ########################
#anotherserver.com
Preparing...                          ########################
Updating / installing...
xmlsec1-1.2.20-7.el7_4                ########################
xmlsec1-openssl-1.2.20-7.el7_4        ########################
Cleaning up / removing...
xmlsec1-openssl-1.2.20-5.el7          ########################
xmlsec1-1.2.20-5.el7                  ########################
Agent pid 3203 killed

```

I am assuming that my audience is already experienced with package tools for their preferred platforms. However, to avoid criticism that I've included little actual discussion of patch tools, the following is a quick reference of RPM manipulation commands, which is the most common package format on enterprise systems:

*   rpm -Uvh package.i686.rpm — install or upgrade a package file.

*   rpm -Fvh package.i686.rpm — upgrade a package file, if an older version is installed.

*   rpm -e package — remove an installed package.

*   rpm -q package — list installed package name and version.

*   rpm -q --changelog package — print full changelog for installed package (including CVEs).

*   rpm -qa — list all installed packages on the system.

*   rpm -ql package — list all files in an installed package.

*   rpm -qpl package.i686.rpm — list files included in a package file.

*   rpm -qi package — print detailed description of installed package.

*   rpm -qpi package — print detailed description of package file.

*   rpm -qf /path/to/file — list package that installed a particular file.

*   rpm --rebuild package.src.rpm — unpack and build a binary RPM under /usr/src/redhat.

*   rpm2cpio package.src.rpm | cpio -icduv — unpack all package files in the current directory.

Another important consideration for scripting the SSH agent is limiting the capability of an authorized key. There is a [specific syntax][23] for such limitations Of particular interest is the from="" clause, which will restrict logins on a key to a limited set of hosts. It is likely wise to declare a set of "bastion" servers that will record non-root logins that escalate into controlled users who make use of the enterprise keys.

An example entry might be the following (note that I've broken this line, which is not allowed syntax but done here for clarity):

```

from="*.c2.security.yourcompany.com,4.3.2.1" ssh-ed25519
 ↪AAAAC3NzaC1lZDI1NTE5AAAAIJSSazJz6A5x6fTcDFIji1X+
↪svesidBonQvuDKsxo1Mx

```

A number of other useful restraints can be placed upon authorized_keys entries. The command="" will restrict a key to a single program or script and will set the SSH_ORIGINAL_COMMAND environment variable to the client's attempted call—scripts can set alarms if the variable does not contain approved contents. The restrict option also is worth consideration, as it disables a large set of SSH features that can be both superfluous and dangerous.

Although it is possible to set server identification keys in the known_hosts file to a @revoked status, this cannot be done with the contents of authorized_keys. However, a system-wide file for forbidden keys can be set in the sshd_config with RevokedKeys. This file overrides any user's authorized_keys. If set, this file must exist and be readable by the sshd server process; otherwise, no keys will be accepted at all (so use care if you configure it on a machine where there are obstacles to physical access). When this option is set, use the artano script to append forbidden keys to the file quickly when they should be disallowed from the network. A clear and convenient file location would be /etc/ssh/revoked_keys.

It is also possible to establish a local Certificate Authority (CA) for OpenSSH that will [allow keys to be registered with an authority][24] with expiration dates. These CAs can [become quite elaborate][25] in their control over an enterprise. Although the maintenance of an SSH CA is beyond the scope of this article, keys issued by such CAs should be strong by adhering to the requirements for Ed25519/E-521/RSA-3072.

### pdsh

Many higher-level tools for the control of collections of servers exist that are much more sophisticated than the script I've presented here. The most famous is likely [Puppet][26], which is a Ruby-based configuration management system for enterprise control. Puppet has a somewhat short list of supported operating systems. If you are looking for low-level control of Android, Tomato, Linux smart terminals or other "exotic" POSIX, Puppet is likely not the appropriate tool. Another popular Ruby-based tool is [Chef][27], which is known for its complexity. Both Puppet and Chef require Ruby installations on both clients and servers, and they both will catalog any SSH keys that they find, so this key strength discussion is completely applicable to them.

There are several similar Python-based tools, including [Ansible][28], [Bcfg2][29], [Fabric][30] and [SaltStack][31]. Of these, only Ansible can run "agentless" over a bare SSH connection; the rest will require agents that run on target nodes (and this likely includes a Python runtime).

Another popular configuration management tool is [CFEngine][32], which is coded in C and claims very high performance. [Rudder][33] has evolved from portions of CFEngine and has a small but growing user community.

Most of the previously mentioned packages are licensed commercially and some are closed source.

The closest low-level tool to the activities presented here is the Parallel Distributed Shell (pdsh), which can be found in the [EPEL repository][34]. The pdsh utilities grew out of an IBM-developed package named dsh designed for the control of compute clusters. Install the following packages from the repository to use pdsh:

```

# rpm -qa | grep pdsh
pdsh-2.31-1.el7.x86_64
pdsh-rcmd-ssh-2.31-1.el7.x86_64

```

An SSH agent must be running while using pdsh with encrypted keys, and there is no obvious way to control the destination port on a per-host basis as was done with the artano script. Below is an example using pdsh to run a command on three remote servers:

```

# eval $(ssh-agent)
Agent pid 17106

# ssh-add  ~/.ssh/master_key
Enter passphrase for /root/.ssh/master_key:
Identity added: /root/.ssh/master_key (/root/.ssh/master_key)

# pdsh -w hosta.com,hostb.com,hostc.com uptime
hosta: 13:24:49 up 13 days,  2:13, 6 users, load avg: 0.00, 0.01, 0.05
hostb: 13:24:49 up  7 days, 21:15, 5 users, load avg: 0.05, 0.04, 0.05
hostc: 13:24:49 up  9 days,  3:26, 3 users, load avg: 0.00, 0.01, 0.05

# eval $(ssh-agent -k)
Agent pid 17106 killed

```

The -w option above defines a host list. It allows for limited arithmetic expansion and can take the list of hosts from standard input if the argument is a dash (-). The PDSH_SSH_ARGS and PDSH_SSH_ARGS_APPEND environment variables can be used to pass custom options to the SSH call. By default, 32 sessions will be launched in parallel, and this "fanout/sliding window" will be maintained by launching new host invocations as existing connections complete and close. You can adjust the size of the "fanout" either with the -f option or the FANOUT environment variable. It's interesting to note that there are two file copy commands: pdcp and rpdcp, which are analogous to scp.

Even a low-level utility like pdsh lacks some flexibility that is available by scripting OpenSSH, so prepare to feel even greater constraints as more complicated tools are introduced.

### Conclusion

Modern Linux touches us in many ways on diverse platforms. When the security of these systems is not maintained, others also may touch our platforms and turn them against us. It is important to realize the maintenance obligations when you add any Linux platform to your environment. This obligation always exists, and there are consequences when it is not met.

In a security emergency, simple, open and well understood tools are best. As tool complexity increases, platform portability certainly declines, the number of competent administrators also falls, and this likely impacts speed of execution. This may be a reasonable trade in many other aspects, but in a security context, it demands a much more careful analysis. Emergency measures must be documented and understood by a wider audience than is required for normal operations, and using more general tools facilitates that discussion.

I hope the techniques presented here will prompt that discussion for those who have not yet faced it.

### Disclaimer

The views and opinions expressed in this article are those of the author and do not necessarily reflect those of Linux Journal.

### Note:

An exploit [compromising Ed25519][35] was recently demonstrated that relies upon custom hardware changes to derive a usable portion of a secret key. Physical hardware security is a basic requirement for encryption integrity, and many common algorithms are further vulnerable to cache timing or other side channel attacks that can be performed by the unprivileged processes of other users. Use caution when granting access to systems that process sensitive data.


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/rapid-secure-patching-tools-and-methods

作者：[Charles Fisher][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/charles-fisher
[1]:https://en.wikipedia.org/wiki/EternalBlue
[2]:http://securityaffairs.co/wordpress/61530/hacking/smbloris-smbv1-flaw.html
[3]:http://www.telegraph.co.uk/news/2017/05/13/nhs-cyber-attack-everything-need-know-biggest-ransomware-offensive
[4]:http://www.linuxjournal.com/content/smbclient-security-windows-printing-and-file-transfer
[5]:https://staff.washington.edu/dittrich/misc/forensics
[6]:https://ed25519.cr.yp.to
[7]:http://www.metzdowd.com/pipermail/cryptography/2016-March/028824.html
[8]:https://blog.g3rt.nl/upgrade-your-ssh-keys.html
[9]:https://news.ycombinator.com/item?id=12563899
[10]:http://safecurves.cr.yp.to/rigid.html
[11]:https://en.wikipedia.org/wiki/Curve25519
[12]:http://blog.cr.yp.to/20140323-ecdsa.html
[13]:https://lwn.net/Articles/573166
[14]:http://martin.kleppmann.com/2013/05/24/improving-security-of-ssh-private-keys.html
[15]:https://en.wikipedia.org/wiki/Shor's_algorithm
[16]:https://www.dwavesys.com/d-wave-two-system
[17]:https://crypto.stackexchange.com/questions/40893/can-or-can-not-d-waves-quantum-computers-use-shors-and-grovers-algorithm-to-f
[18]:https://yro.slashdot.org/story/16/12/21/2334220/nist-asks-public-for-help-with-quantum-proof-cryptography
[19]:https://ntruprime.cr.yp.to/index.html
[20]:http://www.linuxjournal.com/content/cipher-security-how-harden-tls-and-ssh
[21]:https://www.michaelwlucas.com/tools/ssh
[22]:https://people.eecs.berkeley.edu/~dawnsong/papers/ssh-timing.pdf
[23]:https://man.openbsd.org/sshd#AUTHORIZED_KEYS_FILE_FORMAT
[24]:https://ef.gy/hardening-ssh
[25]:https://code.facebook.com/posts/365787980419535/scalable-and-secure-access-with-ssh
[26]:https://puppet.com
[27]:https://www.chef.io
[28]:https://www.ansible.com
[29]:http://bcfg2.org
[30]:http://www.fabfile.org
[31]:https://saltstack.com
[32]:https://cfengine.com
[33]:http://www.rudder-project.org/site
[34]:https://fedoraproject.org/wiki/EPEL
[35]:https://research.kudelskisecurity.com/2017/10/04/defeating-eddsa-with-faults
