翻译中 zhousiyu325

Maintaining a Git Repository
============================================================

Maintenance of your Git repository typically involves reducing a repository's size.  If you imported from another version control system, you may need to clean up unnecessary files after the import.  This page focuses on removing large files from a Git repo and contains the following topics:

*   [Understanding file removal from Git history][1]

*   [Using the BFG to rewrite history][2]

*   [Alternatively, using git filter-branch to rewrite history][3]

*   [Garbage collecting dead data][4]

Be very careful...

The procedure and tools on this page use advanced techniques that involve destructive operations.  Make sure you read carefully and **backup your repository** before starting. The easiest way to create a backup is to clone your repository using the [--mirror][5] flag, and zip the whole clone. With the backup, if you accidentally corrupt a key element of your repo during maintenance, you can recover.

Keep in mind that maintenance can be disruptive to repository users. It is a good idea to communicate repository maintenance with your team or repository followers. Make sure everyone has checked in their code and have agreed to cease development during maintenance.

### Understanding file removal from Git history

Recall that cloning a repository clones the entire history — including every version of every source code file.  If a user commits a huge file, such as a JAR, every clone thereafter includes this file. Even if a user ends up removing the file from the project with a subsequent commit, the file still exists in the repository history.  To remove this file from your repository you must:

*   remove the file from your project's  _current_  file-tree

*   remove the file from repository history -  _rewriting_  Git history, deleting the file from **all** commits containing it

*   remove all [reflog][6] history that refers to the  _old_  commit history

*   repack the repository, garbage-collecting the now-unused data using [git gc][7]

Git 'gc' (garbage collection) will remove all data from the repository that is not actually used, or in some way referenced, by any of your branches or tags. In order for that to be useful, we need to rewrite all Git repository history that contained the unwanted file, so that it no longer references it - git gc will then be able to discard the now-unused data.

Rewriting repository history is a tricky business, because every commit depends on it's parents, so any small change will change the commit id of every subsequent commit. There are two automated tools for doing this:

1.  [the BFG Repo Cleaner][8] - fast, simple, easy to use. Require Java 6 or above.

2.  [git filter-branch][9] - powerful, tricky to configure, slow on big repositories. Part of the core Git suite.

Remember, after you rewrite the history, whether you use the BFG or filter-branch, you will need to remove `reflog` entries that point to old history, and finally run the garbage collector to purge the old data. 

### Using the BFG to rewrite history

[The BFG][11] is specifically designed for removing unwanted data like big files or passwords from Git repos, so it has a simple flag that will remove any large historical (not-in-your-current-commit) files: '--strip-blobs-bigger-than'


```
$ java -jar bfg.jar --strip-blobs-bigger-than 100M
```

Any files over 100MB in size (that aren't in your  _latest_  commit - because [your latest content is protected][12] by the BFG) will be removed from your Git repository's history. If you'd like to specify files by name, you can do that too:


```
$ java -jar bfg.jar --delete-files *.mp4
```

The BFG is [10-1000x][13] faster than git filter-branch, and generally much easier to use - check the full [usage instructions][14] and [examples][15] for more details.

### Alternatively, using git filter-branch to rewrite history

The `filter-branch` command rewrites a Git repo's revision history, just like the BFG, but the process is slower and more manual. If you don't know  _where_  the big file is, your first step will be to find it:

### Manually reviewing large files in your repository

[Antony Stubbs][16] has written a BASH script that does this very well. The script examines the contents of your packfile and lists out the large files.  Before you begin removing files, do the following to obtain and install this script:

1.  [Download the script][10] to your local system.

2.  Put it in a well known location accessible to your Git repository.

3.  Make the script an  executable:

    
    ```
    $ chmod 777 git_find_big.sh
    ```

4.  Clone the repository to your local system.

5.  Change directory to your repository root.

6.  Run the Git garbage collector manually.

    
    ```
    git gc --auto
    ```

7.  Find out the size of the .git folder.

    
    ```
    $ du -hs .git/objects
    ```
    
    ```
    45M .git/objects
    ```

    Note this size down for later reference.

8.  List the big files in your repo by running the `git_find_big.sh` script.

    
    ```
    $ git_find_big.sh 
    ```
    
    ```
    All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file.
    ```
    
    ```
    size  pack  SHA                                       location
    ```
    
    ```
    592   580   e3117f48bc305dd1f5ae0df3419a0ce2d9617336  media/img/emojis.jar
    ```
    
    ```
    550   169   b594a7f59ba7ba9daebb20447a87ea4357874f43  media/js/aui/aui-dependencies.jar
    ```
    
    ```
    518   514   22f7f9a84905aaec019dae9ea1279a9450277130  media/images/screenshots/issue-tracker-wiki.jar
    ```
    
    ```
    337   92    1fd8ac97c9fecf74ba6246eacef8288e89b4bff5  media/js/lib/bundle.js
    ```
    
    ```
    240   239   e0c26d9959bd583e5ef32b6206fc8abe5fea8624  media/img/featuretour/heroshot.png
    ```

    The big files are all JAR files.  The pack size column is the most relevant.  The `aui-dependencies.jar` compacts to 169KB  but the `emojis.jar` compacts only to 580\.  The `emojis.jar` is a candidate for removal.

### Running filter-branch

You can pass this command a filter for rewriting the Git index.  For example, a filter can remove a file from every indexed commit.  The syntax for this is the following:

`git filter-branch --index-filter 'git rm --cached --ignore-unmatch  _pathname_ ' commitHASH`

The `--index-filter` option modifies a repo's staging (or index). The `--cached` option removes a file from the index not the disk.  This is faster as you don't have to checkout each revision before running the filter.  The -`-ignore-unmatch` option in `git rm` prevents the command from failing if the  _pathname_  it is trying to remove isn't there.  By specifying a commit HASH, you remove the `pathname` from every commit starting with the HASH on up.  To remove from the start, leave this off or you can specify HEAD.  

If all your large files are in different branches, you'll need to delete each file by name. If all the files are within a single branch,  you can delete the branch itself.

### Option 1: Delete files by name

Use the following procedure to remove large files:

1.  Run the following command to remove the first large file you identified:

    
    ```
    git filter-branch --index-filter 'git rm --cached --ignore-unmatch filename' HEAD
    ```

2.  Repeat Step 1 for each remaining large file.

3.  Update the references in your repository. `filter-branch` creates backups of your original refs namespaced under `refs/original/`. Once you're confident that you deleted the correct files, you can run the following command to delete the backed up refs, allowing the large objects to be garbage collected:

    
    ```
    $ git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
    ```

### Option 2: Delete just the branch

If all your large files are on a single branch,  you can just delete the branch. Deleting the branch automatically removes all the references.

1.  Delete the branch.

    
    ```
    $ git branch -D PROJ567bugfix
    ```

2.  Prune all of the reflog references from the branch on back.

    
    ```
    $ git reflog expire --expire=now PROJ567bugfix
    ```

### Garbage collecting dead data

1.  Prune all of the reflog references from now on back (unless you're explicitly only operating on one branch).

    
    ```
    $ git reflog expire --expire=now --all
    ```

2.  Repack the repository by running the garbage collector and pruning old objects.

    
    ```
    $ git gc --prune=now
    ```

3.  Push all your changes back to the Bitbucket repository.

    
    ```
    $ git push --all --force
    ```

4.  Make sure all your tags are current too:

    
    ```
    $ git push --tags --force
    ```

--------------------------------------------------------------------------------

via: https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html

作者：[atlassian.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html
[1]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html#MaintainingaGitRepository-UnderstandingfileremovalfromGithistory
[2]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html#MaintainingaGitRepository-UsingtheBFGtorewritehistory
[3]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html#MaintainingaGitRepository-Alternatively,usinggitfilter-branchtorewritehistory
[4]:https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html#MaintainingaGitRepository-Garbagecollectingdeaddata
[5]:http://stackoverflow.com/questions/3959924/whats-the-difference-between-git-clone-mirror-and-git-clone-bare
[6]:http://git-scm.com/docs/git-reflog
[7]:http://git-scm.com/docs/git-gc
[8]:http://rtyley.github.io/bfg-repo-cleaner/
[9]:http://git-scm.com/docs/git-filter-branch
[10]:https://confluence.atlassian.com/bitbucket/files/321848291/321979854/1/1360604134990/git_find_big.sh
[11]:http://rtyley.github.io/bfg-repo-cleaner/
[12]:http://rtyley.github.io/bfg-repo-cleaner/#protected-commits
[13]:https://www.youtube.com/watch?v=Ir4IHzPhJuI
[14]:http://rtyley.github.io/bfg-repo-cleaner/#usage
[15]:http://rtyley.github.io/bfg-repo-cleaner/#examples
[16]:https://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/
