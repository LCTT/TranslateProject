translating by liuxinyu123    

Complete “Beginners to PRO” guide for GIT commands
======
In our [**earlier tutorial,**][1] we have learned to install git on our machines. In this tutorial, we will discuss  how we can use git i.e. various commands that are used with git. So let's start,In our earlier tutorial, we have learned to install git on our machines. In this tutorial, we will discuss  how we can use git i.e. various commands that are used with git. So let's start,

( **Recommended Read** : [**How to install GIT on Linux (Ubuntu & CentOS)**][1] )

### Setting user information

This should the first step after installing git. We will add user information (user name & email), so that the when we commit the code, commit messages will be generated with the user information which makes it easier to keep track of the commit progress. To add user information about user, command is 'git config'

 **$ git config - - global user.name "Daniel"**

 **$ git config - - global user.email "dan.mike@xyz.com"**

After adding the information, we will now check if the information has been updated successfully by running,

 **$ git config - - list**

& we should see our user information as the output.

( **Also Read** : [**Scheduling important jobs with CRONTAB**][3] )

### GIT Commands

#### Create a new repository

To create a new repository, run

 **$ git init**


#### Search a repository

To search a repository, command is

 **$ git grep "repository"**


#### Connect to a remote repository

To connect to a remote repository, run

 **$ git remote add origin remote_server**

Then to check all the configured remote server,

 **$ git remote -v**


#### Clone a repository

To clone a repository from a local server, run the following commands

 **$ git clone repository_path**

If we want to clone a repository locate at remote server, then the command to clone the repository is,

 **$ git clone[[email protected]][2] :/repository_path**


#### List Branches in repository

To check list all the available & the current working branch, execute

 **$ git branch**


#### Create new branch

To create & use a new branch, command is

 **$ git checkout -b 'branchname'**


#### Deleting a branch

To delete a branch, execute

 **$ git branch -d 'branchname'**

To delete a branch on remote repository, execute

 **$ git push origin : 'branchname'**


#### Switch to another branch

To switch to another branch from current branch, use

 **$ git checkout 'branchname'**


#### Adding files

To add a file to the repo, run

 **$ git add filename**


#### Status of files

To check status of files (files that are to be commited or are to added), run

 **$ git status**


#### Commit the changes

After we have added a file or made changes to one, we will commit the code by running,

 **$ git commit -a**

To commit changes to head and not to remote repository, command is

 **$ git commit -m "message"**


#### Push changes

To push changes made to the master branch of the repository, run

 **$ git push origin master**


#### Push branch to repository

To push the changes made on a single branch to remote repository, run

 **$ git push origin 'branchname'**

To push all branches to remote repository, run

 **$ git push -all origin**


#### Merge two branches

To merge another branch into the current active branch, use

 **$ git merge 'branchname'**


#### Merge from remote to local server

To download/pull changes to working directory on local server from remote server, run

 **$ git pull**


#### Checking merge conflicts

To view merge conflicts against base file, run

 **$ git diff -base 'filename'**

To see all the conflicts, run

 **$ git diff**

If we want to preview all the changes before merging, execute

 **$ git diff 'source-branch' 'target-branch'**


#### Creating tags

To create tags to mark any significant changes, run

 **$ git tag 'tag number' 'commit id'**

We can find commit id by running,

 **$ git log**


#### Push tags

To push all the created tags to remote server, run

 **$ git push -tags origin**


#### Revert changes made

If we want to replace changes made on current working tree with the last changes in head, run

 **$ git checkout -'filename'**

We can also fetch the latest history from remote server & point it local repository's master branch, rather than dropping  all local changes made. To do this, run

 **$ git fetch origin**

 **$ git reset -hard master**

That's it guys, these are the commands that we can use with git server. We will be back soon with more interesting tutorials. If you wish that we write a tutorial on a specific topic, please let us know via comment box below. As usual, your comments & suggestions are always welcome.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/beginners-to-pro-guide-for-git-commands/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1] http://linuxtechlab.com/install-git-linux-ubuntu-centos/
[2] /cdn-cgi/l/email-protection
[3] http://linuxtechlab.com/scheduling-important-jobs-crontab/
[4] https://www.facebook.com/linuxtechlab/
[5] https://twitter.com/LinuxTechLab
[6] https://plus.google.com/+linuxtechlab
[7] http://linuxtechlab.com/contact-us-2/
