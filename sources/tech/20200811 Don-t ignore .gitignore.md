[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Don't ignore .gitignore)
[#]: via: (https://opensource.com/article/20/8/dont-ignore-gitignore)
[#]: author: (Rajeev Bera https://opensource.com/users/acompiler)

Don't ignore .gitignore
======
Using a .gitignore file is a best practice for improving the quality of
your code and Git repositories.
![Business woman on laptop sitting in front of window][1]

I have noticed that many developers do not use a .gitignore file, even though it's a [best practice][2] to use one to designate files you don't want Git to track in version control. Because .gitignore can boost your code quality, you should not ignore [.gitignore][3] in your repositories.

### What is .gitignore?

Files in your working Git repository can be:

  1. **Untracked:** Changes that have not been staged or committed
  2. **Tracked:** Changes that have been staged or committed
  3. **Ignored:** Files you tell Git to ignore



There are some files you want Git to ignore and not track in your repository. These include many that are auto-generated or platform-specific, as well as other local configuration files such as:

  1. Files with sensitive information
  2. Compiled code, such as `.dll` or `.class`
  3. System files like `.DS_Store` or `Thumbs.db`
  4. Files with temporary information such as logs, caches, etc.
  5. Generated files such as `dist` folders



If you don't want Git to track certain files in your repository, there is no [Git command][4] you can use. (Although you can stop tracking a file with the `git rm` command, such as `git rm --cached`.) Instead, you need to use a .gitignore file, a text file that tells Git which files not to track.

It's easy to create a .gitignore file; just create a text file and name it .gitignore. Remember to add a single dot (`.`) at the beginning of the file name. That's it!

### Rules for writing a .gitignore file

According to the [documentation][3], "each line in a .gitignore file specifies a pattern."

In this context, a "pattern" can refer to a specific filename, or to some part of a filename combined with a wildcard character. In other words, **example.txt** is a valid pattern that matches a file called **example.txt**, while **ex*txt** is a valid pattern that matches a file called **example.txt** as well as a file called **export.txt**.

Here are some basic rules to help you to set up your .gitignore file correctly:

  1. Any line that starts with a hash (`#`) is a comment.
  2. The `\` character escapes special characters.
  3. The `/` character means that the rule applies only to files and folders located in the same folder.
  4. An asterisk (`*`) means any number of characters (zero or more).
  5. Two asterisks (`**`) specify any number of subdirectories.
  6. A question mark (`?`) replaces zero or one character.
  7. An exclamation sign (`!`) designates the inversion rule (i.e., it includes any file that was excluded by a previous pattern).
  8. Blank lines are ignored, so you can use them to add space and make your file easier to read.
  9. Adding `/` on the end ignores entire directory paths.



### Local vs. global .gitignore files

There are two types of .gitignore files:

  * **Local:** Placed in the root of your Git repository, works only on that repository, and must be committed to the repository
  * **Global:** Placed in the root of your home directory, affects every repository you use on your machine, does not need to be committed



Many developers use a local .gitignore file in their project repository, but very few use the global .gitignore file. The most significant advantages of using a global file are that you don't need to commit it to use it and making one change affects all your repositories.

### Advantages of Git ignore

There are other advantages to using a .gitignore file beyond ensuring specific files are not tracked by Git:

  1. It helps you keep your code repository clean by ignoring unwanted files.
  2. It keeps your repository size under control, which is especially helpful if you are working on a big project.
  3. Every commit, push, and pull request you make will be clean.



### Conclusion

Git is powerful, but in the end, it's just another computer program. It's a team effort to use best practices and keep your code repo stable, and part of this is using a .gitignore file.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/dont-ignore-gitignore

作者：[Rajeev Bera][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/acompiler
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/7/git-repos-best-practices
[3]: https://git-scm.com/docs/gitignore
[4]: https://acompiler.com/git-commands/
