Linux FAQs with Answers--How to fix “tar: Exiting with failure status due to previous errors”
================================================================================
> **Question**: When I try to create an archive using tar command, it fails in the middle, and throws an error saying: "tar: Exiting with failure status due to previous errors." What causes this error, and how can I solve this error? 

![](https://farm9.staticflickr.com/8863/17631029953_1140fe2dd3_b.jpg)

If you encounter the following error while running tar command, the most likely reason is that you do not have read permission on one of the files you are trying to archive with tar.

    tar: Exiting with failure status due to previous errors

Then how can we pin down the file(s) causing the errors, or identify any other cause?

The tar command should actually print out what those "previous errors" are, but you can easily miss printed error messages if you run tar in verbose mode (e.g., -cvf). To catch error messages more easily, you can filter out tar's stdout messages as follows.

    $ tar cvzfz backup.tgz my_program/ > /dev/null

You will then see only error messages sent by tar to stderr.

    tar: my_program/src/lib/.conf.db.~lock~: Cannot open: Permission denied
    tar: Exiting with failure status due to previous errors

As you can see in the above example, the cause for the errors is indeed "denied read permission."

To solve the problem, simply adjust the permission of the problematic file (or remove it), and re-run tar.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/tar-exiting-with-failure-status-due-to-previous-errors.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni