[#]: collector: (lujun9972)
[#]: translator: (furrybear)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create a pull request in GitHub)
[#]: via: (https://opensource.com/article/19/7/create-pull-request-github)
[#]: author: (Kedar Vijay Kulkarni https://opensource.com/users/kkulkarnhttps://opensource.com/users/fontanahttps://opensource.com/users/mhanwellhttps://opensource.com/users/mysentimentshttps://opensource.com/users/greg-p)

如何在Github上创建一个拉取请求
======
Learn how to fork a repo, make changes, and ask the maintainers to
review and merge it.
![a checklist for a team][1]

So, you know how to use git. You have a [GitHub][2] repo and can push to it. All is well. But how the heck do you contribute to other people's GitHub projects? That is what I wanted to know after I learned git and GitHub. In this article, I will explain how to fork a git repo, make changes, and submit a pull request.

When you want to work on a GitHub project, the first step is to fork a repo.

![Forking a GitHub repo][3]

Use [my demo repo][4] to try it out.

Once there, click on the **Fork** button in the top-right corner. This creates a new copy of my demo repo under your GitHub user account with a URL like:


```
`https://github.com/<YourUserName>/demo`
```

The copy includes all the code, branches, and commits from the original repo.

Next, clone the repo by opening the terminal on your computer and running the command:


```
`git clone https://github.com/<YourUserName>/demo`
```

Once the repo is cloned, you need to do two things:

  1. Create a new branch by issuing the command:


```
`git checkout -b new_branch`
```

  2. Create a new remote for the upstream repo with the command:


```
`git remote add upstream https://github.com/kedark3/demo`
```




In this case, "upstream repo" refers to the original repo you created your fork from.

Now you can make changes to the code. The following code creates a new branch, makes an arbitrary change, and pushes it to **new_branch**:


```
$ git checkout -b new_branch
Switched to a new branch ‘new_branch’
$ echo “some test file” &gt; test
$ cat test
Some test file
$ git status
On branch new_branch
No commits yet
Untracked files:
  (use "git add &lt;file&gt;..." to include in what will be committed)
    test
nothing added to commit but untracked files present (use "git add" to track)
$ git add test
$ git commit -S -m "Adding a test file to new_branch"
[new_branch (root-commit) 4265ec8] Adding a test file to new_branch
 1 file changed, 1 insertion(+)
 create mode 100644 test
$ git push -u origin new_branch
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 918 bytes | 918.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
Remote: Create a pull request for ‘new_branch’ on GitHub by visiting:
Remote:   <http://github.com/example/Demo/pull/new/new\_branch>
Remote:
 * [new branch]         new_branch -&gt; new_branch
```

Once you push the changes to your repo, the **Compare &amp; pull request** button will appear in GitHub.

![GitHub's Compare & Pull Request button][5]

Click it and you'll be taken to this screen:

![GitHub's Open pull request button][6]

Open a pull request by clicking the **Create pull request** button. This allows the repo's maintainers to review your contribution. From here, they can merge it if it is good, or they may ask you to make some changes.

### TLDR

In summary, if you want to contribute to a project, the simplest way is to:

  1. Find a project you want to contribute to
  2. Fork it
  3. Clone it to your local system
  4. Make a new branch
  5. Make your changes
  6. Push it back to your repo
  7. Click the **Compare &amp; pull request** button
  8. Click **Create pull request** to open a new pull request



If the reviewers ask for changes, repeat steps 5 and 6 to add more commits to your pull request.

Happy coding!

In a previous article , I discussed the complaints that have been leveled against GitHub during the...

Arfon Smith works at GitHub and is involved in a number of activities at the intersection of open...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/create-pull-request-github

作者：[Kedar Vijay Kulkarni][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kkulkarnhttps://opensource.com/users/fontanahttps://opensource.com/users/mhanwellhttps://opensource.com/users/mysentimentshttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://github.com/
[3]: https://opensource.com/sites/default/files/uploads/forkrepo.png (Forking a GitHub repo)
[4]: https://github.com/kedark3/demo
[5]: https://opensource.com/sites/default/files/uploads/compare-and-pull-request-button.png (GitHub's Compare & Pull Request button)
[6]: https://opensource.com/sites/default/files/uploads/open-a-pull-request_crop.png (GitHub's Open pull request button)
