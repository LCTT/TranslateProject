[#]: subject: "Package is “set to manually installed”? What does it Mean?"
[#]: via: "https://itsfoss.com/package-set-manually-installed/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Package is “set to manually installed”? What does it Mean?
======
If you use the apt command to install packages in the terminal, you’ll see all kinds of output.

If you pay attention and read the output, sometimes you’ll notice a message that reads:

**package_name set to manually installed**

Have you ever wondered what this message means and why you don’t see it for all packages? Let me share some details in this explainer.

### Understanding “Package set to manually installed”

You’ll see this message when you try installing an already installed library or development package. This dependency package was installed automatically with another package. The dependency package gets removed with the apt autoremove command if the main package is removed.

But since you tried to install the dependency package explicitly, your Ubuntu system thinks that you need this package independent of the main package. And hence the package is marked as manually installed so that it is not removed automatically.

Not very clear, right? Take the example of [installing VLC on on Ubuntu][1].

Since the main vlc package depends on a number of other packages, those packages are automatically installed with it.

![installing vlc with apt ubuntu][2]

If you check the [list of installed packages][3] that have vlc in their name, you’ll see that except vlc, the rest are marked ‘automatic’. This indicates that these packages were installed automatically (with vlc) and they will be removed automatically with apt autoremove command (when vlc is uninstalled).

![list installed packages vlc ubuntu][4]

Now suppose you thought to install “vlc-plugin-base” for some reason. If you run the apt install command on it, the system tells you that the package is already installed. At the same time, it changes the mark from automatic to manual because the system thinks that you need this vlc-plugin-base explicitly as you tried to manually install it.

![package set manually][5]

You can see that its status has been changed to [installed] from [installed,automatic].

![listing installed packages with vlc][6]

Now, let me remove VLC and run the auoremove command. You can see that “vlc-plugin-base” is not in the list of packages to be removed.

![autoremove vlc ubuntu][7]

Check the list of installed packages again. vlc-plugin-base is still installed on the system.

![listing installed packages after removing vlc][8]

You can see two more vlc-related packages here. These are the dependencies for the vlc-plugin-base package and this is why they are also present on the system but marked ‘automatic’.

I believe things are more clear now with the examples. Let me add a bonus tip for you.

### Reset package to automatic

If the state of the package got changed to manual from automatic, you can set it back to automatic in the following manner:

```
sudo apt-mark auto package_name
```

![set package to automatic][9]

### Conclusion

This is not a major error and doesn’t stop you from doing your work in your system. However, knowing these little things increase your knowledge a little.

**Curiosity may have killed the cat but it makes a penguin smarter**. That’s an original quote to add humor to this otherwise dull article :)

Let me know if you would like to read more such articles that may seem insignificant but help you understand your Linux system a tiny bit better.

--------------------------------------------------------------------------------

via: https://itsfoss.com/package-set-manually-installed/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-latest-vlc/
[2]: https://itsfoss.com/wp-content/uploads/2022/05/installing-vlc-with-apt-ubuntu-800x489.png
[3]: https://itsfoss.com/list-installed-packages-ubuntu/
[4]: https://itsfoss.com/wp-content/uploads/2022/05/list-installed-packages-vlc-ubuntu-800x477.png
[5]: https://itsfoss.com/wp-content/uploads/2022/05/package-set-manually.png
[6]: https://itsfoss.com/wp-content/uploads/2022/05/listing-installed-packages-with-vlc.png
[7]: https://itsfoss.com/wp-content/uploads/2022/05/autoremove-vlc-ubuntu.png
[8]: https://itsfoss.com/wp-content/uploads/2022/05/listing-installed-packages-after-removing-vlc.png
[9]: https://itsfoss.com/wp-content/uploads/2022/05/set-package-to-automatic.png
