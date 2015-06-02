如何在Bash Shell脚本中显示对话框
================================================================================

这个教程给出几个如何使用类似zenity和whiptail的工具在Bash Shell 脚本中提供消息/对话框的例子。使用这些工具，你的脚本能够告知用户当前程序运行的状态并能与用户进行交互。这两个工具的不同之处在于显示消息框或者对话框的方式。Zenity用GTK工具包创建图形用户界面，而whiptail则在终端窗口内创建消息框。

### Zenity 工具 ###

在Ubuntu中安装zenity，运行:

    sudo apt-get install zenity

用zenity创建消息框或者对话框的命令是不言自明的，我们会给你提供一些例子来参考。

### 创建消息框 ###

	zenity --info --title "Information Box" --text "This should be information" --width=300 --height=200

![消息框截图](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-Information-Box.png)

创建 Yes/No 询问对话框

    zenity --question --text "Do you want this?" --ok-label "Yeah" --cancel-label="Nope"

![问题截图](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-Question.png)

创建输入框并将输入值保存到变量中

    a=$(zenity --entry --title "Entry box" --text "Please enter the value" --width=300 --height=200)
    echo $a

![输入框截图](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-Entry-box.png)

输入后，值会保存在变量 $a 中。

这是一个获取用户姓名并显示的实际事例。

    #!/bin/bash
    #
    # This script will ask for couple of parameters
    # and then continue to work depending on entered values
    #

    # Giving the option to user
    zenity --question --text "Do you want to continue?"

    # Checking if user wants to proceed
    [ $? -eq 0 ] || exit 1

    # Letting user input some values
    FIRSTNAME=$(zenity --entry --title "Entry box" --text "Please, enter your first name." --width=300 --height=150)
    LASTNAME=$(zenity --entry --title "Entry box" --text "Please, enter your last name." --width=300 --height=150)
    AGE=$(zenity --entry --title "Entry box" --text "Please, enter your age." --width=300 --height=150)

    # Displaying entered values in information box
    zenity --info --title "Information" --text "You are ${FIRSTNAME} ${LASTNAME} and you are ${AGE}(s) old." --width=300 --height=100

这些是运行前面脚本的截图。

![例1-问题-1](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Question-1.png)

框1

![例1-输入框-1](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Entry-box-1.png)

输入框

![例1-输入框-2](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Entry-box-2.png)

输入框

![例1-输入框-3](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Entry-box-3.png)

输入框

![例1-信息](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Information.png)

信息框

别忘了查看也许能帮助到你的有用的[zenity 选项][1]。

### Whiptail 工具 ###

在Ubuntu上安装whiptail，运行

    sudo apt-get install whiptail

用whiptail创建消息框或者对话框的命令也是无需解释的，我们会给你提供一些基本例子作为参考。

### 创建消息框 ###

    whiptail --msgbox "This is a message" 10 40

![whiptail消息框截图](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-whiptail-msgbox.png)

### 创建 Yes/No 对话框 ###

    whiptail --yes-button "Yeah" --no-button "Nope" --title "Choose the answer" --yesno "Will you choose yes?" 10 30

![whiptail对话框截图](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-whiptail-yesno.png)

### 创建有缺省值的输入框 ###

    whiptail --inputbox "Enter your number please." 10 30 "10"

![whiptail输入框截图](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-whiptail-entry.png)

尝试使用输入值要注意的一点是whiptail用stdout显示对话框，用stderr输出值。这样的话，如果你用 var=$(...)，你就根本不会看到对话框，也不能获得输入的值。解决方法是交换stdout和stderr。在whiptail命令后面添加 **3>&1 1>&2 2>&3** 就可以做到。你想获取输入值的任何whiptail命令也是如此。

### 创建菜单对话框 ###

    whiptail --menu "This is a menu. Choose an option:" 20 50 10 1 "first" 2 "second" 3 "third"

![whiptail菜单截图](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-whiptail-menu.png)

这是一个请求用户输入一个文件夹的路径并输出它的大小的 **shell 脚本**。

    #!/bin/bash
    #
    #

    # Since whiptail has to use stdout to display dialog, entered value will
    # be stored in stderr. To switch them and get the value to stdout you must
    # use 3>&1 1>&2 2>&3
    FOLDER_PATH=$(whiptail --title "Get the size of folder" \
    --inputbox "Enter folder path:" \
    10 30 \
    "/home" \
    3>&1 1>&2 2>&3)

    if [ -d $FOLDER_PATH ]
    then
    size=$(du -hs "$FOLDER_PATH" | awk '{print $1}')
    whiptail --title "Information" \
    --msgbox "Size of ${FOLDER_PATH} is ${size}" \
    10 40
    elif [ -f $FOLDER_PATH ]
    then
    whiptail --title "Warning!!!" \
    --msgbox "The path you entered is a path to a file not a folder!" \
    10 40
    else
    whiptail --title "Error!!!"
    --msgbox "Path you entered is not recognized. Please try again" \
    10 40
    fi

这是之前例子的一些截图：

![例2-输入框](http://blog.linoxide.com/wp-content/uploads/2015/03/Example2-Entry-box.png)

输入框

![例2-消息框](http://blog.linoxide.com/wp-content/uploads/2015/03/Example2-Information.png)

消息框

如果你在终端下工作，[帮助手册][2]总是有用的。

### 结论 ###

选择合适的工具显示对话框取决于你期望在桌面机器还是服务器上运行你的脚本。桌面机器用户通常使用GUI窗口环境，也可能运行脚本并与显示的窗口进行交互。然而，如果你期望用户是在服务器上工作的，（在没有图形界面时，）你也许希望能确保总能显示，那就使用whiptail或者任何其它在纯终端窗口显示对话框的工具。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-shell-script/bash-shell-script-show-dialog-box/

作者：[Ilija Lazarevic][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/ilijala/
[1]:https://help.gnome.org/users/zenity/stable/
[2]:http://linux.die.net/man/1/whiptail