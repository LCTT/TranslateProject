Getting started with the RStudio IDE
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming_screen.png?itok=BgcSm5Pl)

For as long as I can remember, I've been toying with numbers. As an undergraduate student in the late 1970s, I began taking statistics courses, learning ways to examine and analyze data to uncover some meaning.

Back then, I had a scientific calculator that made statistical calculations much easier than ever before. In the early '90s, as a graduate student in educational psychology working on t-tests, correlations, and [ANOVA][1], I started doing my calculations by meticulously writing text files that were fed into an IBM mainframe. The mainframe was an improvement over my handheld calculator, but one minor spacing error rendered the whole process null and void, and the process was still somewhat tedious.

For writing papers and especially my thesis, I needed a way to create charts from my data and embed them in word processing documents. I was fascinated with Microsoft Excel and its number-crunching capabilities and the myriad charts I could create with the computed results. But there were costs at every step of the way. In the 1990s, along with Excel, there were other proprietary packages available like SAS and SPSS+, but the learning curve was a steep task for my already cramped graduate student schedule.

### Fast forward to the present

More recently, due to my budding interest in data science, combined with my keen interest in Linux and open source software, I've read a lot of data science articles and listened to a lot of data science speakers talk about their work at Linux conferences. As a result, I became very interested in the programming language R, an open source statistical computing software.

At first, it was just a spark. That spark grew when I talked to my friend Michael J. Gallagher, PhD, about how he used R in his [dissertation research][2]. Finally, I visited the [R Project][3] website and learned I could easily install [R for Linux][4]. Game on!

### Installing R

Installing R varies slightly depending on your operating system or distribution. Refer to the installation guide found at the [Comprehensive R Archive Network][5] (CRAN) website. CRAN offers detailed instructions for installing R on [various Linux distributions][6], [Fedora, RHEL, and derivatives][7], [MacOS][8], and [Windows][9].

I was using Ubuntu and, as specified at CRAN, added the following line to my `/etc/apt/sources.list` file:
```
deb https://<my.favorite.cran.mirror>/bin/linux/ubuntu artful/

```

Then I ran the following commands in the terminal:
```
$ sudo apt-get update

$ sudo apt-get install r-base

```

According to CRAN, "Users who need to compile R packages from source [e.g. package maintainers, or anyone installing packages with `install.packages()`] should also install the `r-base-dev` package."

### Using R and RStudio

Once I installed R, I was ready to learn more about using this powerful tool. Dr. Gallagher recommended "Start learning R" on [DataCamp][10], and I also found a free course for R newbies on [Code School][11]. Both courses helped me learn R's commands and syntax. I also enrolled in an online course in R programming at [Udemy][12] and purchased the [Book of R][13] from [No Starch Press][14].

After more reading and watching YouTube videos, I realized I should also install [RStudio][15]. RStudio is an open source IDE for R that's easy to install on [Debian, Ubuntu, Fedora, and RHEL][16]. It can also be installed on MacOS and Windows.

According to the RStudio website, the IDE can be customized to your preferences by selecting the Tools menu and, from there, Global Options.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_global-options.png?itok=un6-SvS-)

R provides some great demonstration examples that can be accessed from the console by entering `demo()` at the prompt. The `demo(plotmath)` and `demo(perspective)` options provide great illustrations of the power of R. I experimented with some simple [vectors][17] and plotting at the command line in the R console, which is shown below.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_plotting-vectors.png?itok=9T7UV8p2)

You may want to start learning ways to use R with some sample data, then later apply that knowledge to yield descriptive statistics on your own data. Not having an abundance of data of my own to analyze, I searched for [datasets][18] that I could use; one such source (which I didn't use for this example) is [economic research data][19] provided by the Federal Reserve Bank of St. Louis. I was intrigued by a dataset I found titled "Passenger Miles on Commercial US Airlines, 1937-1960," so I imported it into RStudio to test out the IDE's capabilities. RStudio can accept data in a variety of formats, including CSV, Excel, SPSS, and SAS.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/rstudio-import.png?itok=1yJKQei1)

Once the data is imported, I used the `summary(AirPassengers)` command to get some initial descriptive statistics of the data. After pressing Enter, I got a summary of monthly airline passengers from 1949-1960, as well as other data, including the minimum, maximum, first quarter, third quarter, median, and mean number of air passengers.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_air-passengers.png?itok=RCJMLIb3)

I knew from my summary statistics that the mean of this sample of airline passengers is 280.3. Entering `sd(AirPassengers)` at the console yields the standard deviation, seen here in the RStudio console:

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_sd-air-passengers.png?itok=d-25fQoz)

I next generated a histogram of my data, which shows this dataset graphically, by entering `hist(AirPassengers);` RStudio can export the data as a PNG, PDF, JPEG, TIFF, SVG, EPS, or BMP.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_histogram-air-passengers.png?itok=0HWsseQE)

In addition to generating statistics and graphical data, R keeps a history of all my operations. This enables me to return to a previous operation, and I can save this history for future reference.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_history.png?itok=50jaFPU4)

In RStudio's script editor, I can write a script of all the commands that I issue, then save that script to run again if my data changes or I want to revisit it.

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/r_script-editor.png?itok=eiE1_bnX)

### Getting help

Help can easily be found by entering `help()` at the R prompt. Specific help information can be found by entering the specific topic you are looking for information about, e.g., `help(sd)` for help with standard deviation. Information on contributors to the R project can be obtained by entering `contributors()` at the prompt. You can find out how to cite R by entering `citation()` at the prompt. License information for R can be easily obtained by entering `license()` at the prompt.

R is distributed under the terms of the GNU General Public License, either Version 2, June 1991, or Version 3, June 2007. For more information about licensing R, refer to the[R Project website.][20]

In addition, RStudio provides an excellent Help menu within the GUI. This area includes links to an RStudio cheat sheet (which can be downloaded as a PDF), online learning at [RStudio][21], RStudio documentation, support, and [license information][22].


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/getting-started-RStudio-IDE

作者：[Don Watkins][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://en.wikipedia.org/wiki/Analysis_of_variance
[2]:https://www.michael-j-gallagher.com/high-performance-computing
[3]:https://www.r-project.org/
[4]:https://cran.r-project.org/index.html
[5]:https://cran.r-project.org/
[6]:https://cran.r-project.org/bin/linux/
[7]:https://cran.r-project.org/bin/linux/redhat/README
[8]:https://cran.r-project.org/bin/macosx/
[9]:https://cran.r-project.org/bin/windows/
[10]:https://www.datacamp.com/onboarding/learn?from=home&technology=r
[11]:http://tryr.codeschool.com/levels/1/challenges/1
[12]:https://www.udemy.com/r-programming
[13]:https://nostarch.com/bookofr
[14]:https://opensource.com/article/17/10/no-starch
[15]:https://www.rstudio.com/
[16]:https://www.rstudio.com/products/rstudio/download/
[17]:http://www.r-tutor.com/r-introduction/vector
[18]:https://vincentarelbundock.github.io/Rdatasets/datasets.html
[19]:https://fred.stlouisfed.org/
[20]:https://www.r-project.org/Licenses/
[21]:https://www.rstudio.com/online-learning/#R
[22]:https://support.rstudio.com/hc/en-us/articles/217801078-What-license-is-RStudio-available-under-
