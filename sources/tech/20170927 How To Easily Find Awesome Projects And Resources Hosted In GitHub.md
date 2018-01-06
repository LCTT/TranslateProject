translating by lujun9972
How To Easily Find Awesome Projects And Resources Hosted In GitHub
======
![](https://www.ostechnix.com/wp-content/uploads/2017/09/Awesome-finder-Find-Awesome-Projects-720x340.png)

Everyday there are hundreds of new additions to the **GitHub** website. Since GitHub has thousands of stuffs, you would be exhausted when searching for a good project. Fortunately, a group of contributors have made a curated lists of awesome stuffs hosted in GitHub. These lists contains a lot of awesome stuffs grouped under different categories such as programming, database, editors, gaming, entertainment and many more. It makes our life much easier to find out any project, software, resource, library, books and all other stuffs hosted in GitHub. A fellow GitHub user went one step ahead and created a command-line utility called **" Awesome-finder"** to find awesome projects and resources on awesome series repositories. This utility helps us to browse through the curated list of awesome lists without leaving the Terminal, without using browser of course.

In this brief guide, I will show you how to easily browse through the curated list of awesome lists in Unix-like systems.

### Awesome-finder - Easily Find Awesome Projects And Resources Hosted In GitHub

#### Installing Awesome-finder

Awesome can be easily installed using **pip** , a package manager for installing programs developed using Python programming language.

On **Arch Linux** and its derivatives like **Antergos** , **Manjaro Linux** , you can install pip using command:
```
sudo pacman -S python-pip
```

On **RHEL** , **CentOS** :
```
sudo yum install epel-release
```
```
sudo yum install python-pip
```

On **Fedora** :
```
sudo dnf install epel-release
```
```
sudo dnf install python-pip
```

On **Debian** , **Ubuntu** , **Linux Mint** :
```
sudo apt-get install python-pip
```

On **SUSE** , **openSUSE** :
```
sudo zypper install python-pip
```

Once PIP installed, run the following command to install 'Awesome-finder' utility.
```
sudo pip install awesome-finder
```

#### Usage

Awesome-finder currently lists the stuffs from the following awesome topics (repositories, of course) from GitHub site:

  * awesome
  * awesome-android
  * awesome-elixir
  * awesome-go
  * awesome-ios
  * awesome-java
  * awesome-javascript
  * awesome-php
  * awesome-python
  * awesome-ruby
  * awesome-rust
  * awesome-scala
  * awesome-swift



This list will be updated on regular basis.

For instance, to view the curated list from awesome-go repository, just type:
```
awesome go
```

You will see all popular stuffs written using "Go", sorted by alphabetical order.

[![][1]][2]

You can navigate through the list using **UP/DOWN** arrows. Once you found the stuff you looking for, choose it and hit **ENTER** key to open the link in your default web browser.

Similarly,

  * "awesome android" command will search the **awesome-android** repository.
  * "awesome awesome" command will search the **awesome** repository.
  * "awesome elixir" command will search the **awesome-elixir**.
  * "awesome go" will search the **awesome-go**.
  * "awesome ios" will search the **awesome-ios**.
  * "awesome java" will search the **awesome-java**.
  * "awesome javascript" will search the **awesome-javascript**.
  * "awesome php" will search the **awesome-php**.
  * "awesome python" will search the **awesome-python**.
  * "awesome ruby" will search the **awesome-ruby**.
  * "awesome rust" will search the **awesome-rust**.
  * "awesome scala" will search the **awesome-scala**.
  * "awesome swift" will search the **awesome-swift**.



Also, it automatically displays the suggestions as you type in the prompt. For instance when I type "dj", it displays the stuffs related to Django.

[![][1]][3]

If you wanted to find the awesome things from latest awesome-<topic> (not use cache), use -f or -force flag:
```
awesome <topic> -f (--force)

```

**Example:**
```
awesome python -f
```

Or,
```
awesome python --force
```

The above command will display the curated list of stuffs from **awesome-python** GitHub repository.

Awesome, isn't it?

To exit from this utility, press **ESC** key. To display help, type:
```
awesome -h
```

And, that's all for now. Hope this helps. If you find our guides useful, please share them on your social, professional networks, so everyone will benefit from them. Good good stuffs to come. Stay tuned!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/

作者：[SK][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_008-1.png ()
[3]:http://www.ostechnix.com/wp-content/uploads/2017/09/sk@sk_009.png ()
[4]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=reddit (Click to share on Reddit)
[5]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=twitter (Click to share on Twitter)
[6]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=facebook (Click to share on Facebook)
[7]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=google-plus-1 (Click to share on Google+)
[8]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=linkedin (Click to share on LinkedIn)
[9]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=pocket (Click to share on Pocket)
[10]:whatsapp://send?text=How%20To%20Easily%20Find%20Awesome%20Projects%20And%20Resources%20Hosted%20In%20GitHub%20https%3A%2F%2Fwww.ostechnix.com%2Feasily-find-awesome-projects-resources-hosted-github%2F (Click to share on WhatsApp)
[11]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=telegram (Click to share on Telegram)
[12]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/?share=email (Click to email this to a friend)
[13]:https://www.ostechnix.com/easily-find-awesome-projects-resources-hosted-github/#print (Click to print)
