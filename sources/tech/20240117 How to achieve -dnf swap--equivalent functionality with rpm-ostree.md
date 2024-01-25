[#]: subject: "How to achieve “dnf swap”-equivalent functionality with rpm-ostree"
[#]: via: "https://fedoramagazine.org/how-to-achieve-dnf-swap-equivalent-functionality-with-rpm-ostree/"
[#]: author: "Mateus Rodrigues Costa https://fedoramagazine.org/author/mateusrodcosta/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to achieve “dnf swap”-equivalent functionality with rpm-ostree
======

![][1]

Photo by [Visax][2] on [Unsplash][3]

If you are running one of the standard variants of Fedora Linux, such as Fedora Workstation or one of the other non-ostree variants, you might have used the _dnf swap_ command at some point to replace one package with another one. This article will describe a technique for performing a similar operation on an [ostree][4] installation using the rpm-ostree command.

The _dnf swap_ command prevents conflicts when two packages contain files with the same name and filesystem path. It is necessary when other system packages depend on a package that you want to replace (“swap out”) with an alternative version, but completely uninstalling the dependent packages and then reinstalling everything with the alternative isn’t practical.

However, that doesn’t work very well with Fedora Silverblue and the ostree variants. They do not have a _rpm-ostree swap_ command. Luckly, there is a way to achieve similar functionality. We just need to uninstall the old package and install the new package in the same transaction!

### Use rpm-ostree to replace packages in the base image

The most common scenario, especially when not overlaying many packages or none at all, is to replace packages in the base image.

A good example of this is replacing nano-default-editor, which was [made the default in Fedora Linux 33][5], with vim-default-editor. Some users would prefer using vim, but _dnf swap nano-default-editor vim-default-editor_ won’t work on ostree-based systems.

If using _dnf_ , when trying to install _vim-default-editor_ , you will most likely hit dependency conflicts and the transaction will fail. The output below is what you would get and it effectively means that both _nano-default-editor_ and _vim-default-editor_ provide _system-default-editor_ , but only one provider of _system-default-editor_ can be installed at once. (vim-default-editor _or_ nano-default-editor can be installed, but both cannot be installed at the same time.)

```

    $ sudo dnf install vim-default-editor
    ...
    Error:
     Problem: problem with installed package nano-default-editor-7.2-4.fc39.noarch
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.1927-1.fc39.noarch from fedora
      - package vim-default-editor-2:9.0.1927-1.fc39.noarch from fedora conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from fedora conflicts with system-default-editor provided by vim-default-editor-2:9.0.1927-1.fc39.noarch from fedora
      - package vim-default-editor-2:9.0.1927-1.fc39.noarch from fedora conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from fedora
      - conflicting requests
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.1.016-1.fc39.noarch from updates
      - package vim-default-editor-2:9.1.016-1.fc39.noarch from updates conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from fedora conflicts with system-default-editor provided by vim-default-editor-2:9.1.016-1.fc39.noarch from updates
      - package vim-default-editor-2:9.1.016-1.fc39.noarch from updates conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from fedora
    (try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)

```

If you attempt the same on rpm-ostree, a similar error message appears, effectively having the same meaning.

```

    $ rpm-ostree install vim-default-editor
    ...
    Resolving dependencies... done
    error: Could not depsolve transaction; 1 problem detected:
     Problem: conflicting requests
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.1.016-1.fc39.noarch from updates
      - package vim-default-editor-2:9.1.016-1.fc39.noarch from updates conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.1927-1.fc39.noarch from fedora
      - package vim-default-editor-2:9.0.1927-1.fc39.noarch from fedora conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.2048-1.fc39.noarch from updates-archive
      - package vim-default-editor-2:9.0.2048-1.fc39.noarch from updates-archive conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.2081-1.fc39.noarch from updates-archive
      - package vim-default-editor-2:9.0.2081-1.fc39.noarch from updates-archive conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.2105-1.fc39.noarch from updates-archive
      - package vim-default-editor-2:9.0.2105-1.fc39.noarch from updates-archive conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.2120-1.fc39.noarch from updates-archive
      - package vim-default-editor-2:9.0.2120-1.fc39.noarch from updates-archive conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.2153-1.fc39.noarch from updates-archive
      - package vim-default-editor-2:9.0.2153-1.fc39.noarch from updates-archive conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.2167-1.fc39.noarch from updates-archive
      - package vim-default-editor-2:9.0.2167-1.fc39.noarch from updates-archive conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.0.2190-1.fc39.noarch from updates-archive
      - package vim-default-editor-2:9.0.2190-1.fc39.noarch from updates-archive conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System
      - package nano-default-editor-7.2-4.fc39.noarch from @System conflicts with system-default-editor provided by vim-default-editor-2:9.1.016-1.fc39.noarch from updates-archive
      - package vim-default-editor-2:9.1.016-1.fc39.noarch from updates-archive conflicts with system-default-editor provided by nano-default-editor-7.2-4.fc39.noarch from @System

```

So, for this to work, we have to look into removing _nano-default-editor_ first. In this scenario we have to look into _rpm-ostree override remove_ , which allows us to remove packages from the base image. But, if we simply try to remove _nano-default-editor_ , it will fail saying _default-editor_ needs a package that provides _system-default-editor_. In other words, if we want to remove nano-default-editor we need to install vim-default-editor or another package that provides _system-default-editor_. Another possibility is removing _default-editor_ completely and losing this functionality:

```

    $ rpm-ostree override remove nano-default-editor
    ...
    Resolving dependencies... done
    error: Could not depsolve transaction; 1 problem detected:
     Problem: package default-editor-7.2-4.fc39.noarch from @System requires system-default-editor, but none of the providers can be installed
      - conflicting requests

```

Thankfully, the _rpm-ostree override remove_ command accepts an extra _‐‐install_ argument which allows us to also install a package along with the removal! So, if we add vim-default-editor as well, we get:

```

    $ rpm-ostree override remove nano-default-editor --install vim-default-editor
    <snip>
    Resolving dependencies... done
    Will download: 6 packages (10,0 MB)
    Downloading from 'fedora'... done
    Downloading from 'updates'... done
    Importing packages... done
    Applying 1 override and 6 overlays
    Processing packages... done
    Running pre scripts... done
    Running post scripts... done
    Running posttrans scripts... done
    Writing rpmdb... done
    Writing OSTree commit... done
    Staging deployment... done
    Freed: 213,9 MB (pkgcache branches: 0)
    Removed:
      nano-default-editor-7.2-4.fc39.noarch
    Added:
      gpm-libs-1.20.7-44.fc39.x86_64
      vim-common-2:9.0.2190-1.fc39.x86_64
      vim-default-editor-2:9.0.2190-1.fc39.noarch
      vim-enhanced-2:9.0.2190-1.fc39.x86_64
      vim-filesystem-2:9.0.2190-1.fc39.noarch
      xxd-2:9.0.2190-1.fc39.x86_64
    Use "rpm-ostree override reset" to undo overrides
    Run "systemctl reboot" to start a reboot

```

And now, after a reboot, vim-default-editor should be installed and vim should be the default editor. You can confirm the results with _rpm-ostree status_ :

```

    $ rpm-ostree status
    State: idle
    Deployments:
    ● fedora:fedora/39/x86_64/silverblue
                      Version: 39.20240106.0 (2024-01-06T01:35:56Z)
                   BaseCommit: 2d052ca5e08b07406612e68cbb4ec67e86d733dba5e458234ad65bc5a4ad5b51
                 GPGSignature: Valid signature by E8F23996F23218640CB44CBE75CF5AC418B8E74C
          RemovedBasePackages: nano-default-editor 7.2-4.fc39
              LayeredPackages: vim-default-editor

```

The command to undo such transaction would be _rpm-ostree override reset nano-default-editor ‐‐uninstall vim-default-editor_.

### Replacing overlaid packages

When replacing overlaid packages the process is considerably simpler. There are three commands to consider: _rpm-ostree install_ , _rpm-ostree uninstall_ and _rpm-ostree upgrade_.

_rpm-ostree install_ receives a list of packages to be installed, but also supports a _‐‐uninstall_ parameter to remove packages in the same transaction. _rpm-ostree uninstall_ receives a list of packages to be uninstalled, but also supports a _‐‐install_ parameter to install packages in the same transaction.

_rpm-ostree upgrade_ upgrades the system, but also supports the _‐‐install_ and _‐‐uninstall_ parameters to install or uninstall packages in the same transaction.

Ultimately, for overlaid packages, it’s mostly a choice of whether to also update the system and then choosing the most convenient command.

### Conclusion

While, due to the nature of _rpm-ostree_ , it may not seem that _dnf swap_ -like functionality is achievable, a closer look at its commands shows similar flexibility, even if in different clothing.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-achieve-dnf-swap-equivalent-functionality-with-rpm-ostree/

作者：[Mateus Rodrigues Costa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mateusrodcosta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2024/01/dnf_swap_equivalent-816x345.jpg
[2]: https://unsplash.com/@visaxslr?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/a-silhouette-of-trees-and-a-cloudy-sky-yYw1JK-d8JA?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://ostreedev.github.io/ostree/
[5]: https://fedoramagazine.org/whats-new-fedora-33-workstation/#:~:text=swap%2Don%2Dzram.-,Nano%20by%20default,-Fresh%20Fedora%2033
