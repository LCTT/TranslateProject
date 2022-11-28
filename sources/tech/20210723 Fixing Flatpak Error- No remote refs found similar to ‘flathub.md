[#]: subject: (Fixing Flatpak Error: No remote refs found similar to ‘flathub’)
[#]: via: (https://itsfoss.com/no-remote-ref-found-flatpak/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Fixing Flatpak Error: No remote refs found similar to ‘flathub’
======

So, I just installed Fedora. Installing my favorite applications was among the list of things to do after installing Fedora.

I tried installing VLC in Flatpak form, but it gave me an error:

**error: No remote refs found similar to ‘flathub’**

![No remote refs found error displayed with Flatpak][1]

### Fixing “no remote refs found similar to flathub” error

The fix is rather simple. Add the Flathub repository in the following way:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

It will ask for your password, or you could use the above command with sudo.

Now, if you try to install a Fltapak package from Fltahub, it should work as expected.

![Adding the Flathub repoistory fixes the issue][2]

### Reason why you see this error and how it was fixed

Now that have fixed the error, it would be a good idea to also learn why you saw this error in the first place and how it was fixed.

Like most other package managers in Linux, Flatpak also works on the concept of repositories. In simpler words, you can imagine package repositories as a warehouse where packages are stored.

But in order to retrieve a package from this warehouse, you need to know the address of the warehouse first.

That’s what happens here. You are trying to download (and install) a package from a certain repository (Flathub in this case). But your system doesn’t know about this “flathub”.

In order to solve this issue, you added the Flathub repository. When you do that, your Linux system can look for the package you are trying to install in this repository.

You may see all the remote Flatpak repository added to your system.

![List Flatpak repositories added to your system][3]

Let’s have a deeper look at the command which was used for adding the repository:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

  * flatpak: this is the flatpak CLI tool.
  * remote-add: this option indicates that you are adding a new remote repository.
  * –if-not-exists: this ensures that the remote repository is only added if it is not added already.
  * flathub: this is short reference for the complete URL of the actual repository. You may name it something else but the convention is to use the one provided by the developer.
  * <https://flathub.org/repo/flathub.flatpakrepo>: The actual repository address.



_**So, the bottom line is that when you see Flatpak complaining about ‘no remote refs found similar to xyz’, verify that the said repository is not added and if that’s the case, figure out its URL and add it to the system.**_

I hope this quick tip help you with this Flatpak issue.

--------------------------------------------------------------------------------

via: https://itsfoss.com/no-remote-ref-found-flatpak/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/flatpak-remote-ref-not-found-error-800x265.png?resize=800%2C265&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/flatpak-no-remote-ref-problem-fixed.png?resize=800%2C317&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/flatpak-list-repositories.png?resize=800%2C317&ssl=1
