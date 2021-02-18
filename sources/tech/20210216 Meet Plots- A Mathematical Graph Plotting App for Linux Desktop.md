[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Meet Plots: A Mathematical Graph Plotting App for Linux Desktop)
[#]: via: (https://itsfoss.com/plots-graph-app/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Meet Plots: A Mathematical Graph Plotting App for Linux Desktop
======

Plots is a graph plotting application that makes it easy to visualize mathematical formulae. You can use it for trigonometric, hyperbolic, exponential and logarithmic functions along with arbitrary sums and products.

### Plot mathematical graphs with Plots on Linux

[Plots][1] is a simple application inspired by graph plotting web apps like [Desmos][2]. It allows you to plot graphs of different math functions, which you can enter interactively, as well as customizing the color of your plots.

Written in Python, Plots takes advantage of modern hardware using [OpenGL][3]. It uses GTK 3 and thus integrates well with the GNOME desktop.

![][4]

Using plots is straightforward. To add a new equation, click the plus sign. Clicking the trash icon deletes the equation. There is also the option to undo and redo. You can also zoom in and zoom out.

![][5]

The text box where you type is equation friendly. The hamburger menu has a ‘help’ option to access the documentation. You’ll find useful tips on how to write various mathematical notations here. You can also copy-paste the equations.

![][6]

In dark mode, the sidebar equation area turns dark but the main plotting area remains white. I believe that’s by design perhaps.

You can use multiple functions and plot them all in one graph:

![][7]

I found it crashing while trying to paste some equations it could not understand. If you write something that it cannot understand or conflicts with existing equations, all plots disappear, Removing the incorrect equation brings back the plot.

No option to export the plots or copy them to clipboard unfortunately. You can always [take screenshots in Linux][8] and use the image in your document where you have to add the graphs.

**Recommended Read:**

![][9]

#### [KeenWrite: An Open Source Text Editor for Data Scientists and Mathematicians][10]

### Installing Plots on Linux

Plots has different installation options available for various kinds of distributions.

Ubuntu 20.04 and 20.10 users can [take advantage of the PPA][11]:

```
sudo add-apt-repository ppa:apandada1/plots
sudo apt update
sudo apt install plots
```

For other Debian based distributions, you can [install it from the deb file][12] available [here][13].

I didn’t find it in AUR package list but as an Arch Linux user, you can either use the Flatpak package or install it using Python.

[Plots Flatpak Package][14]

If interested, you may check out the source code on its GitHub repository. If you like the application, please consider giving it a star on GitHub.

[Plots Source Code on GitHub][1]

**Conclusion**

The primary use case for Plots is for students learning math or related subjects, but it can be useful in many other scenarios. I know not everyone would need that but surely helpful for the people in the academics and schools.

I would have liked the option to export the images though. Perhaps the developers can add this feature in the future releases.

Do you know any similar applications for plotting graphs? How does Plots stack up against them?

--------------------------------------------------------------------------------

via: https://itsfoss.com/plots-graph-app/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://github.com/alexhuntley/Plots/
[2]: https://www.desmos.com/
[3]: https://www.opengl.org/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/fourier-graph-plots.png?resize=800%2C492&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/plots-app-linux-1.png?resize=800%2C518&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/plots-app-linux.png?resize=800%2C527&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/multiple-equations-plots.png?resize=800%2C492&ssl=1
[8]: https://itsfoss.com/take-screenshot-linux/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/keenwrite.png?fit=800%2C450&ssl=1
[10]: https://itsfoss.com/keenwrite/
[11]: https://itsfoss.com/ppa-guide/
[12]: https://itsfoss.com/install-deb-files-ubuntu/
[13]: https://launchpad.net/~apandada1/+archive/ubuntu/plots/+packages
[14]: https://flathub.org/apps/details/com.github.alexhuntley.Plots
