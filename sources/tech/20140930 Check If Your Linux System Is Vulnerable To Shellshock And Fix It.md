Check If Your Linux System Is Vulnerable To Shellshock And Fix It
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/shellshock_Linux_check.jpeg)

Quick tutorial to show you **how to check if your Linux system is impacted with Shellshock** and if yes, **how to fix the system for Bash Bug exploit**.

If you are following news, you might have heard about a vulnerability found in [Bash][1], which is known as **Bash Bug** or **Shellshock**. [Red Hat][2] was the first to discover this vulnerability. This Shellshock bug allows attackers to inject their own code and thus leaves the system open to various malicious and remote attacks. In fact, [hackers are already exploiting it to launch DDoS attacks][3].

Since Bash is found on all Unix-like system, it leaves all Linux systems vulnerable to this Shellshock bug if those are running a specific version of Bash.

Wondering if your Linux system has been impacted by Shellshock? There is an easy way to check it, which we are about to see.

### Check Linux system for Shellshock vulnerability ###

Open a terminal and run the following command in it:

    env x='() { :;}; echo vulnerable' bash -c 'echo hello'

If your system is NOT vulnerable, you will see an output like this:

    bash: warning: x: ignoring function definition attempt
    bash: error importing function definition for `x’
    hello

If your system is vulnerable to Shellshock bug, you’ll see an output like this:

    vulnerable
    hello

I tried it on my Ubuntu 14.10 and here is what I got:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/Shellshock_Linux_Check.jpeg)

You can also check the bash version in use by using the command below:

    bash --version

If the bash version in use is 3.2.51(1), you should update it.

#### Patch Linux system for Shellshock vulnerability ####

If you are running a Debian based Linux OS such as Ubuntu, Linux Mint etc, use the following command to upgrade Bash:

    sudo apt-get update && sudo apt-get install --only-upgrade bash

For Linux OS like Fedora, Red Hat, Cent OS etc, use the following command:

    yum -y update bash

I hope this quick tip helps you to see if you are impacted with Shellshock bug and also to fix it. Questions and suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/linux-shellshock-check-fix/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://en.wikipedia.org/wiki/Bash_(Unix_shell)
[2]:https://securityblog.redhat.com/2014/09/24/bash-specially-crafted-environment-variables-code-injection-attack/
[3]:http://www.wired.com/2014/09/hackers-already-using-shellshock-bug-create-botnets-ddos-attacks/