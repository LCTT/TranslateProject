[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install and Use R on Ubuntu)
[#]: via: (https://itsfoss.com/install-r-ubuntu/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How to Install and Use R on Ubuntu
======

_**Brief: This tutorial teaches you to install R on Ubuntu. You’ll also learn how to run your first R program in Ubuntu using various methods.**_

[R][1], together with Python, is the most commonly used programming language for statistical computing and graphics, making it easy to work with data. With the growing interest in data analysis, data visualization, data science (the machine learning craze), it is now more popular than ever and is a great tool for anyone looking to dive into this fields.

The good thing about R is that its syntax is pretty straight-forward and you can find many tutorials/guides on how R is used in the real world.

In this article, I’ll cover how to install R on Ubuntu Linux. I’ll also show you how to run your first R program in Linux.

![][2]

### Installing R on Ubuntu

**R** is included in the Ubuntu repositories. It can be easily installed using:

```
sudo apt install r-base
```

Do note that this may install a slightly older version. At the time of writing this article, Ubuntu offers version 3.4 whereas the latest is version 3.6.

_I advise sticking with whichever version Ubuntu provides unless you must use the newer version._

In order to get the latest version (or any specific version for that matter), you must use **[CRAN][3]** (The Comprehensive R Archive Network). This is a list of mirrors for downloading the latest version of R. Click on the next section to learn how to install the latest version of R on Ubuntu.

**How to install latest R version 3.6 on Ubuntu (click to expand)**

To get the R version 3.6, you need to add the mirror to your sources list. I have simplified it for you in this command:

```
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran35/"
```

Now you should add the key for the repository:

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
```

And then update the repository information and install R:

```
sudo apt update
sudo apt install r-base
```

That’s it.

[][4]

Suggested read  How to Create a Bootable Windows 10 USB in Linux

### Using R programming on Ubuntu

R has more than one use. I’ll go over several methods you can use to run R programs.

#### Interactive Mode in R

After having installed **R**, you can run the console using:

```
R
```

This should open up the interactive mode:

![R Interactive Mode][5]

This R console is very similar to the **Python** and **Haskell** interactive prompts. You can enter any **R** command and you can do basic mathematical computations. For example:

```
> 20+40
[1] 60

> print ("Hello World!")
[1] "Hello World!"
```

You could test plotting too:

![R Plotting][6]

You can **quit** using **q()** or pressing **CTRL+c**. When doing so, you will be asked if you want to save a workspace ****image; a workspace ****is an environment for created variables.

#### Running R program with Rscript

The second way to run R programs is in directly on the Linux command line. You can do so using **RScript**, a utility included with **r-base**.

First, you have to save your R program to a file using your [favorite code editor on Linux][7]. The file extension should be .r.

This is my sample R program printing “Hello World”. I have saved it in a file name hello.r.

```
print("Hello World!")
a <- rnorm(100)
plot(a)
```

To run the R program, use the command like this:

```
Rscript hello.r
```

You should get back the output:

```
[1] "Hello World!"
```

The plot is going to be saved in the working directory, to a file named **Rplots.pdf**:

![Rplots.pdf][8]

**Note:** _**Rscript**_ _doesn’t load the_ _**methods**_ _package by default. Make sure to [load it explicitly][9] in your script_.

#### Run R scripts with RStudio in Ubuntu

The most common way to use **R** is using [RStudio][10], a great cross-platform open source IDE. You can [install it using deb file in Ubuntu][11]. Download the deb file from the link below. You’ll have to scroll down a bit to locate the DEB files for Ubuntu.

[Download RStudio for Ubuntu][12]

Once you download the DEB file, just double click on it to install it.

Once installed, search for it in the menu and start it. The home window of the application should pop up:

![RStudio Home][13]

Here you have a working console, just like the one you got in the terminal with the **R** command.

[][14]

Suggested read  Setting Up Python Environments In Linux and Unix Systems

To create a file, in the top bar click on **File** and select **New File &gt; Rscript** (or **CTRL+Shift+n)**:

![RStudio New File][15]

Press **CTRL+s** to save the file and choose a location and a name it:

![RStudio Save File][16]

After doing so, click on **Session &gt; Set Working Directory &gt; To Source File Location** to change the working directory to the location of your script:

![RStudio Working Directory][17]

You are now ready to go! Write in your code and click run. You should be able to see output both in the console and in the plotting window:

![RStudio Run][18]

**Wrapping Up**

In this article, I showed you step by step how to get started using the **R** programming language on an Ubuntu system. I covered several ways you can go about this: **R console** – useful for testing, **Rscript** – for the terminal lover, **RStudio** – the IDE for your needs.

Whether you are willing to get into data science or simply love statistics, **R** is a good addition to your programming arsenal, being the perfect tool for analyzing data.

If you are absolutely new to R, let me recommend you this excellent book that will teach you fundamentals of R. It’s available on Amazon Kindle.

Preview | Product | Price |
---|---|---|---
![Learn R in a Day][19] ![Learn R in a Day][19] | [Learn R in a Day][20] |  | [Buy on Amazon][21]

Do you use **R**? Are you just getting into it? Let us know more about how and why you use or want to learn to use **R**!

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-r-ubuntu/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: https://www.r-project.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/06/install-r-on-ubuntu.jpg?resize=800%2C450&ssl=1
[3]: https://cran.r-project.org/
[4]: https://itsfoss.com/bootable-windows-usb-linux/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/r_interactive_mode.png?fit=800%2C516&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/r_plotting.jpg?fit=800%2C434&ssl=1
[7]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/rplots_pdf.png?fit=800%2C539&ssl=1
[9]: https://www.dummies.com/programming/r/how-to-install-load-and-unload-packages-in-r/
[10]: https://www.rstudio.com/
[11]: https://itsfoss.com/install-deb-files-ubuntu/
[12]: https://www.rstudio.com/products/rstudio/download/#download
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_home.jpg?fit=800%2C603&ssl=1
[14]: https://itsfoss.com/python-setup-linux/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_new_file.png?fit=800%2C392&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_save_file.png?fit=800%2C258&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_working_directory.png?fit=800%2C394&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/06/rstudio_run.jpg?fit=800%2C626&ssl=1
[19]: https://i1.wp.com/images-na.ssl-images-amazon.com/images/I/51oIJTbUlnL._SL160_.jpg?ssl=1
[20]: https://www.amazon.com/Learn-R-Day-Steven-Murray-ebook/dp/B00GC2LKOK?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B00GC2LKOK (Learn R in a Day)
[21]: https://www.amazon.com/Learn-R-Day-Steven-Murray-ebook/dp/B00GC2LKOK?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B00GC2LKOK (Buy on Amazon)
