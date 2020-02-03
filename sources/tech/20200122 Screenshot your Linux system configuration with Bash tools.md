[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Screenshot your Linux system configuration with Bash tools)
[#]: via: (https://opensource.com/article/20/1/screenfetch-neofetch)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Screenshot your Linux system configuration with Bash tools
======
ScreenFetch and Neofetch make it easy to share your Linux environment
with others.
![metrics and data shown on a computer screen][1]

There are many reasons you might want to share your Linux configuration with other people. You might be looking for help troubleshooting a problem on your system, or maybe you're so proud of the environment you've created that you want to showcase it to fellow open source enthusiasts.

You could get some of that information with a **cat /proc/cpuinfo** or **lscpu** command at the Bash prompt. But if you want to share more details, such as your operating system, kernel, uptime, shell environment, screen resolution, etc., you have two great tools to choose: screenFetch and Neofetch.

### ScreenFetch

[ScreenFetch][2] is a Bash command-line utility that can produce a very nice screenshot of your system configuration and uptime. It is an easy way to share your system's configuration with others in a colorful way.

It's simple to install screenFetch for many Linux distributions. 

On Fedora, enter:


```
`$ sudo dnf install screenfetch`
```

On Ubuntu, enter:


```
`$ sudo apt install screenfetch`
```

For other operating systems, including FreeBSD, MacOS, and more, consult the screenFetch wiki's [installation page][3]. Once screenFetch is installed, it can produce a detailed and colorful screenshot like this:

![screenFetch][4]

ScreenFetch also provides various command-line options to fine-tune your results. For example, **screenfetch -v** returns verbose output that presents each option line-by-line along with the display shown above.

And **screenfetch -n** eliminates the operating system icon when it displays your system information.

![screenfetch -n option][5]

Other options include **screenfetch -N**, which strips all color from the output; **screenfetch -t**, which truncates the output depending on the size of the terminal; and **screenFetch -E**, which suppresses errors.

Be sure to check the man page on your system for other options. ScreenFetch is open source under the GPLv3, and you can learn more about the project in its [GitHub repository][6].

### Neofetch

[Neofetch][7] is another tool to create a screenshot with your system information. It is written in Bash 3.2 and is open source under the [MIT License][8].

According to the project's website, "Neofetch supports almost 150 different operating systems. From Linux to Windows, all the way to more obscure operating systems like Minix, AIX, and Haiku."

![Neofetch][9]

The project maintains a wiki with excellent [installation documentation][10] for a variety of distributions and operating systems.

If you are on Fedora, RHEL, or CentOS, you can install Neofetch at the Bash prompt with:


```
`$ sudo dnf install neofetch`
```

On Ubuntu 17.10 and greater, you can use:


```
`$ sudo apt install neofetch`
```

On its first run, Neofetch writes a **~/.config/neofetch/config.conf** file to your home directory (**.config/config.conf**), which enables you to [customize and control][11] every aspect of Neofetch's output. For example, you can configure Neofetch to use the image, ASCII file, or wallpaper of your choice—or nothing at all. The config.conf file also makes it easy to share your customization with others.

If Neofetch doesn't support your operating system or provide all the options you are looking for, be sure to open up an issue in the project's [GitHub repo][12].

### Conclusion

No matter why you want to share your system configuration, screenFetch or Neofetch should enable you to do so. Do you know of another open source tool that provides this functionality on Linux? Please share your favorite in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/screenfetch-neofetch

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://github.com/KittyKatt/screenFetch
[3]: https://github.com/KittyKatt/screenFetch/wiki/Installation
[4]: https://opensource.com/sites/default/files/uploads/screenfetch.png (screenFetch)
[5]: https://opensource.com/sites/default/files/uploads/screenfetch-n.png (screenfetch -n option)
[6]: http://github.com/KittyKatt/screenFetch
[7]: https://github.com/dylanaraps/neofetch
[8]: https://github.com/dylanaraps/neofetch/blob/master/LICENSE.md
[9]: https://opensource.com/sites/default/files/uploads/neofetch.png (Neofetch)
[10]: https://github.com/dylanaraps/neofetch/wiki/Installation
[11]: https://github.com/dylanaraps/neofetch/wiki/Customizing-Info
[12]: https://github.com/dylanaraps/neofetch/issues
