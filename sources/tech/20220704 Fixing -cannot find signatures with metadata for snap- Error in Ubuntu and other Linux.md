[#]: subject: "Fixing “cannot find signatures with metadata for snap” Error in Ubuntu and other Linux"
[#]: via: "https://itsfoss.com/snap-metadata-signature-error/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing “cannot find signatures with metadata for snap” Error in Ubuntu and other Linux
======

The other day I was trying to install [massCode][1] application. For installation, it provided a Snap file to download.

When I tried to install the application from Snap file

```
sudo snap install snap_file
```

It gave me the following error:

**error: cannot find signatures with metadata for snap “masscode_2.6.1_amd64.snap”**

![cannot find signature with metadata for snap][2]

That was strange. While [adding external repositories in Ubuntu][3], you have to add the GPG key. But no such things were provided by the developer here.

The ‘fix’ is easy and simple. Let me explain it to you.

### Handling “cannot find signatures with metadata for snap” error

There are no signatures involved here.

What happens is that you have downloaded a Snap installer file from a third party. The snap mechanism in Ubuntu expects you to get the snap packages from the official snap store.

Since it doesn’t come from the snap store, you see the ‘cannot find signatures with metadata for snap’ error message. The error message is not descriptive, like most error messages.

So, what’s the solution here?

Any snap package that is not distributed through the Snap store has to be installed with the**–dangerous flag**. That’s the rule.

```
sudo snap install --dangerous path_to_snap_file
```

This way, you tell the snap package manager to explicitly install the snap package.

Here, I used this flag and was able to install massCode from its snap package successfully.

![installing third party snap packages][4]

How ‘dangerous’ is it to install snap packages this way? Almost the same as downloading and [installing packages in deb format][5].

In my opinion, if you are downloading the snap package from the project developer’s website, you are already entrusting the project. In such cases, you can install it with the –dangerous flag.

Of course, you should first search if the package is available in the snap store or not:

```
snap find package_name
```

I hope this quick little tip helped you fix the Snap error. If you have questions or suggestions please let me know. If you want to learn more, see [this guide on using Snap commands][6].

--------------------------------------------------------------------------------

via: https://itsfoss.com/snap-metadata-signature-error/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://masscode.io/
[2]: https://itsfoss.com/wp-content/uploads/2022/07/cannot-find-signature-with-metadata-for-snap-800x205.png
[3]: https://itsfoss.com/adding-external-repositories-ubuntu/
[4]: https://itsfoss.com/wp-content/uploads/2022/07/installing-third-party-snap-packages-800x358.png
[5]: https://itsfoss.com/install-deb-files-ubuntu/
[6]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
