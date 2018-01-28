# translated by cyleft
# translated by cyleft
# translated by cyleft

A step-by-step guide to Git
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lightbulb-idea-think-yearbook-lead.png?itok=5ZpCm0Jh)

If you've never used [Git][1], you may be nervous about it. There's nothing to worry about--just follow along with this step-by-step getting-started guide, and you will soon have a new Git repository hosted on [GitHub][2].

Before we dive in, let's clear up a common misconception: Git isn't the same thing as GitHub. Git is a version-control system (i.e., a piece of software) that helps you keep track of your computer programs and files and the changes that are made to them over time. It also allows you to collaborate with your peers on a program, code, or file. GitHub and similar services (including GitLab and BitBucket) are websites that host a Git server program to hold your code.

### Step 1: Create a GitHub account

The easiest way to get started is to create an account on [GitHub.com][3] (it's free).

![](https://opensource.com/sites/default/files/u128651/git_guide1.png)

Pick a username (e.g., octocat123), enter your email address and a password, and click **Sign up for GitHub**. Once you are in, it will look something like this:

![](https://opensource.com/sites/default/files/u128651/git_guide2.png)

### Step 2: Create a new repository

A repository is like a place or a container where something is stored; in this case we're creating a Git repository to store code. To create a new repository, select **New Repository** from the `+` sign dropdown menu (you can see I've selected it in the upper-right corner in the image above).

![](https://opensource.com/sites/default/files/u128651/git_guide3.png)

Enter a name for your repository (e.g, "Demo") and click **Create Repository**. Don't worry about changing any other options on this page.

Congratulations! You have set up your first repo on GitHub.com.

### Step 3: Create a file

Once your repo is created, it will look like this:

![](https://opensource.com/sites/default/files/u128651/git_guide4.png)

Don't panic, it's simpler than it looks. Stay with me. Look at the section that starts "...or create a new repository on the command line," and ignore the rest for now.

Open the Terminal program on your computer.

![](https://opensource.com/sites/default/files/u128651/git_guide5.png)

Type `git` and hit **Enter**. If it says command `bash: git: command not found`, then [install Git][4] with the command for your Linux operating system or distribution. Check the installation by typing `git` and hitting **Enter** ; if it's installed, you should see a bunch of information about how you can use the command.

In the terminal, type:
```
mkdir Demo
```

This command will create a directory (or folder) named Demo.

Change your terminal to the Demo directory with the command:
```
cd Demo
```

Then enter:
```
echo "#Demo" >> README.md
```

This creates a file named `README.md` and writes `#Demo` in it. To check that the file was created successfully, enter:
```
cat README.md
```

This will show you what is inside the `README.md` file, if the file was created correctly. Your terminal will look like this:

![](https://opensource.com/sites/default/files/u128651/git_guide7.png)

To tell your computer that Demo is a directory managed by the Git program, enter:
```
git init
```

Then, to tell the Git program you care about this file and want to track any changes from this point forward, enter:
```
git add README.md
```

### Step 4: Make a commit

So far you've created a file and told Git about it, and now it's time to create a commit. Commit can be thought of as a milestone. Every time you accomplish some work, you can write a Git commit to store that version of your file, so you can go back later and see what it looked like at that point in time. Whenever you make a change to your file, you create a new version of that file, different from the previous one.

To make a commit, enter:
```
git commit -m "first commit"
```

That's it! You just created a Git commit and included a message that says first commit. You must always write a message in commit; it not only helps you identify a commit, but it also enables you to understand what you did with the file at that point. So tomorrow, if you add a new piece of code in your file, you can write a commit message that says, Added new code, and when you come back in a month to look at your commit history or Git log (the list of commits), you will know what you changed in the files.

### Step 5: Connect your GitHub repo with your computer

Now, it's time to connect your computer to GitHub with the command:
```
git remote add origin https://github.com/<your_username>/Demo.git
```

Let's look at this command step by step. We are telling Git to add a `remote` called `origin` with the address `https://github.com/<your_username>/Demo.git` (i.e., the URL of your Git repo on GitHub.com). This allows you to interact with your Git repository on GitHub.com by typing `origin` instead of the full URL and Git will know where to send your code. Why `origin`? Well, you can name it anything else if you'd like.

Now we have connected our local copy of the Demo repository to its remote counterpart on GitHub.com. Your terminal looks like this:

![](https://opensource.com/sites/default/files/u128651/git_guide8.png)

Now that we have added the remote, we can push our code (i.e., upload our `README.md` file) to GitHub.com.

Once you are done, your terminal will look like this:

![](https://opensource.com/sites/default/files/u128651/git_guide9.png)

And if you go to `https://github.com/<your_username>/Demo` you will see something like this:

![](https://opensource.com/sites/default/files/u128651/git_guide10.png)

That's it! You have created your first GitHub repo, connected it to your computer, and pushed (or uploaded) a file from your computer to your repository called Demo on GitHub.com. Next time, I will write about Git cloning (downloading your code from GitHub to your computer), adding new files, modifying existing files, and pushing (uploading) files to GitHub.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/step-step-guide-git

作者：[Kedar Vijay Kulkarni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kkulkarn
[1]:https://opensource.com/resources/what-is-git
[2]:https://opensource.com/life/15/11/short-introduction-github
[3]:https://github.com/
[4]:https://www.linuxbabe.com/linux-server/install-git-verion-control-on-linux-debianubuntufedoraarchlinux#crt-2
