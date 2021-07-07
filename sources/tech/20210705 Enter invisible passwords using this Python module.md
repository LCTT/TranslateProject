[#]: subject: (Enter invisible passwords using this Python module)
[#]: via: (https://opensource.com/article/21/7/invisible-passwords-python)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Enter invisible passwords using this Python module
======
Give your password an extra layer of security with GPG and the Python
getpass module.
![Password lock][1]

Passwords are particularly problematic for programmers. You're not supposed to store them without encrypting them, and you're not supposed to reveal what's been typed when your user enters one. This became particularly important to me when I decided I wanted to boost security on my laptop. I encrypt my home directory—but once I log in, any password stored as plain text in a configuration file is potentially exposed to prying eyes.

Specifically, I use an application called [Mutt][2] as my email client. It lets me read and compose emails in my Linux terminal, but normally it expects a password in its configuration file. I restricted permissions on my Mutt config file so that only I can see it, but I'm the only user of my laptop, so I'm not really concerned about authenticated users inadvertently looking at my configs. Instead, I wanted to protect myself from absent-mindedly posting my config online, either for bragging rights or version control, with my password exposed. In addition, although I have no expectations of unwelcome guests on my system, I did want to ensure that an intruder couldn't obtain my password just by running `cat` on my config.

### Python GnuPG

The Python module `python-gnupg` is a Python wrapper for the `gpg` application. The module's name is `python-gnupg`, which you must not confuse with a module called `gnupg`.

[GnuPG][3] (GPG) is the default encryption system for Linux, and I've been using it since 2009 or so. I feel comfortable with it and have a high level of trust in its security.

I decided that the best way to get my password into Mutt was to store my password inside an encrypted GPG file, create a prompt for my GPG password to unlock the encrypted file, and hand the password over to Mutt (actually to the `offlineimap` command, which I use to synchronize my laptop with the email server).

[Getting user input with Python][4] is pretty easy. You make a call to `input`, and whatever the user types is stored as a variable:


```
print("Enter password: ")
myinput = input()

print("You entered: ", myinput)
```

My problem was when I typed a password into the terminal in response to my password prompt, everything I typed was visible to anyone looking over my shoulder or scrolling through my terminal history:


```
$ ./test.py
Enter password: my-Complex-Passphrase
```

### Invisible password entry with getpass

As is often the case, there's a Python module that's already solved my problem. The module is `getpass4`, and from the user's perspective, it behaves exactly like `input` except without displaying what the user is typing.

You can install both modules with [pip][5]:


```
$ python -m pip install --user \
python-gnupg getpass4
```

Here's my Python script to create a password prompt:


```
#!/usr/bin/env python
# by Seth Kenlon
# GPLv3

# install deps:
# python3 -m pip install --user python-gnupg getpass4

import gnupg
import getpass
from pathlib import Path

def get_api_pass():
    homedir = str(Path.home())
    gpg = gnupg.GPG(gnupghome=os.path.join(homedir,".gnupg"), use_agent=True)
    passwd = getpass.getpass(prompt="Enter your GnuPG password: ", stream=None)

    with open(os.path.join(homedir,'.mutt','pass.gpg'), 'rb') as f:
        apipass = (gpg.decrypt_file(f, passphrase=passwd))

    f.close()

    return str(apipass)
   
if __name__ == "__main__":
    apipass = get_api_pass()
    print(apipass)
```

Save the file as `password_prompt.py` if you want to try it out. If you're using `offlineimap` and want to use this solution for your own password entry, then save it to some location you can point `offlineimap` to in your `.offlineimaprc` file (I use `~/.mutt/password_prompt.py`).

### Testing the password prompt

To see the script in action, you first must create an encrypted file (I'll assume that you already have GPG set up):


```
$ echo "hello world" &gt; pass
$ gpg --encrypt pass
$ mv pass.gpg ~/.mutt/pass.gpg
$ rm pass
```

Now run the Python script:


```
$ python ~/.mutt/password_prompt.py
Enter your GPG password:
hello world
```

Nothing displays as you type, but as long as you enter your GPG passphrase correctly, you will see the test message.

### Integrating the password prompt with offlineimap

I needed to integrate my new prompt with the `offlineimap` command. I chose Python for this script because I knew that `offlineimap` can make calls to Python applications. If you're an `offlineimap` user, you'll appreciate that the only "integration" required is changing two lines in your `.offlineimaprc` file.

First, add a line referencing the Python file:


```
`pythonfile = ~/.mutt/password_prompt.py`
```

And then replace the `remotepasseval` line in `.offlineimaprc` with a call to the `get_api_pass()` function in `password_prompt.py`:


```
`remotepasseval = get_api_pass()`
```

No more passwords in your config file!

### Security matters

It sometimes feels almost paranoid to think about security minutiae on your personal computer. Does your SSH config really need to be restricted to 600? Does it really matter that your email password is in an inconsequential config file buried within a hidden folder called, of all things, `.mutt`? Probably not.

And yet knowing that I don't have sensitive data quietly hidden away in my config files makes it a lot easier for me to commit files to public Git repositories, to copy and paste snippets into support forums, and to share my knowledge in the form of actual, known-good configuration files. For that alone, improved security has made my life easier. And with so many great Python modules available to help, it's easy to implement.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/invisible-passwords-python

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/password.jpg?itok=ec6z6YgZ (Password lock)
[2]: http://www.mutt.org/
[3]: https://gnupg.org/
[4]: https://opensource.com/article/20/12/learn-python
[5]: https://opensource.com/article/19/11/python-pip-cheat-sheet
