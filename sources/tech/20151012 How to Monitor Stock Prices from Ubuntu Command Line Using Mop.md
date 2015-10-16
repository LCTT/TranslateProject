translating by Ezio

How to Monitor Stock Prices from Ubuntu Command Line Using Mop
================================================================================
Having a side income is always good, especially when you can easily manage the work along with your full time job. If your regular work involves working on an Internet-connected computer, trading stocks is a popular option to earn a few extra bucks.

While there are quite a few stock-monitoring applications available for Linux, most of them are GUI-based. What if you’re a Linux professional who spends a lot (or all) of your time working on machines that do not have any GUI installed? Are you out of luck? Well, no, there are some command line stock-tracking tools, including Mop, which we’ll be discussing in this article.

### Mop ###

Mop, as already mentioned in the introduction above, is a command line tool that displays continuous and updated information about the US stock markets and individual stocks. Implemented in the GO programming language, the project is the brain child of Michael Dvorkin.

### Download and Install ###

Since the project is implemented in GO, before installing the tool, you’ll first have to make sure that the programming language is installed on your machine. Following are the steps required to install GO on a Debian-based system like Ubuntu:

    sudo apt-get install golang
    mkdir ~/workspace
    echo 'export GOPATH="$HOME/workspace"' >> ~/.bashrc
    source ~/.bashrc

Once GO is installed, the next step is to install the Mop tool and set the environment, something which you can do by running the following commands:

    sudo apt-get install git
    go get github.com/michaeldv/mop
    cd $GOPATH/src/github.com/michaeldv/mop
    make install
    export PATH="$PATH:$GOPATH/bin"

Once done, just run the following command to execute Mop:

    cmd

### Features ###

When you run the Mop command for the first time, you’ll see an output similar to the following.

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-first-run.jpg)

As you can see in the image above, the output – which auto-refreshes frequently – contains information related to various popular stock exchanges around the world as well as individual stocks.

### Add/remove stocks ###

Mop allows you to easily add/remove individual stocks to and from the output list. To add a stock, all you have to do is to press “+” and mention the stock listing name when prompted. For example, the following screenshot was taken while adding Facebook (FB) to the list.

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-add-stock.png)

As I pressed the “+” key, a row containing text “Add tickers:” appeared, prompting me to add the stock listing name – I added FB for Facebook and pressed Enter. The output refreshed, and the new stock was added to the list:

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-stock-added.png)

Similarly, you can delete a stock listing by pressing “-” and mentioning its name.

#### Group stocks based on value ####

There is a way to group stocks based on whether their value is going up or down – all you have to do is to press the “g” key. Following this, the stocks which are advancing will be grouped together and shown in green, while those whose value is going down will be represented in black.

Here is an example screenshot.

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-group-stocks-profit-loss.png)

#### Column sort ####

Mop also allows you to change the sort order of individual columns. For this you first need to press “o” (this will select the first column by default), and then use the left and right arrow keys to select the column you want to sort. Once done, press enter to sort the column contents.

For example, the following screenshot shows the output after the contents of the first column were sorted in descending alphabetical order.

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-change-order.png)

**Note**: to better understand, compare it with the previous screenshot.

#### Other options ####

Other available options include “p” for pausing market data and stock updates, “q” or “esc” for quitting the command line application, and “?” for displaying the help page.

![](https://www.maketecheasier.com/assets/uploads/2015/09/mop-help.png)

### Conclusion ###

Mop is a basic stock monitoring tool that doesn’t offer a plethora of features, but does what it promises. It’s quite obvious that the tool is not for stock trading professionals but is still a decent choice if all you want to do is some basic stock tracking on a command line-only machine.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/monitor-stock-prices-ubuntu-command-line/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
