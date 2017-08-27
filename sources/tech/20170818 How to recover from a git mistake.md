How to recover from a git mistake
============================================================

### Don't let an error in a git command wipe out days of work.

![How to recover from a git mistake](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bubblehands_fromRHT_520_0612LL.png?itok=_iQ2dO3S "How to recover from a git mistake")
Image by : opensource.com

Today my colleague almost lost everything that he did over four days of work. Because of an incorrect **git **command, he dropped the changes he'd saved on [stash][20]. After this sad episode, we looked for a way to try to recover his work... and we did it!

First a warning: When you are implementing a big feature, split it in small pieces and commit it regularly. It's not a good idea to work for a long time without committing your changes.

Now that we've gotten that out of the way, let's demonstrate how to recover changes accidentally dropped from stash.

My example repository, which has only one source file, **main.c**, looks like this:

### [missing_data_from_stash_01.jpeg][9]

![Repository with one source file](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_01.jpeg "Repository with one source file")

José Guilherme Vanz, [CC BY][1]

It has only one commit, the initial commit:

### [missing_data_from_stash_02.jpeg][10]

![One commit](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_02.jpeg "One commit")

José Guilherme Vanz, [CC BY][2]

The first version of our file is:

### [missing_data_from_stash_03.jpeg][11]

![First version of the file](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_03.jpeg "First version of the file")

José Guilherme Vanz, [CC BY][3]

I'll start to code something. For this example, I do not need to make a big change, just something to put in the stash, so I will just add a new line. The **git-diff** output should be:

### [missing_data_from_stash_04.jpeg][12]

![git-diff output ](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_04.jpeg "git-diff output ")

José Guilherme Vanz, [CC BY][4]

Now, suppose that I want to pull some new changes from a remote repository, but I'm not ready to commit my change. Instead, I decide to stash it, pull the remote repository's changes, then apply my change back to the master. I execute the following command to move my change to stash:

```
git stash
```

Looking into the stash with **git stash list**, I can see my change there:

### [missing_data_from_stash_06.jpeg][13]

![Output of changes in our stash](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_06.jpeg "Output of changes in our stash")

José Guilherme Vanz, [CC BY][5]

My code is in a safe place and the master branch is clean (I can check this with **git status**). Now I just need to pull the remote repository changes, then apply my change on the master, and I should be set.

But I accidentally execute:

```
git stash drop
```

which deletes the stash, instead of:

```
git stash pop
```

which would have applied the stash before dropping it from my stack. If I execute **git stash list** again, I can see I dropped my change from the stash without applying it on the master branch. OMG! Who can help me?

Good news: **git** did not delete the object that contains my change; it just removed the reference to it. To prove this, I use the **git-fsck** command, which verifies the connectivity and validity of the objects in the database. Here's the output after I executed the **git-fsck** command on the repository:

### [missing_data_from_stash_07.jpeg][14]

![Output after executing the git-fsck command on the repository](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_07.jpeg "Output after executing the git-fsck command on the repository")

José Guilherme Vanz, [CC BY][6]

With the **--unreachable **argument, I asked **git-fsck** to show me the objects that are unreachable. As you can see, it showed no unreachable objects. After I dropped the changes on my stash, I executed the same command, and received a different output:

### [missing_data_from_stash_08.jpeg][15]

![Output after dropping changes on stash](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_08.jpeg "Output after dropping changes on stash")

José Guilherme Vanz, [CC BY][7]

Now there are three unreachable objects. But which one is my change? Actually, I don't know. I have to search for it by executing the **git-show** command to see each object.

### [missing_data_from_stash_09.jpeg][16]

![Output after executing the git-show command ](https://opensource.com/sites/default/files/u128651/missing_data_from_stash_09.jpeg "Output after executing the git-show command ")

José Guilherme Vanz, [CC BY][8]

There it is! The ID **95ccbd927ad4cd413ee2a28014c81454f4ede82c** corresponds to my change. Now that I found the missing change, I can recover it! One solution is check out the ID into a new branch or apply the commit directly. If you have the ID of the object with your changes, you can decide the best way to put changes on the master branch again. For this example, I will use **git-stash** to apply the commit on my master branch again.

```
git stash apply 95ccbd927ad4cd413ee2a28014c81454f4ede82c
```

Another important thing to remember is **git** runs its garbage collector periodically. After a **gc** execution, you can no longer see the unreachable objects using **git-fsck**.

 _This article was [originally published][18] on the author's blog and is reprinted with permission. _

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/8/recover-dropped-data-stash

作者：[Jose Guilherme Vanz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jvanz
[1]:https://creativecommons.org/licenses/by/4.0/
[2]:https://creativecommons.org/licenses/by/4.0/
[3]:https://creativecommons.org/licenses/by/4.0/
[4]:https://creativecommons.org/licenses/by/4.0/
[5]:https://creativecommons.org/licenses/by/4.0/
[6]:https://creativecommons.org/licenses/by/4.0/
[7]:https://creativecommons.org/licenses/by/4.0/
[8]:https://creativecommons.org/licenses/by/4.0/
[9]:https://opensource.com/file/366691
[10]:https://opensource.com/file/366696
[11]:https://opensource.com/file/366701
[12]:https://opensource.com/file/366706
[13]:https://opensource.com/file/366711
[14]:https://opensource.com/file/366716
[15]:https://opensource.com/file/366721
[16]:https://opensource.com/file/366726
[17]:https://opensource.com/article/17/8/recover-dropped-data-stash?rate=BUOLRB3pka4kgSQFTTEfX7_HJrX6duyjronp9GABnGU
[18]:http://jvanz.com/recovering-missed-data-from-stash.html#recovering-missed-data-from-stash
[19]:https://opensource.com/user/94726/feed
[20]:https://www.git-scm.com/docs/git-stash
[21]:https://opensource.com/users/jvanz
[22]:https://opensource.com/users/jvanz
[23]:https://opensource.com/article/17/8/recover-dropped-data-stash#comments
