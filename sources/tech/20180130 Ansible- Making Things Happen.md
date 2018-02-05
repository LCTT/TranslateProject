Ansible: Making Things Happen
======
In my [last article][1], I described how to configure your server and clients so you could connect to each client from the server. Ansible is a push-based automation tool, so the connection is initiated from your "server", which is usually just a workstation or a server you ssh in to from your workstation. In this article, I explain how modules work and how you can use Ansible in ad-hoc mode from the command line.

Ansible is supposed to make your job easier, so the first thing you need to learn is how to do familiar tasks. For most sysadmins, that means some simple command-line work. Ansible has a few quirks when it comes to command-line utilities, but it's worth learning the nuances, because it makes for a powerful system.

### Command Module

This is the safest module to execute remote commands on the client machine. As with most Ansible modules, it requires Python to be installed on the client, but that's it. When Ansible executes commands using the Command Module, it does not process those commands through the user's shell. This means some variables like $HOME are not available. It also means stream functions (redirects, pipes) don't work. If you don't need to redirect output or to reference the user's home directory as a shell variable, the Command Module is what you want to use. To invoke the Command Module in ad-hoc mode, do something like this:

```

ansible host_or_groupname -m command -a "whoami"

```

Your output should show SUCCESS for each host referenced and then return the user name that the user used to log in. You'll notice that the user is not root, unless that's the user you used to connect to the client computer.

If you want to see the elevated user, you'll add another argument to the ansible command. You can add -b in order to "become" the elevated user (or the sudo user). So, if you were to run the same command as above with a "-b" flag:

```

ansible host_or_groupname -b -m command -a "whoami"

```

you should see a similar result, but the whoami results should say root instead of the user you used to connect. That flag is important to use, especially if you try to run remote commands that require root access!

### Shell Module

There's nothing wrong with using the Shell Module to execute remote commands. It's just important to know that since it uses the remote user's environment, if there's something goofy with the user's account, it might cause problems that the Command Module avoids. If you use the Shell Module, however, you're able to use redirects and pipes. You can use the whoami example to see the difference. This command:

```

ansible host_or_groupname -m command -a "whoami > myname.txt"

```

should result in an error about > not being a valid argument. Since the Command Module doesn't run inside any shell, it interprets the greater-than character as something you're trying to pass to the whoami command. If you use the Shell Module, however, you have no problems:

```

ansible host_or_groupname -m shell -a "whom > myname.txt"

```

This should execute and give you a SUCCESS message for each host, but there should be nothing returned as output. On the remote machine, however, there should be a file called myname.txt in the user's home directory that contains the name of the user. My personal policy is to use the Command Module whenever possible and to use the Shell Module if needed.

### The Raw Module

Functionally, the Raw Module works like the Shell Module. The key difference is that Ansible doesn't do any error checking, and STDERR, STDOUT and Return Code is returned. Other than that, Ansible has no idea what happens, because it just executes the command over SSH directly. So while the Shell Module will use /bin/sh by default, the Raw Module just uses whatever the user's personal default shell might be.

Why would a person decide to use the Raw Module? It doesn't require Python on the remote computer—at all. Although it's true that most servers have Python installed by default, or easily could have it installed, many embedded devices don't and can't have Python installed. For most configuration management tools, not having an agent program installed means the remote device can't be managed. With Ansible, if all you have is SSH, you still can execute remote commands using the Raw Module. I've used the Raw Module to manage Bitcoin miners that have a very minimal embedded environment. It's a powerful tool, and when you need it, it's invaluable!

### Copy Module

Although it's certainly possible to do file and folder manipulation with the Command and Shell Modules, Ansible includes a module specifically for copying files to the server. Even though it requires learning a new syntax for copying files, I like to use it because Ansible will check to see whether a file exists, and whether it's the same file. That means it copies the file only if it needs to, saving time and bandwidth. It even will make backups of existing files! I can't tell you how many times I've used scp and sshpass in a Bash FOR loop and dumped files on servers, even if they didn't need them. Ansible makes it easy and doesn't require FOR loops and IP iterations.

The syntax is a little more complicated than with Command, Shell or Raw. Thankfully, as with most things in the Ansible world, it's easy to understand—for example:

```

ansible host_or_groupname -b -m copy \
    -a "src=./updated.conf dest=/etc/ntp.conf \
        owner=root group=root mode=0644 backup=yes"

```

This will look in the current directory (on the Ansible server/workstation) for a file called updated.conf and then copy it to each host. On the remote system, the file will be put in /etc/ntp.conf, and if a file already exists, and it's different, the original will be backed up with a date extension. If the files are the same, Ansible won't make any changes.

I tend to use the Copy Module when updating configuration files. It would be perfect for updating configuration files on Bitcoin miners, but unfortunately, the Copy Module does require that the remote machine has Python installed. Nevertheless, it's a great way to update common files on many remote machines with one simple command. It's also important to note that the Copy Module supports copying remote files to other locations on the remote filesystem using the remote_src=true directive.

### File Module

The File Module has a lot in common with the Copy Module, but if you try to use the File Module to copy a file, it doesn't work as expected. The File Module does all its actions on the remote machine, so src and dest are all references to the remote filesystem. The File Module often is used for creating directories, creating links or deleting remote files and folders. The following will simply create a folder named /etc/newfolder on the remote servers and set the mode:

```

ansible host_or_groupname -b -m file \
       -a "path=/etc/newfolder state=directory mode=0755"

```

You can, of course, set the owner and group, along with a bunch of other options, which you can learn about on the Ansible doc site. I find I most often will either create a folder or symbolically link a file using the File Module. To create a symlink:

```

sensible host_or_groupname -b -m file \
         -a "src=/etc/ntp.conf dest=/home/user/ntp.conf \
             owner=user group=user state=link"

```

Notice that the state directive is how you inform Ansible what you actually want to do. There are several state options:

*   link — create symlink.

*   directory — create directory.

*   hard — create hardlink.

*   touch — create empty file.

*   absent — delete file or directory recursively.

This might seem a bit complicated, especially when you easily could do the same with a Command or Shell Module command, but the clarity of using the appropriate module makes it more difficult to make mistakes. Plus, learning these commands in ad-hoc mode will make playbooks, which consist of many commands, easier to understand (I plan to cover this in my next article).

### File Management

Anyone who manages multiple distributions knows it can be tricky to handle the various package managers. Ansible handles this in a couple ways. There are specific modules for apt and yum, but there's also a generic module called "package" that will install on the remote computer regardless of whether it's Red Hat- or Debian/Ubuntu-based.

Unfortunately, while Ansible usually can detect the type of package manager it needs to use, it doesn't have a way to fix packages with different names. One prime example is Apache. On Red Hat-based systems, the package is "httpd", but on Debian/Ubuntu systems, it's "apache2". That means some more complex things need to happen in order to install the correct package automatically. The individual modules, however, are very easy to use. I find myself just using apt or yum as appropriate, just like when I manually manage servers. Here's an apt example:

```

ansible host_or_groupname -b -m apt \
          -a "update_cache=yes name=apache2 state=latest"

```

With this one simple line, all the host machines will run apt-get update (that's the update_cache directive at work), then install apache2's latest version including any dependencies required. Much like the File Module, the state directive has a few options:

*   latest — get the latest version, upgrading existing if needed.

*   absent — remove package if installed.

*   present — make sure package is installed, but don't upgrade existing.

The Yum Module works similarly to the Apt Module, but I generally don't bother with the update_cache directive, because yum updates automatically. Although very similar, installing Apache on a Red Hat-based system looks like this:

```

ansible host_or_groupname -b -m yum \
      -a "name=httpd state=present"

```

The difference with this example is that if Apache is already installed, it won't update, even if an update is available. Sometimes updating to the latest version isn't want you want, so this stops that from accidentally happening.

### Just the Facts, Ma'am

One frustrating thing about using Ansible in ad-hoc mode is that you don't have access to the "facts" about the remote systems. In my next article, where I plan to explore creating playbooks full of various tasks, you'll see how you can reference the facts Ansible learns about the systems. It makes Ansible far more powerful, but again, it can be utilized only in playbook mode. Nevertheless, it's possible to use ad-hoc mode to peek at the sorts information Ansible gathers. If you run the setup module, it will show you all the details from a remote system:

```

ansible host_or_groupname -b -m setup

```

That command will spew a ton of variables on your screen. You can scroll through them all to see the vast amount of information Ansible pulls from the host machines. In fact, it shows so much information, it can be overwhelming. You can filter the results:

```

ansible host_or_groupname -b -m setup -a "filter=*family*"

```

That should just return a single variable, ansible_os_family, which likely will be Debian or Red Hat. When you start building more complex Ansible setups with playbooks, it's possible to insert some logic and conditionals in order to use yum where appropriate and apt where the system is Debian-based. Really, the facts variables are incredibly useful and make building playbooks that much more exciting.

But, that's for another article, because you've come to the end of the second installment. Your assignment for now is to get comfortable using Ansible in ad-hoc mode, doing one thing at a time. Most people think ad-hoc mode is just a stepping stone to more complex Ansible setups, but I disagree. The ability to configure hundreds of servers consistently and reliably with a single command is nothing to scoff at. I love making elaborate playbooks, but just as often, I'll use an ad-hoc command in a situation that used to require me to ssh in to a bunch of servers to do simple tasks. Have fun with Ansible; it just gets more interesting from here!


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/ansible-making-things-happen

作者：[Shawn Powers][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/shawn-powers
[1]:http://www.linuxjournal.com/content/ansible-automation-framework-thinks-sysadmin
