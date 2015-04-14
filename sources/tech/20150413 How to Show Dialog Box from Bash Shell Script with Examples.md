How to Show Dialog Box from Bash Shell Script with Examples
================================================================================
This tutorial will give couple of examples on how to use utilities like zenity and whiptail in your Bash shell script to provide message / dialog box . With these utilities your script will be able to inform user about the current state of execution, or give an ability to interact. Difference between these two utilities is the way they are displaying message box or dialog. Zenity uses GTK toolkit for creating graphical user interfaces, while whiptail creates message boxes inside terminal window.

### Zenity Tool ###

To install zenity on Ubuntu run:

    sudo apt-get install zenity

Since commands for creating message boxes or dialogs with zenity are pretty self explanatory, we will provide you with couple of examples.

### Creating information box ###

zenity --info --title "Information Box" --text "This should be information" --width=300 --height=200

![Screenshot-Information Box](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-Information-Box.png)

Creating Yes/No dialog

    zenity --question --text "Do you want this?" --ok-label "Yeah" --cancel-label="Nope"

![Screenshot-Question](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-Question.png)

Creating entry box and storing value in variable

    a=$(zenity --entry --title "Entry box" --text "Please enter the value" --width=300 --height=200)
    echo $a

![Screenshot-Entry box](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-Entry-box.png)

After entering it, value will be stored in $a variable.

Here is the working example which takes user's first name, last name and age and displays it.

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

Here are the screenshots of previous script.

![Example1-Question-1](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Question-1.png)

First box

![Example1-Entry box-1](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Entry-box-1.png)

Entry box

![Example1-Entry box-2](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Entry-box-2.png)

Entry box

![Example1-Entry box-3](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Entry-box-3.png)

Entry box

![Example1-Information](http://blog.linoxide.com/wp-content/uploads/2015/03/Example1-Information.png)

Information box

Don't forget refer some of the useful [zenity options][1] that might help you.

### Whiptail Tool ###

To install whiptail on Ubuntu run

    sudo apt-get install whiptail

Commands for creating message box/dialog with whiptail are also self explanatory, so we will provide you with just couple of basic examples.

### Creating message box ###

    whiptail --msgbox "This is a message" 10 40

![Screenshot-whiptail-msgbox](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-whiptail-msgbox.png)

### Creating Yes/No dialog ###

    whiptail --yes-button "Yeah" --no-button "Nope" --title "Choose the answer" --yesno "Will you choose yes?" 10 30

![Screenshot-whiptail-yesno](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-whiptail-yesno.png)

### Creating entry box with default value ###

    whiptail --inputbox "Enter your number please." 10 30 "10"

![Screenshot-whiptail-entry](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-whiptail-entry.png)

One thing to be aware of when trying to use entered value is that whiptail uses stdout for displaying dialog, and stderr for value output. That way, if you use var=$(...) you wont see dialog box at all, and wont get the entered value. Solution is to switch stdout and stderr. To do that just add **3>&1 1>&2 2>&3** at the end of the whiptail command. Same would be with any whiptail command which you want to use to get some entered value.

### Creating menu dialog ###

    whiptail --menu "This is a menu. Choose an option:" 20 50 10 1 "first" 2 "second" 3 "third"

![Screenshot-whiptail-menu](http://blog.linoxide.com/wp-content/uploads/2015/03/Screenshot-whiptail-menu.png)

Here is a **shell script** that asks user to enter a path to a folder and then outputs it's size.

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

Here are the screenshots from previous example:

![Example2-Entry-box](http://blog.linoxide.com/wp-content/uploads/2015/03/Example2-Entry-box.png)

Entry box

![Example2-Information](http://blog.linoxide.com/wp-content/uploads/2015/03/Example2-Information.png\)

Information box

If you are working in terminal , [manual pages][2] are always available.

### Conclusion ###

Choosing the right tool for displaying dialogs will depend on whether you expect your script to be run on desktop machine or server machine. Desktop machine users mostly use window environment and will possibly be able to run the script and interact with appearing windows. However, if you are expecting that the user is someone on server machine, you might want to play it safe and use whiptail or any other utility that will display dialogs in plain terminal window.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-shell-script/bash-shell-script-show-dialog-box/

作者：[Ilija Lazarevic][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/ilijala/
[1]:https://help.gnome.org/users/zenity/stable/
[2]:http://linux.die.net/man/1/whiptail