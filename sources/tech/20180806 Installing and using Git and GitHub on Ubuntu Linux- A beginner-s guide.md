Installing and using Git and GitHub on Ubuntu Linux: A beginner's guide
======

GitHub is a treasure trove of some of the world's best projects, built by the contributions of developers all across the globe. This simple, yet extremely powerful platform helps every individual interested in building or developing something big to contribute and get recognized in the open source community.

This tutorial is a quick setup guide for installing and using GitHub and how to perform its various functions of creating a repository locally, connecting this repo to the remote host that contains your project (where everyone can see), committing the changes and finally pushing all the content in the local system to GitHub.

Please note that this tutorial assumes that you have a basic knowledge of the terms used in Git such as push, pull requests, commit, repository, etc. It also requires you to register to GitHub [here][1] and make a note of your GitHub username. So let's begin:

### 1 Installing Git for Linux

Download and install Git for Linux:

```
sudo apt-get install git
```

The above command is for Ubuntu and works on all Recent Ubuntu versions, tested from Ubuntu 16.04 to Ubuntu 18.04 LTS (Bionic Beaver) and it's likely to work the same way on future versions.

### 2 Configuring GitHub

Once the installation has successfully completed, the next thing to do is to set up the configuration details of the GitHub user. To do this use the following two commands by replacing "user_name" with your GitHub username and replacing "email_id" with your email-id you used to create your GitHub account.

```
git config --global user.name "user_name"

git config --global user.email "email_id"
```

The following image shows an example of my configuration with my "user_name" being "akshaypai" and my "email_id" being "[[email protected]][2]"

[![Git config][3]][4]

### 3 Creating a local repository

Create a folder on your system. This will serve as a local repository which will later be pushed onto the GitHub website. Use the following command:

```
git init Mytest
```

If the repository is created successfully, then you will get the following line:

Initialized empty Git repository in /home/akshay/Mytest/.git/

This line may vary depending on your system.

So here, Mytest is the folder that is created and "init" makes the folder a GitHub repository. Change the directory to this newly created folder:

```
cd Mytest
```

### 4 Creating a README file to describe the repository

Now create a README file and enter some text like "this is a git setup on Linux". The README file is generally used to describe what the repository contains or what the project is all about. Example:

```
gedit README
```

You can use any other text editors. I use gedit. The content of the README file will be:

This is a git repo

### 5 Adding repository files to an index

This is an important step. Here we add all the things that need to be pushed onto the website into an index. These things might be the text files or programs that you might add for the first time into the repository or it could be adding a file that already exists but with some changes (a newer version/updated version).

Here we already have the README file. So, let's create another file which contains a simple C program and call it sample.c. The contents of it will be:
```

#include<stdio.h>
int main()
{
printf("hello world");
return 0;
}

```

So, now that we have 2 files

README and sample.c

add it to the index by using the following 2 commands:

```
git add README

git add smaple.c
```

Note that the "git add" command can be used to add any number of files and folders to the index. Here, when I say index, what I am referring to is a buffer like space that stores the files/folders that have to be added into the Git repository.

### 6 Committing changes made to the index

Once all the files are added, we can commit it. This means that we have finalized what additions and/or changes have to be made and they are now ready to be uploaded to our repository. Use the command :

```
git commit -m "some_message"
```

"some_message" in the above command can be any simple message like "my first commit" or "edit in readme", etc.

### 7 Creating a repository on GitHub

Create a repository on GitHub. Notice that the name of the repository should be the same as the repository's on the local system. In this case, it will be "Mytest". To do this login to your account on <https://github.com>. Then click on the "plus(+)" symbol at the top right corner of the page and select "create new repository". Fill the details as shown in the image below and click on "create repository" button.

[![Creating a repository on GitHub][5]][6]

Once this is created, we can push the contents of the local repository onto the GitHub repository in your profile. Connect to the repository on GitHub using the command:

Important Note: Make sure you replace 'user_name' and 'Mytest' in the path with your Github username and folder before running the command!

```
git remote add origin <https://github.com/user\_name/Mytest.git>
```

### 8 Pushing files in local repository to GitHub repository

The final step is to push the local repository contents into the remote host repository (GitHub), by using the command:

```
git push origin master
```

Enter the login credentials [user_name and password].

The following image shows the procedure from step 5 to step 8

[![Pushing files in local repository to GitHub repository][7]][8]

So this adds all the contents of the 'Mytest' folder (my local repository) to GitHub. For subsequent projects or for creating repositories, you can start off with step 3 directly. Finally, if you log in to your GitHub account and click on your Mytest repository, you can see that the 2 files README and sample.c have been uploaded and are visible to all as shown in the following image.

[![Content uploaded to Github][9]][10]


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/install-git-and-github-on-ubuntu/

作者：[Akshay Pai][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/
[1]:https://github.com/
[2]:https://www.howtoforge.com/cdn-cgi/l/email-protection
[3]:https://www.howtoforge.com/images/ubuntu_github_getting_started/config.png
[4]:https://www.howtoforge.com/images/ubuntu_github_getting_started/big/config.png
[5]:https://www.howtoforge.com/images/ubuntu_github_getting_started/details.png
[6]:https://www.howtoforge.com/images/ubuntu_github_getting_started/big/details.png
[7]:https://www.howtoforge.com/images/ubuntu_github_getting_started/steps.png
[8]:https://www.howtoforge.com/images/ubuntu_github_getting_started/big/steps.png
[9]:https://www.howtoforge.com/images/ubuntu_github_getting_started/final.png
[10]:https://www.howtoforge.com/images/ubuntu_github_getting_started/big/final.png
