translating---geekpi

10 handy Bash aliases for Linux
======
Get more efficient by using condensed versions of long Bash commands.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U)

How many times have you repeatedly typed out a long command on the command line and wished there was a way to save it for later? This is where Bash aliases come in handy. They allow you to condense long, cryptic commands down to something easy to remember and use. Need some examples to get you started? No problem!

To use a Bash alias you've created, you need to add it to your .bash_profile file, which is located in your home folder. Note that this file is hidden and accessible only from the command line. The easiest way to work with this file is to use something like Vi or Nano.

### 10 handy Bash aliases

  1. How many times have you needed to unpack a .tar file and couldn't remember the exact arguments needed? Aliases to the rescue! Just add the following to your .bash_profile file and then use **untar FileName** to unpack any .tar file.



```
alias untar='tar -zxvf '

```

  2. Want to download something but be able to resume if something goes wrong?



```
alias wget='wget -c '

```

  3. Need to generate a random, 20-character password for a new online account? No problem.



```
alias getpass="openssl rand -base64 20"

```

  4. Downloaded a file and need to test the checksum? We've got that covered too.



```
alias sha='shasum -a 256 '

```

  5. A normal ping will go on forever. We don't want that. Instead, let's limit that to just five pings.



```
alias ping='ping -c 5'

```

  6. Start a web server in any folder you'd like.



```
alias www='python -m SimpleHTTPServer 8000'

```

  7. Want to know how fast your network is? Just download Speedtest-cli and use this alias. You can choose a server closer to your location by using the **speedtest-cli --list** command.



```
alias speed='speedtest-cli --server 2406 --simple'

```

  8. How many times have you needed to know your external IP address and had no idea how to get that info? Yeah, me too.



```
alias ipe='curl ipinfo.io/ip'

```

  9. Need to know your local IP address?



```
alias ipi='ipconfig getifaddr en0'

```

  10. Finally, let's clear the screen.



```
alias c='clear'

```

As you can see, Bash aliases are a super-easy way to simplify your life on the command line. Want more info? I recommend a quick Google search for "Bash aliases" or a trip to GitHub.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/handy-bash-aliases

作者：[Patrick H.Mullins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
