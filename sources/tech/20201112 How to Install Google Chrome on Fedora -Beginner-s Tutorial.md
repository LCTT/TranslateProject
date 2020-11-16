[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Google Chrome on Fedora [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/install-google-chrome-fedora/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Install Google Chrome on Fedora [Beginner’s Tutorial]
======

Fedora comes with Firefox as the default web browser. Despite it being an excellent web browser, you may prefer the popular Google Chrome browser.

If you are wondering how to install Google Chrome on Fedora, let me show you two ways of installing Google Chrome, graphical method and command line method.

  * [GUI method 1: Install Chrome from the software center by enabling Fedora third-party repository][1]
  * [GUI method 2: Download RPM file from Google Chrome’s website][2]
  * [CLI method: Install Chrome from the Fedora third-party repository, everything using commands (same as GUI method 1)][3]



It is up to you which method you prefer. Your Google Chrome on [Fedora][4] will be getting regular updates via the system updates in all the three methods.

### Method 1: Install Google Chrome on Fedora from the Software Center

Fedora provides a third-party repository that contains some popular proprietary software, graphics driver. Google Chrome is one of them.

First step, make sure to enable third-party repositories in Fedora. You should see this option in the software center itself.

![Step1: Fedora Third Party Repositories][5]

Once you have it enabled, simply search for Chrome in the software center:

![Step 2: Search for Chrome In Fedora Software Center][6]

And install it from there:

![Step 3: Install Chrome Fedora][7]

Can it be any easier than this? I don’t think either :)

### Method 2: Installing Google Chrome on Fedora from Chrome website

If you do not want to enable the third-party repository, that’s okay. You don’t have to. You can download the RPM file from Chrome’s website, double-click on it and install it.

Visit Google Chrome’s website and click on the download button.

[Get Google Chrome][8]

![][9]

Then select the .rpm package and click on “Accept and Install”.

![][10]

Once the download is over, double click on the file and click install when prompted at the package manager. Type your password and wait until the process is done.

![][11]

That’s super easy, right? Let’s see somewhat complicated method (if you are not a terminal fan).

### Method 3: Install Chrome on Fedora using command line

Firstly, you need to add extra Fedora repositories (that you saw in method 1):

```
sudo dnf install fedora-workstation-repositories
```

And then enable Google Chrome repository.

```
sudo dnf config-manager --set-enabled google-chrome
```

![][12]

To install the Google Chrome stable release, run the following command at your terminal.

```
sudo dnf install google-chrome-stable
```

You should get a warning for importing the GPG key, enter y to continue.

![][13]

You are adding the Google Chrome repository. The package comes from this repository, directly from Google.

#### Conclusion

Installing Google chrome on Fedora is fairly easy, even if you use the command line. It’s pretty much the [same as installing Chrome on Ubuntu][14] except the third-party repository part.

Now that you have installed it, you may want to [check our list of Google Chrome keyboard shortcuts][15] to use the browser faster.

Don’t forget to subscribe, to get the latest news and tutorials about Fedora, and if you have any questions please leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-google-chrome-fedora/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: tmp.VFVwBw56ac#gui-method-1
[2]: tmp.VFVwBw56ac#gui-method-2
[3]: tmp.VFVwBw56ac#cli-method
[4]: https://getfedora.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/fedora-third-party-repositories.jpg?resize=800%2C400&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/chrome-in-fedora.png?resize=800%2C400&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/installing-chrome-fedora.png?resize=800%2C400&ssl=1
[8]: https://www.google.com/chrome/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/install-google-chrome-ubuntu-1.jpeg?resize=800%2C374&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/3.-download-rpm-chrome.png?resize=800%2C600&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/4.-install-chrome-fedora.png?resize=800%2C550&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/1.-Fedora-extra-repos.png?resize=800%2C550&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/2.-Fedora-GPG-key.png?resize=800%2C550&ssl=1
[14]: https://itsfoss.com/install-chrome-ubuntu/
[15]: https://itsfoss.com/google-chrome-shortcuts/
