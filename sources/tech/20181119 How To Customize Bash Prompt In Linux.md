HankChow translating

How To Customize Bash Prompt In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2017/10/BASH-720x340.jpg)

As you know already, **BASH** (the **B** ourne- **A** gain **Sh** ell) is the default shell for most modern Linux distributions. In this guide, we are going to customize BASH prompt and enhance its look by adding some colors and styles. Of course, there are many plugins/tools available to get this job done easily and quickly. However, we still can do some basic customization, such as adding, modifying elements, changing the foreground and background color etc., without having to install any additional tools and plugins. Let us get started!

### Customize Bash Prompt In Linux

In BASH, we can customize and change the BASH prompt as the way you want by changing the value of **PS1** environment variable.

Usually, the BASH prompt will look something like below:
![](https://www.ostechnix.com/wp-content/uploads/2017/10/Linux-Terminal.png)

Here, **sk** is my username and **ubuntuserver** is my hostname.

Now, we are going to change this prompt as per your liking by inserting some backslash-escaped special characters called **Escape Sequences**.

Let me show you some examples.

Before going further, it is highly recommended to backup the **~/.bashrc** file.

```
$ cp ~/.bashrc ~/.bashrc.bak
```

**Modify “[[email protected]][1]” part in the Bash prompt**

As I mentioned above, the BASH prompt has “[[email protected]][1]” part by default in most Linux distributions. You can change this part to something else.

To do so, edit **~/.bashrc **file:

```
$ vi ~/.bashrc
```

Add the following line at the end:

```
PS1="ostechnix> "
```

Replace “ostechnix” with any letters/words of your choice. Once added, hit the **ESC** key and type **:wq** to save and exit the file.

Run the following command to update the changes:

```
$ source ~/.bashrc
```

Now, the BASH prompt will have the letters “ostechnix” in the shell prompt.

![][3]

Here is another example. I am going to replace “[[email protected]][1]” part with “[[email protected]][1]>”.

To do so, add the following entry in your **~./bashrc** file.

Don’t forget to update the changes using “source ~./bashrc” command.

Here is the output of my BASH prompt in Ubuntu 18.04 LTS.
![](https://www.ostechnix.com/wp-content/uploads/2017/10/bash-prompt-1.png)

**Display username only:**

To display the username only, just add the following line in **~/.bashrc** file.

```
export PS1="\u "
```

Here, **\u** is the escape sequence.

Here are some more values to add to your PS1 variable to change the BASH prompt. After adding each entry, you must run “source ~/.bashrc” command to take effect the changes.

**Add username with hostname:**

```
export PS1="\u\h "
```

Your prompt will now look like below:

```
skubuntuserver
```

**Add username and FQDN (Fully Qualified Domain Name):**

```
export PS1="\u\H "
```

**Add extra characters between username and hostname:**

If you want to any letter, for example **@** , between the username and hostname, use the following entry:

```
export PS1="\u@\h "
```

The bash prompt will look like below:
```
sk@ubuntuserver
```

**Add username with hostname with $ symbol at the end:**
```
export PS1="\u@\h\\$ "
```

**Add special characters between and after username and hostname:**
```
export PS1="\u@\h> "
```

This entry will change the BASH prompt as shown below.
```
sk@ubuntuserver>
```

Similarly, you can add other special characters, such as colon, semi-colon, *, underscore, space etc.

**Display username, hostname, shell name:**
```
export PS1="\u@\h>\s "
```

**Display username, hostname, shell and and its version:**
```
export PS1="\u@\h>\s\v "
```

Bash prompt output:

![][4]

Display username, hostname and path to current directory:
```
export PS1="\u@\h\w "
```

You will see a tilde (~) symbol if the current directory is $HOME.

**Display date in BASH prompt:**

To display date with your username and hostname in the BASH prompt, add the following entry in ~/.bashrc file.
```
export PS1="\u@\h>\d "
```
![][5]

**Date and time in 12 hour format in BASH prompt:**
```
export PS1="\u@\h>\d\@ "
```

**Date and 12 hour time hh:mm:ss format:**
```
export PS1="\u@\h>\d\T "
```

**Date and 24 hour time:**
```
export PS1="\u@\h>\d\A "
```

**Date and 24 hour hh:mm:ss format:**
```
export PS1="\u@\h>\d\t "
```

These are some common escape sequences to change the Bash prompt format. There are few more escape sequences are available. You can view them all in in the **bash man page** under the **“PROMPTING”** section.

And, you can view the current prompt settings at any time using command:

```
$ echo $PS1
```

**Hide “username@hostname” Part In Bash prompt**

I don’t want to change anything. Can I hide it altogether? Yes, you can!

If you’re a blogger or tech writer, there are chances that you have to upload the screenshots of your Linux Terminal in your websites and blogs. Your username/hostname might be too cool, so you may not want others to copy and use them as their own. On the other hand, your username/hostname might be too weird or too bad or contain offensive characters, so you don’t want others to view them. In such cases, this small tip might help you to hide or modify “[[email protected]][1]” part in Terminal.

If you don’t like to let the users to view your username/hostname part, just follow the steps given below.

Edit your **“~/.bashrc”** file:

```
$ vi ~/.bashrc
```

Add the following at the end:

```
PS1="\W> "
```

Type **:wq** to save and close the file.

Then, run the following command to take effect the changes.

```
$ source ~/.bashrc
```

That’s it. Now, check your Terminal. You will not see the [[email protected]][1] part. You will only see the **~ >** symbol.

![][6]

Want to know another simplest way without messing the **~/.bashrc** file? Just create another user account something like **[[email protected]][1]** , or **[[email protected]][1]**. Use these accounts for making guides, videos and upload them on your blog or online. Now, you have nothing to worry about your identity.

**Warning:** This is a bad practice in some cases. For example, if another shells like zsh inherits your current shell, it will cause some problems. Use it only for hiding or modifying your [[email protected]][1] part if you use single shell. Apart from hiding the [[email protected]][1] part in the Terminal, this tip is pretty useless and might be problematic.

### Colorizing BASH prompt

What we have seen so far is we just changed/added some elements to the BASH prompt. In this section, we are going to add colors the elements.

You can enhance the foreground (text) and background color of BASH prompt’s elements by adding some code to the ~/.bashrc file.

For example, to change the foreground color of all texts to Red, add the following code:
```
export PS1="\u@\[\e[31m\]\h\[\e[m\] "
```

Once added, update the changes using command:

Now, your BASH prompt will look like below:
![][7]

Similarly, to change the background color, add this code:
```
export PS1="\u@\[\e[31;46m\]\h\[\e[m\] "
```

![][8]

### **Adding Emojis**

Who doesn’t love emoji? We can add an emoji by placing the following code in the ~/.bashrc file.

```
PS1="\W 🔥 >"
```

Please note that some terminal may not show the emojis properly depending upon the font used. You may see either garbled characters or monochrome emoji if you don’t have suitable fonts.

### Customizing BASH is bit difficult to me, Is there any other easy way?

If you’re a newbie, writing and adding PS1 values will be confusing and difficult. Also, you will find it bit difficult to arrange the elements to get the result of your choice. No worries! There is an online Bash PS1 generator available which allows you to easily generate different PS1 values as you wish.

Go to the following website:

[![EzPrompt](https://www.ostechnix.com/wp-content/uploads/2017/10/EzPrompt.png)][9]

Just pick the elements you want to use in your BASH prompt. Add the colors to the elements and re-arrange them in any order of your liking. Preview the output instantly and finally copy/paste resulting code in your **~/.bashrc** file. It is that simple! Most of the examples mentioned in this guide are taken from this website.


### I messed up with my .bashrc file? How to restore it to default settings?

As I mentioned earlier, it is strongly recommended to take backup ~./bashrc (Or any important configuration files in general) before making any changes. So, you can restore it to the previous working version if something went wrong. However if you forgot to backup the ~/.bashrc file in the first place, you still can restore it to the default settings as described in the following guide.

[How To Restore .bashrc File To Default Settings][10]

The above guide is based on Ubuntu, but it may applicable to other Linux distributions as well. Please let us be clear that the aforementioned guide will help you to reset ~/.bashrc to its default settings at the time of new installation. Any changes done afterwards will be lost.

And, that’s all for now. I will keep updating this guide as I learned more ways to customize the BASH prompt in future.

Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/hide-modify-usernamelocalhost-part-terminal/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/cdn-cgi/l/email-protection
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2017/10/Linux-Terminal-2.png
[4]: http://www.ostechnix.com/wp-content/uploads/2017/10/bash-prompt-2.png
[5]: http://www.ostechnix.com/wp-content/uploads/2017/10/bash-prompt-3.png
[6]: http://www.ostechnix.com/wp-content/uploads/2017/10/Linux-Terminal-1.png
[7]: http://www.ostechnix.com/hide-modify-usernamelocalhost-part-terminal/bash-prompt-4/
[8]: http://www.ostechnix.com/hide-modify-usernamelocalhost-part-terminal/bash-prompt-5/
[9]: http://ezprompt.net/
[10]: https://www.ostechnix.com/restore-bashrc-file-default-settings-ubuntu/
