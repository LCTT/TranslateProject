How to clone, modify, add, and delete files in Git
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_cat.png?itok=ta54QTAf)

In the [first article in this series][1] on getting started with Git, we created a simple Git repo and added a file to it by connecting it with our computer. In this article, we will learn a handful of other things about Git, namely how to clone (download), modify, add, and delete files in a Git repo.

### Let's make some clones

Say you already have a Git repo on GitHub and you want to get your files from it—maybe you lost the local copy on your computer or you're working on a different computer and want access to the files in your repository. What should you do? Download your files from GitHub? Exactly! We call this "cloning" in Git terminology. (You could also download the repo as a ZIP file, but we'll explore the clone method in this article.)

Let's clone the repo, called Demo, we created in the last article. (If you have not yet created a Demo repo, jump back to that article and do those steps before you proceed here.) To clone your file, just open your browser and navigate to `https://github.com/<your_username>/Demo` (where `<your_username>` is the name of your own repo. For example, my repo is `https://github.com/kedark3/Demo`). Once you navigate to that URL, click the "Clone or download" button, and your browser should look something like this:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide11.png?itok=wJYqZyBX)

As you can see above, the "Clone with HTTPS" option is open. Copy your repo's URL from that dropdown box (`https://github.com/<your_username>/Demo.git`). Open the terminal and type the following command to clone your GitHub repo to your computer:
```
git clone https://github.com/<your_username>/Demo.git

```

Then, to see the list of files in the `Demo` directory, enter the command:
```
ls Demo/

```

Your terminal should look like this:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide12.png?itok=E7ZG9t-8)

### Modify files

Now that we have cloned the repo, let's modify the files and update them on GitHub. To begin, enter the commands below, one by one, to change the directory to `Demo/`, check the contents of `README.md`, echo new (additional) content to `README.md`, and check the status with `git status`:
```
cd Demo/

ls

cat README.md

echo "Added another line to REAMD.md" >> README.md

cat README.md

git status

```

This is how it will look in the terminal if you run these commands one by one:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide12.5.png?itok=jhb-EPH1)

Let's look at the output of `git status` and walk through what it means. Don't worry about the part that says:
```
On branch master

Your branch is up-to-date with 'origin/master'.".

```

because we haven't learned it yet. The next line says: `Changes not staged for commit`; this is telling you that the files listed below it aren't marked ready ("staged") to be committed. If you run `git add`, Git takes those files and marks them as `Ready for commit`; in other (Git) words, `Changes staged for commit`. Before we do that, let's check what we are adding to Git with the `git diff` command, then run `git add`.

Here is your terminal output:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide13.png?itok=983p_vNw)

Let's break this down:

  * `diff --git a/README.md b/README.md` is what Git is comparing (i.e., `README.md` in this example).
  * `--- a/README.md` would show anything removed from the file.
  * `+++ b/README.md` would show anything added to your file.
  * Anything added to the file is printed in green text with a + at the beginning of the line.
  * If we had removed anything, it would be printed in red text with a - sign at the beginning.
  * Git status now says `Changes to be committed:` and lists the filename (i.e., `README.md`) and what happened to that file (i.e., it has been `modified` and is ready to be committed).



Tip: If you have already run `git add`, and now you want to see what's different, the usual `git diff` won't yield anything because you already added the file. Instead, you must use `git diff --cached`. It will show you the difference between the current version and previous version of files that Git was told to add. Your terminal output would look like this:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide14.png?itok=bva9fHJj)

### Upload a file to your repo

We have modified the `README.md` file with some new content and it's time to upload it to GitHub.

Let's commit the changes and push those to GitHub. Run:
```
git commit -m "Updated Readme file"

```

This tells Git that you are "committing" to changes that you have "added" to it. You may recall from the first part of this series that it's important to add a message to explain what you did in your commit so you know its purpose when you look back at your Git log later. (We will look more at this topic in the next article.) `Updated Readme file` is the message for this commit—if you don't think this is the most logical way to explain what you did, feel free to write your commit message differently.

Run `git push -u origin master`. This will prompt you for your username and password, then upload the file to your GitHub repo. Refresh your GitHub page, and you should see the changes you just made to `README.md`.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide15.png?itok=Qa3spy13)

The bottom-right corner of the terminal shows that I committed the changes, checked the Git status, and pushed the changes to GitHub. Git status says:
```
Your branch is ahead of 'origin/master' by 1 commit

  (use "git push" to publish your local commits)

```

The first line indicates there is one commit in the local repo but not present in origin/master (i.e., on GitHub). The next line directs us to push those changes to origin/master, and that is what we did. (To refresh your memory on what "origin" means in this case, refer to the first article in this series. I will explain what "master" means in the next article, when we discuss branching.)

### Add a new file to Git

Now that we have modified a file and updated it on GitHub, let's create a new file, add it to Git, and upload it to GitHub. Run:
```
echo "This is a new file" >> file.txt

```

This will create a new file named `file.txt`.

If you `cat` it out:
```
cat file.txt

```

You should see the contents of the file. Now run:
```
git status

```

Git reports that you have an untracked file (named `file.txt`) in your repository. This is Git's way of telling you that there is a new file in the repo directory on your computer that you haven't told Git about, and Git is not tracking that file for any changes you make.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide16.png?itok=UZpSKL13)

We need to tell Git to track this file so we can commit it and upload it to our repo. Here's the command to do that:
```
git add file.txt

git status

```

Your terminal output is:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide17.png?itok=quV-75Na)

Git status is telling you there are changes to `file.txt` to be committed, and that it is a `new file` to Git, which it was not aware of before this. Now that we have added `file.txt` to Git, we can commit the changes and push it to origin/master.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide18.png?itok=e0D7-eol)

Git has now uploaded this new file to GitHub; if you refresh your GitHub page, you should see the new file, `file.txt`, in your Git repo on GitHub.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide19.png?itok=FcuSsHQ6)

With these steps, you can create as many files as you like, add them to Git, and commit and push them up to GitHub.

### Delete a file from Git

What if we discovered we made an error and need to delete `file.txt` from our repo. One way is to remove the file from our local copy of the repo with this command:
```
rm file.txt

```

If you do `git status` now, Git says there is a file that is `not staged for commit` and it has been `deleted` from the local copy of the repo. If we now run:
```
git add file.txt

git status

```

I know we are deleting the file, but we still run `git add` ** because we need to tell Git about the **change** we are making. `git add` ** can be used when we are adding a new file to Git, modifying contents of an existing file and adding it to Git, or deleting a file from a Git repo. Effectively, `git add` takes all the changes into account and stages those changes for commit. If in doubt, carefully look at output of each command in the terminal screenshot below.

Git will tell us the deleted file is staged for commit. As soon as you commit this change and push it to GitHub, the file will be removed from the repo on GitHub as well. Do this by running:
```
git commit -m "Delete file.txt"

git push -u origin master

```

Now your terminal looks like this:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide20.png?itok=SrJMqNXC)

And your GitHub looks like this:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/git_guide21.png?itok=RhXM4Gua)

Now you know how to clone, add, modify, and delete Git files from your repo. The next article in this series will examine Git branching.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/how-clone-modify-add-delete-git-files

作者：[Kedar Vijay Kulkarni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kkulkarn
[1]:https://opensource.com/article/18/1/step-step-guide-git
