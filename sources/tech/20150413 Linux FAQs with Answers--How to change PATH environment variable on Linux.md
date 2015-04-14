Translating----geekpi

Linux FAQs with Answers--How to change PATH environment variable on Linux
================================================================================
> **Question**: When I try to run an executable, it complains "command not found." The executable is actually located in /usr/local/bin. How can I add /usr/local/bin to my PATH variable, so that I can run the command without specify the path?

In Linux, PATH environment variable stores a set of directories to search for an executable command when the command is typed by a user. The value of PATH variable is formatted as a series of colon-separated absolute paths. Each user has a user-specific PATH environment variable (initialized with system-wide default PATH variable).

To check the current PATH environment variable of a user, run the following command as the user:

    $ echo $PATH

----------

    /usr/lib64/qt-3.3/bin:/bin:/usr/bin:/usr/sbin:/sbin:/home/xmodulo/bin

Alternatively, run:

    $ env | grep PATH

----------

    PATH=/usr/lib64/qt-3.3/bin:/bin:/usr/bin:/usr/sbin:/sbin:/home/xmodulo/bin

If the command that you type is not found in any of these directories, the shell will throw an error message: "command not found"

If you want to add an additional directory (e.g., /usr/local/bin) to your PATH variable, you can follow these instructions.

### Change PATH Environment Variable for a Particular User Only ###

If you want to temporarily add a new directory (e.g., /usr/local/bin) to a user's default search path in the current login session, you can simply type the following.

    $ PATH=$PATH:/usr/local/bin

Now check if PATH has been updated:

    $ echo $PATH

----------

    /usr/lib64/qt-3.3/bin:/bin:/usr/bin:/usr/sbin:/sbin:/home/xmodulo/bin:/usr/local/bin

The updated PATH will then remain effective in the current login session. The change, however, will be lost in any new terminal session.

If you want to change PATH variable permanently, open ~/.bashrc (or ~/.bash_profile) with a text editor, and append the following line.

    export PATH=$PATH:/usr/local/bin

Then activate the change permanently by running:

    $ source ~/.bashrc (or source ~/.bash_profile)

### Change PATH Environment Variable System-wide ###

If you want to permanently add /usr/local/bin to system-wide default PATH variable, edit /etc/profile as follows.

    $ sudo vi /etc/profile

----------

    export PATH=$PATH:/usr/local/bin

Once you re-login, the updated PATH variable will take effect.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-path-environment-variable-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
