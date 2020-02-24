[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tools for SSH key management)
[#]: via: (https://opensource.com/article/20/2/ssh-tools)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

Tools for SSH key management
======
Time-saving shortcuts for a commonly used open source tool.
![collection of hardware on blue backround][1]

I use SSH constantly. Every day I find myself logged in to multiple servers and Pis (both in the same room as me and over the internet). I have many devices I need access to, and different requirements for gaining access, so in addition to using various SSH/SCP command options, I have to maintain a config file with all the connection details.

Over time I’ve come up with a few time-saving tips and tools that you might find useful, too.

### SSH keys

SSH keys are a way to authenticate SSH connections without using a password, either to speed up your access or as a security measure, if you turn password access off and ensure only authorized keys are permitted. To create an SSH key, run the command:


```
`$ ssh-keygen`
```

This will create a key-pair (a public and private key) in **~/.ssh/**. Keep the private key (id_rsa) on the PC and never share it. You can share the public key (id_rsa.pub) with others or place it on other servers.

### ssh-copy-id

If I’m working on a Pi at home or work, I tend to leave SSH settings at their default, as I’m not concerned with security on an internal trusted network, and I usually copy my SSH key to the Pi to avoid having to authenticate with a password every time. To do this, I use the **ssh-copy-id** command to copy it to the Pi. This automatically adds your key to the Pi:


```
`$ ssh-copy-id pi@192.168.1.20`
```

On production servers, I tend to turn off password authentication and only allow authorized SSH keys.

### ssh-import-id

Another similar tool is ssh-import-id. You can use this to give yourself (or others) access to a computer or server by importing their keys from GitHub. For example, I have registered my various SSH keys with my GitHub account, so I can push to GitHub without a password. These public keys are made available, so ssh-import-id can use them to authorize me from any of my computers:


```
`$ ssh-import-id gh:bennuttall`
```

I can also use this to give someone else access to a server without asking them for their keys:


```
`$ ssh-import-id gh:waveform80`
```

### storm

I also use a tool called Storm, which helps you add SSH connections to your SSH config, so you don’t have to remember them all. You can install it with pip:


```
`$ sudo pip3 install stormssh`
```

Then you can add an SSH connection to your config with the following command:


```
`$ storm add pi3 pi@192.168.1.20`
```

Then you can just use **ssh pi3** to gain access. Similarly, **scp file.txt pi3:** or **sshfs pi pi3:**

You can also use more SSH options, such as the port number:


```
$ storm add pi3 pi@192.168.1.20:2000
```

You can list, search, and edit saved connections easily using Storm’s [documentation][2]. All Storm actually does is manage items in your ssh config file at **~/.ssh/config**. Once you see how these are stored, you might choose to edit them manually. An example connection in config looks like this:


```
Host pi3
   user pi
   hostname 192.168.1.20
   port 22
```

### Conclusion

SSH is an important tool for system administration, from Raspberry Pi to the largest cloud infrastructures. Familiarizing yourself with key management will forever be handy. Do you have other SSH tricks to add? I would love to have you share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/ssh-tools

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_BUS_Apple_520.png?itok=ZJu-hBV1 (collection of hardware on blue backround)
[2]: https://stormssh.readthedocs.io/en/stable/usage.html
